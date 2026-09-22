import 'package:shared_preferences/shared_preferences.dart';

/// When true, user entered the app without a Supabase session (offline/local).
abstract final class LocalAuthStorage {
  static const _key = 'local_auth_mode';

  static Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, value);
  }
}
