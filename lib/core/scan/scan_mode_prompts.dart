import '../l10n/ai_locale_prompts.dart';
import '../enums/app_locale.dart';
import '../enums/scan_mode.dart';

/// Gemini için mod kuralları (görüntü + malzeme listesi paylaşımlı).
abstract final class ScanModePrompts {
  static String rules(
    ScanMode mode, {
    AppLocale locale = AppLocale.tr,
  }) {
    final difficulty = AiLocalePrompts.difficultyValues(locale);
    final easyMedium = AiLocalePrompts.easyOrMedium(locale);
    final hardLevel = AiLocalePrompts.hard(locale);

    return switch (mode) {
      ScanMode.quickScan => '''
MODE: QUICK SCAN (weeknight / minimal effort)
Goals: 3 distinct recipes anyone can finish in ≤15 minutes total (prep + cook combined).

Recipe mix (required):
- Recipe 1: no-cook or microwave-only (salad, wrap, yogurt bowl, sandwich).
- Recipe 2: single pan / one pot (stir-fry, scrambled eggs, quick pasta).
- Recipe 3: ≤10 min active time (omelet, quesadilla, fried rice with pre-cooked rice).

Constraints:
- cookTime MUST state total minutes and be ≤15 (e.g. "${AiLocalePrompts.cookTimeExample(locale)}").
- difficulty: $easyMedium only — never "$hardLevel".
- Max 6 ingredients per recipe; avoid rare equipment (no sous-vide, no long marination).
- Steps: short, imperative, 4–6 steps; mention substitutions if an ingredient is missing.''',
      ScanMode.survival => '''
MODE: RESCUE / SURVIVAL (reduce waste)
Goals: Use what is visible AND what the user flagged as expiring soon; minimize thrown-away food.

Recipe mix (required):
- Recipe 1: "clean-out-the-fridge" bowl/soup/stir-fry using the most perishable items first.
- Recipe 2: transform leftovers (frittata, fried rice, casserole, smoothie if fruit).
- Recipe 3: freezer-friendly or next-day lunch using remaining items.

Constraints:
- Each recipe should use ≥60% of listed ingredients where possible; overlap ingredients across recipes.
- Step 1 of every recipe: one sentence on storage or using a substitute if something is past peak.
- Prefer realistic home cooking; difficulty may be $difficulty.
- If user hint lists expiring items, those MUST appear in at least 2 recipes.''',
      ScanMode.chefMode => '''
MODE: CHEF (restaurant-style)
Goals: 3 elevated recipes that teach technique — not just "more steps".

Recipe mix (required):
- Recipe 1: sauce or emulsion focus (pan sauce, beurre blanc style, tahini-lemon, reduction).
- Recipe 2: texture contrast (crispy + creamy, sear + slow finish, pickle + rich main).
- Recipe 3: composed plate (protein + vegetable + starch with intentional plating note in final step).

Constraints:
- cookTime may exceed 15 minutes; at least 2 of 3 recipes MUST be difficulty "$hardLevel".
- Include at least one advanced technique per recipe (deglaze, blanch-shock, brine, confit-style low heat, etc.).
- 6–8 detailed steps per recipe; mention resting times and doneness cues.
- Allow pantry staples (butter, stock, wine vinegar) even if not visible.''',
    };
  }
}
