import '../core/enums/cuisine_region.dart';
import '../core/l10n/ai_cuisine_prompts.dart';
import '../core/l10n/ai_locale_prompts.dart';
import '../core/enums/app_locale.dart';
import '../core/enums/diet_profile.dart';
import '../core/enums/scan_mode.dart';
import '../core/scan/scan_mode_prompts.dart';

/// Malzeme listesinden tarif üretimi — görüntü/tarif modlarından ayrı.
abstract final class GeminiIngredientsPromptBuilder {
  static String build(
    List<String> ingredients,
    ScanMode mode, {
    DietProfile diet = DietProfile.none,
    AppLocale locale = AppLocale.tr,
    CuisineRegion cuisineRegion = CuisineRegion.turkish,
  }) {
    final lang = AiLocalePrompts.languageName(locale);
    final difficultyValues = AiLocalePrompts.difficultyValues(locale);
    final list = ingredients.map((e) => '- $e').join('\n');
    final modeRules = ScanModePrompts.rules(mode, locale: locale);

    final dietBlock = diet.promptRules.isEmpty ? '' : '\n${diet.promptRules}\n';
    final strictLanguageBlock = AiLocalePrompts.strictLanguageBlock(locale);
    final cuisineBlock = AiCuisinePrompts.cuisinePromptBlock(cuisineRegion);

    return '''
You are CyberChef. Generate recipes from this pantry ingredient list (receipt/freshness tracking).

$modeRules$dietBlock$cuisineBlock$strictLanguageBlock

INGREDIENTS:
$list

Return ONLY valid JSON:
{
  "ingredients": ["string"],
  "recipes": [
    {
      "title": "string",
      "cookTime": "string",
      "difficulty": "$difficultyValues",
      "instructions": ["step"],
      "nutrition": {
        "calories": 320,
        "protein_g": 18,
        "carbs_g": 35,
        "fat_g": 12,
        "servings": 2
      }
    }
  ]
}

Rules:
- $lang for all user-visible text.
- Exactly 3 recipes following the MODE recipe mix; use primarily listed ingredients.
- nutrition: estimated per serving (integers) for each recipe.
- ingredients array: echo input plus any reasonable staples you assume (max 20).
- Obey MODE difficulty and cookTime constraints.
''';
  }
}
