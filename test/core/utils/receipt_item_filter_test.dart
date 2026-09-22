import 'package:cyberchef/core/utils/receipt_item_filter.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../helpers/receipt_fixtures.dart';

void main() {
  group('ReceiptItemFilter', () {
    test('removes total and payment lines', () {
      final items = [
        testReceiptLine(rawName: 'Domates', cleanName: 'domates'),
        testReceiptLine(rawName: 'TOPLAM', cleanName: 'toplam'),
        testReceiptLine(rawName: 'Visa Kart', cleanName: 'visa'),
        testReceiptLine(rawName: 'Yoğurt', cleanName: 'yoğurt'),
      ];

      final filtered = ReceiptItemFilter.filterFoodItems(items);

      expect(filtered, hasLength(2));
      expect(filtered.map((e) => e.cleanName), ['domates', 'yoğurt']);
    });

    test('drops very low confidence other category noise', () {
      final items = [
        testReceiptLine(
          rawName: 'x',
          cleanName: 'ab',
          category: 'Other',
          confidence: 0.2,
        ),
        testReceiptLine(rawName: 'Elma', cleanName: 'elma'),
      ];

      final filtered = ReceiptItemFilter.filterFoodItems(items);

      expect(filtered, hasLength(1));
      expect(filtered.first.cleanName, 'elma');
    });

    test('keeps real food with Turkish receipt noise words excluded', () {
      final items = [
        testReceiptLine(rawName: 'Poşet', cleanName: 'poşet'),
        testReceiptLine(rawName: 'Süt', cleanName: 'süt'),
      ];

      final filtered = ReceiptItemFilter.filterFoodItems(items);

      expect(filtered, hasLength(1));
      expect(filtered.first.rawName, 'Süt');
    });
  });
}
