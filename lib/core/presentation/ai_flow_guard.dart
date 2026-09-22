import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../ai/ai_usage_guard.dart';
import '../ads/rewarded_scan_offer.dart';
import '../l10n/app_strings.dart';
import '../../services/ai_service.dart';
import 'app_feedback.dart';

abstract final class AiFlowGuard {
  static Future<void> run({
    required BuildContext context,
    required AiService ai,
    required Future<void> Function() action,
    FutureOr<void> Function()? onFinally,
    String? genericErrorMessage,
    AiActionType? rewardAction,
    WidgetRef? ref,
  }) async {
    try {
      await action();
    } on AiServiceException catch (e) {
      if (!context.mounted) return;
      if (e.dailyLimitReached &&
          rewardAction != null &&
          ref != null &&
          context.mounted) {
        final recovered = await RewardedScanOffer.tryRecover(
          context,
          ref,
          rewardAction,
        );
        if (recovered && context.mounted) {
          try {
            await action();
            return;
          } on AiServiceException catch (retryError) {
            if (!context.mounted) return;
            AppFeedback.showAiError(context, ai, retryError);
            return;
          } catch (_) {
            if (!context.mounted) return;
            AppFeedback.showError(
              context,
              genericErrorMessage ?? AppStrings.genericError,
            );
            return;
          }
        }
      }
      AppFeedback.showAiError(context, ai, e);
    } catch (_) {
      if (!context.mounted) return;
      AppFeedback.showError(
        context,
        genericErrorMessage ?? AppStrings.genericError,
      );
    } finally {
      await onFinally?.call();
    }
  }
}
