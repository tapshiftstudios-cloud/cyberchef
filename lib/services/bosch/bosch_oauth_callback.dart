/// Parses OAuth redirect URLs from Home Connect / backend callback.
class BoschOAuthCallback {
  const BoschOAuthCallback._({
    required this.code,
    required this.state,
  });

  final String code;
  final String? state;

  static bool looksLikeCallback(Uri uri, {String callbackPath = '/bosch/callback'}) {
    final hasOAuthPayload = uri.queryParameters.containsKey('code') ||
        uri.queryParameters.containsKey('error');
    if (!hasOAuthPayload) return false;

    // CyberChef backend callback (custom registered application).
    if (uri.path == callbackPath || uri.path.endsWith(callbackPath)) {
      return true;
    }

    // Home Connect "API Web Client" simulator default redirect (quickstart).
    if (uri.host == 'example.com') return true;

    // Avoid showing raw JSON if OAuth hits our Node callback over LAN.
    if (uri.path.endsWith('/bosch/callback')) return true;

    return false;
  }

  static BoschOAuthCallback? tryParse(Uri uri) {
    final error = uri.queryParameters['error'];
    if (error != null && error.isNotEmpty) {
      throw BoschOAuthCallbackException(
        error,
        description: uri.queryParameters['error_description'],
      );
    }
    final code = uri.queryParameters['code']?.trim();
    if (code == null || code.isEmpty) return null;
    final state = uri.queryParameters['state']?.trim();
    return BoschOAuthCallback._(code: code, state: state);
  }
}

class BoschOAuthCallbackException implements Exception {
  BoschOAuthCallbackException(this.error, {this.description});

  final String error;
  final String? description;

  @override
  String toString() => description == null ? error : '$error: $description';
}
