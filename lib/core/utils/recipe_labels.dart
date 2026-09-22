import '../l10n/ai_locale_prompts.dart';
import '../l10n/app_strings.dart';

/// Tarif meta alanlarını seçili dile göre gösterir.
String localizeDifficulty(String value) {
  final locale = AppStrings.currentLocale;
  final key = value.trim().toLowerCase();
  final level = switch (key) {
    'easy' ||
    'kolay' ||
    'fácil' ||
    'facile' ||
    'einfach' ||
    'makkelijk' ||
    'łatwy' ||
    'лёгкий' ||
    'легкий' ||
    '簡単' ||
    '쉬움' ||
    '简单' ||
    'आसान' ||
    'mudah' ||
    'dễ' ||
    'سهل' ||
    'snadné' ||
    'ușor' ||
    'usor' ||
    'lätt' ||
    'latt' ||
    'nem' ||
    'helppo' ||
    'εύκολο' ||
    'ευκολο' ||
    'könnyű' ||
    'konnyu' ||
    'ง่าย' =>
      _DifficultyLevel.easy,
    'medium' ||
    'orta' ||
    'medio' ||
    'moyen' ||
    'mittel' ||
    'gemiddeld' ||
    'średni' ||
    'sredni' ||
    'средний' ||
    '普通' ||
    '보통' ||
    '中等' ||
    'मध्यम' ||
    'sedang' ||
    'trung bình' ||
    'متوسط' ||
    'середній' ||
    'střední' ||
    'stredni' ||
    'mediu' ||
    'medel' ||
    'mellem' ||
    'keskitaso' ||
    'μέτριο' ||
    'metrio' ||
    'közepes' ||
    'koepes' ||
    'sederhana' ||
    'ปานกลาง' =>
      _DifficultyLevel.medium,
    'hard' ||
    'zor' ||
    'difícil' ||
    'dificil' ||
    'difficile' ||
    'schwer' ||
    'moeilijk' ||
    'trudny' ||
    'сложный' ||
    '難しい' ||
    '어려움' ||
    '困难' ||
    'कठिन' ||
    'sulit' ||
    'khó' ||
    'kho' ||
    'صعب' ||
    'складний' ||
    'náročné' ||
    'narocne' ||
    'dificil' ||
    'svår' ||
    'svar' ||
    'vaikea' ||
    'δύσκολο' ||
    'dyskolο' ||
    'nehéz' ||
    'nehez' ||
    'susah' ||
    'ยาก' =>
      _DifficultyLevel.hard,
    _ => null,
  };
  if (level == null) return value;
  return switch (level) {
    _DifficultyLevel.easy => AiLocalePrompts.easy(locale),
    _DifficultyLevel.medium => AiLocalePrompts.medium(locale),
    _DifficultyLevel.hard => AiLocalePrompts.hard(locale),
  };
}

enum _DifficultyLevel { easy, medium, hard }
