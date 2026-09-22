import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/enums/scan_mode.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/core/scan/recipe_mode_processor.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/recipe_fixtures.dart';

void main() {
  setUp(() => AppStrings.useLocale(AppLocale.tr));
  tearDown(() => AppStrings.useLocale(AppLocale.tr));

  group('RecipeModeProcessor', () {
    test('quickScan sorts by shortest cook time first', () {
      final input = testPantryResult([
        testRecipe(title: 'Slow', cookTime: '30 dk', difficulty: 'Kolay'),
        testRecipe(title: 'Fast', cookTime: '8 dk', difficulty: 'Orta'),
        testRecipe(title: 'Mid', cookTime: '15 dk', difficulty: 'Kolay'),
      ]);

      final out = RecipeModeProcessor.apply(input, ScanMode.quickScan);

      expect(out.recipes.map((r) => r.title), ['Fast', 'Mid', 'Slow']);
    });

    test('chefMode puts harder recipes first', () {
      final input = testPantryResult([
        testRecipe(title: 'Easy', cookTime: '10 min', difficulty: 'Easy'),
        testRecipe(title: 'Hard', cookTime: '1 saat', difficulty: 'Hard'),
        testRecipe(title: 'Mid', cookTime: '25 min', difficulty: 'Medium'),
      ]);

      final out = RecipeModeProcessor.apply(input, ScanMode.chefMode);

      expect(out.recipes.first.title, 'Hard');
      expect(out.recipes.last.title, 'Easy');
    });

    test('parses hour + minute cook times for ordering', () {
      final input = testPantryResult([
        testRecipe(title: 'Long', cookTime: '1 saat 10 dk', difficulty: 'Zor'),
        testRecipe(title: 'Short', cookTime: '12 dk', difficulty: 'Kolay'),
      ]);

      final out = RecipeModeProcessor.apply(input, ScanMode.quickScan);

      expect(out.recipes.first.title, 'Short');
    });

    test('returns same result when fewer than two recipes', () {
      final input = testPantryResult([
        testRecipe(title: 'Only'),
      ]);

      final out = RecipeModeProcessor.apply(input, ScanMode.quickScan);

      expect(identical(out, input), isTrue);
    });

    test('preserves ingredients list', () {
      final input = testPantryResult([
        testRecipe(cookTime: '5 dk'),
        testRecipe(cookTime: '20 dk'),
      ]);

      final out = RecipeModeProcessor.apply(input, ScanMode.survival);

      expect(out.ingredients, input.ingredients);
    });
  });
}
