import '../../../../core/l10n/app_strings.dart';
import 'nutrition_estimate.dart';

/// Structured JSON models returned by Gemini (scaffold for next phase).

class PantryAnalysisResult {
  const PantryAnalysisResult({
    required this.ingredients,
    required this.recipes,
  });

  factory PantryAnalysisResult.fromJson(Map<String, dynamic> json) {
    return PantryAnalysisResult(
      ingredients: (json['ingredients'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      recipes: (json['recipes'] as List<dynamic>? ?? [])
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'ingredients': ingredients,
        'recipes': recipes.map((r) => r.toJson()).toList(),
      };

  final List<String> ingredients;
  final List<Recipe> recipes;
}

class Recipe {
  const Recipe({
    required this.title,
    required this.cookTime,
    required this.difficulty,
    required this.instructions,
    this.nutrition,
    this.imageUrl,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    final nutritionRaw = json['nutrition'];
    return Recipe(
      title: json['title'] as String? ?? AppStrings.untitledRecipe,
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
      };

  final String title;
  final String cookTime;
  final String difficulty;
  final List<String> instructions;
  final NutritionEstimate? nutrition;
  /// Optional cover image (V2: AI/proxy). When null, [RecipeImageService] resolves stock.
  final String? imageUrl;
}
