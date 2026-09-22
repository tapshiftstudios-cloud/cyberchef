import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import '../core/l10n/app_strings.dart';
import '../core/models/notification_time.dart';
import '../core/storage/user_preferences_storage.dart';
import '../features/pantry/domain/models/pantry_item.dart';

/// Kritik tazelik ürünleri için yerel bildirimler.
class FreshnessNotificationService {
  FreshnessNotificationService._();
  static final FreshnessNotificationService instance =
      FreshnessNotificationService._();

  static const _enabledKey = 'freshness_notifications_enabled';
  static const _lastCriticalNotifyKey = 'freshness_last_critical_notify';
  static const _criticalChannelId = 'freshness_critical';
  static const _dailyChannelId = 'freshness_daily';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized || kIsWeb) return;

    tz_data.initializeTimeZones();
    try {
      tz.setLocalLocation(tz.getLocation('Europe/Istanbul'));
    } catch (_) {
      tz.setLocalLocation(tz.UTC);
    }

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initSettings = InitializationSettings(android: android);
    await _plugin.initialize(initSettings);

    final criticalChannel = AndroidNotificationChannel(
      _criticalChannelId,
      AppStrings.notificationCriticalChannelName,
      description: AppStrings.notificationCriticalChannelDesc,
      importance: Importance.high,
    );
    final dailyChannel = AndroidNotificationChannel(
      _dailyChannelId,
      AppStrings.notificationDailyChannelName,
      description: AppStrings.notificationDailyChannelDesc,
      importance: Importance.defaultImportance,
    );

    final androidPlugin =
        _plugin.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    await androidPlugin?.createNotificationChannel(criticalChannel);
    await androidPlugin?.createNotificationChannel(dailyChannel);

    _initialized = true;
  }

  Future<bool> isEnabled() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_enabledKey) ?? true;
  }

  Future<void> setEnabled(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_enabledKey, value);
    if (!value) {
      await _plugin.cancel(2001);
    } else {
      await scheduleDailyReminder();
    }
  }

  Future<NotificationTime> getReminderTime() =>
      UserPreferencesStorage.loadFreshnessNotificationTime();

  Future<void> setReminderTime(NotificationTime time) async {
    await UserPreferencesStorage.saveFreshnessNotificationTime(time);
    if (await isEnabled()) {
      await _plugin.cancel(2001);
      await scheduleDailyReminder();
    }
  }

  Future<bool> requestPermission() async {
    if (kIsWeb) return false;
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    return await android?.requestNotificationsPermission() ?? true;
  }

  Future<void> notifyCriticalItems(List<PantryItem> items) async {
    if (!_initialized || !await isEnabled()) return;

    final critical = items
        .where((e) => e.urgency == FreshnessUrgency.critical)
        .toList();
    if (critical.isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (prefs.getString(_lastCriticalNotifyKey) == today) return;

    await requestPermission();

    final names = critical.take(3).map((e) => e.cleanName).join(', ');
    final extra = critical.length > 3 ? ' (+${critical.length - 3})' : '';

    await _plugin.show(
      1001,
      AppStrings.notificationCriticalTitle,
      AppStrings.notificationCriticalBody(names, extra),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _criticalChannelId,
          AppStrings.notificationCriticalChannelName,
          channelDescription: AppStrings.notificationCriticalChannelDesc,
          importance: Importance.high,
          priority: Priority.high,
        ),
      ),
    );

    await prefs.setString(_lastCriticalNotifyKey, today);
  }

  Future<void> scheduleDailyReminder() async {
    if (!_initialized || !await isEnabled()) return;
    await requestPermission();

    await _plugin.zonedSchedule(
      2001,
      AppStrings.notificationDailyTitle,
      AppStrings.notificationDailyBody,
      await _nextScheduledTime(),
      NotificationDetails(
        android: AndroidNotificationDetails(
          _dailyChannelId,
          AppStrings.notificationDailyChannelName,
          channelDescription: AppStrings.notificationDailyChannelDesc,
        ),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<tz.TZDateTime> _nextScheduledTime() async {
    final time = await UserPreferencesStorage.loadFreshnessNotificationTime();
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  Future<void> refreshFromItems(List<PantryItem> items) async {
    if (!await isEnabled()) return;
    await notifyCriticalItems(items);
    await scheduleDailyReminder();
  }
}
