import 'package:cyberchef/core/enums/app_locale.dart';
import 'package:cyberchef/core/l10n/app_strings.dart';
import 'package:cyberchef/services/ai_service.dart';
import 'package:cyberchef/services/gemini_error_mapper.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

void main() {
  setUp(() => AppStrings.useLocale(AppLocale.tr));

  group('GeminiErrorMapper.fromGenerative', () {
    test('maps quota errors', () {
      final ex = GeminiErrorMapper.fromGenerative(
        GenerativeAIException('Quota exceeded for quota metric'),
      );
      expect(ex.type, AiErrorType.quota);
      expect(ex.message, AppStrings.geminiQuotaExceeded);
    });

    test('maps timeout errors', () {
      final ex = GeminiErrorMapper.fromGenerative(
        GenerativeAIException('Request timed out after 30s'),
      );
      expect(ex.type, AiErrorType.timeout);
      expect(ex.message, AppStrings.geminiTimeout);
    });

    test('maps model not found', () {
      final ex = GeminiErrorMapper.fromGenerative(
        GenerativeAIException('Model not found: xyz'),
      );
      expect(ex.type, AiErrorType.modelUnavailable);
    });

    test('maps 503 server errors', () {
      final ex = GeminiErrorMapper.fromGenerative(
        GenerativeAIException('503 service unavailable'),
      );
      expect(ex.type, AiErrorType.server);
      expect(ex.message, AppStrings.geminiServerError);
    });
  });

  group('GeminiErrorMapper.fromAny', () {
    test('maps socket errors to network', () {
      final ex = GeminiErrorMapper.fromAny(
        Exception('SocketException: failed host lookup'),
        fallbackMessage: AppStrings.genericError,
      );
      expect(ex.type, AiErrorType.network);
    });
  });
}
