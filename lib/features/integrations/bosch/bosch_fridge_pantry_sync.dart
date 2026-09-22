import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/ai/ai_usage_guard.dart';
import '../../../core/config/bosch_config.dart';
import '../../../core/config/supabase_config.dart';
import '../../../core/enums/scan_mode.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/presentation/ai_flow_guard.dart';
import '../../../core/presentation/app_feedback.dart';
import '../../../core/providers/service_providers.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../pantry/data/pantry_repository.dart';
import '../../pantry/presentation/providers/pantry_provider.dart';
import '../../pantry/presentation/providers/recent_scans_provider.dart';
import '../../../services/bosch/bosch_token_refresh.dart';
import '../../../services/bosch/home_connect_api.dart';
import 'bosch_connect_copy.dart';

abstract final class BoschFridgePantrySync {
  static Future<void> run({
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    final token = await BoschTokenRefresh().getValidAccessToken();
    if (token == null) {
      if (context.mounted) {
        AppFeedback.showError(context, BoschConnectCopy.notLinked);
      }
      return;
    }

    if (context.mounted) {
      AppFeedback.showInfo(context, BoschConnectCopy.syncFetchingPhoto);
    }

    Uint8List? imageBytes;
    try {
      imageBytes = await HomeConnectApi().fetchLatestFridgePhoto(token);
    } on HomeConnectApiException catch (e) {
      if (e.isInsufficientScope && BoschConfig.isSimulator && context.mounted) {
        imageBytes = await _pickSimulatorDemoPhoto(context);
        if (imageBytes == null) {
          AppFeedback.showError(
            context,
            '${BoschConnectCopy.syncFailed}: ${BoschConnectCopy.imagesScopeMissing}',
          );
          return;
        }
      } else {
        if (context.mounted) {
          final hint = e.isInsufficientScope
              ? '\n${BoschConnectCopy.scopeReconnectHint}'
              : '';
          AppFeedback.showError(
            context,
            '${BoschConnectCopy.syncFailed}: $e$hint',
          );
        }
        return;
      }
    }

    await _analyzeAndNavigate(context: context, ref: ref, imageBytes: imageBytes);
  }

  static Future<Uint8List?> _pickSimulatorDemoPhoto(BuildContext context) async {
    final useDemo = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(BoschConnectCopy.demoPhotoDialogTitle),
        content: Text(BoschConnectCopy.demoPhotoDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(BoschConnectCopy.demoPhotoCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(BoschConnectCopy.demoPhotoPick),
          ),
        ],
      ),
    );
    if (useDemo != true || !context.mounted) return null;

    final file = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 2048,
      maxHeight: 2048,
      imageQuality: 92,
    );
    if (file == null) return null;
    return file.readAsBytes();
  }

  static Future<void> _analyzeAndNavigate({
    required BuildContext context,
    required WidgetRef ref,
    required Uint8List imageBytes,
  }) async {
    final aiService = ref.read(aiServiceProvider);
    if (!aiService.isConfigured) {
      if (context.mounted) {
        AppFeedback.showError(context, AppStrings.geminiKeyMissing);
      }
      return;
    }

    const mode = ScanMode.quickScan;

    if (!context.mounted) return;

    await AiFlowGuard.run(
      context: context,
      ai: aiService,
      ref: ref,
      rewardAction: AiActionType.pantryScan,
      action: () async {
        final prepared = await aiService.prepareImageForAnalysis(imageBytes);
        final diet = ref.read(dietProfileProvider);
        final locale = ref.read(localeProvider);
        final cuisineRegion = ref.read(effectiveCuisineRegionProvider);
        final result = await aiService.analyzePantryImage(
          imageBytes: prepared,
          mode: mode,
          alreadyPrepared: true,
          diet: diet,
          locale: locale,
          cuisineRegion: cuisineRegion,
        );

        if (!context.mounted) return;

        await ref.read(recentScansProvider.notifier).addScan(
              mode: mode,
              result: result,
            );

        if (SupabaseConfig.isConfigured && context.mounted) {
          try {
            await ref.read(pantryRepositoryProvider).saveScan(
                  mode: mode,
                  result: result,
                );
            ref.invalidate(pantryHistoryProvider);
          } on PantryException catch (e) {
            if (context.mounted && e.type != PantryErrorType.notAuthenticated) {
              AppFeedback.showError(
                context,
                '${AppStrings.scanSaveFailedPrefix}: ${e.message}',
              );
            }
          }
        }

        if (!context.mounted) return;

        await AppNavigator.pushRecipesResults(
          context,
          result: result,
          mode: mode,
        );
      },
    );

    if (context.mounted) {
      AppFeedback.showInfo(context, BoschConnectCopy.syncDone);
    }
  }
}
