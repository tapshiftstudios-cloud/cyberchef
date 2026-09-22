import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/shopping_list_storage.dart';
import '../../domain/shopping_list_item.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingListItem>>(
  (ref) => ShoppingListNotifier(),
);

class ShoppingListNotifier extends StateNotifier<List<ShoppingListItem>> {
  ShoppingListNotifier() : super(const []) {
    _load();
  }

  Future<void> refresh() async {
    state = await ShoppingListStorage.loadAll();
  }

  Future<void> _load() async {
    await refresh();
  }

  Future<void> _persist() async {
    await ShoppingListStorage.saveAll(state);
  }

  Future<void> add(String name, {String? fromRecipe}) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;
    final exists = state.any(
      (e) => e.name.toLowerCase() == trimmed.toLowerCase() && !e.checked,
    );
    if (exists) return;
    state = [
      ShoppingListItem(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        name: trimmed,
        fromRecipe: fromRecipe,
      ),
      ...state,
    ];
    await _persist();
  }

  Future<void> addMissingIngredients(
    List<String> required,
    List<String> available,
  ) async {
    final avail = available.map((e) => e.toLowerCase()).toSet();
    for (final ing in required) {
      final lower = ing.toLowerCase();
      final has = avail.any(
        (a) => lower.contains(a) || a.contains(lower),
      );
      if (!has) await add(ing);
    }
  }

  Future<void> toggle(String id) async {
    state = state
        .map((e) => e.id == id ? e.copyWith(checked: !e.checked) : e)
        .toList();
    await _persist();
  }

  Future<void> remove(String id) async {
    state = state.where((e) => e.id != id).toList();
    await _persist();
  }

  Future<void> clearChecked() async {
    state = state.where((e) => !e.checked).toList();
    await _persist();
  }
}
