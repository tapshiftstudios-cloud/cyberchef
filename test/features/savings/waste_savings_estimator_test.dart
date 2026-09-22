import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/features/pantry/domain/models/pantry_item.dart';
import 'package:cyberchef/features/savings/domain/models/waste_savings_event.dart';
import 'package:cyberchef/features/savings/domain/savings_currency.dart';
import 'package:cyberchef/features/savings/domain/waste_savings_estimator.dart';
import 'package:flutter_test/flutter_test.dart';

PantryItem _item({
  required int daysRemaining,
  String category = 'Dairy',
  double? purchasePrice,
}) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return PantryItem(
    id: '1',
    cleanName: 'Süt',
    category: category,
    purchaseDate: today,
    estimatedExpiryDays: daysRemaining,
    quantity: '1 L',
    purchasePrice: purchasePrice,
  );
}

void main() {
  group('WasteSavingsEstimator', () {
    test('qualifies when 0-5 days remaining', () {
      expect(
        WasteSavingsEstimator.qualifiesForRescue(_item(daysRemaining: 0)),
        isTrue,
      );
      expect(
        WasteSavingsEstimator.qualifiesForRescue(_item(daysRemaining: 5)),
        isTrue,
      );
    });

    test('does not qualify when more than 5 days left', () {
      expect(
        WasteSavingsEstimator.qualifiesForRescue(_item(daysRemaining: 6)),
        isFalse,
      );
    });

    test('buildEvent uses TRY for Turkish locale', () {
      final event = WasteSavingsEstimator.buildEvent(
        item: _item(daysRemaining: 2),
        locale: AppLocale.tr,
      );
      expect(event.currencyCode, 'TRY');
      expect(event.estimatedKg, greaterThan(0));
      expect(event.estimatedMoney, greaterThan(0));
    });

    test('buildEvent uses EUR for German locale', () {
      final event = WasteSavingsEstimator.buildEvent(
        item: _item(daysRemaining: 2),
        locale: AppLocale.de,
      );
      expect(event.currencyCode, 'EUR');
    });

    test('parses kg from quantity string', () {
      final item = PantryItem(
        id: '2',
        cleanName: 'Domates',
        category: 'Vegetable',
        purchaseDate: DateTime.now(),
        estimatedExpiryDays: 3,
        quantity: '1.2 kg',
      );
      final event = WasteSavingsEstimator.buildEvent(
        item: item,
        locale: AppLocale.en,
      );
      expect(event.estimatedKg, closeTo(1.2, 0.01));
      expect(event.currencyCode, 'USD');
    });

    test('uses category aware pricing for both locales', () {
      final item = PantryItem(
        id: '3',
        cleanName: 'Banvit Tavuk',
        category: 'Meat',
        purchaseDate: DateTime.now(),
        estimatedExpiryDays: 2,
        quantity: '500 g',
      );

      final enEvent = WasteSavingsEstimator.buildEvent(
        item: item,
        locale: AppLocale.en,
      );
      final trEvent = WasteSavingsEstimator.buildEvent(
        item: item,
        locale: AppLocale.tr,
      );

      expect(enEvent.estimatedMoney, closeTo(12.1, 0.3));
      expect(trEvent.estimatedMoney, closeTo(236.5, 3.0));
    });

    test('uses receipt purchasePrice when available', () {
      final event = WasteSavingsEstimator.buildEvent(
        item: _item(daysRemaining: 2, purchasePrice: 89.90),
        locale: AppLocale.tr,
      );
      expect(event.estimatedMoney, closeTo(89.90, 0.01));
    });

    test('Frozen and Other categories have defaults', () {
      final frozen = WasteSavingsEstimator.buildEvent(
        item: _item(daysRemaining: 1, category: 'Frozen'),
        locale: AppLocale.en,
      );
      final other = WasteSavingsEstimator.buildEvent(
        item: _item(daysRemaining: 1, category: 'Other'),
        locale: AppLocale.en,
      );
      expect(frozen.estimatedKg, greaterThan(0));
      expect(other.estimatedKg, greaterThan(0));
      expect(frozen.estimatedMoney, greaterThan(0));
      expect(other.estimatedMoney, greaterThan(0));
    });
  });

  group('displayMoneyForEvent', () {
    late WasteSavingsEvent event;

    setUp(() {
      event = WasteSavingsEvent(
        id: 'x',
        itemName: 'Süt',
        category: 'Dairy',
        rescuedAt: DateTime(2026, 6, 1),
        daysRemainingAtRescue: 2,
        estimatedKg: 1.0,
        estimatedMoney: 42.0,
        currencyCode: 'TRY',
      );
    });

    test('returns stored money when locale currency matches', () {
      expect(
        WasteSavingsEstimator.displayMoneyForEvent(event, AppLocale.tr),
        42.0,
      );
    });

    test('recalculates when locale currency differs', () {
      final usd = WasteSavingsEstimator.displayMoneyForEvent(
        event,
        AppLocale.en,
      );
      expect(usd, isNot(42.0));
      expect(usd, greaterThan(0));
    });
  });

  group('sumDisplayMoney', () {
    test('sums per-event display amounts', () {
      final events = [
        WasteSavingsEstimator.buildEvent(
          item: _item(daysRemaining: 2, purchasePrice: 30),
          locale: AppLocale.tr,
        ),
        WasteSavingsEstimator.buildEvent(
          item: _item(daysRemaining: 1, purchasePrice: 45),
          locale: AppLocale.tr,
        ),
      ];
      expect(
        WasteSavingsEstimator.sumDisplayMoney(events, AppLocale.tr),
        closeTo(75, 0.01),
      );
    });
  });

  group('SavingsCurrency', () {
    test('maps locales to expected currencies', () {
      expect(SavingsCurrency.codeForLocale(AppLocale.tr), 'TRY');
      expect(SavingsCurrency.codeForLocale(AppLocale.en), 'USD');
      expect(SavingsCurrency.codeForLocale(AppLocale.de), 'EUR');
      expect(SavingsCurrency.codeForLocale(AppLocale.fr), 'EUR');
      expect(SavingsCurrency.codeForLocale(AppLocale.pl), 'PLN');
      expect(SavingsCurrency.codeForLocale(AppLocale.ja), 'JPY');
    });
  });
}
