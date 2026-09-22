import 'app_locale.dart';
import '../l10n/strings_registry.dart';

/// Tarif üretiminde uygulanan diyet tercihi.
enum DietProfile {
  none,
  vegetarian,
  vegan,
  glutenFree,
  lowCarb,
  halal,
}

extension DietProfileX on DietProfile {
  String label(AppLocale locale) => switch (this) {
        DietProfile.none => stringsForLocale(locale).dietNone,
        DietProfile.vegetarian => stringsForLocale(locale).dietVegetarian,
        DietProfile.vegan => stringsForLocale(locale).dietVegan,
        DietProfile.glutenFree => stringsForLocale(locale).dietGlutenFree,
        DietProfile.lowCarb => stringsForLocale(locale).dietLowCarb,
        DietProfile.halal => stringsForLocale(locale).dietHalal,
      };

  /// Gemini prompt kuralları (İngilizce talimat, çıktı dili ayrı).
  String get promptRules => switch (this) {
        DietProfile.none => '',
        DietProfile.vegetarian =>
          'DIET: Vegetarian — no meat, poultry, or fish. Eggs/dairy allowed unless vegan conflict.',
        DietProfile.vegan =>
          'DIET: Vegan — no animal products (meat, fish, dairy, eggs, honey).',
        DietProfile.glutenFree =>
          'DIET: Gluten-free — avoid wheat, barley, rye; suggest GF substitutes.',
        DietProfile.lowCarb =>
          'DIET: Low carb — minimize bread, pasta, rice, sugar; favor protein and vegetables.',
        DietProfile.halal =>
          'DIET: Halal — no pork, alcohol, or non-halal ingredients in recipes.',
      };
}
