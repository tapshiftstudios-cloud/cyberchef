import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';
import 'neon_decorations.dart';

abstract final class AppTheme {
  static ThemeData build() {
    final p = AppColors.palette;
    final isLight = p.isLight;
    final inter = GoogleFonts.interTextTheme(
      isLight ? ThemeData.light().textTheme : ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: isLight ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
      colorScheme: isLight
          ? ColorScheme.light(
              surface: p.surface,
              primary: p.primary,
              secondary: p.secondary,
              error: p.error,
              onSurface: p.textPrimary,
              onPrimary: Colors.white,
              onSecondary: p.textPrimary,
            )
          : ColorScheme.dark(
              surface: p.surface,
              primary: p.primary,
              secondary: p.secondary,
              error: p.error,
              onSurface: p.textPrimary,
              onPrimary: Colors.white,
              onSecondary: p.textPrimary,
            ),
      dividerColor: p.border,
      iconTheme: IconThemeData(color: p.textSecondary),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: p.surface,
        indicatorColor: p.primary.withValues(alpha: 0.18),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: p.primary,
            );
          }
          return GoogleFonts.inter(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: p.textMuted,
          );
        }),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: p.surface.withValues(alpha: 0.92),
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        titleTextStyle: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: p.textPrimary,
        ),
        iconTheme: IconThemeData(color: p.textSecondary),
      ),
      textTheme: inter.copyWith(
        displayLarge: GoogleFonts.inter(
          color: p.textPrimary,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
        displayMedium: GoogleFonts.inter(
          color: p.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        titleLarge: GoogleFonts.inter(
          color: p.textPrimary,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          letterSpacing: -0.3,
        ),
        titleMedium: GoogleFonts.inter(
          color: p.textPrimary,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        bodyLarge: GoogleFonts.inter(
          color: p.textPrimary,
          fontWeight: FontWeight.w400,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          color: p.textSecondary,
          fontWeight: FontWeight.w400,
          height: 1.45,
        ),
        labelLarge: GoogleFonts.inter(
          color: p.primary,
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
        labelMedium: GoogleFonts.inter(
          color: p.textMuted,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
      cardTheme: CardThemeData(
        color: p.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.cardRadius),
          side: BorderSide(color: p.border, width: 1),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: p.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: p.primary,
          side: BorderSide(color: p.border),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: p.surfaceElevated,
        contentTextStyle: GoogleFonts.inter(color: p.textPrimary),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          side: BorderSide(color: p.border),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: p.surface,
        labelStyle: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: p.textMuted,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          borderSide: BorderSide(color: p.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          borderSide: BorderSide(color: p.primary, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          borderSide: BorderSide(color: p.error),
        ),
      ),
    );
  }

  /// Primary action button — flat SaaS style.
  static Widget neonButton({
    required String label,
    required VoidCallback? onPressed,
    Color? accent,
    IconData? icon,
  }) {
    final color = accent ?? AppColors.primary;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
        child: Ink(
          decoration: NeonDecorations.button(accent: color, filled: true),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: color, size: 20),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: GoogleFonts.inter(
                    color: color,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
