import '../enums/app_locale.dart';

/// Fiş/OCR ile kaydedilen Türkçe ürün ve mağaza adlarını EN arayüzde okunaklı gösterir.
abstract final class PantryNameLocalizer {
  static const _storeNames = {
    'Şehir Süpermarketleri': 'City Supermarkets',
    'Sehir Supermarketleri': 'City Supermarkets',
  };

  static const _phrases = {
    'Domates Salçası': 'Tomato paste',
    'Domates Salca': 'Tomato paste',
    'Uno Ekmek': 'Uno bread',
    'Banvit Tavuk': 'Banvit chicken',
    'Sütaş Ayran': 'Sutas ayran',
    'Sutas Ayran': 'Sutas ayran',
  };

  static const _words = {
    'Ekmek': 'Bread',
    'Mantar': 'Mushroom',
    'Domates': 'Tomato',
    'Krema': 'Cream',
    'Salçası': 'Paste',
    'Salca': 'Paste',
    'Tavuk': 'Chicken',
    'Yoğurt': 'Yogurt',
    'Yogurt': 'Yogurt',
    'Peynir': 'Cheese',
    'Süt': 'Milk',
    'Sut': 'Milk',
    'Ayran': 'Ayran',
    'Elma': 'Apple',
    'Muz': 'Banana',
    'Patates': 'Potato',
    'Soğan': 'Onion',
    'Sogan': 'Onion',
    'Biber': 'Pepper',
    'Et': 'Meat',
    'Balık': 'Fish',
    'Balik': 'Fish',
  };

  static String productName(String name, AppLocale locale) {
    if (locale != AppLocale.en || name.trim().isEmpty) return name;
    return _localize(name.trim(), _phrases, _words);
  }

  static String storeName(String name, AppLocale locale) {
    if (locale != AppLocale.en || name.trim().isEmpty) return name;
    final trimmed = name.trim();
    return _storeNames[trimmed] ?? _localize(trimmed, const {}, _words);
  }

  static String _localize(
    String input,
    Map<String, String> phrases,
    Map<String, String> words,
  ) {
    var result = input;
    final sortedPhrases = phrases.keys.toList()
      ..sort((a, b) => b.length.compareTo(a.length));
    for (final phrase in sortedPhrases) {
      result = result.replaceAll(phrase, phrases[phrase]!);
    }

    for (final entry in words.entries) {
      result = result.replaceAll(
        RegExp('\\b${RegExp.escape(entry.key)}\\b'),
        entry.value,
      );
    }
    return result;
  }
}
