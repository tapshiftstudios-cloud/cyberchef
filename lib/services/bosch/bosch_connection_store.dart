import 'package:shared_preferences/shared_preferences.dart';

/// Local storage for Bosch OAuth tokens (Step 2 — device-only until Supabase link).
class BoschConnectionStore {
  static const _keyLinked = 'bosch_hc_linked_v1';
  static const _keyAccess = 'bosch_hc_access_v1';
  static const _keyRefresh = 'bosch_hc_refresh_v1';
  static const _keyExpiresAt = 'bosch_hc_expires_at_v1';
  static const _keyScope = 'bosch_hc_scope_v1';

  Future<bool> get isLinked async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyLinked) ?? false;
  }

  Future<String?> get accessToken async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyAccess);
  }

  Future<String?> get refreshToken async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyRefresh);
  }

  Future<String?> get grantedScope async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyScope);
  }

  Future<bool> isAccessTokenExpired({int withinSeconds = 0}) async {
    final prefs = await SharedPreferences.getInstance();
    final expiresAt = prefs.getInt(_keyExpiresAt);
    if (expiresAt == null) return false;
    final threshold =
        DateTime.now().add(Duration(seconds: withinSeconds)).millisecondsSinceEpoch;
    return threshold >= expiresAt;
  }

  Future<void> saveTokens({
    required String accessToken,
    String? refreshToken,
    int? expiresInSeconds,
    String? scope,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyLinked, true);
    await prefs.setString(_keyAccess, accessToken);
    if (refreshToken != null && refreshToken.isNotEmpty) {
      await prefs.setString(_keyRefresh, refreshToken);
    }
    if (expiresInSeconds != null && expiresInSeconds > 0) {
      final expiresAt =
          DateTime.now().add(Duration(seconds: expiresInSeconds)).millisecondsSinceEpoch;
      await prefs.setInt(_keyExpiresAt, expiresAt);
    }
    if (scope != null && scope.trim().isNotEmpty) {
      await prefs.setString(_keyScope, scope.trim());
    }
  }

  Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyLinked);
    await prefs.remove(_keyAccess);
    await prefs.remove(_keyRefresh);
    await prefs.remove(_keyExpiresAt);
    await prefs.remove(_keyScope);
  }
}
