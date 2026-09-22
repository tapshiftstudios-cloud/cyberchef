import 'package:cyberchef/features/recipes/domain/models/recipe_models.dart';

Recipe testRecipe({
  String title = 'Test',
  String cookTime = '15 min',
  String difficulty = 'Easy',
}) {
  return Recipe(
    title: title,
    cookTime: cookTime,
    difficulty: difficulty,
    instructions: const ['Step 1'],
  );
}

PantryAnalysisResult testPantryResult(List<Recipe> recipes) {
  return PantryAnalysisResult(
    ingredients: const ['egg', 'milk'],
    recipes: recipes,
  );
}
