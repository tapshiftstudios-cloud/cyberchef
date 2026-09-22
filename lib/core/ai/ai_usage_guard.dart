import 'package:shared_preferences/shared_preferences.dart';

import 'ai_reward_credit_use.dart';
import 'ai_reward_credits.dart';

enum AiActionType {
  pantryScan,
  receiptScan,
  recipeFromIngredients,
}

extension AiActionTypeX on AiActionType {
  String get serverName => switch (this) {
        AiActionType.pantryScan => 'pantry_scan',
        AiActionType.receiptScan => 'receipt_scan',
        AiActionType.recipeFromIngredients => 'recipe_from_ingredients',
      };
}

final class AiUsageDecision {
  const AiUsageDecision._({
    required this.allowed,
    this.waitSeconds = 0,
    this.dailyLimitReached = false,
  });

  final bool allowed;
  final int waitSeconds;
  final bool dailyLimitReached;

  factory AiUsageDecision.allow() => const AiUsageDecision._(allowed: true);

  factory AiUsageDecision.cooldown(int seconds) => AiUsageDecision._(
        allowed: false,
        waitSeconds: seconds,
      );

  factory AiUsageDecision.dailyLimit() => const AiUsageDecision._(
        allowed: false,
        dailyLimitReached: true,
      );
}

/// Prevents abusive repeated AI usage with daily limits + short cooldowns.
abstract final class AiUsageGuard {
  static const int pantryScanDailyLimit = 3;
  static const int receiptScanDailyLimit = 2;
  static const int recipeFromIngredientsDailyLimit = 3;

  static const int proPantryScanDailyLimit = 30;
  static const int proReceiptScanDailyLimit = 15;
  static const int proRecipeFromIngredientsDailyLimit = 30;
  static const Duration actionCooldown = Duration(seconds: 10);

  static String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  static String _prefix(AiActionType type) => switch (type) {
        AiActionType.pantryScan => 'ai_usage_pantry_scan',
        AiActionType.receiptScan => 'ai_usage_receipt_scan',
        AiActionType.recipeFromIngredients => 'ai_usage_recipe_from_ingredients',
      };

  static int _dailyLimit(AiActionType type) => switch (type) {
        AiActionType.pantryScan => pantryScanDailyLimit,
        AiActionType.receiptScan => receiptScanDailyLimit,
        AiActionType.recipeFromIngredients => recipeFromIngredientsDailyLimit,
      };

  static Future<void> _ensureToday(
    SharedPreferences prefs,
    String prefix,
  ) async {
    final dayKey = '${prefix}_date';
    final countKey = '${prefix}_count';
    final today = _todayKey();
    if (prefs.getString(dayKey) != today) {
      await prefs.setString(dayKey, today);
      await prefs.setInt(countKey, 0);
    }
  }

  static Future<AiUsageDecision> tryAcquire(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    final prefix = _prefix(type);
    final countKey = '${prefix}_count';
    final lastAtKey = '${prefix}_last_at_ms';
    await _ensureToday(prefs, prefix);

    final nowMs = DateTime.now().millisecondsSinceEpoch;
    final lastAtMs = prefs.getInt(lastAtKey);
    if (lastAtMs != null) {
      final elapsed = nowMs - lastAtMs;
      final remainingMs = actionCooldown.inMilliseconds - elapsed;
      if (remainingMs > 0) {
        final waitSeconds = ((remainingMs + 999) ~/ 1000).clamp(1, 999);
        return AiUsageDecision.cooldown(waitSeconds);
      }
    }

    final limit = _dailyLimit(type);
    final count = prefs.getInt(countKey) ?? 0;
    if (count >= limit) {
      if (AiRewardCreditUse.takePending()) {
        final consumed = await AiRewardCredits.consume(type);
        if (consumed) {
          await prefs.setInt(countKey, count + 1);
          await prefs.setInt(lastAtKey, nowMs);
          return AiUsageDecision.allow();
        }
      }
      return AiUsageDecision.dailyLimit();
    }

    await prefs.setInt(countKey, count + 1);
    await prefs.setInt(lastAtKey, nowMs);
    return AiUsageDecision.allow();
  }

  /// Başarısız doğrudan Gemini çağrısından sonra tüketilen kotayı geri verir.
  static Future<void> rollback(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    final prefix = _prefix(type);
    final countKey = '${prefix}_count';
    await _ensureToday(prefs, prefix);
    final count = prefs.getInt(countKey) ?? 0;
    if (count <= 0) return;
    await prefs.setInt(countKey, count - 1);
  }

  static Future<int> remainingToday(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    final prefix = _prefix(type);
    final countKey = '${prefix}_count';
    await _ensureToday(prefs, prefix);
    final used = prefs.getInt(countKey) ?? 0;
    final limit = _dailyLimit(type);
    return (limit - used).clamp(0, limit);
  }

  static Future<Duration> cooldownRemaining(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    final lastAtKey = '${_prefix(type)}_last_at_ms';
    final lastAtMs = prefs.getInt(lastAtKey);
    if (lastAtMs == null) return Duration.zero;
    final elapsed = DateTime.now().millisecondsSinceEpoch - lastAtMs;
    final remainingMs = actionCooldown.inMilliseconds - elapsed;
    if (remainingMs <= 0) return Duration.zero;
    return Duration(milliseconds: remainingMs);
  }
}
