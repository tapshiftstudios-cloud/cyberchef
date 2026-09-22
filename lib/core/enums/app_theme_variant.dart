import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../theme/app_color_palette.dart';

/// Uygulama görünüm temaları.
enum AppThemeVariant {
  neon,
  ocean,
  ember,
  lavender,
  daylight,
  cream;

  AppColorPalette get palette => switch (this) {
        AppThemeVariant.neon => const AppColorPalette(
              id: 'neon',
              background: Color(0xFF1C1C22),
              surface: Color(0xFF27272E),
              surfaceElevated: Color(0xFF32323B),
              primary: Color(0xFF02965E),
              secondary: Color(0xFF7B8494),
              border: Color(0xFF40404A),
              textPrimary: Color(0xFFF8FAFC),
              textSecondary: Color(0xFFB4BCC8),
              textMuted: Color(0xFF7B8494),
              error: Color(0xFFEF4444),
              success: Color(0xFF02965E),
              isLight: false,
              chefAccent: Color(0xFF10B981),
            ),
        AppThemeVariant.ocean => const AppColorPalette(
              id: 'ocean',
              background: Color(0xFF111B26),
              surface: Color(0xFF1B2836),
              surfaceElevated: Color(0xFF253444),
              primary: Color(0xFF38BDF8),
              secondary: Color(0xFF7B8FA3),
              border: Color(0xFF3A4F63),
              textPrimary: Color(0xFFF4FAFF),
              textSecondary: Color(0xFFA8BDD4),
              textMuted: Color(0xFF7B8FA3),
              error: Color(0xFFF87171),
              success: Color(0xFF22D3EE),
              isLight: false,
              chefAccent: Color(0xFF7DD3FC),
            ),
        AppThemeVariant.ember => const AppColorPalette(
              id: 'ember',
              background: Color(0xFF1C1714),
              surface: Color(0xFF2A221E),
              surfaceElevated: Color(0xFF362C26),
              primary: Color(0xFFF59E0B),
              secondary: Color(0xFF8A8178),
              border: Color(0xFF4D4036),
              textPrimary: Color(0xFFFFF8F0),
              textSecondary: Color(0xFFE0D8D2),
              textMuted: Color(0xFF8A8178),
              error: Color(0xFFEF4444),
              success: Color(0xFF84CC16),
              isLight: false,
              chefAccent: Color(0xFFFB923C),
            ),
        AppThemeVariant.lavender => const AppColorPalette(
              id: 'lavender',
              background: Color(0xFF18161F),
              surface: Color(0xFF24212C),
              surfaceElevated: Color(0xFF302C3A),
              primary: Color(0xFFA78BFA),
              secondary: Color(0xFF8B85A0),
              border: Color(0xFF423D52),
              textPrimary: Color(0xFFFAF8FF),
              textSecondary: Color(0xFFD4C9F8),
              textMuted: Color(0xFF9B94B0),
              error: Color(0xFFF472B6),
              success: Color(0xFF34D399),
              isLight: false,
              chefAccent: Color(0xFFC4B5FD),
            ),
        AppThemeVariant.daylight => const AppColorPalette(
              id: 'daylight',
              background: Color(0xFFFAFCFE),
              surface: Color(0xFFFFFFFF),
              surfaceElevated: Color(0xFFF4F7FB),
              primary: Color(0xFF059669),
              secondary: Color(0xFF64748B),
              border: Color(0xFFE5EBF2),
              textPrimary: Color(0xFF0F172A),
              textSecondary: Color(0xFF475569),
              textMuted: Color(0xFF94A3B8),
              error: Color(0xFFDC2626),
              success: Color(0xFF059669),
              isLight: true,
              chefAccent: Color(0xFF0D9488),
            ),
        AppThemeVariant.cream => const AppColorPalette(
              id: 'cream',
              background: Color(0xFFFFFCF8),
              surface: Color(0xFFFFFFFF),
              surfaceElevated: Color(0xFFFAF4EC),
              primary: Color(0xFFEA580C),
              secondary: Color(0xFF78716C),
              border: Color(0xFFEDE4DA),
              textPrimary: Color(0xFF292524),
              textSecondary: Color(0xFF57534E),
              textMuted: Color(0xFFA8A29E),
              error: Color(0xFFDC2626),
              success: Color(0xFFCA8A04),
              isLight: true,
              chefAccent: Color(0xFFC2410C),
            ),
      };

  String get label => switch (this) {
        AppThemeVariant.neon => AppStrings.themeNeonLabel,
        AppThemeVariant.ocean => AppStrings.themeOceanLabel,
        AppThemeVariant.ember => AppStrings.themeEmberLabel,
        AppThemeVariant.lavender => AppStrings.themeLavenderLabel,
        AppThemeVariant.daylight => AppStrings.themeDaylightLabel,
        AppThemeVariant.cream => AppStrings.themeCreamLabel,
      };

  String get subtitle => switch (this) {
        AppThemeVariant.neon => AppStrings.themeNeonSubtitle,
        AppThemeVariant.ocean => AppStrings.themeOceanSubtitle,
        AppThemeVariant.ember => AppStrings.themeEmberSubtitle,
        AppThemeVariant.lavender => AppStrings.themeLavenderSubtitle,
        AppThemeVariant.daylight => AppStrings.themeDaylightSubtitle,
        AppThemeVariant.cream => AppStrings.themeCreamSubtitle,
      };

  static AppThemeVariant fromId(String? id) {
    if (id == null) return AppThemeVariant.neon;
    return AppThemeVariant.values.firstWhere(
      (v) => v.name == id,
      orElse: () => AppThemeVariant.neon,
    );
  }
}
