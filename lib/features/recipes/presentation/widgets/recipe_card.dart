import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/providers/recipe_localization_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/recipe_labels.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../../domain/models/recipe_models.dart';
import 'favorite_recipe_button.dart';
import 'recipe_visual.dart';

class RecipeCard extends ConsumerWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
    required this.index,
    this.accent,
    this.onTap,
    this.favoriteModeLabel,
    this.compactVisual = false,
    this.recipeCacheId,
    this.pantryIngredients = const [],
  });

  final Recipe recipe;
  final int index;
  final Color? accent;
  final VoidCallback? onTap;
  final String? favoriteModeLabel;
  final bool compactVisual;
  final String? recipeCacheId;
  final List<String> pantryIngredients;

  LocalizedRecipeKey get _displayKey =>
      (recipe: recipe, cacheId: recipeCacheId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accentColor = accent ?? AppColors.primary;
    final isLoading = ref.watch(localizedRecipeLoadingProvider(_displayKey));
    final display =
        ref.watch(localizedRecipeDisplayProvider(_displayKey)) ?? recipe;

    if (isLoading) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Card(
          color: AppColors.surface,
          child: SizedBox(
            height: compactVisual ? 200 : 280,
            child: const Center(child: CircularProgressIndicator()),
          ),
        ),
      );
    }

    final title = display.title;
    final cookTime = display.cookTime;
    final difficulty = localizeDifficulty(display.difficulty);
    final steps = display.instructions;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(NeonDecorations.cardRadius),
          child: Ink(
            decoration: NeonDecorations.card(),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: accentColor.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.border),
                        ),
                        child: Text(
                          '${index + 1}',
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: AppColors.textPrimary,
                            height: 1.3,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                      if (favoriteModeLabel != null)
                        FavoriteRecipeButton(
                          recipe: recipe,
                          modeLabel: favoriteModeLabel,
                          iconSize: 22,
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  RecipeVisual(
                    title: title,
                    imageSearchTitle: display.effectiveImageSearchTitle,
                    imageUrl: recipe.imageUrl,
                    ingredients: pantryIngredients,
                    height: compactVisual ? 112 : 136,
                    compact: compactVisual,
                  ),
                  const SizedBox(height: 14),
                  Row(
                    children: [
                      _MetaChip(
                        icon: Icons.schedule_outlined,
                        label: cookTime,
                      ),
                      const SizedBox(width: 16),
                      _MetaChip(
                        icon: Icons.signal_cellular_alt,
                        label: difficulty,
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  ...steps.asMap().entries.map((entry) {
                    final stepNum = entry.key + 1;
                    final step = entry.value;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$stepNum.',
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              step,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                                height: 1.5,
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
          ),
        ),
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 15, color: AppColors.textMuted),
        const SizedBox(width: 6),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
