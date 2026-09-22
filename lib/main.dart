import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_bootstrap.dart';
import 'core/config/app_env.dart';
import 'core/crash/crash_reporting.dart';
import 'core/enums/app_locale.dart';
import 'core/l10n/app_strings.dart';
import 'core/providers/user_preferences_provider.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_theme.dart';
import 'core/widgets/app_root_chrome.dart';
import 'features/app/presentation/app_launcher.dart';

Future<void> main() async {
  await bootstrap();

  final sentryDsn = CrashReporting.resolveDsn({
    CrashReporting.envDsnKey: AppEnv.value(CrashReporting.envDsnKey) ?? '',
  });
  if (sentryDsn != null) {
    final packageInfo = await PackageInfo.fromPlatform();
    await SentryFlutter.init(
      (options) => CrashReporting.configure(
        options,
        dsn: sentryDsn,
        version: packageInfo.version,
        buildNumber: packageInfo.buildNumber,
      ),
      appRunner: () => runApp(
        const ProviderScope(
          child: CyberChefApp(),
        ),
      ),
    );
    return;
  }

  runApp(
    const ProviderScope(
      child: CyberChefApp(),
    ),
  );
}

class CyberChefApp extends ConsumerWidget {
  const CyberChefApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final themeVariant = ref.watch(appThemeProvider);
    AppStrings.useLocale(locale);
    AppColors.applyVariant(themeVariant);

    return MaterialApp(
      title: 'CyberChef',
      debugShowCheckedModeBanner: false,
      locale: locale.flutterLocale,
      supportedLocales: AppLocale.values.map((l) => l.flutterLocale).toList(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: AppTheme.build(),
      themeMode: themeVariant.palette.isLight ? ThemeMode.light : ThemeMode.dark,
      builder: (context, child) {
        if (child == null) return const SizedBox.shrink();
        return AppRootChrome(child: child);
      },
      home: const AppLauncher(),
    );
  }
}
