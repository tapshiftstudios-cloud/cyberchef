import 'app_strings.dart';

/// Tarih / süre biçimlendirme (seçili dile göre).
abstract final class L10nFormat {
  static const _monthsTr = [
    'Oca', 'Şub', 'Mar', 'Nis', 'May', 'Haz',
    'Tem', 'Ağu', 'Eyl', 'Eki', 'Kas', 'Ara',
  ];
  static const _monthsEn = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];
  static const _weekdaysTr = ['Pt', 'Sa', 'Ça', 'Pe', 'Cu', 'Ct', 'Pz'];
  static const _weekdaysEn = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  static String monthShort(int month) {
    if (AppStrings.isEnglish) return _monthsEn[(month - 1).clamp(0, 11)];
    if (AppStrings.isTurkish) return _monthsTr[(month - 1).clamp(0, 11)];
    final full = AppStrings.calendarMonthName(month);
    return full.length > 3 ? full.substring(0, 3) : full;
  }

  static String weekdayShort(int weekday) {
    if (AppStrings.isEnglish) return _weekdaysEn[(weekday - 1).clamp(0, 6)];
    if (AppStrings.isTurkish) return _weekdaysTr[(weekday - 1).clamp(0, 6)];
    const fallback = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return fallback[(weekday - 1).clamp(0, 6)];
  }

  static String formatExpiryDate(DateTime d) =>
      '${d.day} ${monthShort(d.month)} ${d.year}';

  static String calendarMonthFull(int month) =>
      AppStrings.calendarMonthName(month);

  static String formatDaysLabel(int days) {
    if (days < 0) return AppStrings.daysExpired;
    if (days == 0) return AppStrings.daysToday;
    if (days == 1) return AppStrings.daysTomorrow;
    return AppStrings.daysCount(days);
  }

  static String timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 1) return AppStrings.timeAgoJustNow;
    if (diff.inHours < 1) {
      return AppStrings.timeAgoMinutes(diff.inMinutes);
    }
    if (diff.inHours < 24) return AppStrings.timeAgoHours(diff.inHours);
    return AppStrings.timeAgoDays(diff.inDays);
  }

  static String localizeCategory(String category) {
    switch (category) {
      case 'Dairy':
        return AppStrings.categoryDairy;
      case 'Meat':
        return AppStrings.categoryMeat;
      case 'Fruit':
        return AppStrings.categoryFruit;
      case 'Vegetable':
        return AppStrings.categoryVegetable;
      case 'Beverage':
        return AppStrings.categoryBeverage;
      case 'Bakery':
        return AppStrings.categoryBakery;
      default:
        return AppStrings.categoryPantry;
    }
  }
}
