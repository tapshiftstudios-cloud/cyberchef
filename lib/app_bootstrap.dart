import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/config/app_env.dart';
import 'core/l10n/app_strings.dart';
import 'core/storage/user_preferences_storage.dart';
import 'core/theme/app_colors.dart';
import 'services/ad_service.dart';

/// Ortak başlatma: dotenv, locale, tema, sistem çubukları.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  try {
    await dotenv.load(fileName: 'assets/config/cyberchef.env');
  } catch (_) {
    // Bundled defaults may be absent in tests.
  }

  try {
    await dotenv.load(fileName: '.env');
  } catch (_) {
    // Local .env is optional when bundled defaults or dart-defines are set.
  }

  AppEnv.applySecretPolicy();

  final locale = await UserPreferencesStorage.loadLocale();
  AppStrings.useLocale(locale);

  final themeVariant = await UserPreferencesStorage.loadTheme();
  AppColors.applyVariant(themeVariant);
  await AdService.instance.initialize();
  final p = themeVariant.palette;
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
