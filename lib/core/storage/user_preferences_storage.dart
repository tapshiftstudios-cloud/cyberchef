import 'package:shared_preferences/shared_preferences.dart';

import '../enums/app_locale.dart';
import '../enums/cuisine_region.dart';
import '../enums/diet_profile.dart';
import '../enums/app_theme_variant.dart';
import '../enums/scan_mode.dart';
import '../models/notification_time.dart';

abstract final class UserPreferencesStorage {
  static const _localeKey = 'cyberchef_locale_v1';
  static const _dietKey = 'cyberchef_diet_v1';
  static const _scanModeKey = 'cyberchef_scan_mode_v1';
  static const _themeKey = 'cyberchef_theme_v1';
  static const _notificationHourKey = 'cyberchef_freshness_notify_hour_v1';
  static const _notificationMinuteKey = 'cyberchef_freshness_notify_minute_v1';
  static const _cuisineKey = 'cyberchef_cuisine_v1';

  static Future<AppLocale> loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    return AppLocale.fromCode(prefs.getString(_localeKey));
  }

  static Future<void> saveLocale(AppLocale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.code);
  }

  static Future<DietProfile> loadDiet() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_dietKey);
    if (raw == null) return DietProfile.none;
    return DietProfile.values.firstWhere(
      (e) => e.name == raw,
      orElse: () => DietProfile.none,
    );
  }

  static Future<void> saveDiet(DietProfile diet) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_dietKey, diet.name);
  }

  static Future<CuisinePreference> loadCuisine() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_cuisineKey);
    if (raw == null) return CuisinePreference.automatic;
    return CuisinePreference.values.firstWhere(
      (e) => e.name == raw,
      orElse: () => CuisinePreference.automatic,
    );
  }

  static Future<void> saveCuisine(CuisinePreference cuisine) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_cuisineKey, cuisine.name);
  }

  static Future<ScanMode> loadScanMode() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_scanModeKey);
    if (raw == null) return ScanMode.quickScan;
    return ScanMode.values.firstWhere(
      (m) => m.name == raw,
      orElse: () => ScanMode.quickScan,
    );
  }

  static Future<void> saveScanMode(ScanMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_scanModeKey, mode.name);
  }

  static Future<AppThemeVariant> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return AppThemeVariant.fromId(prefs.getString(_themeKey));
  }

  static Future<void> saveTheme(AppThemeVariant theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_themeKey, theme.name);
  }

  static Future<NotificationTime> loadFreshnessNotificationTime() async {
    final prefs = await SharedPreferences.getInstance();
    final hour = prefs.getInt(_notificationHourKey);
    final minute = prefs.getInt(_notificationMinuteKey);
    if (hour == null || minute == null) {
      return NotificationTime.defaultTime;
    }
    return NotificationTime(hour: hour, minute: minute).clamp();
  }

  static Future<void> saveFreshnessNotificationTime(NotificationTime time) async {
    final prefs = await SharedPreferences.getInstance();
    final clamped = time.clamp();
    await prefs.setInt(_notificationHourKey, clamped.hour);
    await prefs.setInt(_notificationMinuteKey, clamped.minute);
  }
}
