import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/pantry_repository.dart';
import '../../domain/models/pantry_scan_record.dart';

final pantryRepositoryProvider = Provider<PantryRepository>((ref) {
  return PantryRepository();
});

final pantryHistoryProvider =
    AsyncNotifierProvider<PantryHistoryNotifier, List<PantryScanRecord>>(
  PantryHistoryNotifier.new,
);

class PantryHistoryNotifier extends AsyncNotifier<List<PantryScanRecord>> {
  @override
  Future<List<PantryScanRecord>> build() async {
    final repo = ref.read(pantryRepositoryProvider);
    if (!repo.isAvailable) return [];
    try {
      return await repo.fetchHistory();
    } on PantryException catch (e) {
      if (e.type == PantryErrorType.notAuthenticated) return [];
      rethrow;
    }
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(pantryRepositoryProvider).fetchHistory();
    });
  }

  Future<void> deleteScan(String id) async {
    await ref.read(pantryRepositoryProvider).deleteScan(id);
    await refresh();
  }
}
