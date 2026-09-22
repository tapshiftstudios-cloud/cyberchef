import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Bento-style surfaces: soft radius, subtle border, light elevation.
abstract final class NeonDecorations {
  static const double cardRadius = 16;
  static const double controlRadius = 12;

  static BoxDecoration card({
    Color? accent,
    double radius = cardRadius,
  }) {
    return BoxDecoration(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: AppColors.border, width: 1),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(
            alpha: AppColors.palette.isLight ? 0.06 : 0.12,
          ),
          blurRadius: AppColors.palette.isLight ? 10 : 14,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  static BoxDecoration button({
    Color? accent,
    bool filled = false,
    double radius = controlRadius,
  }) {
    final a = accent ?? AppColors.primary;
    return BoxDecoration(
      color: filled
          ? a.withValues(alpha: 0.14)
          : AppColors.surface,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: filled ? a.withValues(alpha: 0.55) : AppColors.border,
        width: 1,
      ),
    );
  }

  /// Kept for API compatibility; no longer used by the camera overlay.
  static LinearGradient scanLineGradient() {
    return LinearGradient(
      colors: [
        Colors.transparent,
        AppColors.primary.withValues(alpha: 0.4),
        Colors.transparent,
      ],
    );
  }
}
