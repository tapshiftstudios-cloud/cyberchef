import 'package:flutter/material.dart';

import '../enums/app_locale.dart';
import '../enums/cuisine_region.dart';

/// Cihaz bölgesi ve uygulama dilinden efektif mutfağı çıkarır.
abstract final class CuisineRegionResolver {
  static CuisineRegion resolve({
    required Locale deviceLocale,
    required AppLocale appLocale,
  }) {
    final country = deviceLocale.countryCode?.toUpperCase();
    if (country != null && country.isNotEmpty) {
      final fromCountry = _fromCountryCode(country);
      if (fromCountry != null) return fromCountry;
    }
    return fromAppLocale(appLocale);
  }

  static CuisineRegion effective({
    required CuisinePreference preference,
    required Locale deviceLocale,
    required AppLocale appLocale,
  }) {
    if (!preference.isAutomatic) {
      return preference.manualRegion ?? fromAppLocale(appLocale);
    }
    return resolve(deviceLocale: deviceLocale, appLocale: appLocale);
  }

  static CuisineRegion? _fromCountryCode(String country) => switch (country) {
        'TR' => CuisineRegion.turkish,
        'IT' => CuisineRegion.italian,
        'ES' || 'MX' || 'AR' || 'CO' || 'CL' || 'PE' => CuisineRegion.spanish,
        'DE' || 'AT' || 'CH' => CuisineRegion.german,
        'FR' || 'BE' || 'LU' => CuisineRegion.french,
        'PT' || 'BR' => CuisineRegion.portugueseBrazilian,
        'GB' || 'IE' => CuisineRegion.americanBritish,
        'US' || 'CA' || 'AU' || 'NZ' => CuisineRegion.americanBritish,
        'NL' => CuisineRegion.dutch,
        'PL' => CuisineRegion.polish,
        'RU' => CuisineRegion.russian,
        'JP' => CuisineRegion.japanese,
        'KR' => CuisineRegion.korean,
        'CN' || 'TW' || 'HK' || 'SG' => CuisineRegion.chinese,
        'IN' => CuisineRegion.indian,
        'ID' => CuisineRegion.indonesian,
        'VN' => CuisineRegion.vietnamese,
        'SA' ||
        'AE' ||
        'EG' ||
        'QA' ||
        'KW' ||
        'BH' ||
        'OM' ||
        'JO' ||
        'LB' ||
        'MA' ||
        'TN' =>
          CuisineRegion.middleEastern,
        'UA' => CuisineRegion.ukrainian,
        'CZ' => CuisineRegion.czech,
        'RO' || 'MD' => CuisineRegion.romanian,
        'SE' || 'NO' || 'DK' || 'FI' || 'IS' => CuisineRegion.nordic,
        'GR' || 'CY' => CuisineRegion.greek,
        'HU' => CuisineRegion.hungarian,
        'MY' || 'BN' => CuisineRegion.malaysian,
        'TH' => CuisineRegion.thai,
        _ => null,
      };

  static CuisineRegion fromAppLocale(AppLocale locale) => switch (locale) {
        AppLocale.en => CuisineRegion.americanBritish,
        AppLocale.tr => CuisineRegion.turkish,
        AppLocale.es => CuisineRegion.spanish,
        AppLocale.de => CuisineRegion.german,
        AppLocale.fr => CuisineRegion.french,
        AppLocale.pt => CuisineRegion.portugueseBrazilian,
        AppLocale.it => CuisineRegion.italian,
        AppLocale.nl => CuisineRegion.dutch,
        AppLocale.pl => CuisineRegion.polish,
        AppLocale.ru => CuisineRegion.russian,
        AppLocale.ja => CuisineRegion.japanese,
        AppLocale.ko => CuisineRegion.korean,
        AppLocale.zh => CuisineRegion.chinese,
        AppLocale.hi => CuisineRegion.indian,
        AppLocale.id => CuisineRegion.indonesian,
        AppLocale.vi => CuisineRegion.vietnamese,
        AppLocale.ar => CuisineRegion.middleEastern,
        AppLocale.uk => CuisineRegion.ukrainian,
        AppLocale.cs => CuisineRegion.czech,
        AppLocale.ro => CuisineRegion.romanian,
        AppLocale.sv || AppLocale.da || AppLocale.fi => CuisineRegion.nordic,
        AppLocale.el => CuisineRegion.greek,
        AppLocale.hu => CuisineRegion.hungarian,
        AppLocale.ms => CuisineRegion.malaysian,
        AppLocale.th => CuisineRegion.thai,
      };
}
