import '../../features/recipes/domain/models/recipe_models.dart';
import '../enums/scan_mode.dart';
import '../utils/recipe_labels.dart';

/// AI çıktısını moda göre sıralar / hafif düzenler.
abstract final class RecipeModeProcessor {
  static PantryAnalysisResult apply(
    PantryAnalysisResult result,
    ScanMode mode,
  ) {
    if (result.recipes.length < 2) return result;

    final recipes = List<Recipe>.from(result.recipes);
    recipes.sort((a, b) => _compare(a, b, mode));

    return PantryAnalysisResult(
      ingredients: result.ingredients,
      recipes: recipes,
    );
  }

  static int _compare(Recipe a, Recipe b, ScanMode mode) {
    return switch (mode) {
      ScanMode.quickScan => _minutes(a.cookTime).compareTo(_minutes(b.cookTime)) != 0
          ? _minutes(a.cookTime).compareTo(_minutes(b.cookTime))
          : _difficultyRank(a.difficulty).compareTo(_difficultyRank(b.difficulty)),
      ScanMode.chefMode => _difficultyRank(b.difficulty).compareTo(_difficultyRank(a.difficulty)) != 0
          ? _difficultyRank(b.difficulty).compareTo(_difficultyRank(a.difficulty))
          : _minutes(b.cookTime).compareTo(_minutes(a.cookTime)),
      ScanMode.survival => _difficultyRank(a.difficulty).compareTo(_difficultyRank(b.difficulty)),
    };
  }

  static int _minutes(String cookTime) {
    final lower = cookTime.toLowerCase();
    var total = 0;
    final hour = RegExp(r'(\d+)\s*(saat|hour|hr|h)\b').firstMatch(lower);
    if (hour != null) total += int.parse(hour.group(1)!) * 60;
    final min = RegExp(r'(\d+)\s*(dk|min|minute|minutes|dakika)\b').firstMatch(lower);
    if (min != null) total += int.parse(min.group(1)!);
    if (total == 0) {
      final bare = RegExp(r'(\d+)').firstMatch(lower);
      if (bare != null) total = int.parse(bare.group(1)!);
    }
    return total;
  }

  static int _difficultyRank(String difficulty) {
    final d = localizeDifficulty(difficulty).toLowerCase();
    if (d.contains('hard') || d.contains('zor')) return 3;
    if (d.contains('medium') || d.contains('orta')) return 2;
    return 1;
  }
}
