import 'dart:typed_data';

import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/enums/cuisine_region.dart';
import 'package:cyberchef/core/enums/diet_profile.dart';
import 'package:cyberchef/core/enums/scan_mode.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/features/pantry/domain/models/receipt_analysis_result.dart';
import 'package:cyberchef/features/recipes/domain/models/recipe_models.dart';
import 'package:cyberchef/services/ai_backend_proxy.dart';
import 'package:cyberchef/services/ai_service.dart';
import 'package:flutter_test/flutter_test.dart';

final class _QuotaProxy implements AiBackendProxy {
  @override
  bool get isConfigured => true;

  @override
  Future<PantryAnalysisResult?> analyzePantryImage({
    required Uint8List imageBytes,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
    String? survivalExpiryHint,
  }) async {
    throw const AiProxyFailure(
      statusCode: 429,
      errorCode: 'gemini_quota_exceeded',
      message: 'quota exceeded',
    );
  }

  @override
  Future<AiBackendUsageStatus?> fetchUsageStatus() async => null;

  @override
  Future<bool> activateProTier({
    required String source,
    required String platform,
    required String productId,
    String? packageName,
    String? purchaseToken,
    String? purchaseId,
  }) async =>
      false;

  @override
  Future<bool> claimRewardCredit({required String action}) async => false;

  @override
  Future<PantryAnalysisResult?> generateRecipesFromIngredients({
    required List<String> ingredients,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
  }) async =>
      null;

  @override
  Future<PantryAnalysisResult?> localizePantryAnalysisResult({
    required PantryAnalysisResult result,
    required AppLocale targetLocale,
  }) async =>
      null;

  @override
  Future<ReceiptAnalysisResult?> processReceiptImage({
    required Uint8List imageBytes,
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  }) async =>
      null;

  @override
  Future<Recipe?> translateRecipe({
    required Recipe recipe,
    required AppLocale targetLocale,
  }) async =>
      null;
}

void main() {
  setUp(() {
    AppStrings.useLocale(AppLocale.tr);
    AiService.setQuotaCooldownUntilForTesting(null);
  });

  group('AiService.quotaRetryMessage', () {
    test('returns base message only when cooldown is zero', () {
      final ai = AiService();
      final message = ai.quotaRetryMessage();

      expect(message, AppStrings.geminiQuotaExceeded);
      expect(message, isNot(contains('0 dakika')));
      expect(message, isNot(contains('saniye')));
    });

    test('includes minute retry text when cooldown is at least one minute', () {
      AiService.setQuotaCooldownUntilForTesting(
        DateTime.now().add(const Duration(minutes: 5)),
      );
      final ai = AiService();
      final message = ai.quotaRetryMessage();

      expect(message, startsWith(AppStrings.geminiQuotaExceeded));
      expect(message, contains('5 dakika'));
    });

    test('includes second retry text when cooldown is under one minute', () {
      AiService.setQuotaCooldownUntilForTesting(
        DateTime.now().add(const Duration(seconds: 30)),
      );
      final ai = AiService();
      final message = ai.quotaRetryMessage();

      expect(message, startsWith(AppStrings.geminiQuotaExceeded));
      expect(message, contains('30 saniye'));
      expect(message, isNot(contains('0 dakika')));
    });
  });

  test('proxy gemini_quota_exceeded enters cooldown before throwing', () async {
    final ai = AiService(proxy: _QuotaProxy());

    await expectLater(
      ai.analyzePantryImage(
        imageBytes: Uint8List.fromList([1, 2, 3]),
        mode: ScanMode.survival,
        alreadyPrepared: true,
      ),
      throwsA(
        isA<AiServiceException>().having(
          (e) => e.type,
          'type',
          AiErrorType.quota,
        ),
      ),
    );

    expect(ai.isInCooldown, isTrue);
    expect(ai.quotaRetryMessage(), isNot(contains('0 dakika')));
  });

  test('proxy billing depleted does not enter cooldown', () async {
    final billingProxy = _BillingDepletedProxy();
    final ai = AiService(proxy: billingProxy);

    await expectLater(
      ai.analyzePantryImage(
        imageBytes: Uint8List.fromList([1, 2, 3]),
        mode: ScanMode.survival,
        alreadyPrepared: true,
      ),
      throwsA(
        isA<AiServiceException>()
            .having((e) => e.type, 'type', AiErrorType.billingDepleted)
            .having((e) => e.message, 'message', AppStrings.geminiBillingDepleted),
      ),
    );

    expect(ai.isInCooldown, isFalse);
  });
}

final class _BillingDepletedProxy extends _QuotaProxy {
  @override
  Future<PantryAnalysisResult?> analyzePantryImage({
    required Uint8List imageBytes,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
    String? survivalExpiryHint,
  }) async {
    throw const AiProxyFailure(
      statusCode: 429,
      errorCode: 'gemini_quota_exceeded',
      message:
          'Your prepayment credits are depleted. Please go to AI Studio billing.',
    );
  }
}
