import '../core/enums/cuisine_region.dart';
import '../core/l10n/ai_cuisine_prompts.dart';
import '../core/l10n/ai_locale_prompts.dart';
import '../core/enums/app_locale.dart';
import '../core/enums/diet_profile.dart';
import '../core/enums/scan_mode.dart';
import '../core/scan/scan_mode_prompts.dart';

/// Builds mode-aware prompts for Gemini 3 Flash structured JSON output.
abstract final class GeminiPromptBuilder {
  static String build(
    ScanMode mode, {
    String? survivalExpiryHint,
    DietProfile diet = DietProfile.none,
    AppLocale locale = AppLocale.tr,
    CuisineRegion cuisineRegion = CuisineRegion.turkish,
  }) {
    final lang = AiLocalePrompts.languageName(locale);
    final difficultyValues = AiLocalePrompts.difficultyValues(locale);

    final modeRules = ScanModePrompts.rules(mode, locale: locale);

    final userHint = mode == ScanMode.survival &&
            survivalExpiryHint != null &&
            survivalExpiryHint.trim().isNotEmpty
        ? '''

USER HINT (expiring soon — prioritize these over visual guesses):
${survivalExpiryHint.trim()}
'''
        : '';

    final dietBlock = diet.promptRules.isEmpty
        ? ''
        : '''

${diet.promptRules}
''';
    final strictLanguageBlock = AiLocalePrompts.strictLanguageBlock(locale);
    final cuisineBlock = AiCuisinePrompts.cuisinePromptBlock(cuisineRegion);

    return '''
You are CyberChef, an expert pantry vision AI. Analyze the fridge/pantry photo.

$modeRules$userHint$dietBlock$cuisineBlock$strictLanguageBlock

TASK:
1. Identify all visible food ingredients (be specific: "Greek yogurt" not just "dairy").
2. Generate exactly 3 recipes following the MODE recipe mix above, using primarily visible ingredients.

Return ONLY valid JSON (no markdown, no commentary) matching this schema:
{
  "ingredients": ["string"],
  "recipes": [
    {
      "title": "string",
      "cookTime": "string (e.g. ${AiLocalePrompts.cookTimeExample(locale)})",
      "difficulty": "$difficultyValues",
      "instructions": ["string step 1", "string step 2"],
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
- Write ALL user-visible text in $lang (titles, ingredients, steps, cookTime).
- ingredients: 3–20 items max.
- recipes: exactly 3 entries; titles must sound different from each other.
- instructions: follow MODE step count; be specific to visible items.
- nutrition: estimated per serving (integers); include for every recipe.
- difficulty must use exactly the allowed values above and obey MODE constraints.
- If the image is not food/fridge/pantry, return {"ingredients":[],"recipes":[]}.
''';
  }
}
