import '../../recipes/domain/models/recipe_models.dart';

class FavoriteRecipe {
  const FavoriteRecipe({
    required this.id,
    required this.recipe,
    required this.savedAt,
    this.modeLabel,
  });

  factory FavoriteRecipe.fromJson(Map<String, dynamic> json) {
    return FavoriteRecipe(
      id: json['id'] as String,
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      savedAt: DateTime.parse(json['savedAt'] as String),
      modeLabel: json['modeLabel'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'recipe': recipe.toJson(),
        'savedAt': savedAt.toIso8601String(),
        if (modeLabel != null) 'modeLabel': modeLabel,
      };

  final String id;
  final Recipe recipe;
  final DateTime savedAt;
  final String? modeLabel;

  static String idForRecipe(Recipe recipe) {
    return Object.hash(
      recipe.title,
      recipe.cookTime,
      recipe.difficulty,
      Object.hashAll(recipe.instructions),
    ).toString();
  }
}
