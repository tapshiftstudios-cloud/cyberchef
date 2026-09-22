import 'package:flutter/material.dart';

import '../../services/ai_service.dart';

abstract final class AppFeedback {
  static void showInfo(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showError(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAiError(
    BuildContext context,
    AiService ai,
    AiServiceException error,
  ) {
    final message = error.type == AiErrorType.billingDepleted
        ? error.message
        : error.type == AiErrorType.quota && ai.isInCooldown
            ? ai.quotaRetryMessage()
            : error.message;
    showError(context, message);
  }
}
