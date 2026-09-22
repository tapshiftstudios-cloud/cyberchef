import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/models/waste_savings_event.dart';

abstract final class WasteSavingsStorage {
  static const _key = 'waste_savings_events_v1';

  static Future<List<WasteSavingsEvent>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => WasteSavingsEvent.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => b.rescuedAt.compareTo(a.rescuedAt));
    } catch (_) {
      return [];
    }
  }

  static Future<void> append(WasteSavingsEvent event) async {
    final all = await loadAll();
    all.insert(0, event);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode(all.map((e) => e.toJson()).toList()),
    );
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}
