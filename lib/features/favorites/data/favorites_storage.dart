import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/favorite_recipe.dart';

abstract final class FavoritesStorage {
  static const _key = 'favorite_recipes_v1';

  static Future<List<FavoriteRecipe>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => FavoriteRecipe.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => b.savedAt.compareTo(a.savedAt));
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveAll(List<FavoriteRecipe> items) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = jsonEncode(items.map((e) => e.toJson()).toList());
    await prefs.setString(_key, encoded);
  }
}
