import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enums/scan_mode.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/presentation/app_feedback.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../favorites/presentation/providers/favorites_provider.dart';
import '../../domain/models/recipe_models.dart';

class FavoriteRecipeButton extends ConsumerWidget {
  const FavoriteRecipeButton({
    super.key,
    required this.recipe,
    this.modeLabel,
    this.favoriteId,
    this.iconSize = 24,
  });

  final Recipe recipe;
  final String? modeLabel;
  final String? favoriteId;
  final double iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoritesProvider).valueOrNull ?? const [];
    final isFavorite = favoriteId != null
        ? favorites.any((f) => f.id == favoriteId)
        : ref.watch(isFavoriteProvider(recipe));

    return IconButton(
      tooltip: isFavorite
          ? AppStrings.favoriteRemoveTooltip
          : AppStrings.favoriteAddTooltip,
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? AppColors.primary : AppColors.textSecondary,
        size: iconSize,
      ),
      onPressed: () async {
        bool added;
        if (favoriteId != null && isFavorite) {
          await ref.read(favoritesProvider.notifier).remove(favoriteId!);
          added = false;
        } else {
          added = await ref
              .read(favoritesProvider.notifier)
              .toggle(recipe, modeLabel: modeLabel);
        }
        if (!context.mounted) return;
        AppFeedback.showInfo(
          context,
          added ? AppStrings.favoriteAddedSnack : AppStrings.favoriteRemovedSnack,
        );
      },
    );
  }
}

/// Helper when [ScanMode] is available instead of label string.
class FavoriteRecipeButtonForMode extends ConsumerWidget {
  const FavoriteRecipeButtonForMode({
    super.key,
    required this.recipe,
    required this.mode,
    this.iconSize = 24,
  });

  final Recipe recipe;
  final ScanMode mode;
  final double iconSize;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FavoriteRecipeButton(
      recipe: recipe,
      modeLabel: mode.label,
      iconSize: iconSize,
    );
  }
}
