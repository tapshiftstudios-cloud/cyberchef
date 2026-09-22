import 'dart:io';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

import '../core/ai/ai_reward_credits.dart';
import '../core/ai/ai_usage_guard.dart';
import '../core/config/app_env.dart';
import '../core/l10n/ai_locale_prompts.dart';
import '../core/enums/cuisine_region.dart';
import '../core/enums/app_locale.dart';
import '../core/enums/diet_profile.dart';
import '../core/enums/scan_mode.dart';
import '../core/l10n/app_strings.dart';
import '../core/utils/image_resize.dart';
import '../core/utils/json_parser.dart';
import '../core/utils/receipt_item_filter.dart';
import '../features/pantry/domain/models/receipt_analysis_result.dart';
import '../features/recipes/domain/models/recipe_models.dart';
import 'ai_backend_proxy.dart';
import 'gemini_ingredients_prompt_builder.dart';
import '../core/scan/recipe_mode_processor.dart';
import 'gemini_prompt_builder.dart';
import 'gemini_error_mapper.dart';
import 'gemini_receipt_prompt_builder.dart';

/// Gemini 3 Flash multimodal — pantry vision + structured recipe JSON.
class AiService {
  AiService({
    String? modelId,
    AiBackendProxy? proxy,
  })  : _modelId = modelId ?? defaultModelId,
        _proxy = proxy ?? NoopAiBackendProxy();

  static const String defaultModelId = 'gemini-3-flash-preview';
  static const String fallbackModelId = 'gemini-2.5-flash';
  static const int targetImageSize = 640;
  static const Duration _quotaCooldown = Duration(minutes: 5);
  static DateTime? _cooldownUntil;

  final String _modelId;
  final AiBackendProxy _proxy;

  bool get _isProxyRequired => AppEnv.isAiProxyRequired;

  bool get _canUseDirectGemini => !_isProxyRequired && _apiKey != null;

  String? get _apiKey => AppEnv.clientGeminiApiKey;

  bool get _usesBackendUsageGuard => _proxy.isConfigured;

  bool get isConfigured => _proxy.isConfigured || _canUseDirectGemini;
  bool get isInCooldown =>
      _cooldownUntil != null && DateTime.now().isBefore(_cooldownUntil!);
  Duration get cooldownRemaining {
    if (!isInCooldown) return Duration.zero;
    return _cooldownUntil!.difference(DateTime.now());
  }

  int get cooldownRemainingMinutes {
    final remaining = cooldownRemaining;
    if (remaining <= Duration.zero) return 0;
    return ((remaining.inSeconds + 59) ~/ 60).clamp(1, 999);
  }

  String quotaRetryMessage() {
    final remaining = cooldownRemaining;
    if (remaining <= Duration.zero) {
      return AppStrings.geminiQuotaExceeded;
    }
    if (remaining < const Duration(minutes: 1)) {
      final seconds =
          ((remaining.inMilliseconds + 999) ~/ 1000).clamp(1, 999);
      return '${AppStrings.geminiQuotaExceeded} ${AppStrings.aiActionCooldownSeconds(seconds)}';
    }
    return '${AppStrings.geminiQuotaExceeded} ${AppStrings.aiQuotaRetryInMinutes(cooldownRemainingMinutes)}';
  }

  Future<AiBackendUsageStatus?> fetchBackendUsageStatus() {
    return _proxy.fetchUsageStatus();
  }

  Future<bool> claimRewardCredit(AiActionType action) async {
    if (_proxy.isConfigured) {
      return _proxy.claimRewardCredit(action: action.serverName);
    }
    return AiRewardCredits.grant(action);
  }

  Future<bool> activateProTier({
    required String source,
    required String platform,
    required String productId,
    String? packageName,
    String? purchaseToken,
    String? purchaseId,
  }) {
    return _proxy.activateProTier(
      source: source,
      platform: platform,
      productId: productId,
      packageName: packageName,
      purchaseToken: purchaseToken,
      purchaseId: purchaseId,
    );
  }

  AiServiceException _quotaException() {
    return AiServiceException(
      AppStrings.geminiQuotaExceeded,
      type: AiErrorType.quota,
    );
  }

  void _enterQuotaCooldown() {
    _cooldownUntil = DateTime.now().add(_quotaCooldown);
  }

  static bool _isBillingDepletedMessage(String? message) {
    final lower = message?.toLowerCase() ?? '';
    return lower.contains('credit') ||
        lower.contains('billing') ||
        lower.contains('prepay');
  }

  Never _throwGeminiQuotaFailure(String? serverMessage) {
    if (_isBillingDepletedMessage(serverMessage)) {
      throw AiServiceException(
        AppStrings.geminiBillingDepleted,
        type: AiErrorType.billingDepleted,
      );
    }
    _enterQuotaCooldown();
    throw AiServiceException(
      serverMessage ?? AppStrings.geminiQuotaExceeded,
      type: AiErrorType.quota,
    );
  }

  @visibleForTesting
  static void setQuotaCooldownUntilForTesting(DateTime? until) {
    _cooldownUntil = until;
  }

  void _trackQuotaIfNeeded(Object error) {
    final mapped = GeminiErrorMapper.fromAny(
      error,
      fallbackMessage: AppStrings.genericError,
      fallbackType: AiErrorType.unknown,
    );
    if (mapped.type == AiErrorType.quota) {
      _enterQuotaCooldown();
    }
  }

  Future<void> _enforceUsage(AiActionType action) async {
    if (_usesBackendUsageGuard) return;
    final decision = await AiUsageGuard.tryAcquire(action);
    if (decision.allowed) return;
    if (decision.dailyLimitReached) {
      final message = switch (action) {
        AiActionType.pantryScan => AppStrings.aiPantryScanDailyLimitReached,
        AiActionType.receiptScan => AppStrings.aiReceiptDailyLimitReached,
        AiActionType.recipeFromIngredients => AppStrings.aiRecipeDailyLimitReached,
      };
      throw AiServiceException(
        message,
        type: AiErrorType.rateLimited,
        dailyLimitReached: true,
      );
    }
    throw AiServiceException(
      AppStrings.aiActionCooldownSeconds(decision.waitSeconds),
      type: AiErrorType.rateLimited,
    );
  }

  Never _throwProxyFailure(
    AiProxyFailure failure, {
    required AiActionType action,
  }) {
    if (failure.statusCode == 429) {
      if (failure.errorCode == 'daily_limit') {
        final message = switch (action) {
          AiActionType.pantryScan => AppStrings.aiPantryScanDailyLimitReached,
          AiActionType.receiptScan => AppStrings.aiReceiptDailyLimitReached,
          AiActionType.recipeFromIngredients =>
            AppStrings.aiRecipeDailyLimitReached,
        };
        throw AiServiceException(
          message,
          type: AiErrorType.rateLimited,
          dailyLimitReached: true,
        );
      }
      if (failure.errorCode == 'cooldown' && failure.waitSeconds > 0) {
        throw AiServiceException(
          AppStrings.aiActionCooldownSeconds(failure.waitSeconds),
          type: AiErrorType.rateLimited,
        );
      }
      if (failure.errorCode == 'gemini_quota_exceeded') {
        _throwGeminiQuotaFailure(failure.message);
      }
      throw AiServiceException(
        failure.message ?? AppStrings.geminiQuotaExceeded,
        type: AiErrorType.rateLimited,
      );
    }
    if (failure.errorCode == 'gemini_key_missing') {
      throw AiServiceException(
        AppStrings.geminiKeyMissing,
        type: AiErrorType.configuration,
      );
    }
    if (failure.errorCode == 'gemini_failed' ||
        failure.errorCode == 'invalid_model_response') {
      throw AiServiceException(
        failure.message ?? AppStrings.geminiServerError,
        type: AiErrorType.server,
      );
    }
    if (failure.errorCode == 'gemini_quota_exceeded') {
      _throwGeminiQuotaFailure(failure.message);
    }
    throw AiServiceException(
      failure.message ?? AppStrings.geminiServerError,
      type: AiErrorType.server,
    );
  }

  /// Tarif metnini hedef dilde doğal hale çevirir (JSON döner).
  Future<Recipe> translateRecipe({
    required Recipe recipe,
    required AppLocale targetLocale,
  }) async {
    if (isInCooldown) return recipe;
    final proxied = await _proxy.translateRecipe(
      recipe: recipe,
      targetLocale: targetLocale,
    );
    if (proxied != null) return proxied;
    if (!_canUseDirectGemini) return recipe;

    final targetLang = AiLocalePrompts.languageName(targetLocale);
    final difficultyValues = AiLocalePrompts.difficultyValues(targetLocale);

    final model = GenerativeModel(
      model: _modelId,
      apiKey: _apiKey!,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        temperature: 0.1,
      ),
    );

    try {
      final response = await model.generateContent([
        Content.text('''
You are a recipe localization assistant.
Translate/adapt this recipe to natural $targetLang.

Return ONLY valid JSON with this exact schema:
{
  "title": "string",
  "cookTime": "string",
  "difficulty": "$difficultyValues",
  "instructions": ["string"],
  "nutrition": {
    "calories": 320,
    "protein_g": 18,
    "carbs_g": 35,
    "fat_g": 12,
    "servings": 2
  }
}

Rules:
- Keep cooking intent and order the same.
- Keep ingredient meaning; do not invent ingredients.
- Translate all visible text fully to $targetLang.
- difficulty must be exactly one of: $difficultyValues.

INPUT JSON:
${jsonEncode(recipe.toJson())}
'''),
      ]);

      final text = response.text?.trim();
      if (text == null || text.isEmpty) return recipe;
      final json = parseGeminiJson(text);
      return Recipe.fromJson(json);
    } catch (e) {
      _trackQuotaIfNeeded(e);
      return recipe;
    }
  }

  /// Tüm sonuç setini (ingredients + recipes) hedef dile doğal biçimde yerelleştirir.
  Future<PantryAnalysisResult> localizePantryAnalysisResult({
    required PantryAnalysisResult result,
    required AppLocale targetLocale,
  }) async {
    if (isInCooldown) return result;
    final proxied = await _proxy.localizePantryAnalysisResult(
      result: result,
      targetLocale: targetLocale,
    );
    if (proxied != null) return proxied;
    if (!_canUseDirectGemini) return result;

    final targetLang = AiLocalePrompts.languageName(targetLocale);
    final difficultyValues = AiLocalePrompts.difficultyValues(targetLocale);

    final model = GenerativeModel(
      model: _modelId,
      apiKey: _apiKey!,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        temperature: 0.1,
      ),
    );

    try {
      final response = await model.generateContent([
        Content.text('''
You are a recipe localization assistant.
Rewrite this full pantry result into natural $targetLang.

Return ONLY valid JSON with this schema:
{
  "ingredients": ["string"],
  "recipes": [
    {
      "title": "string",
      "cookTime": "string",
      "difficulty": "$difficultyValues",
      "instructions": ["string"],
      "nutrition": {
        "calories": 320,
        "protein_g": 18,
        "carbs_g": 35,
        "fat_g": 12,
        "servings": 2
      }
    }
  ]
}

Rules:
- Keep cooking intent and ingredient meaning.
- Do not invent new ingredients.
- Translate ALL visible text to $targetLang.
- Keep recipe count and step counts the same.
- difficulty must be one of: $difficultyValues.

INPUT JSON:
${jsonEncode(result.toJson())}
'''),
      ]);

      final text = response.text?.trim();
      if (text == null || text.isEmpty) return result;
      final json = parseGeminiJson(text);
      final localized = PantryAnalysisResult.fromJson(json);
      if (localized.recipes.isEmpty) return result;
      return localized;
    } catch (e) {
      _trackQuotaIfNeeded(e);
      return result;
    }
  }

  /// Fiş görüntüsü — dikey oran korunarak yeniden boyutlandırılır.
  Future<Uint8List> prepareReceiptImage(Uint8List rawBytes) async {
    try {
      return await resizeImageForReceipt(rawBytes);
    } on ImageResizeException catch (e) {
      throw AiServiceException(
        e.message,
        type: AiErrorType.recognition,
        cause: e,
      );
    }
  }

  /// Resize captured image to 640×640 before sending to Gemini.
  Future<Uint8List> prepareImageForAnalysis(Uint8List rawBytes) async {
    try {
      return await resizeImageToSquare(rawBytes, size: targetImageSize);
    } on ImageResizeException catch (e) {
      throw AiServiceException(
        e.message,
        type: AiErrorType.recognition,
        cause: e,
      );
    }
  }

  /// Analyze fridge photo → ingredients + 3 recipes.
  Future<PantryAnalysisResult> analyzePantryImage({
    required Uint8List imageBytes,
    required ScanMode mode,
    String? survivalExpiryHint,
    bool alreadyPrepared = false,
    DietProfile diet = DietProfile.none,
    AppLocale locale = AppLocale.tr,
    CuisineRegion cuisineRegion = CuisineRegion.turkish,
  }) async {
    if (!isConfigured) {
      throw AiServiceException(
        AppStrings.geminiKeyMissing,
        type: AiErrorType.configuration,
      );
    }
    if (isInCooldown) throw _quotaException();
    await _enforceUsage(AiActionType.pantryScan);

    final prepared = alreadyPrepared
        ? imageBytes
        : await prepareImageForAnalysis(imageBytes);

    try {
      final proxied = await _proxy.analyzePantryImage(
        imageBytes: prepared,
        mode: mode,
        diet: diet,
        locale: locale,
        cuisineRegion: cuisineRegion,
        survivalExpiryHint: survivalExpiryHint,
      );
      if (proxied != null) return proxied;

      if (!_canUseDirectGemini) {
        throw AiServiceException(
          AppStrings.geminiServerError,
          type: AiErrorType.server,
        );
      }

      try {
        return await _generateWithModel(
          modelId: _modelId,
          imageBytes: prepared,
          mode: mode,
          survivalExpiryHint: survivalExpiryHint,
          diet: diet,
          locale: locale,
          cuisineRegion: cuisineRegion,
        );
      } on AiServiceException catch (e) {
        if (e.type == AiErrorType.quota) _enterQuotaCooldown();
        if (e.type == AiErrorType.modelUnavailable &&
            _modelId != fallbackModelId) {
          return _generateWithModel(
            modelId: fallbackModelId,
            imageBytes: prepared,
            mode: mode,
            survivalExpiryHint: survivalExpiryHint,
            diet: diet,
            locale: locale,
            cuisineRegion: cuisineRegion,
          );
        }
        rethrow;
      } catch (e) {
        final mapped = GeminiErrorMapper.fromAny(
          e,
          fallbackMessage: AppStrings.imageNotRecognized,
          fallbackType: AiErrorType.recognition,
        );
        if (mapped.type == AiErrorType.quota) _enterQuotaCooldown();
        throw mapped;
      }
    } on AiProxyFailure catch (failure) {
      _throwProxyFailure(failure, action: AiActionType.pantryScan);
    } catch (e) {
      if (!_usesBackendUsageGuard) {
        await AiUsageGuard.rollback(AiActionType.pantryScan);
      }
      rethrow;
    }
  }

  /// Fiş fotoğrafı → OCR + ürün listesi + tahmini raf ömrü (JSON).
  Future<ReceiptAnalysisResult> processReceiptImage(
    File imageFile, {
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  }) async {
    if (!isConfigured) {
      throw AiServiceException(
        AppStrings.geminiKeyMissing,
        type: AiErrorType.configuration,
      );
    }
    if (isInCooldown) throw _quotaException();
    await _enforceUsage(AiActionType.receiptScan);

    final rawBytes = await imageFile.readAsBytes();
    final prepared = await prepareReceiptImage(rawBytes);

    try {
      final proxied = await _proxy.processReceiptImage(
        imageBytes: prepared,
        cuisineRegion: cuisineRegion,
        locale: locale,
      );
      if (proxied != null) return proxied;

      if (!_canUseDirectGemini) {
        throw AiServiceException(
          AppStrings.geminiServerError,
          type: AiErrorType.server,
        );
      }

      try {
        return await _generateReceiptWithModel(
          modelId: _modelId,
          imageBytes: prepared,
          attempt: 0,
          cuisineRegion: cuisineRegion,
          locale: locale,
        );
      } on AiServiceException catch (e) {
        if (e.type == AiErrorType.quota) _enterQuotaCooldown();
        if (e.type == AiErrorType.modelUnavailable &&
            _modelId != fallbackModelId) {
          return _generateReceiptWithModel(
            modelId: fallbackModelId,
            imageBytes: prepared,
            attempt: 0,
            cuisineRegion: cuisineRegion,
            locale: locale,
          );
        }
        rethrow;
      } catch (e) {
        final mapped = GeminiErrorMapper.fromAny(
          e,
          fallbackMessage: AppStrings.receiptNotRecognized,
          fallbackType: AiErrorType.recognition,
        );
        if (mapped.type == AiErrorType.quota) _enterQuotaCooldown();
        throw mapped;
      }
    } on AiProxyFailure catch (failure) {
      _throwProxyFailure(failure, action: AiActionType.receiptScan);
    } catch (e) {
      if (!_usesBackendUsageGuard) {
        await AiUsageGuard.rollback(AiActionType.receiptScan);
      }
      rethrow;
    }
  }

  /// Tazelik envanterindeki malzemelerden tarif üretir (görüntüsüz).
  Future<PantryAnalysisResult> generateRecipesFromIngredients({
    required List<String> ingredients,
    ScanMode mode = ScanMode.survival,
    DietProfile diet = DietProfile.none,
    AppLocale locale = AppLocale.tr,
    CuisineRegion cuisineRegion = CuisineRegion.turkish,
  }) async {
    if (!isConfigured) {
      throw AiServiceException(
        AppStrings.geminiKeyMissing,
        type: AiErrorType.configuration,
      );
    }
    if (isInCooldown) throw _quotaException();
    await _enforceUsage(AiActionType.recipeFromIngredients);
    if (ingredients.isEmpty) {
      throw AiServiceException(
        AppStrings.freshnessNoIngredientsForRecipes,
        type: AiErrorType.recognition,
      );
    }

    try {
      final proxied = await _proxy.generateRecipesFromIngredients(
        ingredients: ingredients,
        mode: mode,
        diet: diet,
        locale: locale,
        cuisineRegion: cuisineRegion,
      );
      if (proxied != null) return proxied;

      if (!_canUseDirectGemini) {
        throw AiServiceException(
          AppStrings.geminiServerError,
          type: AiErrorType.server,
        );
      }

      try {
        return await _generateRecipesFromIngredientsModel(
          modelId: _modelId,
          ingredients: ingredients,
          mode: mode,
          diet: diet,
          locale: locale,
          cuisineRegion: cuisineRegion,
        );
      } on AiServiceException catch (e) {
        if (e.type == AiErrorType.quota) _enterQuotaCooldown();
        if (e.type == AiErrorType.modelUnavailable &&
            _modelId != fallbackModelId) {
          return _generateRecipesFromIngredientsModel(
            modelId: fallbackModelId,
            ingredients: ingredients,
            mode: mode,
            diet: diet,
            locale: locale,
            cuisineRegion: cuisineRegion,
          );
        }
        rethrow;
      }
    } on AiProxyFailure catch (failure) {
      _throwProxyFailure(failure, action: AiActionType.recipeFromIngredients);
    } catch (e) {
      if (!_usesBackendUsageGuard) {
        await AiUsageGuard.rollback(AiActionType.recipeFromIngredients);
      }
      rethrow;
    }
  }

  Future<PantryAnalysisResult> _generateRecipesFromIngredientsModel({
    required String modelId,
    required List<String> ingredients,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
  }) async {
    final model = GenerativeModel(
      model: modelId,
      apiKey: _apiKey!,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        temperature: mode.geminiTemperature,
      ),
    );

    final GenerateContentResponse response;
    try {
      response = await model.generateContent([
        Content.text(
          GeminiIngredientsPromptBuilder.build(
            ingredients,
            mode,
            diet: diet,
            locale: locale,
            cuisineRegion: cuisineRegion,
          ),
        ),
      ]);
    } on GenerativeAIException catch (e) {
      final mapped = GeminiErrorMapper.fromGenerative(e);
      if (mapped.type == AiErrorType.quota) _enterQuotaCooldown();
      throw mapped;
    }

    final text = response.text?.trim();
    if (text == null || text.isEmpty) {
      throw AiServiceException(
        AppStrings.parseError,
        type: AiErrorType.parsing,
      );
    }

    final json = parseGeminiJson(text);
    final result = PantryAnalysisResult.fromJson(json);
    if (result.recipes.isEmpty) {
      throw AiServiceException(
        AppStrings.parseError,
        type: AiErrorType.parsing,
      );
    }
    return RecipeModeProcessor.apply(result, mode);
  }

  Future<ReceiptAnalysisResult> _generateReceiptWithModel({
    required String modelId,
    required Uint8List imageBytes,
    required int attempt,
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  }) async {
    final model = GenerativeModel(
      model: modelId,
      apiKey: _apiKey!,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        temperature: attempt > 0 ? 0.15 : 0.25,
      ),
    );

    GenerateContentResponse response;
    try {
      response = await model.generateContent([
        Content.multi([
          TextPart(
            GeminiReceiptPromptBuilder.build(
              cuisineRegion: cuisineRegion,
              locale: locale,
            ),
          ),
          DataPart('image/jpeg', imageBytes),
        ]),
      ]);
    } on GenerativeAIException catch (e) {
      final mapped = GeminiErrorMapper.fromGenerative(e);
      if (mapped.type == AiErrorType.quota) _enterQuotaCooldown();
      throw mapped;
    }

    final text = response.text?.trim();
    if (text == null || text.isEmpty) {
      throw AiServiceException(
        AppStrings.receiptNotRecognized,
        type: AiErrorType.recognition,
      );
    }

    try {
      final json = parseGeminiJson(text);
      var result = ReceiptAnalysisResult.fromJson(json);
      final filtered = ReceiptItemFilter.filterFoodItems(result.items);

      result = ReceiptAnalysisResult(
        receiptDetected: result.receiptDetected,
        items: filtered,
        purchaseDate: result.purchaseDate,
        storeName: result.storeName,
      );

      if (!result.receiptDetected || result.items.isEmpty) {
        throw AiServiceException(
          AppStrings.receiptNotDetected,
          type: AiErrorType.recognition,
        );
      }

      return result;
    } on FormatException catch (e) {
      if (attempt < 1) {
        return _generateReceiptWithModel(
          modelId: modelId,
          imageBytes: imageBytes,
          attempt: attempt + 1,
          cuisineRegion: cuisineRegion,
          locale: locale,
        );
      }
      throw AiServiceException(
        AppStrings.parseError,
        type: AiErrorType.parsing,
        cause: e,
      );
    }
  }

  Future<PantryAnalysisResult> _generateWithModel({
    required String modelId,
    required Uint8List imageBytes,
    required ScanMode mode,
    String? survivalExpiryHint,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
  }) async {
    final model = GenerativeModel(
      model: modelId,
      apiKey: _apiKey!,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
        temperature: mode.geminiTemperature,
      ),
    );

    GenerateContentResponse response;
    try {
      response = await model.generateContent([
        Content.multi([
          TextPart(
            GeminiPromptBuilder.build(
              mode,
              survivalExpiryHint: survivalExpiryHint,
              diet: diet,
              locale: locale,
              cuisineRegion: cuisineRegion,
            ),
          ),
          DataPart('image/jpeg', imageBytes),
        ]),
      ]);
    } on GenerativeAIException catch (e) {
      final mapped = GeminiErrorMapper.fromGenerative(e);
      if (mapped.type == AiErrorType.quota) _enterQuotaCooldown();
      throw mapped;
    }

    final text = response.text?.trim();
    if (text == null || text.isEmpty) {
      throw AiServiceException(
        AppStrings.imageNotRecognized,
        type: AiErrorType.recognition,
      );
    }

    try {
      final json = parseGeminiJson(text);
      final result = PantryAnalysisResult.fromJson(json);

      if (result.ingredients.isEmpty && result.recipes.isEmpty) {
        throw AiServiceException(
          AppStrings.imageNotPantry,
          type: AiErrorType.recognition,
        );
      }

      return RecipeModeProcessor.apply(result, mode);
    } on FormatException catch (e) {
      throw AiServiceException(
        AppStrings.parseError,
        type: AiErrorType.parsing,
        cause: e,
      );
    }
  }

}

enum AiErrorType {
  configuration,
  network,
  quota,
  billingDepleted,
  rateLimited,
  timeout,
  server,
  recognition,
  parsing,
  modelUnavailable,
  unknown,
}

class AiServiceException implements Exception {
  AiServiceException(
    this.message, {
    this.type = AiErrorType.unknown,
    this.cause,
    this.dailyLimitReached = false,
  });

  final String message;
  final AiErrorType type;
  final Object? cause;
  final bool dailyLimitReached;

  @override
  String toString() => message;
}
