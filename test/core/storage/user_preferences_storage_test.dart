import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/enums/app_theme_variant.dart';
import 'package:cyberchef/core/enums/diet_profile.dart';
import 'package:cyberchef/core/enums/scan_mode.dart';
import 'package:cyberchef/core/models/notification_time.dart';
import 'package:cyberchef/core/storage/user_preferences_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('UserPreferencesStorage', () {
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
    });

    test('locale defaults to English and persists', () async {
      expect(await UserPreferencesStorage.loadLocale(), AppLocale.en);

      await UserPreferencesStorage.saveLocale(AppLocale.en);
      expect(await UserPreferencesStorage.loadLocale(), AppLocale.en);
    });

    test('theme defaults to neon and persists', () async {
      expect(await UserPreferencesStorage.loadTheme(), AppThemeVariant.neon);

      await UserPreferencesStorage.saveTheme(AppThemeVariant.cream);
      expect(await UserPreferencesStorage.loadTheme(), AppThemeVariant.cream);
    });

    test('diet defaults to none and persists', () async {
      expect(await UserPreferencesStorage.loadDiet(), DietProfile.none);

      await UserPreferencesStorage.saveDiet(DietProfile.lowCarb);
      expect(await UserPreferencesStorage.loadDiet(), DietProfile.lowCarb);
    });

    test('scan mode defaults to quickScan and persists', () async {
      expect(await UserPreferencesStorage.loadScanMode(), ScanMode.quickScan);

      await UserPreferencesStorage.saveScanMode(ScanMode.survival);
      expect(await UserPreferencesStorage.loadScanMode(), ScanMode.survival);
    });

    test('notification time defaults to 09:00 and persists', () async {
      expect(
        await UserPreferencesStorage.loadFreshnessNotificationTime(),
        NotificationTime.defaultTime,
      );

      await UserPreferencesStorage.saveFreshnessNotificationTime(
        const NotificationTime(hour: 18, minute: 30),
      );
      final loaded =
          await UserPreferencesStorage.loadFreshnessNotificationTime();
      expect(loaded.hour, 18);
      expect(loaded.minute, 30);
    });
  });
}
