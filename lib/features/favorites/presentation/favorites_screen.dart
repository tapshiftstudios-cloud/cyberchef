import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/providers/main_shell_tab_provider.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../../core/widgets/responsive_recipe_list.dart';
import '../../../core/widgets/responsive_shell.dart';
import '../../recipes/presentation/widgets/recipe_card.dart';
import 'providers/favorites_provider.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoritesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.favoritesTitle),
      ),
      body: favoritesAsync.when(
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateCard(
              icon: Icons.favorite_border,
              message: AppStrings.favoritesEmpty,
              actionLabel: AppStrings.navScan,
              onAction: () {
                ref.read(mainShellTabIndexProvider.notifier).state = 0;
                Navigator.of(context).pop();
              },
            );
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(0, 12, 0, 24),
            children: [
              ResponsiveShell(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ResponsiveRecipeList(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final favorite = items[index];
                    return Dismissible(
                      key: ValueKey(favorite.id),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(
                            NeonDecorations.cardRadius,
                          ),
                        ),
                        child: Icon(
                          Icons.delete_outline,
                          color: AppColors.error,
                        ),
                      ),
                      onDismissed: (_) {
                        ref
                            .read(favoritesProvider.notifier)
                            .remove(favorite.id);
                      },
                      child: RecipeCard(
                        recipe: favorite.recipe,
                        recipeCacheId: favorite.id,
                        index: index,
                        compactVisual: true,
                        onTap: () {
                          AppNavigator.pushRecipeDetail(
                            context,
                            recipe: favorite.recipe,
                            index: index,
                            favoriteModeLabel: favorite.modeLabel,
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              AppStrings.genericLoadError,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(color: AppColors.error),
            ),
          ),
        ),
      ),
    );
  }
}

