import '../../../core/enums/app_locale.dart';

/// UI locale → ISO 4217 currency for savings estimates and display.
abstract final class SavingsCurrency {
  static String codeForLocale(AppLocale locale) => switch (locale) {
        AppLocale.tr => 'TRY',
        AppLocale.en => 'USD',
        AppLocale.de ||
        AppLocale.fr ||
        AppLocale.es ||
        AppLocale.it ||
        AppLocale.nl ||
        AppLocale.pt ||
        AppLocale.ro ||
        AppLocale.cs ||
        AppLocale.el ||
        AppLocale.fi ||
        AppLocale.sv ||
        AppLocale.da =>
          'EUR',
        AppLocale.pl => 'PLN',
        AppLocale.ru => 'RUB',
        AppLocale.uk => 'UAH',
        AppLocale.ja => 'JPY',
        AppLocale.ko => 'KRW',
        AppLocale.zh => 'CNY',
        AppLocale.hi => 'INR',
        AppLocale.id => 'IDR',
        AppLocale.vi => 'VND',
        AppLocale.ar => 'SAR',
        AppLocale.hu => 'HUF',
        AppLocale.ms => 'MYR',
        AppLocale.th => 'THB',
      };

  /// Rough USD→local multipliers for category tables that only define USD/TRY/EUR.
  static double usdRate(String currencyCode) => switch (currencyCode) {
        'USD' => 1.0,
        'TRY' => 32.0,
        'EUR' => 0.92,
        'GBP' => 0.79,
        'PLN' => 4.0,
        'RUB' => 92.0,
        'UAH' => 41.0,
        'JPY' => 150.0,
        'KRW' => 1350.0,
        'CNY' => 7.2,
        'INR' => 84.0,
        'IDR' => 15800.0,
        'VND' => 25000.0,
        'SAR' => 3.75,
        'HUF' => 365.0,
        'MYR' => 4.5,
        'THB' => 34.0,
        _ => 1.0,
      };

  static (double min, double max) clampBounds(String currencyCode) {
    if (currencyCode == 'USD') return (2.0, 9999.0);
    if (currencyCode == 'JPY' || currencyCode == 'KRW' || currencyCode == 'VND') {
      return (50.0, 999999.0);
    }
    if (currencyCode == 'IDR') return (500.0, 9999999.0);
    return (25.0, 99999.0);
  }
}
