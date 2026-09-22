import 'package:flutter/material.dart';

import '../l10n/app_strings.dart';
import '../theme/app_colors.dart';

/// Recipe generation modes for Gemini prompting.
enum ScanMode {
  quickScan,
  survival,
  chefMode;

  String get label => switch (this) {
        ScanMode.quickScan => AppStrings.scanModeQuickLabel,
        ScanMode.survival => AppStrings.scanModeSurvivalLabel,
        ScanMode.chefMode => AppStrings.scanModeChefLabel,
      };

  String get subtitle => switch (this) {
        ScanMode.quickScan => AppStrings.scanModeQuickSubtitle,
        ScanMode.survival => AppStrings.scanModeSurvivalSubtitle,
        ScanMode.chefMode => AppStrings.scanModeChefSubtitle,
      };

  String get description => switch (this) {
        ScanMode.quickScan => AppStrings.scanModeQuickDesc,
        ScanMode.survival => AppStrings.scanModeSurvivalDesc,
        ScanMode.chefMode => AppStrings.scanModeChefDesc,
      };

  Color get accentColor => switch (this) {
        ScanMode.quickScan => AppColors.primary,
        ScanMode.survival => AppColors.secondary,
        ScanMode.chefMode => AppColors.chefModeAccent,
      };

  IconData get icon => switch (this) {
        ScanMode.quickScan => Icons.bolt_rounded,
        ScanMode.survival => Icons.eco_rounded,
        ScanMode.chefMode => Icons.restaurant_menu_rounded,
      };

  double get geminiTemperature => switch (this) {
        ScanMode.quickScan => 0.22,
        ScanMode.survival => 0.36,
        ScanMode.chefMode => 0.52,
      };

  String get bestFor => switch (this) {
        ScanMode.quickScan => AppStrings.scanModeQuickBestFor,
        ScanMode.survival => AppStrings.scanModeSurvivalBestFor,
        ScanMode.chefMode => AppStrings.scanModeChefBestFor,
      };

  String get examples => switch (this) {
        ScanMode.quickScan => AppStrings.scanModeQuickExamples,
        ScanMode.survival => AppStrings.scanModeSurvivalExamples,
        ScanMode.chefMode => AppStrings.scanModeChefExamples,
      };

  /// Stored in Supabase `pantry_scans.mode`.
  String get apiValue => name;

  static ScanMode fromApiValue(String value) {
    return ScanMode.values.firstWhere(
      (m) => m.apiValue == value,
      orElse: () => ScanMode.quickScan,
    );
  }
}
