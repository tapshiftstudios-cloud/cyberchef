import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/navigation/app_navigator.dart';
import '../../../core/enums/scan_mode.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/ai/ai_usage_guard.dart';
import '../../../core/presentation/ai_flow_guard.dart';
import '../../../core/providers/service_providers.dart';
import '../../camera/presentation/providers/camera_scan_providers.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../pantry/domain/models/pantry_item.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';

/// Envanterden tarif üretiminde kullanılacak ürünleri seçer:
/// önce kritik/uyarı, yoksa tüm aktif ürünler.
List<PantryItem> freshnessItemsForRecipes(List<PantryItem> items) {
  final active = items.where((e) => !e.isConsumed).toList();
  if (active.isEmpty) return const [];

  final urgent = active
      .where(
        (e) =>
            e.urgency == FreshnessUrgency.critical ||
            e.urgency == FreshnessUrgency.warning,
      )
      .toList();
  return urgent.isNotEmpty ? urgent : active;
}

/// Tazelik envanterinden tarif akışını başlatır.
Future<void> startFreshnessRecipeFlow(
  BuildContext context,
  WidgetRef ref,
) async {
  final items = ref.read(pantryItemsProvider).valueOrNull ?? [];
  final selected = freshnessItemsForRecipes(items);
  if (selected.isEmpty) return;
  await generateRecipesFromFreshnessItems(context, ref, selected);
}

/// Tazelik envanterinden tarif üretir ve sonuç ekranına gider.
Future<void> generateRecipesFromFreshnessItems(
  BuildContext context,
  WidgetRef ref,
  List<PantryItem> items,
) async {
  if (items.isEmpty) return;

  final ai = ref.read(aiServiceProvider);
  if (!ai.isConfigured) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.geminiKeyMissing)),
      );
    }
    return;
  }

  ref.read(isAnalyzingProvider.notifier).state = true;
  ref.read(analysisStatusProvider.notifier).state = (
    title: AppStrings.freshnessRecipeTitle,
    subtitle: AppStrings.stepBuildRecipes,
  );

  await AiFlowGuard.run(
    context: context,
    ai: ai,
    ref: ref,
    rewardAction: AiActionType.recipeFromIngredients,
    onFinally: () => ref.read(isAnalyzingProvider.notifier).state = false,
    action: () async {
      final ingredients = items.map((e) {
        final q = e.quantity;
        return q != null && q.isNotEmpty ? '${e.cleanName} ($q)' : e.cleanName;
      }).toList();

      final result = await ai.generateRecipesFromIngredients(
        ingredients: ingredients,
        mode: ScanMode.survival,
        diet: ref.read(dietProfileProvider),
        locale: ref.read(localeProvider),
        cuisineRegion: ref.read(effectiveCuisineRegionProvider),
      );

      if (!context.mounted) return;
      await AppNavigator.pushRecipesResults(
        context,
        result: result,
        mode: ScanMode.survival,
      );
    },
  );
}
