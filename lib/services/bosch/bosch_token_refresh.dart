import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/app_env.dart';
import 'bosch_connection_store.dart';
import 'bosch_oauth_api.dart';

/// Refreshes Home Connect access tokens via Node backend (keeps client secret off-device).
class BoschTokenRefresh {
  BoschTokenRefresh({
    http.Client? client,
    BoschConnectionStore? store,
  })  : _client = client ?? http.Client(),
        _store = store ?? BoschConnectionStore();

  final http.Client _client;
  final BoschConnectionStore _store;

  Future<String?> getValidAccessToken() async {
    final access = await _store.accessToken;
    if (access == null || access.isEmpty) return null;

    if (!await _store.isAccessTokenExpired(withinSeconds: 120)) {
      return access;
    }

    final refresh = await _store.refreshToken;
    if (refresh == null || refresh.isEmpty) return access;

    final base = AppEnv.boschBackendUrl;
    if (base == null) return access;

    final response = await _client
        .post(
          Uri.parse('$base/bosch/refresh'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'refreshToken': refresh}),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      return access;
    }

    final json = jsonDecode(response.body);
    if (json is! Map<String, dynamic> || json['ok'] != true) {
      return access;
    }

    final bundle = BoschTokenBundle.fromJson(json);
    await _store.saveTokens(
      accessToken: bundle.accessToken,
      refreshToken: bundle.refreshToken ?? refresh,
      expiresInSeconds: bundle.expiresInSeconds,
      scope: bundle.scope,
    );
    return bundle.accessToken;
  }
}
