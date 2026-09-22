import '../../../../core/enums/app_locale.dart';
import '../../../../core/l10n/app_strings.dart';

abstract final class SavingsFormat {
  static String kg(double value) => '${value.toStringAsFixed(1)} kg';

  static String money(double amount, String currencyCode) {
    final rounded = amount.round();
    return switch (currencyCode) {
      'USD' => '\$$rounded',
      'TRY' => AppStrings.isTurkish ? '$rounded TL' : '$rounded TRY',
      'EUR' => '$rounded €',
      'GBP' => '£$rounded',
      'PLN' => '$rounded zł',
      'RUB' => '$rounded ₽',
      'UAH' => '$rounded ₴',
      'JPY' => '¥$rounded',
      'KRW' => '₩$rounded',
      'CNY' => '¥$rounded',
      'INR' => '₹$rounded',
      'IDR' => 'Rp$rounded',
      'VND' => '$rounded ₫',
      'SAR' => '$rounded SAR',
      'HUF' => '$rounded Ft',
      'MYR' => 'RM$rounded',
      'THB' => '฿$rounded',
      _ => '$rounded $currencyCode',
    };
  }

  static String weekLabel(DateTime weekStart, AppLocale locale) {
    final day = weekStart.day;
    final month = weekStart.month;
    if (locale == AppLocale.en) {
      const months = [
        'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
      ];
      return '${months[month - 1]} $day';
    }
    const months = [
      'Oca', 'Şub', 'Mar', 'Nis', 'May', 'Haz',
      'Tem', 'Ağu', 'Eyl', 'Eki', 'Kas', 'Ara',
    ];
    return '$day ${months[month - 1]}';
  }
}
