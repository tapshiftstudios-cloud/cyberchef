import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ai/ai_usage_guard.dart';
import '../../../core/ads/rewarded_scan_offer.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/presentation/app_feedback.dart';
import '../../../core/providers/service_providers.dart';
import '../../../core/utils/connectivity_helper.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../services/ai_service.dart';
import '../../camera/presentation/providers/camera_scan_providers.dart';
import '../../camera/presentation/widgets/receipt_items_confirm_sheet.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import 'providers/receipt_queue_provider.dart';

/// Fiş görüntüsünü analiz eder veya çevrimdışı kuyruğa alır.
Future<void> runReceiptAnalysisFlow(
  BuildContext context,
  WidgetRef ref, {
  required Uint8List bytes,
  String? queueEntryId,
}) async {
  final aiService = ref.read(aiServiceProvider);
  if (!aiService.isConfigured) {
    _showError(context, AppStrings.geminiKeyMissing);
    return;
  }

  final online = await ConnectivityHelper.hasConnection();
  if (!online) {
    await ref.read(receiptQueueProvider.notifier).enqueue(bytes);
    if (!context.mounted) return;
    AppFeedback.showInfo(context, AppStrings.receiptQueuedOffline);
    return;
  }

  ref.read(isAnalyzingProvider.notifier).state = true;

  void setStep(String subtitle) {
    ref.read(analysisStatusProvider.notifier).state = (
      title: AppStrings.receiptAnalysisTitle,
      subtitle: subtitle,
    );
  }

  File? tempFile;
  try {
    setStep(AppStrings.stepReceiptPrepare);
    final dir = Directory.systemTemp;
    tempFile = File(
      '${dir.path}/receipt_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await tempFile.writeAsBytes(bytes);

    setStep(AppStrings.stepReceiptOcr);
    final result = await aiService.processReceiptImage(
      tempFile,
      cuisineRegion: ref.read(effectiveCuisineRegionProvider),
      locale: ref.read(localeProvider),
    );

    setStep(AppStrings.stepReceiptInfer);

    if (!context.mounted) return;

    ref.read(isAnalyzingProvider.notifier).state = false;

    final confirmedItems = await showReceiptItemsConfirmSheet(
      context,
      result: result,
    );

    if (!context.mounted ||
        confirmedItems == null ||
        confirmedItems.isEmpty) {
      return;
    }

    final addResult =
        await ref.read(pantryItemsProvider.notifier).addItems(confirmedItems);

    if (queueEntryId != null) {
      await ref.read(receiptQueueProvider.notifier).remove(queueEntryId);
    }

    if (context.mounted) {
      var msg = AppStrings.receiptSaved;
      if (addResult.mergedCount > 0) {
        msg = '${AppStrings.receiptSaved} · ${AppStrings.receiptMergedSnack}';
      }
      if (addResult.cloudError != null) {
        msg = '$msg · ${AppStrings.receiptCloudSyncFailed}';
      } else if (addResult.cloudSynced) {
        msg = '$msg · ${AppStrings.receiptCloudSynced}';
      }
      if (!context.mounted) return;
      AppFeedback.showInfo(context, msg);
    }
  } on AiServiceException catch (e) {
    final ai = ref.read(aiServiceProvider);
    if (!context.mounted) return;
    if (e.dailyLimitReached) {
      final recovered = await RewardedScanOffer.tryRecover(
        context,
        ref,
        AiActionType.receiptScan,
      );
      if (recovered && context.mounted) {
        await runReceiptAnalysisFlow(
          context,
          ref,
          bytes: bytes,
          queueEntryId: queueEntryId,
        );
        return;
      }
    }
    if (!context.mounted) return;
    AppFeedback.showAiError(context, ai, e);
  } catch (_) {
    if (!context.mounted) return;
    AppFeedback.showError(context, AppStrings.genericError);
  } finally {
    ref.read(isAnalyzingProvider.notifier).state = false;
    if (tempFile != null && await tempFile.exists()) {
      await tempFile.delete();
    }
  }
}

Future<void> runReceiptAnalysisFromFile(
  BuildContext context,
  WidgetRef ref,
  File file,
  String queueEntryId,
) async {
  final bytes = await file.readAsBytes();
  if (!context.mounted) return;
  await runReceiptAnalysisFlow(
    context,
    ref,
    bytes: bytes,
    queueEntryId: queueEntryId,
  );
}

void _showError(BuildContext context, String message) {
  AppFeedback.showError(context, message);
}
