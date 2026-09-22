/// Günlük tazelik hatırlatması saati (24 saat).
import '../enums/app_locale.dart';

class NotificationTime {
  const NotificationTime({
    required this.hour,
    required this.minute,
  });

  final int hour;
  final int minute;

  static const defaultTime = NotificationTime(hour: 9, minute: 0);

  NotificationTime clamp() {
    return NotificationTime(
      hour: hour.clamp(0, 23),
      minute: minute.clamp(0, 59),
    );
  }

  String format24() {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String formatForLocale(AppLocale locale) {
    if (locale == AppLocale.en) {
      final hour12 = hour % 12 == 0 ? 12 : hour % 12;
      final mm = minute.toString().padLeft(2, '0');
      final suffix = hour < 12 ? 'AM' : 'PM';
      return '$hour12:$mm $suffix';
    }
    return format24();
  }

  @override
  bool operator ==(Object other) =>
      other is NotificationTime && other.hour == hour && other.minute == minute;

  @override
  int get hashCode => Object.hash(hour, minute);
}
