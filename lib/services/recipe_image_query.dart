/// Builds English stock-photo search terms from localized recipe titles.
abstract final class RecipeImageQuery {
  /// English dish phrases (longest match first).
  static const _englishDishTerms = <(String, String)>[
    ('cauliflower fritters', 'cauliflower fritters'),
    ('cauliflower mücver', 'cauliflower fritters'),
    ('rice pudding', 'turkish rice pudding'),
    ('chicken rice pilaf', 'chicken rice pilaf'),
    ('rice pilaf', 'rice pilaf dish'),
    ('olive oil leeks', 'leeks olive oil dish'),
    ('leeks with olive oil', 'leeks olive oil dish'),
    ('fusilli pasta', 'fusilli pasta'),
    ('pasta with cheese', 'pasta cheese'),
    ('chicken sauté', 'chicken saute dish'),
    ('chicken saute', 'chicken saute dish'),
    ('stuffed peppers', 'stuffed peppers dish'),
    ('vegetable soup', 'vegetable soup bowl'),
    ('tomato soup', 'tomato soup bowl'),
    ('chicken soup', 'chicken soup bowl'),
    ('greek salad', 'greek salad bowl'),
    ('caesar salad', 'caesar salad'),
    ('beef stew', 'beef stew bowl'),
    ('fried rice', 'fried rice dish'),
    ('omelette', 'omelette plate'),
    ('scrambled eggs', 'scrambled eggs plate'),
  ];

  static const _turkishDishTerms = <(String, String)>[
    ('karnabahar mücver', 'cauliflower fritters'),
    ('karnabahar mucver', 'cauliflower fritters'),
    ('zeytinyağlı pırasa', 'leeks olive oil dish'),
    ('zeytinyagli pirasa', 'leeks olive oil dish'),
    ('sütlaç', 'turkish rice pudding'),
    ('sutlac', 'turkish rice pudding'),
    ('sütlac', 'turkish rice pudding'),
    ('sutlaci', 'turkish rice pudding'),
    ('lorlu burgu', 'fusilli pasta cheese'),
    ('burgu makarna', 'fusilli pasta'),
    ('pilav', 'rice pilaf dish'),
    ('makarna', 'pasta dish'),
    ('mücver', 'zucchini fritters'),
    ('mucver', 'vegetable fritters'),
    ('pırasa', 'leek dish'),
    ('pirasa', 'leek dish'),
    ('karnabahar', 'cauliflower dish'),
    ('tavuk', 'chicken dish'),
    ('çorba', 'soup bowl'),
    ('corba', 'soup bowl'),
    ('salata', 'fresh salad'),
    ('kebap', 'kebab plate'),
    ('köfte', 'meatballs plate'),
    ('kofte', 'meatballs plate'),
    ('börek', 'borek pastry'),
    ('borek', 'borek pastry'),
    ('dolma', 'stuffed vegetables'),
    ('menemen', 'turkish eggs pan'),
    ('omlet', 'omelette plate'),
  ];

  static String forTitle(String rawTitle, {List<String> ingredients = const []}) {
    final titleNorm = _normalize(rawTitle);
    if (titleNorm.isEmpty) return 'homemade food plate';

    final fromTitle = _matchTerms(titleNorm, _englishDishTerms) ??
        _matchTerms(titleNorm, _turkishDishTerms);
    if (fromTitle != null) return fromTitle;

    final fromIngredients = _fromIngredients(ingredients);
    if (fromIngredients != null) return fromIngredients;

    if (_isMostlyLatin(titleNorm)) {
      final short = _firstWords(titleNorm, 5);
      if (short.isNotEmpty) return '$short food dish';
    }

    return 'homemade food plate';
  }

  static String? _matchTerms(String haystack, List<(String, String)> terms) {
    for (final (needle, english) in terms) {
      if (haystack.contains(needle)) return english;
    }
    return null;
  }

  static String? _fromIngredients(List<String> ingredients) {
    if (ingredients.isEmpty) return null;
    final blob = _normalize(ingredients.take(6).join(' '));
    if (blob.isEmpty) return null;

    final fromTerms = _matchTerms(blob, _englishDishTerms) ??
        _matchTerms(blob, _turkishDishTerms);
    if (fromTerms != null) return fromTerms;

    const ingredientMap = <String, String>{
      'chicken': 'chicken dish',
      'tavuk': 'chicken dish',
      'rice': 'rice dish',
      'pirinç': 'rice dish',
      'pirinc': 'rice dish',
      'pasta': 'pasta dish',
      'makarna': 'pasta dish',
      'cauliflower': 'cauliflower dish',
      'karnabahar': 'cauliflower dish',
      'leek': 'leek dish',
      'pırasa': 'leek dish',
      'pirasa': 'leek dish',
      'milk': 'creamy dessert',
      'süt': 'creamy dessert',
      'egg': 'egg dish',
      'yumurta': 'egg dish',
      'cheese': 'cheese dish',
      'peynir': 'cheese dish',
      'lor': 'cheese dish',
      'tomato': 'tomato dish',
      'domates': 'tomato dish',
      'potato': 'potato dish',
      'patates': 'potato dish',
    };

    for (final entry in ingredientMap.entries) {
      if (blob.contains(entry.key)) return entry.value;
    }
    return null;
  }

  static String _normalize(String input) {
    return input
        .toLowerCase()
        .replaceAll(RegExp(r'\([^)]*\)'), ' ')
        .replaceAll(RegExp(r'[^a-z0-9çğıöşü\s-]', unicode: true), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }

  static bool _isMostlyLatin(String text) {
    if (text.isEmpty) return false;
    var latin = 0;
    for (final rune in text.runes) {
      if (rune <= 0x7f || (rune >= 0xc0 && rune <= 0x24f)) latin++;
    }
    return latin / text.length >= 0.85;
  }

  static String _firstWords(String text, int maxWords) {
    final parts = text.split(' ').where((w) => w.length > 2).take(maxWords);
    return parts.join(' ');
  }
}
