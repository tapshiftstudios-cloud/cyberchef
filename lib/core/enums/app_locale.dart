import 'package:flutter/material.dart';

/// Supported app UI languages (BCP-47 language codes).
enum AppLocale {
  en('en', 'English'),
  tr('tr', 'Türkçe'),
  es('es', 'Español'),
  de('de', 'Deutsch'),
  fr('fr', 'Français'),
  pt('pt', 'Português'),
  it('it', 'Italiano'),
  nl('nl', 'Nederlands'),
  pl('pl', 'Polski'),
  ru('ru', 'Русский'),
  ja('ja', '日本語'),
  ko('ko', '한국어'),
  zh('zh', '中文'),
  hi('hi', 'हिन्दी'),
  id('id', 'Bahasa Indonesia'),
  vi('vi', 'Tiếng Việt'),
  ar('ar', 'العربية'),
  uk('uk', 'Українська'),
  cs('cs', 'Čeština'),
  ro('ro', 'Română'),
  sv('sv', 'Svenska'),
  da('da', 'Dansk'),
  fi('fi', 'Suomi'),
  el('el', 'Ελληνικά'),
  hu('hu', 'Magyar'),
  ms('ms', 'Bahasa Melayu'),
  th('th', 'ไทย');

  const AppLocale(this.code, this.label);

  final String code;
  final String label;

  Locale get flutterLocale => Locale(code);

  bool get isRtl => code == 'ar';

  static AppLocale fromCode(String? code) {
    if (code == null || code.isEmpty) return AppLocale.en;
    final normalized = code.toLowerCase().replaceAll('_', '-');
    if (normalized.startsWith('zh')) return AppLocale.zh;
    if (normalized.startsWith('pt')) return AppLocale.pt;
    for (final locale in AppLocale.values) {
      if (locale.code == normalized) return locale;
    }
    final lang = normalized.split('-').first;
    for (final locale in AppLocale.values) {
      if (locale.code == lang) return locale;
    }
    return AppLocale.en;
  }
}
