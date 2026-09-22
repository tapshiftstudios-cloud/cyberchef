import 'package:flutter/material.dart';

import '../../features/favorites/presentation/favorites_screen.dart';
import '../../features/freshness/presentation/freshness_list_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/pantry/presentation/pantry_history_screen.dart';
import '../../features/pantry/presentation/unified_pantry_screen.dart';
import '../../features/recipes/domain/models/recipe_models.dart';
import '../../features/recipes/presentation/recipe_detail_screen.dart';
import '../../features/recipes/presentation/recipes_results_screen.dart';
import '../../features/savings/presentation/savings_dashboard_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';
import '../enums/scan_mode.dart';

abstract final class AppNavigator {
  static Future<void> pushRecipesResults(
    BuildContext context, {
    required PantryAnalysisResult result,
    required ScanMode mode,
  }) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => RecipesResultsScreen(result: result, mode: mode),
      ),
    );
  }

  static Future<void> pushRecipeDetail(
    BuildContext context, {
    required Recipe recipe,
    int? index,
    String? favoriteModeLabel,
  }) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => RecipeDetailScreen(
          recipe: recipe,
          index: index,
          favoriteModeLabel: favoriteModeLabel,
        ),
      ),
    );
  }

  static Future<void> pushSettings(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const SettingsScreen(),
      ),
    );
  }

  static Future<void> pushFavorites(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const FavoritesScreen(),
      ),
    );
  }

  static Future<void> pushPantryHistory(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const PantryHistoryScreen(),
      ),
    );
  }

  static Future<void> pushFreshnessList(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const FreshnessListScreen(),
      ),
    );
  }

  static Future<void> pushOnboardingPreview(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => OnboardingScreen(
          onComplete: () => Navigator.of(context).pop(),
        ),
      ),
    );
  }

  static Future<void> pushUnifiedPantry(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const UnifiedPantryScreen(),
      ),
    );
  }

  static Future<void> pushSavingsDashboard(BuildContext context) {
    return Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const SavingsDashboardScreen(),
      ),
    );
  }
}
