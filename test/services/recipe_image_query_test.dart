import 'package:cyberchef/services/recipe_image_query.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('maps Turkish dish titles to English stock queries', () {
    expect(
      RecipeImageQuery.forTitle('Karnabahar Mücveri'),
      'cauliflower fritters',
    );
    expect(
      RecipeImageQuery.forTitle('Zeytinyağlı Pırasa'),
      'leeks olive oil dish',
    );
    expect(
      RecipeImageQuery.forTitle('Pratik Ev Sütlacı'),
      'turkish rice pudding',
    );
    expect(
      RecipeImageQuery.forTitle('Lorlu Burgu Makarna'),
      'fusilli pasta cheese',
    );
  });

  test('maps English dish titles for stock search', () {
    expect(
      RecipeImageQuery.forTitle('Cauliflower Fritters with Herbs'),
      'cauliflower fritters',
    );
    expect(
      RecipeImageQuery.forTitle('Quick Chicken Rice Pilaf'),
      'chicken rice pilaf',
    );
  });

  test('uses pantry ingredients when title is generic', () {
    expect(
      RecipeImageQuery.forTitle(
        'Hızlı Tabak',
        ingredients: ['tavuk', 'pirinç'],
      ),
      'chicken dish',
    );
  });
}
