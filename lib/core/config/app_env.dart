import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Reads configuration from `--dart-define` first, then optional dotenv.
///
/// [GEMINI_API_KEY] is never exposed on the client in release builds or when
/// [AI_PROXY_REQUIRED] is enabled — use Supabase Edge Function secrets instead.
abstract final class AppEnv {
  static const String geminiApiKey = 'GEMINI_API_KEY';
  static const String aiProxyRequiredKey = 'AI_PROXY_REQUIRED';
  static const String aiBackendProxyUrlKey = 'AI_BACKEND_PROXY_URL';
  static const String supabaseUrlKey = 'SUPABASE_URL';

  static String? _clean(String? value) {
    if (value == null) return null;
    final trimmed = value.trim();
    if (trimmed.isEmpty) return null;
    return trimmed;
  }

  static bool get isAiProxyRequired {
    final raw = _rawValue(aiProxyRequiredKey)?.toLowerCase();
    return raw == 'true' || raw == '1' || raw == 'yes';
  }

  /// Whether the Flutter app may read a Gemini key from defines or dotenv.
  @visibleForTesting
  static bool clientGeminiKeyAllowed({
    required bool releaseMode,
    required bool proxyRequired,
  }) {
    return !releaseMode && !proxyRequired;
  }

  static bool get _clientGeminiKeyAllowed => clientGeminiKeyAllowed(
        releaseMode: kReleaseMode,
        proxyRequired: isAiProxyRequired,
      );

  static String? _fromDefine(String key) {
    final value = switch (key) {
      geminiApiKey => const String.fromEnvironment(geminiApiKey),
      'SUPABASE_URL' => const String.fromEnvironment('SUPABASE_URL'),
      'SUPABASE_ANON_KEY' => const String.fromEnvironment('SUPABASE_ANON_KEY'),
      'SENTRY_DSN' => const String.fromEnvironment('SENTRY_DSN'),
      'AI_BACKEND_PROXY_URL' =>
        const String.fromEnvironment('AI_BACKEND_PROXY_URL'),
      'AI_BACKEND_PROXY_BEARER' =>
        const String.fromEnvironment('AI_BACKEND_PROXY_BEARER'),
      aiProxyRequiredKey => const String.fromEnvironment(aiProxyRequiredKey),
      'IAP_PRO_MONTHLY_ID' => const String.fromEnvironment('IAP_PRO_MONTHLY_ID'),
      'IAP_PRO_YEARLY_ID' => const String.fromEnvironment('IAP_PRO_YEARLY_ID'),
      'PRIVACY_POLICY_URL' => const String.fromEnvironment('PRIVACY_POLICY_URL'),
      'ADMOB_APP_ID' => const String.fromEnvironment('ADMOB_APP_ID'),
      'ADMOB_BANNER_UNIT_ID' => const String.fromEnvironment('ADMOB_BANNER_UNIT_ID'),
      'ADMOB_REWARDED_UNIT_ID' => const String.fromEnvironment('ADMOB_REWARDED_UNIT_ID'),
      'ADS_ENABLED' => const String.fromEnvironment('ADS_ENABLED'),
      'PEXELS_API_KEY' => const String.fromEnvironment('PEXELS_API_KEY'),
      'BOSCH_BACKEND_URL' => const String.fromEnvironment('BOSCH_BACKEND_URL'),
      'BOSCH_API_HOST' => const String.fromEnvironment('BOSCH_API_HOST'),
      _ => '',
    };
    return _clean(value);
  }

  static String? _fromDotEnv(String key) {
    try {
      return _clean(dotenv.env[key]);
    } catch (_) {
      // dotenv may be unavailable in tests/CI when not loaded.
      return null;
    }
  }

  static String? _rawValue(String key) => _fromDefine(key) ?? _fromDotEnv(key);

  /// Gemini key for optional direct (non-proxy) development only.
  static String? get clientGeminiApiKey {
    if (!_clientGeminiKeyAllowed) return null;
    return _rawValue(geminiApiKey);
  }

  /// Resolves the AI backend proxy URL from an explicit define/env value, or
  /// auto-derives `{SUPABASE_URL}/functions/v1/ai-proxy` when Supabase is set.
  static String? get aiBackendProxyUrl {
    final explicit = _rawValue(aiBackendProxyUrlKey);
    if (explicit != null) return explicit;
    return _deriveProxyUrlFromSupabase(_rawValue(supabaseUrlKey));
  }

  @visibleForTesting
  static String? deriveProxyUrlFromSupabase(String? supabaseUrl) =>
      _deriveProxyUrlFromSupabase(supabaseUrl);

  static String? _deriveProxyUrlFromSupabase(String? supabaseUrl) {
    final baseUrl = _clean(supabaseUrl);
    if (baseUrl == null) return null;
    final base = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;
    return '$base/functions/v1/ai-proxy';
  }

  static String? get pexelsApiKey => _rawValue('PEXELS_API_KEY');

  /// Node OAuth backend base URL, e.g. `http://10.0.2.2:3000` (Android emulator).
  static String? get boschBackendUrl {
    final raw = _rawValue('BOSCH_BACKEND_URL');
    if (raw == null) return null;
    return raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
  }

  static String? value(String key) {
    if (key == geminiApiKey) return clientGeminiApiKey;
    if (key == aiBackendProxyUrlKey) return aiBackendProxyUrl;
    return _rawValue(key);
  }

  /// Removes client-side Gemini secrets from memory after dotenv load.
  static void applySecretPolicy() {
    if (_clientGeminiKeyAllowed) return;
    try {
      dotenv.env.remove(geminiApiKey);
    } catch (_) {
      // dotenv not loaded (tests/CI).
    }
    assert(() {
      if (_fromDefine(geminiApiKey) != null) {
        debugPrint(
          'AppEnv: $geminiApiKey dart-define ignored '
          '(${kReleaseMode ? 'release build' : 'AI_PROXY_REQUIRED=true'}).',
        );
      }
      return true;
    }());
  }
}
