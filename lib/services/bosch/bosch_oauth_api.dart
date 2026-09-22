import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../core/config/app_env.dart';

class BoschAuthUrlResponse {
  BoschAuthUrlResponse({
    required this.authorizationUrl,
    required this.state,
    required this.redirectUri,
  });

  final String authorizationUrl;
  final String state;
  final String redirectUri;

  factory BoschAuthUrlResponse.fromJson(Map<String, dynamic> json) {
    final url = json['authorizationUrl']?.toString().trim();
    final state = json['state']?.toString().trim();
    var redirectUri = json['redirectUri']?.toString().trim();
    redirectUri ??= Uri.parse(url ?? '').queryParameters['redirect_uri'];
    if (url == null ||
        url.isEmpty ||
        state == null ||
        state.isEmpty ||
        redirectUri == null ||
        redirectUri.isEmpty) {
      throw const FormatException('Invalid auth-url response');
    }
    return BoschAuthUrlResponse(
      authorizationUrl: url,
      state: state,
      redirectUri: redirectUri,
    );
  }
}

class BoschTokenBundle {
  BoschTokenBundle({
    required this.accessToken,
    this.refreshToken,
    this.expiresInSeconds,
    this.tokenType,
    this.scope,
  });

  final String accessToken;
  final String? refreshToken;
  final int? expiresInSeconds;
  final String? tokenType;
  final String? scope;

  factory BoschTokenBundle.fromJson(Map<String, dynamic> json) {
    if (json['ok'] != true) {
      final err = json['error']?.toString() ?? 'unknown';
      throw BoschOAuthApiException(err, message: json['message']?.toString());
    }
    final access = json['accessToken']?.toString().trim();
    if (access == null || access.isEmpty) {
      throw const FormatException('Missing accessToken');
    }
    final expiresRaw = json['expiresIn'];
    return BoschTokenBundle(
      accessToken: access,
      refreshToken: json['refreshToken']?.toString(),
      expiresInSeconds: expiresRaw is int
          ? expiresRaw
          : int.tryParse(expiresRaw?.toString() ?? ''),
      tokenType: json['tokenType']?.toString(),
      scope: json['scope']?.toString(),
    );
  }
}

class BoschOAuthApiException implements Exception {
  BoschOAuthApiException(this.code, {this.message});

  final String code;
  final String? message;

  @override
  String toString() => message ?? code;
}

class BoschOAuthApi {
  BoschOAuthApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  String? get _base => AppEnv.boschBackendUrl;

  Uri _uri(String path) {
    final base = _base;
    if (base == null) {
      throw BoschOAuthApiException('backend_url_missing');
    }
    return Uri.parse('$base$path');
  }

  Future<BoschAuthUrlResponse> fetchAuthorizationUrl() async {
    final response = await _client
        .get(_uri('/bosch/auth-url'))
        .timeout(const Duration(seconds: 15));
    if (response.statusCode != 200) {
      throw BoschOAuthApiException(
        'auth_url_http_${response.statusCode}',
        message: response.body,
      );
    }
    final json = jsonDecode(response.body);
    if (json is! Map<String, dynamic>) {
      throw const FormatException('auth-url body');
    }
    return BoschAuthUrlResponse.fromJson(json);
  }

  Future<BoschTokenBundle> exchangeCode({
    required String code,
    required String state,
    required String redirectUri,
  }) async {
    final response = await _client
        .post(
          _uri('/bosch/exchange'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'code': code,
            'state': state,
            'redirectUri': redirectUri,
          }),
        )
        .timeout(const Duration(seconds: 20));
    Map<String, dynamic> json;
    try {
      json = jsonDecode(response.body) as Map<String, dynamic>;
    } catch (_) {
      throw BoschOAuthApiException(
        'exchange_invalid_json',
        message: response.body,
      );
    }
    if (response.statusCode >= 400) {
      final oauthErr = json['error']?.toString();
      final oauthDesc = json['errorDescription']?.toString() ??
          json['error_description']?.toString();
      throw BoschOAuthApiException(
        oauthErr ?? 'exchange_http_${response.statusCode}',
        message: oauthDesc ?? json['message']?.toString(),
      );
    }
    return BoschTokenBundle.fromJson(json);
  }
}
