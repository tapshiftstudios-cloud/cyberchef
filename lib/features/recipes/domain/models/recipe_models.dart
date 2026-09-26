import '../../../../core/l10n/app_strings.dart';
import 'nutrition_estimate.dart';

/// Structured JSON models returned by Gemini (scaffold for next phase).

class PantryAnalysisResult {
  const PantryAnalysisResult({
    required this.ingredients,
    required this.recipes,
    this.imageSearchIngredients,
  });

  factory PantryAnalysisResult.fromJson(Map<String, dynamic> json) {
    final ingredients = (json['ingredients'] as List<dynamic>? ?? [])
        .map((e) => e.toString())
        .toList();
    final storedSearch = json['imageSearchIngredients'] as List<dynamic>?;
    return PantryAnalysisResult(
      ingredients: ingredients,
      recipes: (json['recipes'] as List<dynamic>? ?? [])
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageSearchIngredients: storedSearch?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'ingredients': ingredients,
        'recipes': recipes.map((r) => r.toJson()).toList(),
        if (imageSearchIngredients != null &&
            !_sameStringList(imageSearchIngredients!, ingredients))
          'imageSearchIngredients': imageSearchIngredients,
      };

  final List<String> ingredients;
  final List<Recipe> recipes;
  /// Original scan language — used for stock photo search after UI localization.
  final List<String>? imageSearchIngredients;

  List<String> get effectiveImageSearchIngredients =>
      (imageSearchIngredients != null && imageSearchIngredients!.isNotEmpty)
          ? imageSearchIngredients!
          : ingredients;

  static bool _sameStringList(List<String> a, List<String> b) {
    if (a.length != b.length) return false;
    for (var i = 0; i < a.length; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

class Recipe {
  const Recipe({
    required this.title,
    required this.cookTime,
    required this.difficulty,
    required this.instructions,
    this.nutrition,
    this.imageUrl,
    this.imageSearchTitle,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final nutritionRaw = json['nutrition'];
    final title = json['title'] as String? ?? AppStrings.untitledRecipe;
    return Recipe(
      title: title,
      cookTime: json['cookTime'] as String? ?? '',
      difficulty: json['difficulty'] as String? ?? '',
      instructions: (json['instructions'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      nutrition: nutritionRaw is Map<String, dynamic>
          ? NutritionEstimate.fromJson(nutritionRaw)
          : NutritionEstimate.fromJson(
              nutritionRaw is Map
                  ? Map<String, dynamic>.from(nutritionRaw)
                  : null,
            ),
      imageUrl: json['imageUrl'] as String?,
      imageSearchTitle: json['imageSearchTitle'] as String? ?? title,
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'cookTime': cookTime,
        'difficulty': difficulty,
        'instructions': instructions,
        if (nutrition != null && nutrition!.hasData)
          'nutrition': nutrition!.toJson(),
        if (imageUrl != null && imageUrl!.trim().isNotEmpty)
          'imageUrl': imageUrl,
        if (imageSearchTitle != null &&
            imageSearchTitle!.trim().isNotEmpty &&
            imageSearchTitle != title)
          'imageSearchTitle': imageSearchTitle,
      };

  final String title;
  final String cookTime;
  final String difficulty;
  final List<String> instructions;
  final NutritionEstimate? nutrition;
  /// Optional cover image (V2: AI/proxy). When null, [RecipeImageService] resolves stock.
  final String? imageUrl;
  /// Language at scan time — stock photos search this, not localized [title].
  final String? imageSearchTitle;

  String get effectiveImageSearchTitle =>
      (imageSearchTitle != null && imageSearchTitle!.trim().isNotEmpty)
          ? imageSearchTitle!.trim()
          : title;
}
