import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/pantry_item.dart';

/// Cihazda tazelik envanteri (misafir veya çevrimdışı).
abstract final class PantryItemStorage {
  static const _key = 'pantry_items_v1';

  static Future<List<PantryItem>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => PantryItem.fromJson(e as Map<String, dynamic>))
          .where((item) => !item.isConsumed)
          .toList()
        ..sort((a, b) => a.daysRemaining().compareTo(b.daysRemaining()));
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveAll(List<PantryItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(items.map((e) => e.toJson()).toList()),
    );
  }

  static Future<void> appendMany(List<PantryItem> newItems) async {
    final all = await _loadRaw();
    final consumed = all.where((e) => e.isConsumed);
    final active = all.where((e) => !e.isConsumed).toList();
    final merged = [
      ...newItems,
      ...active.where((e) => !newItems.any((n) => n.id == e.id)),
    ];
    await prefsSaveRaw([...merged, ...consumed]);
  }

  static Future<PantryItem?> findById(String id) async {
    final all = await _loadRaw();
    for (final e in all) {
      if (e.id == id) return e;
    }
    return null;
  }

  static Future<void> markConsumed(String id, {DateTime? at}) async {
    final all = await _loadRaw();
    final when = at ?? DateTime.now();
    final updated = all
        .map(
          (e) => e.id == id
              ? e.copyWith(isConsumed: true, consumedAt: when)
              : e,
        )
        .toList();
    await prefsSaveRaw(updated);
  }

  static Future<List<PantryItem>> _loadRaw() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => PantryItem.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> prefsSaveRaw(List<PantryItem> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(items.map((e) => e.toJson()).toList()),
    );
  }

  static Future<void> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
