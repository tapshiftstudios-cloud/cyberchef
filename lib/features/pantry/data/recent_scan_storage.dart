import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../domain/recent_scan.dart';

abstract final class RecentScanStorage {
  static const _key = 'recent_scans_v1';
  static const maxItems = 5;

  static Future<List<RecentScan>> loadAll() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];

    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => RecentScan.fromJson(e as Map<String, dynamic>))
          .toList()
        ..sort((a, b) => b.scannedAt.compareTo(a.scannedAt));
    } catch (_) {
      return [];
    }
  }

  static Future<void> saveAll(List<RecentScan> items) async {
    final prefs = await SharedPreferences.getInstance();
    final trimmed = items.take(maxItems).toList();
    await prefs.setString(
      _key,
      jsonEncode(trimmed.map((e) => e.toJson()).toList()),
    );
  }
}
