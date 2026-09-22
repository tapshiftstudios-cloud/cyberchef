import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../recipes/domain/models/recipe_models.dart';
import '../../../../core/enums/scan_mode.dart';
import '../../data/recent_scan_storage.dart';
import '../../domain/recent_scan.dart';

final recentScansProvider =
    AsyncNotifierProvider<RecentScansNotifier, List<RecentScan>>(
  RecentScansNotifier.new,
);

class RecentScansNotifier extends AsyncNotifier<List<RecentScan>> {
  @override
  Future<List<RecentScan>> build() => RecentScanStorage.loadAll();

  Future<void> addScan({
    required ScanMode mode,
    required PantryAnalysisResult result,
  }) async {
    final current = state.valueOrNull ?? await RecentScanStorage.loadAll();
    final entry = RecentScan(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      scannedAt: DateTime.now(),
      mode: mode,
      analysis: result,
    );
    final updated = [entry, ...current].take(RecentScanStorage.maxItems).toList();
    await RecentScanStorage.saveAll(updated);
    state = AsyncData(updated);
  }

  Future<void> remove(String id) async {
    final current = state.valueOrNull ?? await RecentScanStorage.loadAll();
    final updated = current.where((s) => s.id != id).toList();
    await RecentScanStorage.saveAll(updated);
    state = AsyncData(updated);
  }

  Future<void> clearAll() async {
    await RecentScanStorage.saveAll([]);
    state = const AsyncData([]);
  }
}
