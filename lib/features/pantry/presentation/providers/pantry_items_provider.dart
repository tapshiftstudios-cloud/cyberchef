import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/supabase_config.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../../../core/utils/pantry_item_utils.dart';
import '../../../savings/domain/waste_savings_service.dart';
import '../../../savings/presentation/providers/waste_savings_provider.dart';
import '../../../savings/domain/models/waste_savings_event.dart';
import '../../data/pantry_item_storage.dart';
import '../../data/pantry_items_repository.dart';
import '../../../../services/freshness_notification_service.dart';
import '../../../../services/pantry_widget_service.dart';
import '../../domain/models/pantry_item.dart';

final pantryItemsRepositoryProvider = Provider<PantryItemsRepository>(
  (ref) => PantryItemsRepository(),
);

/// Son bulut senkron durumu (Ayarlar / snackbar).
final pantrySyncStatusProvider = StateProvider<String?>((ref) => null);

class PantryItemsNotifier extends AsyncNotifier<List<PantryItem>> {
  @override
  Future<List<PantryItem>> build() async {
    return PantryItemStorage.loadAll();
  }

  Future<PantryAddItemsResult> addItems(
    List<PantryItem> items, {
    bool mergeDuplicates = true,
  }) async {
    if (items.isEmpty) {
      return const PantryAddItemsResult(addedCount: 0);
    }

    final base = DateTime.now().microsecondsSinceEpoch;
    final incoming = items.asMap().entries.map((entry) {
      return entry.value.copyWith(
        id: '${base}_${entry.key}_${entry.value.cleanName.hashCode}',
      );
    }).toList();

    var existing = await PantryItemStorage.loadAll();
    var mergedCount = 0;
    final toInsert = <PantryItem>[];
    final toUpdateCloud = <PantryItem>[];

    for (final item in incoming) {
      PantryItem? match;
      for (final e in existing) {
        if (PantryItemUtils.namesMatch(e, item)) {
          match = e;
          break;
        }
      }

      if (mergeDuplicates && match != null) {
        final existingMatch = match;
        final updated = existingMatch.copyWith(
          purchaseDate: item.purchaseDate,
          estimatedExpiryDays: item.estimatedExpiryDays,
          quantity: item.quantity ?? existingMatch.quantity,
          storeName: item.storeName ?? existingMatch.storeName,
          confidence: item.confidence ?? existingMatch.confidence,
          purchasePrice: item.purchasePrice ?? existingMatch.purchasePrice,
        );
        existing = existing
            .map((e) => e.id == existingMatch.id ? updated : e)
            .toList();
        if (updated.hasCloudId) toUpdateCloud.add(updated);
        mergedCount++;
      } else {
        toInsert.add(item);
      }
    }

    final merged = [...toInsert, ...existing];
    await PantryItemStorage.saveAll(merged);

    String? cloudError;
    var cloudSynced = false;

    if (SupabaseConfig.isConfigured &&
        (toInsert.isNotEmpty || toUpdateCloud.isNotEmpty)) {
      try {
        final repo = ref.read(pantryItemsRepositoryProvider);
        if (toInsert.isNotEmpty) {
          final idMap = await repo.insertItems(toInsert);
          cloudSynced = true;

          final all = await PantryItemStorage.loadAll();
          final withCloudIds = all.map((e) {
            final cloudId = idMap[e.id];
            return cloudId != null ? e.copyWith(id: cloudId) : e;
          }).toList();
          await PantryItemStorage.saveAll(withCloudIds);
        }
        for (final updated in toUpdateCloud) {
          await repo.updateItem(updated);
        }
        if (toUpdateCloud.isNotEmpty) cloudSynced = true;
      } on PantryItemsException catch (e) {
        cloudError = e.message;
        ref.read(pantrySyncStatusProvider.notifier).state = e.message;
      }
    }

    ref.invalidateSelf();

    final active = await PantryItemStorage.loadAll();
    await FreshnessNotificationService.instance.refreshFromItems(active);
    await PantryWidgetService.updateFromItems(active);

    return PantryAddItemsResult(
      addedCount: toInsert.length,
      mergedCount: mergedCount,
      cloudSynced: cloudSynced,
      cloudError: cloudError,
    );
  }

  /// Ürünü tüketildi işaretler. Yakın SKT ise tasarruf kaydı döner.
  Future<WasteSavingsEvent?> markConsumed(String id) async {
    final current = state.valueOrNull ?? [];
    PantryItem? item;
    for (final e in current) {
      if (e.id == id) {
        item = e;
        break;
      }
    }

    // Dismissible requires the item to leave the tree immediately on swipe.
    if (current.isNotEmpty) {
      state = AsyncData(current.where((e) => e.id != id).toList());
    }

    item ??= await PantryItemStorage.findById(id);
    WasteSavingsEvent? rescued;

    if (item != null && !item.isConsumed) {
      rescued = await WasteSavingsService.recordIfRescued(
        item,
        locale: ref.read(localeProvider),
      );
    }

    await PantryItemStorage.markConsumed(id);

    if (SupabaseConfig.isConfigured) {
      try {
        await ref.read(pantryItemsRepositoryProvider).markConsumed(id);
      } on PantryItemsException catch (e) {
        ref.read(pantrySyncStatusProvider.notifier).state = e.message;
      }
    }

    ref.invalidate(wasteSavingsSummaryProvider);
    final active = state.valueOrNull ?? await PantryItemStorage.loadAll();
    await PantryWidgetService.updateFromItems(active);
    return rescued;
  }

  Future<bool> syncFromCloud({bool showErrors = true}) async {
    if (!SupabaseConfig.isConfigured) return false;
    try {
      final remote =
          await ref.read(pantryItemsRepositoryProvider).fetchActive();
      if (remote.isNotEmpty) {
        await PantryItemStorage.saveAll(remote);
      }
      ref.read(pantrySyncStatusProvider.notifier).state = null;
      ref.invalidateSelf();
      final active = await PantryItemStorage.loadAll();
      await PantryWidgetService.updateFromItems(active);
      return true;
    } on PantryItemsException catch (e) {
      if (showErrors) {
        ref.read(pantrySyncStatusProvider.notifier).state = e.message;
      }
      return false;
    }
  }

  /// Haftalık özet: kritik + uyarı ürün sayısı.
  FreshnessWeeklySummary weeklySummary(List<PantryItem> items) {
    final critical =
        items.where((e) => e.urgency == FreshnessUrgency.critical).length;
    final warning =
        items.where((e) => e.urgency == FreshnessUrgency.warning).length;
    return FreshnessWeeklySummary(critical: critical, warning: warning);
  }
}

class FreshnessWeeklySummary {
  const FreshnessWeeklySummary({
    required this.critical,
    required this.warning,
  });

  final int critical;
  final int warning;

  int get atRisk => critical + warning;
}

final pantryItemsProvider =
    AsyncNotifierProvider<PantryItemsNotifier, List<PantryItem>>(
  PantryItemsNotifier.new,
);
