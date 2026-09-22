import 'package:flutter/material.dart';

/// Semantic renk seti — tema değişince [AppColors] üzerinden okunur.
class AppColorPalette {
  const AppColorPalette({
    required this.id,
    required this.background,
    required this.surface,
    required this.surfaceElevated,
    required this.primary,
    required this.secondary,
    required this.border,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.error,
    required this.success,
    required this.isLight,
    this.chefAccent,
  });

  final String id;
  final Color background;
  final Color surface;
  final Color surfaceElevated;
  final Color primary;
  final Color secondary;
  final Color border;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color error;
  final Color success;
  final bool isLight;

  /// Şef modu vurgusu; yoksa [primary] kullanılır.
  final Color? chefAccent;

  Color get chefModeAccent => chefAccent ?? primary;

  List<Color> get previewSwatches => [
        background,
        surface,
        primary,
        secondary,
      ];

  /// Ana ekran arka planı — üstte hafif aydınlık, altta derinlik.
  List<Color> get scaffoldGradientColors => isLight
      ? [
          background,
          surfaceElevated,
          background,
        ]
      : [
          surfaceElevated,
          background,
          Color.lerp(background, surface, 0.45)!,
        ];

  Decoration get scaffoldDecoration => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: scaffoldGradientColors,
          stops: isLight ? const [0.0, 0.42, 1.0] : const [0.0, 0.38, 1.0],
        ),
      );

  /// Alt sistem çubuğu / gradient bitiş rengi — nav bar bandını önler.
  Color get scaffoldBottomColor => scaffoldGradientColors.last;
}
