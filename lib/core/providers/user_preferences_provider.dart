import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../cuisine/cuisine_region_resolver.dart';
import '../enums/app_locale.dart';
import '../enums/app_theme_variant.dart';
import '../enums/cuisine_region.dart';
import '../enums/diet_profile.dart';import '../l10n/app_strings.dart';
import '../models/notification_time.dart';
import '../storage/user_preferences_storage.dart';
import '../theme/app_colors.dart';
import '../../services/freshness_notification_service.dart';
import '../../services/pantry_widget_service.dart';

final localeProvider =
    StateNotifierProvider<LocaleNotifier, AppLocale>((ref) => LocaleNotifier());

final dietProfileProvider =
    StateNotifierProvider<DietNotifier, DietProfile>((ref) => DietNotifier());

final cuisinePreferenceProvider =
    StateNotifierProvider<CuisineNotifier, CuisinePreference>(
  (ref) => CuisineNotifier(),
);

/// Otomatik modda cihaz bölgesi + uygulama dili; manuel modda seçilen mutfak.
final effectiveCuisineRegionProvider = Provider<CuisineRegion>((ref) {
  final preference = ref.watch(cuisinePreferenceProvider);
  final appLocale = ref.watch(localeProvider);
  final deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;
  return CuisineRegionResolver.effective(
    preference: preference,
    deviceLocale: deviceLocale,
    appLocale: appLocale,
  );
});

final appThemeProvider =    StateNotifierProvider<AppThemeNotifier, AppThemeVariant>(
  (ref) => AppThemeNotifier(),
);

final freshnessNotificationTimeProvider =
    StateNotifierProvider<FreshnessNotificationTimeNotifier, NotificationTime>(
  (ref) => FreshnessNotificationTimeNotifier(),
);

class AppThemeNotifier extends StateNotifier<AppThemeVariant> {
  AppThemeNotifier() : super(AppThemeVariant.neon) {
    _load();
  }

  Future<void> _load() async {
    state = await UserPreferencesStorage.loadTheme();
    _apply(state);
  }

  Future<void> setTheme(AppThemeVariant theme) async {
    state = theme;
    _apply(theme);
    await UserPreferencesStorage.saveTheme(theme);
  }

  void _apply(AppThemeVariant theme) {
    AppColors.applyVariant(theme);
    final p = theme.palette;
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            p.isLight ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: p.scaffoldBottomColor,
        systemNavigationBarIconBrightness:
            p.isLight ? Brightness.dark : Brightness.light,
      ),
    );
  }
}

class LocaleNotifier extends StateNotifier<AppLocale> {
  LocaleNotifier() : super(AppStrings.currentLocale) {
    _load();
  }

  Future<void> _load() async {
    final locale = await UserPreferencesStorage.loadLocale();
    state = locale;
    AppStrings.useLocale(locale);
    await PantryWidgetService.refreshLabelsFromStoredCounts();
  }

  Future<void> setLocale(AppLocale locale) async {
    state = locale;
    AppStrings.useLocale(locale);
    await UserPreferencesStorage.saveLocale(locale);
    await PantryWidgetService.refreshLabelsFromStoredCounts();
  }
}

class FreshnessNotificationTimeNotifier extends StateNotifier<NotificationTime> {
  FreshnessNotificationTimeNotifier() : super(NotificationTime.defaultTime) {
    _load();
  }

  Future<void> _load() async {
    state = await UserPreferencesStorage.loadFreshnessNotificationTime();
  }

  Future<void> setTime(NotificationTime time) async {
    final clamped = time.clamp();
    state = clamped;
    await FreshnessNotificationService.instance.setReminderTime(clamped);
  }
}

class DietNotifier extends StateNotifier<DietProfile> {
  DietNotifier() : super(DietProfile.none) {
    _load();
  }

  Future<void> _load() async {
    state = await UserPreferencesStorage.loadDiet();
  }

  Future<void> setDiet(DietProfile diet) async {
    state = diet;
    await UserPreferencesStorage.saveDiet(diet);
  }
}

class CuisineNotifier extends StateNotifier<CuisinePreference> {
  CuisineNotifier() : super(CuisinePreference.automatic) {
    _load();
  }

  Future<void> _load() async {
    state = await UserPreferencesStorage.loadCuisine();
  }

  Future<void> setCuisine(CuisinePreference cuisine) async {
    state = cuisine;
    await UserPreferencesStorage.saveCuisine(cuisine);
  }
}