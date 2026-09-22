import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/features/recipes/domain/models/recipe_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => AppStrings.useLocale(AppLocale.en));

  group('PantryAnalysisResult.fromJson', () {
    test('parses ingredients and recipes with nutrition', () {
      final result = PantryAnalysisResult.fromJson({
        'ingredients': ['egg', 'milk'],
        'recipes': [
          {
            'title': 'Omelet',
            'cookTime': '10 min',
            'difficulty': 'Easy',
            'instructions': ['Beat eggs', 'Cook'],
            'nutrition': {
              'calories': 320,
              'protein_g': 18,
              'carbs_g': 4,
              'fat_g': 22,
              'servings': 1,
            },
          },
        ],
      });

      expect(result.ingredients, ['egg', 'milk']);
      expect(result.recipes, hasLength(1));
      expect(result.recipes.first.title, 'Omelet');
      expect(result.recipes.first.nutrition?.calories, 320);
    });

    test('handles empty lists', () {
      final result = PantryAnalysisResult.fromJson({
        'ingredients': [],
        'recipes': [],
      });

      expect(result.ingredients, isEmpty);
      expect(result.recipes, isEmpty);
    });

    test('round-trips through toJson', () {
      final original = PantryAnalysisResult.fromJson({
        'ingredients': ['bread'],
        'recipes': [
          {
            'title': 'Toast',
            'cookTime': '5 min',
            'difficulty': 'Easy',
            'instructions': ['Toast bread'],
          },
        ],
      });

      final restored = PantryAnalysisResult.fromJson(original.toJson());

      expect(restored.ingredients, original.ingredients);
      expect(restored.recipes.first.title, original.recipes.first.title);
    });
  });
}
