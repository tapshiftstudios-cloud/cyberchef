import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/app_env.dart';
import 'recipe_image_fallback.dart';
import 'recipe_image_query.dart';

/// V1: title-based stock photo lookup + local cache.
/// V2-ready: pass [explicitUrl] from Recipe.imageUrl (AI/proxy) when set.
class RecipeImageService {
  RecipeImageService({http.Client? client}) : _client = client ?? http.Client();

  static final RecipeImageService instance = RecipeImageService();

  final http.Client _client;
  static const _cachePrefix = 'recipe_img_v3_';
  static const _memoryMax = 128;
  final Map<String, String> _memory = {};

  Future<String> resolveUrl(
    String title, {
    String? explicitUrl,
    List<String> ingredients = const [],
  }) async {
    final trimmedExplicit = explicitUrl?.trim();
    if (trimmedExplicit != null && trimmedExplicit.isNotEmpty) {
      return trimmedExplicit;
    }

    final normalizedTitle = title.trim();
    if (normalizedTitle.isEmpty) {
      return RecipeImageFallback.urlForTitle(title);
    }

    final query = RecipeImageQuery.forTitle(
      normalizedTitle,
      ingredients: ingredients,
    );
    final cacheKey = _cachePrefix + _hash('$normalizedTitle|$query');
    final mem = _memory[cacheKey];
    if (mem != null) return mem;

    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(cacheKey);
    if (stored != null && stored.isNotEmpty) {
      _remember(cacheKey, stored);
      return stored;
    }

    final fetched = await _fetchRemote(query, normalizedTitle);
    await prefs.setString(cacheKey, fetched);
    _remember(cacheKey, fetched);
    return fetched;
  }

  Future<String> _fetchRemote(String query, String titleForFallback) async {
    if (_looksLatinQuery(query)) {
      final mealDb = await _tryTheMealDb(query);
      if (mealDb != null) return mealDb;
    }

    final pexels = await _tryPexels(query);
    if (pexels != null) return pexels;

    return RecipeImageFallback.urlForTitle(titleForFallback);
  }

  static bool _looksLatinQuery(String query) {
    return RegExp(r'^[a-z0-9\s-]+$').hasMatch(query);
  }

  Future<String?> _tryTheMealDb(String query) async {
    try {
      final uri = Uri.https(
        'www.themealdb.com',
        '/api/json/v1/1/search.php',
        {'s': query},
      );
      final response = await _client.get(uri).timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return null;
      final json = jsonDecode(response.body);
      if (json is! Map<String, dynamic>) return null;
      final meals = json['meals'];
      if (meals is! List || meals.isEmpty) return null;
      final first = meals.first;
      if (first is! Map<String, dynamic>) return null;
      final thumb = first['strMealThumb']?.toString().trim();
      if (thumb == null || thumb.isEmpty) return null;
      return thumb;
    } catch (_) {
      return null;
    }
  }

  Future<String?> _tryPexels(String query) async {
    final apiKey = AppEnv.pexelsApiKey;
    if (apiKey == null) return null;
    try {
      final uri = Uri.https(
        'api.pexels.com',
        '/v1/search',
        {
          'query': query,
          'per_page': '5',
          'orientation': 'landscape',
        },
      );
      final response = await _client
          .get(
            uri,
            headers: {'Authorization': apiKey},
          )
          .timeout(const Duration(seconds: 8));
      if (response.statusCode != 200) return null;
      final json = jsonDecode(response.body);
      if (json is! Map<String, dynamic>) return null;
      final photos = json['photos'];
      if (photos is! List || photos.isEmpty) return null;
      for (final photo in photos) {
        if (photo is! Map<String, dynamic>) continue;
        final alt = photo['alt']?.toString().toLowerCase() ?? '';
        if (_isIrrelevantPhotoAlt(alt)) continue;
        final src = photo['src'];
        if (src is! Map<String, dynamic>) continue;
        final medium = src['medium']?.toString().trim();
        if (medium != null && medium.isNotEmpty) return medium;
        final large = src['large']?.toString().trim();
        if (large != null && large.isNotEmpty) return large;
      }
      final first = photos.first;
      if (first is Map<String, dynamic>) {
        final src = first['src'];
        if (src is Map<String, dynamic>) {
          return src['medium']?.toString().trim() ??
              src['large']?.toString().trim();
        }
      }
      return null;
    } catch (_) {
      return null;
    }
  }

  void _remember(String cacheKey, String url) {
    if (_memory.length >= _memoryMax) {
      _memory.remove(_memory.keys.first);
    }
    _memory[cacheKey] = url;
  }

  static bool _isIrrelevantPhotoAlt(String alt) {
    if (alt.isEmpty) return false;
    const block = [
      'street',
      'city',
      'building',
      'shop',
      'restaurant exterior',
      'people',
      'coffee',
      'latte',
      'bar',
    ];
    for (final word in block) {
      if (alt.contains(word)) return true;
    }
    return false;
  }

  static String _hash(String input) {
    return base64Url.encode(utf8.encode(input)).replaceAll('=', '');
  }
}
