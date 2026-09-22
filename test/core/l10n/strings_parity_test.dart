import 'dart:io';

import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/l10n/strings_en.dart';
import 'package:cyberchef/core/l10n/strings_registry.dart';
import 'package:cyberchef/core/l10n/strings_tr.dart';
import 'package:flutter_test/flutter_test.dart';

/// UTF-8 text misread as Latin-1 and saved again (common PowerShell mistake).
/// Avoids Nordic `Å`/`å`, which are valid in da/sv/fi copy.
final _mojibakePattern = RegExp(r'Ã[\x80-\xBF]|â€|Ãƒ|Ã¢|ÄÞ');

void main() {
  test('quota retry message exists in both locales', () {
    const tr = StringsTr();
    const en = StringsEn();

    expect(tr.aiQuotaRetryInMinutes(5), contains('5'));
    expect(en.aiQuotaRetryInMinutes(5), contains('5'));
    expect(tr.aiQuotaRetryInMinutes(5).trim(), isNotEmpty);
    expect(en.aiQuotaRetryInMinutes(5).trim(), isNotEmpty);
  });

  test('AI usage guard strings exist in both locales', () {
    const tr = StringsTr();
    const en = StringsEn();

    expect(tr.aiPantryScanDailyLimitReached.trim(), isNotEmpty);
    expect(en.aiPantryScanDailyLimitReached.trim(), isNotEmpty);
    expect(tr.aiReceiptDailyLimitReached.trim(), isNotEmpty);
    expect(en.aiReceiptDailyLimitReached.trim(), isNotEmpty);
    expect(tr.aiRecipeDailyLimitReached.trim(), isNotEmpty);
    expect(en.aiRecipeDailyLimitReached.trim(), isNotEmpty);
    expect(tr.aiActionCooldownSeconds(5), contains('5'));
    expect(en.aiActionCooldownSeconds(5), contains('5'));
  });

  test('core AI error strings are non-empty in both locales', () {
    const tr = StringsTr();
    const en = StringsEn();

    final trValues = [
      tr.geminiKeyMissing,
      tr.networkError,
      tr.geminiQuotaExceeded,
      tr.geminiTimeout,
      tr.geminiServerError,
      tr.genericError,
    ];
    final enValues = [
      en.geminiKeyMissing,
      en.networkError,
      en.geminiQuotaExceeded,
      en.geminiTimeout,
      en.geminiServerError,
      en.genericError,
    ];

    for (final value in [...trValues, ...enValues]) {
      expect(value.trim(), isNotEmpty);
    }
  });

  test('locale dart files are UTF-8 without mojibake', () {
    final l10nDir = Directory('lib/core/l10n');
    expect(l10nDir.existsSync(), isTrue);

    for (final file in l10nDir
        .listSync()
        .whereType<File>()
        .where((f) => RegExp(r'strings_[a-z]{2}\.dart$').hasMatch(f.path))) {
      if (file.path.endsWith('strings_en.dart') ||
          file.path.endsWith('strings_tr.dart')) {
        continue;
      }
      final content = file.readAsStringSync();
      expect(
        _mojibakePattern.hasMatch(content),
        isFalse,
        reason: '${file.path} contains mojibake — regenerate with '
            'tool/repair_l10n_from_cache.py',
      );
    }
  });

  test('monetization strings are localized outside English', () {
    const en = StringsEn();
    final englishRefs = [
      en.storeUnavailable,
      en.proProductIdsNotConfigured,
      en.noProProductsFound,
      en.purchaseFlowFailed,
      en.purchaseFailed,
      en.restorePurchases,
      en.restorePurchasesStarted,
      en.manageSubscriptions,
      en.emptyStateScanReceipt,
      en.emptyStateStartScan,
    ];

    for (final locale in AppLocale.values) {
      if (locale == AppLocale.en) continue;
      final strings = stringsForLocale(locale);
      final localized = [
        strings.storeUnavailable,
        strings.proProductIdsNotConfigured,
        strings.noProProductsFound,
        strings.purchaseFlowFailed,
        strings.purchaseFailed,
        strings.restorePurchases,
        strings.restorePurchasesStarted,
        strings.manageSubscriptions,
        strings.emptyStateScanReceipt,
        strings.emptyStateStartScan,
      ];

      for (var i = 0; i < localized.length; i++) {
        expect(localized[i].trim(), isNotEmpty, reason: locale.code);
        expect(
          localized[i],
          isNot(equals(englishRefs[i])),
          reason: '${locale.code} still uses English for index $i',
        );
      }
    }
  });
}
