import '../enums/app_locale.dart';

/// Gemini tarif / envanter promptları için dil adları ve zorluk etiketleri.
abstract final class AiLocalePrompts {
  static String languageName(AppLocale locale) => switch (locale) {
        AppLocale.en => 'English',
        AppLocale.tr => 'Turkish',
        AppLocale.es => 'Spanish',
        AppLocale.de => 'German',
        AppLocale.fr => 'French',
        AppLocale.pt => 'Portuguese',
        AppLocale.it => 'Italian',
        AppLocale.nl => 'Dutch',
        AppLocale.pl => 'Polish',
        AppLocale.ru => 'Russian',
        AppLocale.ja => 'Japanese',
        AppLocale.ko => 'Korean',
        AppLocale.zh => 'Chinese (Simplified)',
        AppLocale.hi => 'Hindi',
        AppLocale.id => 'Indonesian',
        AppLocale.vi => 'Vietnamese',
        AppLocale.ar => 'Arabic',
        AppLocale.uk => 'Ukrainian',
        AppLocale.cs => 'Czech',
        AppLocale.ro => 'Romanian',
        AppLocale.sv => 'Swedish',
        AppLocale.da => 'Danish',
        AppLocale.fi => 'Finnish',
        AppLocale.el => 'Greek',
        AppLocale.hu => 'Hungarian',
        AppLocale.ms => 'Malay',
        AppLocale.th => 'Thai',
      };

  static String difficultyValues(AppLocale locale) =>
      '${easy(locale)} | ${medium(locale)} | ${hard(locale)}';

  static String easy(AppLocale locale) => switch (locale) {
        AppLocale.en => 'Easy',
        AppLocale.tr => 'Kolay',
        AppLocale.es => 'Fácil',
        AppLocale.de => 'Einfach',
        AppLocale.fr => 'Facile',
        AppLocale.pt => 'Fácil',
        AppLocale.it => 'Facile',
        AppLocale.nl => 'Makkelijk',
        AppLocale.pl => 'Łatwy',
        AppLocale.ru => 'Лёгкий',
        AppLocale.ja => '簡単',
        AppLocale.ko => '쉬움',
        AppLocale.zh => '简单',
        AppLocale.hi => 'आसान',
        AppLocale.id => 'Mudah',
        AppLocale.vi => 'Dễ',
        AppLocale.ar => 'سهل',
        AppLocale.uk => 'Легкий',
        AppLocale.cs => 'Snadné',
        AppLocale.ro => 'Ușor',
        AppLocale.sv => 'Lätt',
        AppLocale.da => 'Nem',
        AppLocale.fi => 'Helppo',
        AppLocale.el => 'Εύκολο',
        AppLocale.hu => 'Könnyű',
        AppLocale.ms => 'Mudah',
        AppLocale.th => 'ง่าย',
      };

  static String medium(AppLocale locale) => switch (locale) {
        AppLocale.en => 'Medium',
        AppLocale.tr => 'Orta',
        AppLocale.es => 'Medio',
        AppLocale.de => 'Mittel',
        AppLocale.fr => 'Moyen',
        AppLocale.pt => 'Médio',
        AppLocale.it => 'Medio',
        AppLocale.nl => 'Gemiddeld',
        AppLocale.pl => 'Średni',
        AppLocale.ru => 'Средний',
        AppLocale.ja => '普通',
        AppLocale.ko => '보통',
        AppLocale.zh => '中等',
        AppLocale.hi => 'मध्यम',
        AppLocale.id => 'Sedang',
        AppLocale.vi => 'Trung bình',
        AppLocale.ar => 'متوسط',
        AppLocale.uk => 'Середній',
        AppLocale.cs => 'Střední',
        AppLocale.ro => 'Mediu',
        AppLocale.sv => 'Medel',
        AppLocale.da => 'Mellem',
        AppLocale.fi => 'Keskitaso',
        AppLocale.el => 'Μέτριο',
        AppLocale.hu => 'Közepes',
        AppLocale.ms => 'Sederhana',
        AppLocale.th => 'ปานกลาง',
      };

  static String hard(AppLocale locale) => switch (locale) {
        AppLocale.en => 'Hard',
        AppLocale.tr => 'Zor',
        AppLocale.es => 'Difícil',
        AppLocale.de => 'Schwer',
        AppLocale.fr => 'Difficile',
        AppLocale.pt => 'Difícil',
        AppLocale.it => 'Difficile',
        AppLocale.nl => 'Moeilijk',
        AppLocale.pl => 'Trudny',
        AppLocale.ru => 'Сложный',
        AppLocale.ja => '難しい',
        AppLocale.ko => '어려움',
        AppLocale.zh => '困难',
        AppLocale.hi => 'कठिन',
        AppLocale.id => 'Sulit',
        AppLocale.vi => 'Khó',
        AppLocale.ar => 'صعب',
        AppLocale.uk => 'Складний',
        AppLocale.cs => 'Náročné',
        AppLocale.ro => 'Dificil',
        AppLocale.sv => 'Svår',
        AppLocale.da => 'Svær',
        AppLocale.fi => 'Vaikea',
        AppLocale.el => 'Δύσκολο',
        AppLocale.hu => 'Nehéz',
        AppLocale.ms => 'Susah',
        AppLocale.th => 'ยาก',
      };

  static String easyOrMedium(AppLocale locale) => switch (locale) {
        AppLocale.en => 'Easy or Medium',
        AppLocale.tr => 'Kolay veya Orta',
        AppLocale.es => 'Fácil o Medio',
        AppLocale.de => 'Einfach oder Mittel',
        AppLocale.fr => 'Facile ou Moyen',
        AppLocale.pt => 'Fácil ou Médio',
        AppLocale.it => 'Facile o Medio',
        AppLocale.nl => 'Makkelijk of Gemiddeld',
        AppLocale.pl => 'Łatwy lub Średni',
        AppLocale.ru => 'Лёгкий или Средний',
        AppLocale.ja => '簡単または普通',
        AppLocale.ko => '쉬움 또는 보통',
        AppLocale.zh => '简单或中等',
        AppLocale.hi => 'आसान या मध्यम',
        AppLocale.id => 'Mudah atau Sedang',
        AppLocale.vi => 'Dễ hoặc Trung bình',
        AppLocale.ar => 'سهل أو متوسط',
        AppLocale.uk => 'Легкий або Середній',
        AppLocale.cs => 'Snadné nebo Střední',
        AppLocale.ro => 'Ușor sau Mediu',
        AppLocale.sv => 'Lätt eller Medel',
        AppLocale.da => 'Nem eller Mellem',
        AppLocale.fi => 'Helppo tai Keskitaso',
        AppLocale.el => 'Εύκολο ή Μέτριο',
        AppLocale.hu => 'Könnyű vagy Közepes',
        AppLocale.ms => 'Mudah atau Sederhana',
        AppLocale.th => 'ง่ายหรือปานกลาง',
      };

  static String cookTimeExample(AppLocale locale) => switch (locale) {
        AppLocale.tr => '12 dk',
        AppLocale.de => '12 Min.',
        AppLocale.fr => '12 min',
        AppLocale.es || AppLocale.pt || AppLocale.it => '12 min',
        _ => '12 min',
      };

  static String strictLanguageBlock(AppLocale locale) {
    final lang = languageName(locale);
    return '''

CRITICAL LANGUAGE REQUIREMENT:
- Output MUST be natural $lang only.
- Do NOT mix languages or leave untranslated words from other languages.
- Universal ingredient names may stay recognizable if no common $lang term exists.
''';
  }
}
