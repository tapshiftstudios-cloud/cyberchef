import '../core/enums/app_locale.dart';
import '../core/enums/cuisine_region.dart';
import '../core/l10n/ai_receipt_prompts.dart';

/// Fiş tarama için Gemini istemi — bölge ve dile göre.
abstract final class GeminiReceiptPromptBuilder {
  static String build({
    required CuisineRegion cuisineRegion,
    required AppLocale locale,
  }) =>
      AiReceiptPrompts.build(region: cuisineRegion, locale: locale);
}
