import 'package:cyberchef/core/ai/ai_usage_guard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('daily limit blocks after configured number', () async {
    final now = DateTime.now();
    final today =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
    SharedPreferences.setMockInitialValues({
      'ai_usage_receipt_scan_date': today,
      'ai_usage_receipt_scan_count': AiUsageGuard.receiptScanDailyLimit,
    });

    final blocked = await AiUsageGuard.tryAcquire(AiActionType.receiptScan);
    expect(blocked.allowed, isFalse);
    expect(blocked.dailyLimitReached, isTrue);
  });

  test('cooldown blocks rapid consecutive requests', () async {
    final first = await AiUsageGuard.tryAcquire(AiActionType.pantryScan);
    expect(first.allowed, isTrue);

    final second = await AiUsageGuard.tryAcquire(AiActionType.pantryScan);
    expect(second.allowed, isFalse);
    expect(second.dailyLimitReached, isFalse);
    expect(second.waitSeconds, greaterThan(0));
  });
}
