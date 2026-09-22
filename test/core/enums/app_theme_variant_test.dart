import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/enums/app_theme_variant.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() => AppStrings.useLocale(AppLocale.tr));

  group('AppThemeVariant', () {
    test('fromId falls back to neon for unknown id', () {
      expect(AppThemeVariant.fromId(null), AppThemeVariant.neon);
      expect(AppThemeVariant.fromId('unknown'), AppThemeVariant.neon);
    });

    test('fromId resolves cream', () {
      expect(AppThemeVariant.fromId('cream'), AppThemeVariant.cream);
    });

    test('daylight and cream palettes are light', () {
      expect(AppThemeVariant.daylight.palette.isLight, isTrue);
      expect(AppThemeVariant.cream.palette.isLight, isTrue);
      expect(AppThemeVariant.neon.palette.isLight, isFalse);
    });

    test('applyVariant updates AppColors', () {
      AppColors.applyVariant(AppThemeVariant.ocean);
      expect(AppColors.primary, const Color(0xFF38BDF8));

      AppColors.applyVariant(AppThemeVariant.neon);
      expect(AppColors.primary, const Color(0xFF02965E));
    });

    test('each variant has distinct primary color', () {
      final primaries = AppThemeVariant.values
          .map((v) => v.palette.primary.value)
          .toSet();
      expect(primaries.length, AppThemeVariant.values.length);
    });
  });
}
