import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../core/ai/ai_reward_credit_use.dart';
import '../core/config/app_env.dart';
import '../core/enums/app_locale.dart';
import '../core/enums/cuisine_region.dart';
import '../core/enums/diet_profile.dart';
import '../core/enums/scan_mode.dart';
import '../features/pantry/domain/models/receipt_analysis_result.dart';
import '../features/recipes/domain/models/recipe_models.dart';

/// Contract for optional backend proxy execution of AI calls.
///
/// Return `null` when proxy is unavailable or returns an unexpected payload.
/// Callers can safely fall back to direct provider calls.
abstract interface class AiBackendProxy {
  bool get isConfigured;
  Future<AiBackendUsageStatus?> fetchUsageStatus();
  Future<bool> activateProTier({
    required String source,
    required String platform,
    required String productId,
    String? packageName,
    String? purchaseToken,
    String? purchaseId,
  });

  Future<bool> claimRewardCredit({required String action});

  Future<PantryAnalysisResult?> analyzePantryImage({
    required Uint8List imageBytes,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
    String? survivalExpiryHint,
  });

  Future<ReceiptAnalysisResult?> processReceiptImage({
    required Uint8List imageBytes,
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  });

  Future<PantryAnalysisResult?> generateRecipesFromIngredients({
    required List<String> ingredients,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
  });

  Future<Recipe?> translateRecipe({
    required Recipe recipe,
    required AppLocale targetLocale,
  });

  Future<PantryAnalysisResult?> localizePantryAnalysisResult({
    required PantryAnalysisResult result,
    required AppLocale targetLocale,
  });
}

final class AiBackendUsageStatus {
  const AiBackendUsageStatus({
    required this.tier,
    required this.pantryRemaining,
    required this.receiptRemaining,
    required this.recipeRemaining,
    required this.cooldownSeconds,
    required this.resetAtIso,
  });

  final String tier;
  final int pantryRemaining;
  final int receiptRemaining;
  final int recipeRemaining;
  final int cooldownSeconds;
  final String resetAtIso;
}

/// Thrown when the backend proxy returns a non-success HTTP status.
final class AiProxyFailure implements Exception {
  const AiProxyFailure({
    required this.statusCode,
    this.errorCode,
    this.message,
    this.waitSeconds = 0,
  });

  final int statusCode;
  final String? errorCode;
  final String? message;
  final int waitSeconds;

  @override
  String toString() =>
      'AiProxyFailure($statusCode, $errorCode, $message, wait=$waitSeconds)';
}

final class NoopAiBackendProxy implements AiBackendProxy {
  @override
  bool get isConfigured => false;

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
  }) async {
    return false;
  }

  @override
  Future<bool> claimRewardCredit({required String action}) async => false;

  @override
  Future<PantryAnalysisResult?> analyzePantryImage({
    required Uint8List imageBytes,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
    String? survivalExpiryHint,
  }) async {
    return null;
  }

  @override
  Future<PantryAnalysisResult?> generateRecipesFromIngredients({
    required List<String> ingredients,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
  }) async {
    return null;
  }

  @override
  Future<PantryAnalysisResult?> localizePantryAnalysisResult({
    required PantryAnalysisResult result,
    required AppLocale targetLocale,
  }) async {
    return null;
  }

  @override
  Future<ReceiptAnalysisResult?> processReceiptImage({
    required Uint8List imageBytes,
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  }) async {
    return null;
  }

  @override
  Future<Recipe?> translateRecipe({
    required Recipe recipe,
    required AppLocale targetLocale,
  }) async {
    return null;
  }
}

/// HTTP-based proxy adapter.
///
/// Expected endpoint contract (JSON):
/// - POST /ai/analyze-pantry
/// - POST /ai/process-receipt
/// - POST /ai/generate-from-ingredients
/// - POST /ai/translate-recipe
/// - POST /ai/localize-pantry
///
/// Each endpoint should return `{ "data": { ... } }`.
final class HttpAiBackendProxy implements AiBackendProxy {
  HttpAiBackendProxy({
    required String baseUrl,
    String? bearerToken,
    Future<String?> Function()? authBearerProvider,
    Future<String> Function()? deviceIdProvider,
    http.Client? client,
  })  : _baseUrl = baseUrl.endsWith('/')
            ? baseUrl.substring(0, baseUrl.length - 1)
            : baseUrl,
        _bearerToken = bearerToken?.trim().isEmpty ?? true
            ? null
            : bearerToken!.trim(),
        _authBearerProvider = authBearerProvider,
        _deviceIdProvider = deviceIdProvider,
        _client = client ?? http.Client();

  final String _baseUrl;
  final String? _bearerToken;
  final Future<String?> Function()? _authBearerProvider;
  final Future<String> Function()? _deviceIdProvider;
  final http.Client _client;

  @override
  bool get isConfigured => _baseUrl.isNotEmpty;

  Future<Map<String, String>> _headers() async {
    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    final anonKey = AppEnv.value('SUPABASE_ANON_KEY');
    if (anonKey != null && anonKey.trim().isNotEmpty) {
      headers['apikey'] = anonKey.trim();
    }
    final authBearerProvider = _authBearerProvider;
    final dynamicBearer = authBearerProvider == null
        ? null
        : await authBearerProvider();
    if (dynamicBearer != null && dynamicBearer.trim().isNotEmpty) {
      headers['Authorization'] = 'Bearer ${dynamicBearer.trim()}';
    } else if (_bearerToken != null) {
      headers['Authorization'] = 'Bearer $_bearerToken';
    }
    final deviceIdProvider = _deviceIdProvider;
    if (deviceIdProvider != null) {
      final deviceId = await deviceIdProvider();
      if (deviceId.trim().isNotEmpty) {
        headers['x-device-id'] = deviceId.trim();
      }
    }
    return headers;
  }

  Future<Map<String, dynamic>?> _post(
    String route,
    Map<String, dynamic> body, {
    bool throwOnError = false,
  }) async {
    try {
      final payload = {
        ...body,
        '_route': route,
        if (AiRewardCreditUse.takePending()) 'useRewardCredit': true,
      };
      final response = await _client.post(
        Uri.parse(_baseUrl),
        headers: await _headers(),
        body: jsonEncode(payload),
      );
      Map<String, dynamic>? decodedBody;
      try {
        final decoded = jsonDecode(response.body);
        if (decoded is Map<String, dynamic>) {
          decodedBody = decoded;
        }
      } catch (_) {}

      if (response.statusCode < 200 || response.statusCode >= 300) {
        if (throwOnError) {
          throw AiProxyFailure(
            statusCode: response.statusCode,
            errorCode: decodedBody?['error']?.toString(),
            message: decodedBody?['message']?.toString(),
            waitSeconds: (decodedBody?['waitSeconds'] as num?)?.toInt() ?? 0,
          );
        }
        return null;
      }

      if (decodedBody == null) {
        if (throwOnError) {
          throw const AiProxyFailure(
            statusCode: 502,
            errorCode: 'invalid_response',
          );
        }
        return null;
      }
      final data = decodedBody['data'];
      if (data is Map<String, dynamic>) return data;
      if (throwOnError) {
        throw const AiProxyFailure(
          statusCode: 502,
          errorCode: 'invalid_response',
        );
      }
      return null;
    } on AiProxyFailure {
      rethrow;
    } catch (_) {
      if (throwOnError) {
        throw const AiProxyFailure(
          statusCode: 502,
          errorCode: 'network_error',
        );
      }
      return null;
    }
  }

  @override
  Future<AiBackendUsageStatus?> fetchUsageStatus() async {
    final data = await _post('/usage-status', {});
    if (data == null) return null;
    try {
      return AiBackendUsageStatus(
        tier: (data['tier'] as String?) ?? 'free',
        pantryRemaining: (data['pantryRemaining'] as num?)?.toInt() ?? 0,
        receiptRemaining: (data['receiptRemaining'] as num?)?.toInt() ?? 0,
        recipeRemaining: (data['recipeRemaining'] as num?)?.toInt() ?? 0,
        cooldownSeconds: (data['cooldownSeconds'] as num?)?.toInt() ?? 0,
        resetAtIso: (data['resetAt'] as String?) ?? '',
      );
    } catch (_) {
      return null;
    }
  }

  @override
  Future<bool> activateProTier({
    required String source,
    required String platform,
    required String productId,
    String? packageName,
    String? purchaseToken,
    String? purchaseId,
  }) async {
    final data = await _post('/activate-pro', {
      'source': source,
      'platform': platform,
      'productId': productId,
      if (packageName != null && packageName.trim().isNotEmpty)
        'packageName': packageName.trim(),
      if (purchaseToken != null && purchaseToken.trim().isNotEmpty)
        'purchaseToken': purchaseToken.trim(),
      if (purchaseId != null && purchaseId.trim().isNotEmpty)
        'purchaseId': purchaseId.trim(),
    });
    return data != null;
  }

  @override
  Future<bool> claimRewardCredit({required String action}) async {
    final data = await _post('/claim-reward-credit', {
      'action': action,
    });
    if (data == null) return false;
    return data['granted'] == true;
  }

  @override
  Future<PantryAnalysisResult?> analyzePantryImage({
    required Uint8List imageBytes,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
    String? survivalExpiryHint,
  }) async {
    final data = await _post(
      '/ai/analyze-pantry',
      {
        'imageBase64': base64Encode(imageBytes),
        'mode': mode.name,
        'diet': diet.name,
        'locale': locale.code,
        'cuisineRegion': cuisineRegion.code,
        if (survivalExpiryHint != null && survivalExpiryHint.trim().isNotEmpty)
          'survivalExpiryHint': survivalExpiryHint.trim(),
      },
      throwOnError: true,
    );
    if (data == null) return null;
    try {
      return PantryAnalysisResult.fromJson(data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<ReceiptAnalysisResult?> processReceiptImage({
    required Uint8List imageBytes,
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  }) async {
    final data = await _post(
      '/ai/process-receipt',
      {
        'imageBase64': base64Encode(imageBytes),
        'cuisineRegion': cuisineRegion.code,
        'locale': locale.code,
      },
      throwOnError: true,
    );
    if (data == null) return null;
    try {
      return ReceiptAnalysisResult.fromJson(data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PantryAnalysisResult?> generateRecipesFromIngredients({
    required List<String> ingredients,
    required ScanMode mode,
    required DietProfile diet,
    required AppLocale locale,
    required CuisineRegion cuisineRegion,
  }) async {
    final data = await _post(
      '/ai/generate-from-ingredients',
      {
        'ingredients': ingredients,
        'mode': mode.name,
        'diet': diet.name,
        'locale': locale.code,
        'cuisineRegion': cuisineRegion.code,
      },
      throwOnError: true,
    );
    if (data == null) return null;
    try {
      return PantryAnalysisResult.fromJson(data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<Recipe?> translateRecipe({
    required Recipe recipe,
    required AppLocale targetLocale,
  }) async {
    final data = await _post('/ai/translate-recipe', {
      'recipe': recipe.toJson(),
      'targetLocale': targetLocale.code,
    });
    if (data == null) return null;
    try {
      return Recipe.fromJson(data);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<PantryAnalysisResult?> localizePantryAnalysisResult({
    required PantryAnalysisResult result,
    required AppLocale targetLocale,
  }) async {
    final data = await _post('/ai/localize-pantry', {
      'result': result.toJson(),
      'targetLocale': targetLocale.code,
    });
    if (data == null) return null;
    try {
      return PantryAnalysisResult.fromJson(data);
    } catch (_) {
      return null;
    }
  }
}
