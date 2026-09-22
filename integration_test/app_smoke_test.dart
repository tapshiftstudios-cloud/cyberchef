import 'package:cyberchef/features/app/presentation/app_launcher.dart';
import 'package:cyberchef/features/app/presentation/main_shell.dart';
import 'package:cyberchef/core/storage/onboarding_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('app launcher reaches main shell when onboarding complete', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'onboarding_complete_v1': true,
    });
    expect(await OnboardingStorage.isComplete(), isTrue);

    await tester.pumpWidget(
      const ProviderScope(
        child: MaterialApp(home: AppLauncher()),
      ),
    );

    // AppLauncher waits minimum splash duration (3.6s) before routing.
    await tester.pump(const Duration(milliseconds: 3800));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.byType(MainShellHost), findsOneWidget);
  });
}
