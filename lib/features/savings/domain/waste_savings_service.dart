import '../../../core/enums/app_locale.dart';
import '../../pantry/domain/models/pantry_item.dart';
import '../data/waste_savings_storage.dart';
import 'models/waste_savings_event.dart';
import 'savings_currency.dart';
import 'waste_savings_estimator.dart';

abstract final class WasteSavingsService {
  /// Yaklaşan SKT'li ürün tüketildiyse kayıt ekler.
  static Future<WasteSavingsEvent?> recordIfRescued(
    PantryItem item, {
    required AppLocale locale,
  }) async {
    if (!WasteSavingsEstimator.qualifiesForRescue(item)) return null;
    final event = WasteSavingsEstimator.buildEvent(item: item, locale: locale);
    await WasteSavingsStorage.append(event);
    return event;
  }

  static Future<WasteSavingsSummary> buildSummary({
    required AppLocale locale,
    DateTime? now,
  }) async {
    final events = await WasteSavingsStorage.loadAll();
    final clock = now ?? DateTime.now();
    final monthStart = DateTime(clock.year, clock.month);

    final thisMonth = events.where((e) {
      final d = e.rescuedAt;
      return !d.isBefore(monthStart);
    }).toList();

    final currency = SavingsCurrency.codeForLocale(locale);

    var kg = 0.0;
    for (final e in thisMonth) {
      kg += e.estimatedKg;
    }
    final money = WasteSavingsEstimator.sumDisplayMoney(thisMonth, locale);

    final trend = _weeklyTrend(events, clock, locale);

    return WasteSavingsSummary(
      itemsRescuedThisMonth: thisMonth.length,
      totalKgThisMonth: kg,
      totalMoneyThisMonth: money,
      currencyCode: currency,
      weeklyTrend: trend,
      recentEvents: events.take(12).toList(),
      allTimeItems: events.length,
    );
  }

  static List<WasteSavingsWeekBucket> _weeklyTrend(
    List<WasteSavingsEvent> events,
    DateTime now,
    AppLocale locale,
  ) {
    DateTime weekStart(DateTime d) {
      final weekday = d.weekday;
      return DateTime(d.year, d.month, d.day)
          .subtract(Duration(days: weekday - 1));
    }

    final buckets = <DateTime, WasteSavingsWeekBucket>{};
    for (var i = 3; i >= 0; i--) {
      final start = weekStart(now.subtract(Duration(days: i * 7)));
      buckets[start] = WasteSavingsWeekBucket(
        weekStart: start,
        itemCount: 0,
        totalKg: 0,
        totalMoney: 0,
      );
    }

    for (final e in events) {
      final start = weekStart(e.rescuedAt);
      if (!buckets.containsKey(start)) continue;
      final prev = buckets[start]!;
      buckets[start] = WasteSavingsWeekBucket(
        weekStart: start,
        itemCount: prev.itemCount + 1,
        totalKg: prev.totalKg + e.estimatedKg,
        totalMoney: prev.totalMoney +
            WasteSavingsEstimator.displayMoneyForEvent(e, locale),
      );
    }

    final sorted = buckets.keys.toList()..sort();
    return sorted.map((k) => buckets[k]!).toList();
  }
}
