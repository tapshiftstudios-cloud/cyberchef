import '../enums/app_locale.dart';

/// Kaydedilmiş tarif metinlerini mevcut arayüz diline yaklaştırır.
abstract final class RecipeTextLocalizer {
  static const Map<String, String> _toEnglishMap = {
    've': 'and',
    'ile': 'with',
    'için': 'for',
    'icin': 'for',
    'onları': 'them',
    'onlari': 'them',
    'sonra': 'then',
    'önce': 'before',
    'once': 'before',
    'hemen': 'immediately',
    'hızlıca': 'quickly',
    'hizlica': 'quickly',
    'yüksek ateşte': 'on high heat',
    'yuksek ateste': 'on high heat',
    'orta ateşte': 'on medium heat',
    'kısık ateşte': 'on low heat',
    'kisik ateste': 'on low heat',
    'kadar': 'until',
    'az': 'less',
    'yerine': 'instead',
    'nemli bir bezle': 'with a damp cloth',
    'su dan geçirin': 'rinse in water',
    'su dan gecirin': 'rinse in water',
    'tavada': 'in pan',
    'doğranmış': 'chopped',
    'dogranmis': 'chopped',
    'ekleyip': 'add and',
    'ekleyerek': 'by adding',
    'kabukları soyulmuş': 'peeled',
    'kabuklari soyulmus': 'peeled',
    'baharatları': 'spices',
    'baharatlari': 'spices',
    'yumuşayana': 'until soft',
    'yumusayana': 'until soft',
    'yıkamak': 'washing',
    'yikamak': 'washing',
    'pişirmeden': 'before cooking',
    'pisirmeden': 'before cooking',
    'geçirin': 'rinse',
    'gecirin': 'rinse',
    'yemek kaşığı': 'tbsp',
    'yemek kasigi': 'tbsp',
    'tatlı kaşığı': 'tsp',
    'tatli kasigi': 'tsp',
    'çay kaşığı': 'tsp',
    'cay kasigi': 'tsp',
    'yarım': 'half',
    'yarim': 'half',
    'çok az': 'a little',
    'cok az': 'a little',
    'servis yapın': 'serve',
    'servis edin': 'serve',
    'pişirin': 'cook',
    'pisirin': 'cook',
    'kavurun': 'saute',
    'soteleyin': 'saute',
    'sotelemeye devam edin': 'continue sauteing',
    'doğrayın': 'chop',
    'dograyin': 'chop',
    'ekleyin': 'add',
    'karıştırın': 'mix',
    'karistirin': 'mix',
    'yıkayın': 'wash',
    'yikayin': 'wash',
    'silin': 'wipe',
    'pişirmeden önce': 'before cooking',
    'pisirmeden once': 'before cooking',
    'suyunu': 'its water',
    'suyu': 'water',
    'küp küp': 'into cubes',
    'kup kup': 'into cubes',
    'mühürleyin': 'sear',
    'muhurleyin': 'sear',
    'domates': 'tomato',
    'mantar': 'mushroom',
    'tavuk': 'chicken',
    'peynir': 'cheese',
    'yoğurt': 'yogurt',
    'yogurt': 'yogurt',
    'süt': 'milk',
    'sut': 'milk',
    'soğan': 'onion',
    'sogan': 'onion',
    'biber': 'pepper',
    'salça': 'paste',
    'salca': 'paste',
    'kolay': 'Easy',
    'orta': 'Medium',
    'zor': 'Hard',
    'dk': 'min',
  };

  static const Map<String, String> _toTurkishMap = {
    'sample plating': 'Ornek sunum',
    'easy': 'Kolay',
    'medium': 'Orta',
    'hard': 'Zor',
    'minutes': 'dk',
    'minute': 'dk',
    'min': 'dk',
    'and': 've',
    'with': 'ile',
    'for': 'icin',
    'before': 'oncesi',
    'instead': 'yerine',
    'immediately': 'hemen',
    'quickly': 'hizlica',
    'on high heat': 'yuksek ateste',
    'on medium heat': 'orta ateste',
    'on low heat': 'kisik ateste',
    'until': 'kadar',
    'in pan': 'tavada',
    'chopped': 'dogranmis',
    'add and': 'ekleyip',
    'by adding': 'ekleyerek',
    'peeled': 'kabugu soyulmus',
    'spices': 'baharatlar',
    'until soft': 'yumusayana kadar',
    'washing': 'yikamak',
    'before cooking': 'pisirmeden once',
    'rinse in water': 'sudan gecirin',
    'rinse': 'gecirin',
    'tbsp': 'yemek kasigi',
    'tsp': 'cay kasigi',
    'half': 'yarim',
    'a little': 'cok az',
    'serve': 'servis yapin',
    'cook': 'pisirin',
    'saute': 'soteleyin',
    'continue sauteing': 'sotelemeye devam edin',
    'chop': 'dograyin',
    'add': 'ekleyin',
    'mix': 'karistirin',
    'wash': 'yikayin',
    'wipe': 'silin',
    'its water': 'suyunu',
    'water': 'su',
    'into cubes': 'kup kup',
    'sear': 'muhurleyin',
    'tomato': 'domates',
    'mushroom': 'mantar',
    'chicken': 'tavuk',
    'cheese': 'peynir',
    'yogurt': 'yogurt',
    'milk': 'sut',
    'onion': 'sogan',
    'pepper': 'biber',
    'paste': 'salca',
    'them': 'onlari',
  };

  static String localize(String text, AppLocale locale) {
    if (text.trim().isEmpty) return text;

    final map = locale == AppLocale.en ? _toEnglishMap : _toTurkishMap;
    var out = text;
    final keys = map.keys.toList()..sort((a, b) => b.length.compareTo(a.length));
    for (final key in keys) {
      out = out.replaceAll(RegExp(key, caseSensitive: false), map[key]!);
    }
    if (locale == AppLocale.en) {
      out = _cleanupMixedSuffixes(out);
    }
    return _normalizeWhitespace(out);
  }

  static String _cleanupMixedSuffixes(String text) {
    var out = text;

    // Turkish "with" suffixes after translated tokens: chickenli/chickenlu -> chicken.
    out = out.replaceAllMapped(
      RegExp(
        r'\b([A-Za-z]+)(lı|li|lu|lü|lı|li|lu|lü|li|lu)\b',
        caseSensitive: false,
      ),
      (m) => m.group(1)!,
    );

    // Turkish plural/possessive endings stuck to translated words.
    out = out.replaceAllMapped(
      RegExp(
        r'\b(mushroom|chicken|tomato|onion|pepper|cheese|yogurt|milk)(ların|lerin|lari|leri|ların|lerin)\b',
        caseSensitive: false,
      ),
      (m) => '${m.group(1)}s',
    );

    // Common broken transliterations from OCR/LLM outputs.
    out = out.replaceAll(RegExp(r'\bmuhurleyin\b', caseSensitive: false), 'sear');
    out = out.replaceAll(RegExp(r'\bpisirin\b', caseSensitive: false), 'cook');
    out = out.replaceAll(RegExp(r'\bdogranmis\b', caseSensitive: false), 'chopped');

    return out;
  }

  static String _normalizeWhitespace(String text) {
    return text.replaceAll(RegExp(r'\s+'), ' ').trim();
  }
}
