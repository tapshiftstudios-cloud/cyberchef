import '../../features/pantry/domain/models/pantry_item.dart';

/// Buzdolabı taraması ile fiş envanteri çakışma ipucu.
abstract final class PantryCrossValidation {
  static List<String> findPossibleMismatches({
    required List<String> scanIngredients,
    required List<PantryItem> pantryItems,
  }) {
    final pantryNames = pantryItems
        .where((e) => !e.isConsumed)
        .map((e) => e.cleanName.toLowerCase())
        .toSet();

    final mismatches = <String>[];
    for (final ing in scanIngredients) {
      final lower = ing.toLowerCase();
      final inPantry = pantryNames.any(
        (p) => lower.contains(p) || p.contains(lower),
      );
      if (!inPantry && ing.length > 2) {
        mismatches.add(ing);
      }
    }
    return mismatches.take(5).toList();
  }
}
