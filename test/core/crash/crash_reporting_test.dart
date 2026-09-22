import 'package:cyberchef/core/crash/crash_reporting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CrashReporting.resolveDsn', () {
    test('returns null when key missing or empty', () {
      expect(CrashReporting.resolveDsn({}), isNull);
      expect(
        CrashReporting.resolveDsn({CrashReporting.envDsnKey: ''}),
        isNull,
      );
      expect(
        CrashReporting.resolveDsn({CrashReporting.envDsnKey: '   '}),
        isNull,
      );
    });

    test('returns null for invalid DSN shape', () {
      expect(
        CrashReporting.resolveDsn({CrashReporting.envDsnKey: 'not-a-dsn'}),
        isNull,
      );
    });

    test('returns trimmed DSN when valid', () {
      const dsn = 'https://abc@o123.ingest.sentry.io/456';
      expect(
        CrashReporting.resolveDsn({CrashReporting.envDsnKey: '  $dsn  '}),
        dsn,
      );
    });
  });

  group('CrashReporting.captureException', () {
    test('no-ops when Sentry is not initialized', () async {
      await expectLater(
        CrashReporting.captureException(Exception('test')),
        completes,
      );
    });
  });
}
