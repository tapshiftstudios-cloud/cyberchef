import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/app_env.dart';
import 'recipe_image_fallback.dart';

/// V1: title-based stock photo lookup + local cache.
/// V2-ready: pass [explicitUrl] from Recipe.imageUrl (AI/proxy) when set.
class RecipeImageService {
  RecipeImageService({http.Client? client}) : _client = client ?? http.Client();

  static final RecipeImageService instance = RecipeImageService();

  final http.Client _client;
  static const _cachePrefix = 'recipe_img_v1_';
  static const _memoryMax = 128;
  final Map<String, String> _memory = {};

  Future<String> resolveUrl(
    String title, {
    String? explicitUrl,
  }) async {
    final trimmedExplicit = explicitUrl?.trim();
    if (trimmedExplicit != null && trimmedExplicit.isNotEmpty) {
      return trimmedExplicit;
    }

    final normalizedTitle = title.trim();
    if (normalizedTitle.isEmpty) {
      return RecipeImageFallback.urlForTitle(title);
    }

    final cacheKey = _cachePrefix + _hash(normalizedTitle.toLowerCase());
    final mem = _memory[cacheKey];
    if (mem != null) return mem;

    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(cacheKey);
    if (stored != null && stored.isNotEmpty) {
      _remember(cacheKey, stored);
      return stored;
    }

    final fetched = await _fetchRemote(normalizedTitle);
    await prefs.setString(cacheKey, fetched);
    _remember(cacheKey, fetched);
    return fetched;
  }

  Future<String> _fetchRemote(String title) async {
    final mealDb = await _tryTheMealDb(title);
    if (mealDb != null) return mealDb;

    final pexels = await _tryPexels(title);
    if (pexels != null) return pexels;

    return RecipeImageFallback.urlForTitle(title);
  }

  Future<String?> _tryTheMealDb(String title) async {
    try {
      final uri = Uri.https(
        'www.themealdb.com',
        '/api/json/v1/1/search.php',
        {'s': title},
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

  Future<String?> _tryPexels(String title) async {
    final apiKey = AppEnv.pexelsApiKey;
    if (apiKey == null) return null;
    try {
      final uri = Uri.https(
        'api.pexels.com',
        '/v1/search',
        {
          'query': '$title food',
          'per_page': '1',
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
      final photo = photos.first;
      if (photo is! Map<String, dynamic>) return null;
      final src = photo['src'];
      if (src is! Map<String, dynamic>) return null;
      final medium = src['medium']?.toString().trim();
      if (medium != null && medium.isNotEmpty) return medium;
      return src['large']?.toString().trim();
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

  static String _hash(String input) {
    return base64Url.encode(utf8.encode(input)).replaceAll('=', '');
  }
}
