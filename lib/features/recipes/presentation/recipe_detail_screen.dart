import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/providers/recipe_localization_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/recipe_labels.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../../core/widgets/responsive_shell.dart';
import '../domain/models/recipe_models.dart';
import '../domain/models/nutrition_estimate.dart';
import 'utils/recipe_share.dart';

import 'widgets/favorite_recipe_button.dart';
import 'widgets/recipe_visual.dart';

class RecipeDetailScreen extends ConsumerWidget {
  const RecipeDetailScreen({
    super.key,
    required this.recipe,
    this.index,
    this.favoriteModeLabel,
    this.recipeCacheId,
  });

  final Recipe recipe;
  final int? index;
  final String? favoriteModeLabel;
  final String? recipeCacheId;

  LocalizedRecipeKey get _displayKey =>
      (recipe: recipe, cacheId: recipeCacheId);

  Future<void> _share(BuildContext context, WidgetRef ref) async {
    final localized = _displayRecipe(ref);
    await SharePlus.instance.share(
      ShareParams(text: formatRecipeForShare(localized)),
    );
  }

  Future<void> _copy(BuildContext context, WidgetRef ref) async {
    final localized = _displayRecipe(ref);
    await Clipboard.setData(ClipboardData(text: formatRecipeForShare(localized)));
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppStrings.recipeCopiedSnack)),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(localizedRecipeLoadingProvider(_displayKey));
    if (isLoading) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.recipeDetailTitle(index)),
        ),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    final localized = _displayRecipe(ref);
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.recipeDetailTitle(index)),
        actions: [
          FavoriteRecipeButton(
            recipe: recipe,
            modeLabel: favoriteModeLabel,
            favoriteId: recipeCacheId,
          ),
          IconButton(
            tooltip: AppStrings.copyRecipe,
            icon: Icon(Icons.copy_outlined),
            onPressed: () => _copy(context, ref),
          ),
          IconButton(
            tooltip: AppStrings.shareRecipe,
            icon: Icon(Icons.share_outlined),
            onPressed: () => _share(context, ref),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
        children: [
          ResponsiveShell(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(22),
                  decoration: NeonDecorations.card(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localized.title,
                        style: GoogleFonts.inter(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textPrimary,
                          height: 1.25,
                          letterSpacing: -0.3,
                        ),
                      ),
                      const SizedBox(height: 14),
                      RecipeVisual(
                        title: localized.title,
                        imageUrl: localized.imageUrl,
                        height: 164,
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          _Meta(
                            icon: Icons.schedule_outlined,
                            label: localized.cookTime,
                          ),
                          const SizedBox(width: 20),
                          _Meta(
                            icon: Icons.signal_cellular_alt,
                            label: localizeDifficulty(localized.difficulty),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (localized.nutrition != null && localized.nutrition!.hasData) ...[
                  const SizedBox(height: 20),
                  _NutritionCard(nutrition: localized.nutrition!),
                ],
                const SizedBox(height: 20),
                Text(
                  AppStrings.recipeInstructions,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 12),
                ...localized.instructions.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.12),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColors.border),
                          ),
                          child: Text(
                            '${entry.key + 1}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            entry.value,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              height: 1.5,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Recipe _displayRecipe(WidgetRef ref) {
    return ref.watch(localizedRecipeDisplayProvider(_displayKey)) ?? recipe;
  }
}

class _NutritionCard extends StatelessWidget {
  const _NutritionCard({required this.nutrition});

  final NutritionEstimate nutrition;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: NeonDecorations.card(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.nutritionTitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          Text(
            AppStrings.nutritionPerServing,
            style: GoogleFonts.inter(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              if (nutrition.calories != null)
                _NutrientChip(
                  label: AppStrings.nutritionCalories,
                  value: '${nutrition.calories} kcal',
                ),
              if (nutrition.proteinG != null)
                _NutrientChip(
                  label: AppStrings.nutritionProtein,
                  value: '${nutrition.proteinG} g',
                ),
              if (nutrition.carbsG != null)
                _NutrientChip(
                  label: AppStrings.nutritionCarbs,
                  value: '${nutrition.carbsG} g',
                ),
              if (nutrition.fatG != null)
                _NutrientChip(
                  label: AppStrings.nutritionFat,
                  value: '${nutrition.fatG} g',
                ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            AppStrings.nutritionEstimateNote,
            style: GoogleFonts.inter(
              fontSize: 10,
              color: AppColors.textMuted,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}

class _NutrientChip extends StatelessWidget {
  const _NutrientChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: NeonDecorations.button(filled: true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(fontSize: 10, color: AppColors.textMuted),
          ),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _Meta extends StatelessWidget {
  const _Meta({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: AppColors.textMuted),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}

