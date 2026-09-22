import 'package:google_generative_ai/google_generative_ai.dart';

import '../core/crash/crash_reporting.dart';
import '../core/l10n/app_strings.dart';
import 'ai_service.dart';

/// Gemini / ağ hatalarını kullanıcı dostu [AiServiceException]'a çevirir.
abstract final class GeminiErrorMapper {
  static AiServiceException fromGenerative(GenerativeAIException error) {
    if (_isModelNotFound(error)) {
      return AiServiceException(
        AppStrings.modelUnavailable,
        type: AiErrorType.modelUnavailable,
        cause: error,
      );
    }
    if (_isQuota(error)) {
      return AiServiceException(
        AppStrings.geminiQuotaExceeded,
        type: AiErrorType.quota,
        cause: error,
      );
    }
    if (_isTimeout(error)) {
      return AiServiceException(
        AppStrings.geminiTimeout,
        type: AiErrorType.timeout,
        cause: error,
      );
    }
    if (_isNetwork(error)) {
      return AiServiceException(
        AppStrings.networkError,
        type: AiErrorType.network,
        cause: error,
      );
    }
    if (_isServer(error)) {
      _reportUnexpected(error);
      return AiServiceException(
        AppStrings.geminiServerError,
        type: AiErrorType.server,
        cause: error,
      );
    }
    _reportUnexpected(error);
    return AiServiceException(
      AppStrings.genericError,
      type: AiErrorType.unknown,
      cause: error,
    );
  }

  static AiServiceException fromAny(
    Object error, {
    required String fallbackMessage,
    AiErrorType fallbackType = AiErrorType.unknown,
  }) {
    if (error is AiServiceException) return error;
    if (error is GenerativeAIException) {
      return fromGenerative(error);
    }
    if (_isQuota(error)) {
      return AiServiceException(
        AppStrings.geminiQuotaExceeded,
        type: AiErrorType.quota,
        cause: error,
      );
    }
    if (_isTimeout(error)) {
      return AiServiceException(
        AppStrings.geminiTimeout,
        type: AiErrorType.timeout,
        cause: error,
      );
    }
    if (_isNetwork(error)) {
      return AiServiceException(
        AppStrings.networkError,
        type: AiErrorType.network,
        cause: error,
      );
    }
    if (_isServer(error)) {
      _reportUnexpected(error);
      return AiServiceException(
        AppStrings.geminiServerError,
        type: AiErrorType.server,
        cause: error,
      );
    }
    return AiServiceException(
      fallbackMessage,
      type: fallbackType,
      cause: error,
    );
  }

  static void _reportUnexpected(Object error) {
    CrashReporting.captureException(error);
  }

  static String _text(Object e) {
    if (e is GenerativeAIException) return e.message;
    return e.toString().toLowerCase();
  }

  static bool _isModelNotFound(GenerativeAIException e) {
    final message = e.message.toLowerCase();
    return message.contains('not found') ||
        message.contains('invalid model') ||
        message.contains('404');
  }

  static bool _isQuota(Object e) {
    final message = _text(e);
    return message.contains('quota') ||
        message.contains('rate limit') ||
        message.contains('rate_limit') ||
        message.contains('resource exhausted') ||
        message.contains('too many requests') ||
        message.contains('429');
  }

  static bool _isTimeout(Object e) {
    final message = _text(e);
    return message.contains('timeout') ||
        message.contains('timed out') ||
        message.contains('deadline exceeded');
  }

  static bool _isNetwork(Object e) {
    final message = _text(e);
    return message.contains('socket') ||
        message.contains('network') ||
        message.contains('connection') ||
        message.contains('failed host lookup') ||
        message.contains('unreachable');
  }

  static bool _isServer(Object e) {
    final message = _text(e);
    return message.contains('500') ||
        message.contains('502') ||
        message.contains('503') ||
        message.contains('internal error') ||
        message.contains('service unavailable');
  }
}
