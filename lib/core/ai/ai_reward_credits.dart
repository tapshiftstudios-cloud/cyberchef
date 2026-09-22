import 'package:shared_preferences/shared_preferences.dart';

import 'ai_usage_guard.dart';

/// Yerel (proxy kapalı) modda ödüllü reklam kredileri.
abstract final class AiRewardCredits {
  static const int maxEarnedPerDay = 3;

  static String _todayKey() {
    final now = DateTime.now();
    return '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}';
  }

  static String _remainingKey(AiActionType type) =>
      'ai_reward_remaining_${type.name}';

  static String _earnedKey(AiActionType type) => 'ai_reward_earned_${type.name}';

  static String _dateKey(AiActionType type) => 'ai_reward_date_${type.name}';

  static Future<void> _ensureToday(
    SharedPreferences prefs,
    AiActionType type,
  ) async {
    final today = _todayKey();
    if (prefs.getString(_dateKey(type)) != today) {
      await prefs.setString(_dateKey(type), today);
      await prefs.setInt(_remainingKey(type), 0);
      await prefs.setInt(_earnedKey(type), 0);
    }
  }

  static Future<int> remaining(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    await _ensureToday(prefs, type);
    return prefs.getInt(_remainingKey(type)) ?? 0;
  }

  static Future<bool> grant(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    await _ensureToday(prefs, type);
    final earned = prefs.getInt(_earnedKey(type)) ?? 0;
    if (earned >= maxEarnedPerDay) return false;
    final balance = prefs.getInt(_remainingKey(type)) ?? 0;
    await prefs.setInt(_earnedKey(type), earned + 1);
    await prefs.setInt(_remainingKey(type), balance + 1);
    return true;
  }

  static Future<bool> consume(AiActionType type) async {
    final prefs = await SharedPreferences.getInstance();
    await _ensureToday(prefs, type);
    final balance = prefs.getInt(_remainingKey(type)) ?? 0;
    if (balance <= 0) return false;
    await prefs.setInt(_remainingKey(type), balance - 1);
    return true;
  }
}
