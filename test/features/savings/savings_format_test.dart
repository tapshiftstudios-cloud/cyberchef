import 'package:cyberchef/features/savings/presentation/utils/savings_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SavingsFormat.money', () {
    test('formats major currencies', () {
      expect(SavingsFormat.money(12.4, 'USD'), '\$12');
      expect(SavingsFormat.money(99, 'EUR'), '99 €');
      expect(SavingsFormat.money(150, 'JPY'), '¥150');
      expect(SavingsFormat.money(42, 'PLN'), '42 zł');
    });
  });
}
