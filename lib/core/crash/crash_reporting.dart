import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Opsiyonel Sentry crash raporlama — `SENTRY_DSN` yoksa tamamen kapalı.
abstract final class CrashReporting {
  static const envDsnKey = 'SENTRY_DSN';

  /// `.env` veya ortam değişkeninden DSN okur.
  static String? resolveDsn(Map<String, String> env) {
    final raw = env[envDsnKey]?.trim();
    if (raw == null || raw.isEmpty) return null;
    if (!_looksLikeSentryDsn(raw)) return null;
    return raw;
  }

  static bool _looksLikeSentryDsn(String value) {
    return value.startsWith('https://') && value.contains('@');
  }

  static void configure(
    SentryFlutterOptions options, {
    required String dsn,
    required String version,
    required String buildNumber,
  }) {
    options.dsn = dsn;
    options.tracesSampleRate = 0;
    options.attachScreenshot = false;
    options.environment = kReleaseMode ? 'production' : 'development';
    options.release = 'cyberchef@$version+$buildNumber';
    options.beforeSend = (event, hint) {
      if (kDebugMode) return null;
      return event;
    };
  }

  static Future<void> captureException(
    Object exception, {
    StackTrace? stackTrace,
  }) async {
    if (!Sentry.isEnabled) return;
    await Sentry.captureException(
      exception,
      stackTrace: stackTrace,
    );
  }

  static Future<void> captureMessage(String message) async {
    if (!Sentry.isEnabled) return;
    await Sentry.captureMessage(message);
  }
}
