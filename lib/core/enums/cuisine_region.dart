/// Yerel mutfak / bölge — tarif üretiminde kullanılır.
enum CuisineRegion {
  americanBritish,
  turkish,
  spanish,
  german,
  french,
  portugueseBrazilian,
  italian,
  dutch,
  polish,
  russian,
  japanese,
  korean,
  chinese,
  indian,
  indonesian,
  vietnamese,
  middleEastern,
  ukrainian,
  czech,
  romanian,
  nordic,
  greek,
  hungarian,
  malaysian,
  thai,
}

/// Kullanıcı tercihi: otomatik (cihaz bölgesi) veya manuel mutfak.
enum CuisinePreference {
  automatic,
  americanBritish,
  turkish,
  spanish,
  german,
  french,
  portugueseBrazilian,
  italian,
  dutch,
  polish,
  russian,
  japanese,
  korean,
  chinese,
  indian,
  indonesian,
  vietnamese,
  middleEastern,
  ukrainian,
  czech,
  romanian,
  nordic,
  greek,
  hungarian,
  malaysian,
  thai,
}

extension CuisinePreferenceX on CuisinePreference {
  bool get isAutomatic => this == CuisinePreference.automatic;

  CuisineRegion? get manualRegion =>
      isAutomatic ? null : CuisineRegion.values.byName(name);

  static CuisinePreference fromCode(String? code) {
    if (code == null || code.isEmpty) return CuisinePreference.automatic;
    try {
      return CuisinePreference.values.byName(code);
    } catch (_) {
      return CuisinePreference.automatic;
    }
  }

  /// Picker'da gösterilecek kısa ad (çoğu dilde anlaşılır).
  String get pickerLabel => switch (this) {
        CuisinePreference.automatic => 'Automatic',
        CuisinePreference.americanBritish => 'American & British',
        CuisinePreference.turkish => 'Turkish',
        CuisinePreference.spanish => 'Spanish',
        CuisinePreference.german => 'German',
        CuisinePreference.french => 'French',
        CuisinePreference.portugueseBrazilian => 'Portuguese & Brazilian',
        CuisinePreference.italian => 'Italian',
        CuisinePreference.dutch => 'Dutch',
        CuisinePreference.polish => 'Polish',
        CuisinePreference.russian => 'Russian',
        CuisinePreference.japanese => 'Japanese',
        CuisinePreference.korean => 'Korean',
        CuisinePreference.chinese => 'Chinese',
        CuisinePreference.indian => 'Indian',
        CuisinePreference.indonesian => 'Indonesian',
        CuisinePreference.vietnamese => 'Vietnamese',
        CuisinePreference.middleEastern => 'Middle Eastern',
        CuisinePreference.ukrainian => 'Ukrainian',
        CuisinePreference.czech => 'Czech',
        CuisinePreference.romanian => 'Romanian',
        CuisinePreference.nordic => 'Nordic',
        CuisinePreference.greek => 'Greek',
        CuisinePreference.hungarian => 'Hungarian',
        CuisinePreference.malaysian => 'Malaysian',
        CuisinePreference.thai => 'Thai',
      };
}

extension CuisineRegionX on CuisineRegion {
  String get code => name;

  String get pickerLabel => switch (this) {
        CuisineRegion.americanBritish => 'American & British',
        CuisineRegion.turkish => 'Turkish',
        CuisineRegion.spanish => 'Spanish',
        CuisineRegion.german => 'German',
        CuisineRegion.french => 'French',
        CuisineRegion.portugueseBrazilian => 'Portuguese & Brazilian',
        CuisineRegion.italian => 'Italian',
        CuisineRegion.dutch => 'Dutch',
        CuisineRegion.polish => 'Polish',
        CuisineRegion.russian => 'Russian',
        CuisineRegion.japanese => 'Japanese',
        CuisineRegion.korean => 'Korean',
        CuisineRegion.chinese => 'Chinese',
        CuisineRegion.indian => 'Indian',
        CuisineRegion.indonesian => 'Indonesian',
        CuisineRegion.vietnamese => 'Vietnamese',
        CuisineRegion.middleEastern => 'Middle Eastern',
        CuisineRegion.ukrainian => 'Ukrainian',
        CuisineRegion.czech => 'Czech',
        CuisineRegion.romanian => 'Romanian',
        CuisineRegion.nordic => 'Nordic',
        CuisineRegion.greek => 'Greek',
        CuisineRegion.hungarian => 'Hungarian',
        CuisineRegion.malaysian => 'Malaysian',
        CuisineRegion.thai => 'Thai',
      };

  static CuisineRegion fromCode(String? code) {
    if (code == null || code.isEmpty) return CuisineRegion.americanBritish;
    try {
      return CuisineRegion.values.byName(code);
    } catch (_) {
      return CuisineRegion.americanBritish;
    }
  }
}
