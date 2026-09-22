import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

/// Provides a stable local device id used for backend rate-limit identity.
abstract final class AiDeviceIdentity {
  static const _key = 'ai_device_id_v1';
  static final _rng = Random();

  static Future<String> getOrCreate() async {
    final prefs = await SharedPreferences.getInstance();
    final existing = prefs.getString(_key);
    if (existing != null && existing.trim().isNotEmpty) {
      return existing;
    }

    final now = DateTime.now().microsecondsSinceEpoch.toRadixString(36);
    final salt = _rng.nextInt(1 << 32).toRadixString(36);
    final id = 'dcf-$now-$salt';
    await prefs.setString(_key, id);
    return id;
  }
}
