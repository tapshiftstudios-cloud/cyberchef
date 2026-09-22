import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ai/ai_reward_credit_use.dart';
import '../ai/ai_usage_guard.dart';
import '../l10n/app_strings.dart';
import '../presentation/app_feedback.dart';
import '../providers/service_providers.dart';
import '../providers/subscription_tier_provider.dart';
import '../theme/app_colors.dart';
import '../../services/ad_service.dart';

/// Günlük limit dolduğunda ödüllü reklam ile +1 tarama hakkı sunar.
abstract final class RewardedScanOffer {
  static Future<bool> tryRecover(
    BuildContext context,
    WidgetRef ref,
    AiActionType action,
  ) async {
    final tier = await ref.read(subscriptionTierProvider.future);
    if (tier == 'pro' || !context.mounted) return false;

    final choice = await showModalBottomSheet<_OfferChoice>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => _OfferSheet(action: action),
    );
    if (!context.mounted || choice == null) return false;

    if (choice == _OfferChoice.cancel) return false;

    if (choice == _OfferChoice.watchAd) {
      final adResult = await AdService.instance.showRewardedAd();
      if (!context.mounted) return false;
      if (adResult != RewardedAdResult.completed) {
        AppFeedback.showError(context, AppStrings.adRewardNotCompleted);
        return false;
      }

      final ai = ref.read(aiServiceProvider);
      final granted = await ai.claimRewardCredit(action);
      if (!context.mounted) return false;
      if (!granted) {
        AppFeedback.showError(context, AppStrings.adRewardDailyCapReached);
        return false;
      }

      AiRewardCreditUse.markPending();
      AppFeedback.showInfo(context, AppStrings.adRewardGranted);
      return true;
    }

    return false;
  }
}

enum _OfferChoice { watchAd, cancel }

class _OfferSheet extends StatelessWidget {
  const _OfferSheet({required this.action});

  final AiActionType action;

  String get _title => switch (action) {
        AiActionType.pantryScan => AppStrings.adRewardTitlePantry,
        AiActionType.receiptScan => AppStrings.adRewardTitleReceipt,
        AiActionType.recipeFromIngredients => AppStrings.adRewardTitleRecipe,
      };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            _title,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppStrings.adRewardSubtitle,
            style: GoogleFonts.inter(
              fontSize: 14,
              height: 1.45,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => Navigator.pop(context, _OfferChoice.watchAd),
            icon: const Icon(Icons.play_circle_outline),
            label: Text(AppStrings.adRewardWatchButton),
            style: FilledButton.styleFrom(
              backgroundColor: AppColors.primary,
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => Navigator.pop(context, _OfferChoice.cancel),
            child: Text(AppStrings.scanConfirmCancel),
          ),
        ],
      ),
    );
  }
}
