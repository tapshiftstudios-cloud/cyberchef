import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/core/l10n/l10n_format.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('L10nFormat TR', () {
    setUp(() => AppStrings.useLocale(AppLocale.tr));

    test('formatDaysLabel', () {
      expect(L10nFormat.formatDaysLabel(-1), 'Süresi geçti');
      expect(L10nFormat.formatDaysLabel(0), 'Bugün');
      expect(L10nFormat.formatDaysLabel(1), 'Yarın');
      expect(L10nFormat.formatDaysLabel(5), '5 gün');
    });

    test('monthShort uses Turkish abbreviations', () {
      expect(L10nFormat.monthShort(3), 'Mar');
      expect(L10nFormat.formatExpiryDate(DateTime(2026, 5, 10)), '10 May 2026');
    });

    test('localizeCategory maps Dairy', () {
      expect(L10nFormat.localizeCategory('Dairy'), 'Süt ürünleri');
    });
  });

  group('L10nFormat EN', () {
    setUp(() => AppStrings.useLocale(AppLocale.en));

    test('formatDaysLabel', () {
      expect(L10nFormat.formatDaysLabel(0), 'Today');
      expect(L10nFormat.formatDaysLabel(3), '3 days');
    });

    test('monthShort uses English abbreviations', () {
      expect(L10nFormat.formatExpiryDate(DateTime(2026, 5, 10)), '10 May 2026');
    });

    test('localizeCategory maps Meat', () {
      expect(L10nFormat.localizeCategory('Meat'), 'Meat / fish');
    });
  });
}
