import 'package:cyberchef/core/config/supabase_config.dart';
import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/core/theme/app_colors.dart';
import 'package:cyberchef/core/enums/app_theme_variant.dart';
import 'package:cyberchef/features/auth/presentation/widgets/auth_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    AppStrings.useLocale(AppLocale.en);
    AppColors.applyVariant(AppThemeVariant.neon);
  });

  testWidgets('shows main shell when Supabase is not configured', (tester) async {
    if (SupabaseConfig.isConfigured) {
      return;
    }

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(
          home: AuthGate(),
        ),
      ),
    );
    await tester.pump();

    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.text(AppStrings.navScan), findsOneWidget);
  });
}
