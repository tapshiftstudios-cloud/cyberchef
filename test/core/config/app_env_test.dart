import 'package:cyberchef/core/config/app_env.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppEnv.clientGeminiKeyAllowed', () {
    test('blocks in release builds', () {
      expect(
        AppEnv.clientGeminiKeyAllowed(
          releaseMode: true,
          proxyRequired: false,
        ),
        isFalse,
      );
    });

    test('blocks when AI proxy is required', () {
      expect(
        AppEnv.clientGeminiKeyAllowed(
          releaseMode: false,
          proxyRequired: true,
        ),
        isFalse,
      );
    });

    test('allows debug direct Gemini when proxy is off', () {
      expect(
        AppEnv.clientGeminiKeyAllowed(
          releaseMode: false,
          proxyRequired: false,
        ),
        isTrue,
      );
    });
  });

  group('AppEnv.deriveProxyUrlFromSupabase', () {
    test('returns null when Supabase URL is missing', () {
      expect(AppEnv.deriveProxyUrlFromSupabase(null), isNull);
      expect(AppEnv.deriveProxyUrlFromSupabase(''), isNull);
    });

    test('derives ai-proxy endpoint from Supabase URL', () {
      expect(
        AppEnv.deriveProxyUrlFromSupabase('https://example.supabase.co'),
        'https://example.supabase.co/functions/v1/ai-proxy',
      );
    });

    test('strips trailing slash before deriving', () {
      expect(
        AppEnv.deriveProxyUrlFromSupabase('https://example.supabase.co/'),
        'https://example.supabase.co/functions/v1/ai-proxy',
      );
    });
  });
}
