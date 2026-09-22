import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/recipe_localization_provider.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../data/favorites_storage.dart';
import '../../domain/favorite_recipe.dart';
import '../../../recipes/domain/models/recipe_models.dart';

final favoritesProvider =
    AsyncNotifierProvider<FavoritesNotifier, List<FavoriteRecipe>>(
  FavoritesNotifier.new,
);

final isFavoriteProvider = Provider.family<bool, Recipe>((ref, recipe) {
  final favorites = ref.watch(favoritesProvider).valueOrNull ?? [];
  final id = FavoriteRecipe.idForRecipe(recipe);
  return favorites.any((f) => f.id == id);
});

class FavoritesNotifier extends AsyncNotifier<List<FavoriteRecipe>> {
  @override
  Future<List<FavoriteRecipe>> build() async {
    ref.watch(recipeLocalizationProvider);
    final locale = ref.watch(localeProvider);
    await ref.read(recipeLocalizationProvider.notifier).ensurePrepared(locale);

    final raw = await FavoritesStorage.loadAll();
    final loc = ref.read(recipeLocalizationProvider.notifier);
    final localized = await Future.wait(
      raw.map((favorite) async {
        final recipe = await loc.localizeRecipeIfNeeded(
          favorite.id,
          favorite.recipe,
          locale,
        );
        return FavoriteRecipe(
          id: favorite.id,
          recipe: recipe,
          savedAt: favorite.savedAt,
          modeLabel: favorite.modeLabel,
        );
      }),
    );
    return localized;
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<bool> toggle(Recipe recipe, {String? modeLabel}) async {
    final current = await FavoritesStorage.loadAll();
    final id = FavoriteRecipe.idForRecipe(recipe);
    final exists = current.any((f) => f.id == id);

    final updated = exists
        ? current.where((f) => f.id != id).toList()
        : [
            FavoriteRecipe(
              id: id,
              recipe: recipe,
              savedAt: DateTime.now(),
              modeLabel: modeLabel,
            ),
            ...current,
          ];

    await FavoritesStorage.saveAll(updated);
    ref.invalidateSelf();
    await future;
    return !exists;
  }

  Future<void> remove(String id) async {
    final current = await FavoritesStorage.loadAll();
    final updated = current.where((f) => f.id != id).toList();
    await FavoritesStorage.saveAll(updated);
    ref.invalidateSelf();
    await future;
  }
}
