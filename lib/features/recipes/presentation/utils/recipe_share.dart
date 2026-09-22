import '../../../../core/l10n/app_strings.dart';
import '../../domain/models/recipe_models.dart';

String formatRecipeForShare(Recipe recipe) {
  final buffer = StringBuffer()
    ..writeln(recipe.title)
    ..writeln('${recipe.cookTime} · ${recipe.difficulty}')
    ..writeln()
    ..writeln(AppStrings.recipeShareInstructionsHeader);

  for (var i = 0; i < recipe.instructions.length; i++) {
    buffer.writeln('${i + 1}. ${recipe.instructions[i]}');
  }

  buffer.writeln();
  buffer.write(AppStrings.recipeShareFooter);

  return buffer.toString();
}
