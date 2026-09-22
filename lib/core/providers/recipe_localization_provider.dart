import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/favorites/data/favorites_storage.dart';
import '../../features/favorites/domain/favorite_recipe.dart';
import '../../features/pantry/data/recent_scan_storage.dart';
import '../../features/recipes/domain/models/recipe_models.dart';
import '../enums/app_locale.dart';
import '../l10n/recipe_text_localizer.dart';
import 'service_providers.dart';
import 'user_preferences_provider.dart';

final recipeLocalizationProvider =
    NotifierProvider<RecipeLocalizationNotifier, RecipeLocalizationState>(
  RecipeLocalizationNotifier.new,
);

class RecipeLocalizationState {
  const RecipeLocalizationState({
    this.isPreparing = false,
    this.preparingFor,
    this.completed = 0,
    this.total = 0,
    this.recipes = const {},
    this.pantries = const {},
  });

  final bool isPreparing;
  final AppLocale? preparingFor;
  final int completed;
  final int total;
  final Map<String, Recipe> recipes;
  final Map<String, PantryAnalysisResult> pantries;

  RecipeLocalizationState copyWith({
    bool? isPreparing,
    AppLocale? preparingFor,
    int? completed,
    int? total,
    Map<String, Recipe>? recipes,
    Map<String, PantryAnalysisResult>? pantries,
  }) {
    return RecipeLocalizationState(
      isPreparing: isPreparing ?? this.isPreparing,
      preparingFor: preparingFor ?? this.preparingFor,
      completed: completed ?? this.completed,
      total: total ?? this.total,
      recipes: recipes ?? this.recipes,
      pantries: pantries ?? this.pantries,
    );
  }
}

class RecipeLocalizationNotifier extends Notifier<RecipeLocalizationState> {
  static const _favoriteTimeout = Duration(seconds: 12);
  static const _pantryTimeout = Duration(seconds: 15);
  static const _batchTimeout = Duration(seconds: 40);

  final Map<String, PantryAnalysisResult> _registeredPantrySources = {};
  Completer<void>? _prepareCompleter;
  AppLocale? _activePrepareLocale;
  AppLocale? _batchPreparedForLocale;
  bool _pantryWarmupRunning = false;

  @override
  RecipeLocalizationState build() {
    ref.listen<AppLocale>(localeProvider, (previous, next) {
      if (previous != null && previous != next) {
        unawaited(prepareLocale(next, forceRefresh: true));
      }
    });
    return const RecipeLocalizationState();
  }

  static String pantrySourceId(PantryAnalysisResult result) {
    return jsonEncode(result.toJson()).hashCode.toRadixString(16);
  }

  void registerPantryResult(String id, PantryAnalysisResult result) {
    _registeredPantrySources[id] = result;
  }

  String _recipeCacheKey(String recipeId, AppLocale locale) =>
      '${recipeId}_${locale.code}';

  String _pantryCacheKey(String pantryId, AppLocale locale) =>
      '${pantryId}_${locale.code}';

  String _localeSuffix(AppLocale locale) => '_${locale.code}';

  void _clearCacheForLocale(AppLocale locale) {
    final suffix = _localeSuffix(locale);
    state = state.copyWith(
      recipes: Map.fromEntries(
        state.recipes.entries.where((e) => !e.key.endsWith(suffix)),
      ),
      pantries: Map.fromEntries(
        state.pantries.entries.where((e) => !e.key.endsWith(suffix)),
      ),
    );
  }

  Recipe? recipeForDisplay(String recipeId, Recipe source, AppLocale locale) {
    final cached = state.recipes[_recipeCacheKey(recipeId, locale)];
    if (cached != null) return cached;
    if (!needsAiLocalization(source, locale)) return source;
    return null;
  }

  PantryAnalysisResult? pantryForDisplay(
    String pantryId,
    PantryAnalysisResult source,
    AppLocale locale,
  ) {
    final cached = state.pantries[_pantryCacheKey(pantryId, locale)];
    if (cached != null) return cached;
    if (!needsAiLocalizationForPantry(source, locale)) return source;
    return null;
  }

  Future<void> ensurePrepared(AppLocale locale) async {
    if (_batchPreparedForLocale == locale && !await _hasPendingFavoriteWork(locale)) {
      return;
    }
    await prepareLocale(
      locale,
      forceRefresh: _batchPreparedForLocale != locale,
    );
  }

  Future<PantryAnalysisResult> localizePantryIfNeeded(
    String pantryId,
    PantryAnalysisResult source,
    AppLocale locale,
  ) async {
    final ready = pantryForDisplay(pantryId, source, locale);
    if (ready != null) return ready;

    final translated = await _translatePantry(source, locale);
    final result = translated ?? source;
    _putPantry(_pantryCacheKey(pantryId, locale), result);
    return result;
  }

  Future<Recipe> localizeRecipeIfNeeded(
    String recipeId,
    Recipe source,
    AppLocale locale,
  ) async {
    final ready = recipeForDisplay(recipeId, source, locale);
    if (ready != null) return ready;

    final translated = await _translateRecipe(source, locale);
    if (translated != null) {
      _putRecipe(_recipeCacheKey(recipeId, locale), translated);
      return translated;
    }
    if (!needsAiLocalization(source, locale)) return source;
    final fallback = _fallbackLocalizeRecipe(source, locale);
    _putRecipe(_recipeCacheKey(recipeId, locale), fallback);
    return fallback;
  }

  Future<bool> _hasPendingFavoriteWork(AppLocale locale) async {
    final favorites = await FavoritesStorage.loadAll();
    for (final favorite in favorites) {
      if (recipeForDisplay(favorite.id, favorite.recipe, locale) == null) {
        return true;
      }
    }
    return false;
  }

  Future<void> prepareLocale(
    AppLocale locale, {
    bool forceRefresh = false,
  }) async {
    if (_prepareCompleter != null && _activePrepareLocale == locale) {
      return _prepareCompleter!.future;
    }

    if (!forceRefresh &&
        _batchPreparedForLocale == locale &&
        !await _hasPendingFavoriteWork(locale)) {
      return;
    }

    final completer = Completer<void>();
    _prepareCompleter = completer;
    _activePrepareLocale = locale;

    if (forceRefresh || _batchPreparedForLocale != locale) {
      _clearCacheForLocale(locale);
    }

    state = state.copyWith(
      isPreparing: true,
      preparingFor: locale,
      completed: 0,
      total: 0,
    );

    try {
      await _runPrepareFavorites(locale).timeout(
        _batchTimeout,
        onTimeout: () {},
      );
      _batchPreparedForLocale = locale;
      unawaited(_warmPantryInBackground(locale));
    } finally {
      state = state.copyWith(isPreparing: false);
      if (!completer.isCompleted) completer.complete();
      _prepareCompleter = null;
      _activePrepareLocale = null;
    }
  }

  Future<void> _runPrepareFavorites(AppLocale locale) async {
    final ai = ref.read(aiServiceProvider);
    final favorites = await FavoritesStorage.loadAll();
    if (favorites.isEmpty) {
      state = state.copyWith(total: 0, completed: 0);
      return;
    }

    state = state.copyWith(total: favorites.length, completed: 0);
    var completed = 0;

    for (final favorite in favorites) {
      final key = _recipeCacheKey(favorite.id, locale);
      Recipe result = favorite.recipe;

      if (ai.isConfigured) {
        final translated = await _translateRecipe(favorite.recipe, locale);
        if (translated != null) {
          result = translated;
        } else if (needsAiLocalization(favorite.recipe, locale)) {
          result = _fallbackLocalizeRecipe(favorite.recipe, locale);
        }
      }

      _putRecipe(key, result);
      completed++;
      state = state.copyWith(completed: completed);
    }
  }

  Future<void> _warmPantryInBackground(AppLocale locale) async {
    if (_pantryWarmupRunning) return;
    _pantryWarmupRunning = true;
    try {
      final ai = ref.read(aiServiceProvider);
      if (!ai.isConfigured) return;

      final pantryJobs = <String, PantryAnalysisResult>{};
      final recentScans = await RecentScanStorage.loadAll();
      for (final scan in recentScans) {
        pantryJobs['scan_${scan.id}'] = scan.analysis;
      }
      pantryJobs.addAll(_registeredPantrySources);

      for (final entry in pantryJobs.entries) {
        final key = _pantryCacheKey(entry.key, locale);
        if (state.pantries.containsKey(key)) continue;
        if (!needsAiLocalizationForPantry(entry.value, locale)) {
          _putPantry(key, entry.value);
          continue;
        }
        final translated = await _translatePantry(entry.value, locale);
        _putPantry(key, translated ?? entry.value);
      }
    } finally {
      _pantryWarmupRunning = false;
    }
  }

  Future<Recipe?> _translateRecipe(Recipe source, AppLocale locale) async {
    final ai = ref.read(aiServiceProvider);
    if (!ai.isConfigured) {
      return needsAiLocalization(source, locale) ? null : source;
    }

    for (var attempt = 0; attempt < 2; attempt++) {
      try {
        final translated = await ai
            .translateRecipe(recipe: source, targetLocale: locale)
            .timeout(_favoriteTimeout);
        if (!needsAiLocalization(translated, locale)) {
          return translated;
        }
      } on TimeoutException {
        continue;
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  Future<PantryAnalysisResult?> _translatePantry(
    PantryAnalysisResult source,
    AppLocale locale,
  ) async {
    final ai = ref.read(aiServiceProvider);
    if (!ai.isConfigured) {
      return needsAiLocalizationForPantry(source, locale) ? null : source;
    }

    for (var attempt = 0; attempt < 2; attempt++) {
      try {
        final translated = await ai
            .localizePantryAnalysisResult(result: source, targetLocale: locale)
            .timeout(_pantryTimeout);
        if (!needsAiLocalizationForPantry(translated, locale)) {
          return translated;
        }
      } on TimeoutException {
        continue;
      } catch (_) {
        continue;
      }
    }
    return null;
  }

  void _putRecipe(String key, Recipe recipe) {
    state = state.copyWith(
      recipes: {...state.recipes, key: recipe},
    );
  }

  void _putPantry(String key, PantryAnalysisResult pantry) {
    state = state.copyWith(
      pantries: {...state.pantries, key: pantry},
    );
  }

  Recipe _fallbackLocalizeRecipe(Recipe recipe, AppLocale locale) {
    return Recipe(
      title: RecipeTextLocalizer.localize(recipe.title, locale),
      cookTime: RecipeTextLocalizer.localize(recipe.cookTime, locale),
      difficulty: RecipeTextLocalizer.localize(recipe.difficulty, locale),
      instructions: recipe.instructions
          .map((step) => RecipeTextLocalizer.localize(step, locale))
          .toList(),
      nutrition: recipe.nutrition,
      imageUrl: recipe.imageUrl,
    );
  }

  static bool needsAiLocalization(Recipe recipe, AppLocale locale) {
    final blob = ([
      recipe.title,
      recipe.cookTime,
      recipe.difficulty,
      ...recipe.instructions,
    ]).join(' ').toLowerCase();
    if (blob.trim().isEmpty) return false;
    return _looksWrongLanguage(blob, locale);
  }

  static bool needsAiLocalizationForPantry(
    PantryAnalysisResult result,
    AppLocale locale,
  ) {
    final blob = [
      ...result.ingredients,
      ...result.recipes.map((r) => r.title),
      ...result.recipes.expand((r) => r.instructions),
    ].join(' ').toLowerCase();
    if (blob.trim().isEmpty) return false;
    return _looksWrongLanguage(blob, locale);
  }

  static bool _looksWrongLanguage(String blob, AppLocale locale) {
    if (locale == AppLocale.en) {
      return _looksTurkish(blob);
    }
    if (locale == AppLocale.tr) {
      return _looksEnglish(blob);
    }
    return _looksEnglish(blob) || _looksTurkish(blob);
  }

  static bool _looksTurkish(String blob) {
    return RegExp(
      r'[çğıöşü]|\b(ve|ile|icin|için|tavuk|mantar|domates|sogan|soğan|pisir|ekley|karistir|dogra|yumurta|ispanak|dk|kolay|orta|zor|dakika|yikay|karış|pişir|servis)\b',
      caseSensitive: false,
    ).hasMatch(blob);
  }

  static bool _looksEnglish(String blob) {
    return RegExp(
      r'\b(the|and|with|for|to|in|of|a|an|or|cup|cups|tbsp|tsp|min|mins|minute|minutes|hour|hours|bake|baking|whisk|heat|stir|add|serve|cook|chop|saute|sauté|until|soft|medium|hard|easy|chicken|mushroom|tomato|pepper|onion|egg|milk|salt|oven|bowl|pan|preheat|mix|slice|dice|simmer|boil|fry|grill|roast|°f|°c)\b',
      caseSensitive: false,
    ).hasMatch(blob);
  }
}

typedef LocalizedRecipeKey = ({Recipe recipe, String? cacheId});

final localizedRecipeDisplayProvider =
    Provider.family<Recipe?, LocalizedRecipeKey>((ref, key) {
  ref.watch(recipeLocalizationProvider);
  final locale = ref.watch(localeProvider);
  final id = key.cacheId ?? FavoriteRecipe.idForRecipe(key.recipe);
  return ref.read(recipeLocalizationProvider.notifier).recipeForDisplay(
        id,
        key.recipe,
        locale,
      );
});

final localizedRecipeLoadingProvider =
    Provider.family<bool, LocalizedRecipeKey>((ref, key) {
  final prep = ref.watch(recipeLocalizationProvider);
  final locale = ref.watch(localeProvider);
  final display = ref.watch(localizedRecipeDisplayProvider(key));
  if (display != null) return false;
  if (!RecipeLocalizationNotifier.needsAiLocalization(key.recipe, locale)) {
    return false;
  }
  return prep.isPreparing && prep.preparingFor == locale;
});

final localizedPantryProvider = FutureProvider.family<
    PantryAnalysisResult,
    ({String id, PantryAnalysisResult source})>((ref, args) async {
  final locale = ref.watch(localeProvider);
  return ref.read(recipeLocalizationProvider.notifier).localizePantryIfNeeded(
        args.id,
        args.source,
        locale,
      );
});
