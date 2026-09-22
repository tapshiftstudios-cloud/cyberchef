import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/features/pantry/domain/models/pantry_item.dart';
import 'package:cyberchef/features/savings/data/waste_savings_storage.dart';
import 'package:cyberchef/features/savings/domain/savings_currency.dart';
import 'package:cyberchef/features/savings/domain/waste_savings_estimator.dart';
import 'package:cyberchef/features/savings/domain/waste_savings_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    await WasteSavingsStorage.clear();
  });

  test('buildSummary aggregates current month', () async {
    final item = PantryItem(
      id: 'a',
      cleanName: 'Yoğurt',
      category: 'Dairy',
      purchaseDate: DateTime.now().subtract(const Duration(days: 4)),
      estimatedExpiryDays: 6,
    );

    await WasteSavingsService.recordIfRescued(item, locale: AppLocale.tr);

    final summary = await WasteSavingsService.buildSummary(locale: AppLocale.tr);

    expect(summary.itemsRescuedThisMonth, 1);
    expect(summary.totalKgThisMonth, greaterThan(0));
    expect(summary.totalMoneyThisMonth, greaterThan(0));
    expect(summary.weeklyTrend, hasLength(4));
    expect(summary.recentEvents, hasLength(1));
    expect(
      summary.totalMoneyThisMonth,
      closeTo(
        WasteSavingsEstimator.sumDisplayMoney(
          summary.recentEvents,
          AppLocale.tr,
        ),
        0.01,
      ),
    );
  });

  test('buildSummary uses display locale currency for EN', () async {
    final item = PantryItem(
      id: 'b',
      cleanName: 'Yoğurt',
      category: 'Dairy',
      purchaseDate: DateTime.now().subtract(const Duration(days: 4)),
      estimatedExpiryDays: 6,
    );

    await WasteSavingsService.recordIfRescued(item, locale: AppLocale.tr);

    final summary = await WasteSavingsService.buildSummary(locale: AppLocale.en);

    expect(summary.currencyCode, 'USD');
    expect(summary.totalMoneyThisMonth, greaterThan(0));
  });

  test('weekly trend totalMoney sums event display amounts', () async {
    final item = PantryItem(
      id: 'c',
      cleanName: 'Peynir',
      category: 'Dairy',
      purchaseDate: DateTime.now().subtract(const Duration(days: 2)),
      estimatedExpiryDays: 4,
      purchasePrice: 55,
    );

    await WasteSavingsService.recordIfRescued(item, locale: AppLocale.tr);

    final summary = await WasteSavingsService.buildSummary(locale: AppLocale.tr);
    final currentWeek = summary.weeklyTrend.last;

    expect(currentWeek.itemCount, 1);
    expect(currentWeek.totalMoney, closeTo(55, 0.01));
    expect(currentWeek.totalKg, greaterThan(0));
  });

  test('buildSummary currency follows locale', () async {
    final summaryDe =
        await WasteSavingsService.buildSummary(locale: AppLocale.de);
    expect(summaryDe.currencyCode, SavingsCurrency.codeForLocale(AppLocale.de));
  });
}
