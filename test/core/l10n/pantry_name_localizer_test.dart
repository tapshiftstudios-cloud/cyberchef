import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/l10n/pantry_name_localizer.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('localizes common Turkish pantry names in EN', () {
    expect(
      PantryNameLocalizer.productName('Mantar', AppLocale.en),
      'Mushroom',
    );
    expect(
      PantryNameLocalizer.productName('Uno Ekmek', AppLocale.en),
      'Uno bread',
    );
    expect(
      PantryNameLocalizer.productName('Banvit Tavuk', AppLocale.en),
      'Banvit chicken',
    );
    expect(
      PantryNameLocalizer.storeName('Şehir Süpermarketleri', AppLocale.en),
      'City Supermarkets',
    );
  });

  test('keeps original names in TR locale', () {
    expect(
      PantryNameLocalizer.productName('Mantar', AppLocale.tr),
      'Mantar',
    );
  });
}
