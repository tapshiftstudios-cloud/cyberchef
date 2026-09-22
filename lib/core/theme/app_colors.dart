import 'package:flutter/material.dart';

import '../enums/app_theme_variant.dart';
import 'app_color_palette.dart';

/// Aktif tema renkleri — [AppThemeVariant] ile güncellenir.
abstract final class AppColors {
  static AppColorPalette _palette = AppThemeVariant.neon.palette;

  static void apply(AppColorPalette palette) => _palette = palette;

  static void applyVariant(AppThemeVariant variant) =>
      apply(variant.palette);

  static AppColorPalette get palette => _palette;

  static Color get background => _palette.background;
  static Color get surface => _palette.surface;
  static Color get surfaceElevated => _palette.surfaceElevated;
  static Color get primary => _palette.primary;
  static Color get secondary => _palette.secondary;
  static Color get border => _palette.border;
  static Color get chefModeAccent => _palette.chefModeAccent;

  static Color get cyan => primary;
  static Color get magenta => secondary;

  static Color get textPrimary => _palette.textPrimary;
  static Color get textSecondary => _palette.textSecondary;
  static Color get textMuted => _palette.textMuted;

  static Color get error => _palette.error;
  static Color get success => _palette.success;
}
