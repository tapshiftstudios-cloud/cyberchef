import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/enums/app_theme_variant.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/core/theme/app_colors.dart';
import 'package:cyberchef/features/app/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    AppStrings.useLocale(AppLocale.tr);
    AppColors.applyVariant(AppThemeVariant.neon);
  });

  testWidgets('SplashScreen shows brand and tagline', (tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: SplashScreen(),
        ),
      ),
    );

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text(AppStrings.appBrandName), findsOneWidget);
    expect(find.text(AppStrings.splashTagline), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
