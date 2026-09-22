import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/shopping_list_item.dart';

abstract final class ShoppingListStorage {
  static const _key = 'cyberchef_shopping_list_v1';

  static Future<List<ShoppingListItem>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => ShoppingListItem.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveAll(List<ShoppingListItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(items.map((e) => e.toJson()).toList()),
    );
  }
}
