import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/enums/scan_mode.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/presentation/app_feedback.dart';
import '../../../core/providers/recipe_localization_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../shopping/presentation/providers/shopping_list_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../domain/models/recipe_models.dart';
import 'widgets/ingredient_chips.dart';
import 'widgets/recipe_card.dart';
import '../../../core/widgets/responsive_shell.dart';

class RecipesResultsScreen extends ConsumerWidget {
  const RecipesResultsScreen({
    super.key,
    required this.result,
    required this.mode,
  });

  final PantryAnalysisResult result;
  final ScanMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pantryId = RecipeLocalizationNotifier.pantrySourceId(result);
    ref.read(recipeLocalizationProvider.notifier).registerPantryResult(
          pantryId,
          result,
        );

    final localizedAsync = ref.watch(
      localizedPantryProvider((id: pantryId, source: result)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.recipesScreenTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: localizedAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => _ResultsBody(result: result, mode: mode),
        data: (data) => _ResultsBody(result: data, mode: mode),
      ),
    );
  }
}

class _ResultsBody extends ConsumerWidget {
  const _ResultsBody({
    required this.result,
    required this.mode,
  });

  final PantryAnalysisResult result;
  final ScanMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 28),
      children: [
        ResponsiveShell(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: NeonDecorations.button(
                  accent: mode.accentColor,
                  filled: true,
                ),
                child: Row(
                  children: [
                    Icon(mode.icon, color: mode.accentColor, size: 28),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            mode.label,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: mode.accentColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            mode.subtitle,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            mode.bestFor,
                            style: GoogleFonts.inter(
                              fontSize: 11,
                              height: 1.35,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Text(
                AppStrings.recipesDetectedIngredients,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.2,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 12),
              IngredientChips(ingredients: result.ingredients),
              const SizedBox(height: 12),
              AppTheme.neonButton(
                label: AppStrings.shoppingAddFromRecipe,
                icon: Icons.playlist_add,
                onPressed: () async {
                  final pantry = ref.read(pantryItemsProvider).valueOrNull ?? [];
                  final inPantry = pantry.map((e) => e.cleanName).toList();
                  await ref.read(shoppingListProvider.notifier).addMissingIngredients(
                        result.ingredients,
                        inPantry,
                      );
                  if (context.mounted) {
                    AppFeedback.showInfo(
                      context,
                      AppStrings.shoppingListAddedSnack,
                    );
                  }
                },
              ),
              const SizedBox(height: 28),
              Text(
                AppStrings.recipesAiCount(result.recipes.length),
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 16),
              ...result.recipes.asMap().entries.map(
                    (entry) => RecipeCard(
                      recipe: entry.value,
                      index: entry.key,
                      accent: mode.accentColor,
                      favoriteModeLabel: mode.label,
                      pantryIngredients: result.effectiveImageSearchIngredients,
                      onTap: () {
                        AppNavigator.pushRecipeDetail(
                          context,
                          recipe: entry.value,
                          index: entry.key,
                          favoriteModeLabel: mode.label,
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
