import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/config/supabase_config.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/enums/camera_capture_type.dart';
import '../../../core/enums/scan_mode.dart';
import '../../../core/ai/ai_usage_guard.dart';
import '../../../core/presentation/ai_flow_guard.dart';
import '../../../core/presentation/app_feedback.dart';
import '../../../core/utils/camera_platform.dart';
import '../../../core/widgets/responsive_shell.dart';
import '../../../core/providers/service_providers.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../pantry/data/pantry_repository.dart';
import '../../pantry/presentation/providers/pantry_provider.dart';
import '../../recipes/domain/models/recipe_models.dart';
import 'providers/camera_provider.dart';
import 'providers/camera_scan_providers.dart';
import 'widgets/analysis_overlay.dart';
import 'widgets/mode_info_sheet.dart';
import 'widgets/mode_selector.dart';
import 'widgets/neon_camera_frame.dart';
import 'widgets/scanning_overlay.dart';
import 'widgets/recent_scans_strip.dart';
import 'widgets/scan_photo_confirm_sheet.dart';
import 'widgets/survival_expiry_hint_field.dart';
import 'widgets/camera_capture_toggle.dart';
import 'widgets/receipt_capture_hints.dart';
import '../../pantry/presentation/providers/recent_scans_provider.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../../core/utils/image_quality_check.dart';
import '../../../core/utils/pantry_cross_validation.dart';
import '../../receipt/presentation/receipt_analysis_flow.dart';
import '../../receipt/presentation/widgets/receipt_offline_banner.dart';
import '../../barcode/presentation/widgets/barcode_scan_panel.dart';
import '../../../core/providers/user_preferences_provider.dart';
import 'widgets/image_quality_dialog.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final cameraAsync = ref.watch(cameraControllerProvider);
    final selectedMode = ref.watch(selectedScanModeProvider);
    final captureType = ref.watch(cameraCaptureTypeProvider);
    final isReceiptMode = captureType.isReceipt;
    final isBarcodeMode = captureType.isBarcode;
    final isScanning = ref.watch(isScanningProvider);
    final isAnalyzing = ref.watch(isAnalyzingProvider);
    final isCameraLive = cameraAsync.valueOrNull?.value.isInitialized ?? false;
    final canUseLiveCamera = supportsLiveCamera;
    final isSurvival = !isReceiptMode &&
        !isBarcodeMode &&
        selectedMode == ScanMode.survival;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final previewHeight = isBarcodeMode
        ? (screenHeight * 0.36).clamp(230.0, 340.0)
        : isSurvival
            ? (screenHeight * 0.27).clamp(175.0, 260.0)
            : isReceiptMode
                ? (screenHeight * 0.30).clamp(200.0, 300.0)
                : (screenHeight * 0.33).clamp(220.0, 340.0);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.appBrandName),
        actions: [
          IconButton(
            tooltip: AppStrings.tooltipSettings,
            icon: Icon(Icons.settings_outlined, color: AppColors.textSecondary),
            onPressed: () {
              AppNavigator.pushSettings(context);
            },
          ),
          if (isCameraLive)
            IconButton(
              tooltip: AppStrings.tooltipToggleGuide,
              icon: Icon(
                isScanning ? Icons.pause_circle_outline : Icons.play_circle_outline,
                color: AppColors.textSecondary,
              ),
              onPressed: () {
                ref.read(isScanningProvider.notifier).state = !isScanning;
              },
            ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: ResponsiveShell(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LayoutBuilder(
                builder: (context, constraints) => SingleChildScrollView(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.paddingOf(context).bottom + 12,
                  ),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                  CameraCaptureToggle(
                    selected: captureType,
                    onChanged: (type) {
                      if (type.isBarcode) {
                        ref
                            .read(cameraControllerProvider.notifier)
                            .deactivate();
                      }
                      ref.read(cameraCaptureTypeProvider.notifier).state =
                          type;
                    },
                  ),
                  if (isReceiptMode) ...[
                    const SizedBox(height: 8),
                    const ReceiptCaptureHints(),
                    Consumer(
                      builder: (ctx, ref, _) => ReceiptOfflineBanner(
                        onProcessEntry: (file, id) =>
                            runReceiptAnalysisFromFile(ctx, ref, file, id),
                      ),
                    ),
                  ],
                  if (isReceiptMode) const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          isBarcodeMode
                              ? AppStrings.barcodeScanTitle
                              : isReceiptMode
                                  ? AppStrings.scanSubtitleReceipt
                                  : AppStrings.scanSubtitleSmart,
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.2,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                      if (!isReceiptMode && !isBarcodeMode)
                        IconButton(
                          tooltip: AppStrings.tooltipModesAbout,
                          icon: Icon(
                            Icons.info_outline,
                            size: 20,
                            color: AppColors.textSecondary,
                          ),
                          onPressed: () => showScanModeInfoSheet(context),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  if (!isReceiptMode && !isBarcodeMode) const RecentScansStrip(),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: previewHeight.toDouble(),
                    child: isBarcodeMode
                        ? const BarcodeScanPanel()
                        : cameraAsync.when(
                            data: (controller) {
                              final live =
                                  controller != null && controller.value.isInitialized;
                              if (live) {
                                return _CameraPreviewSection(
                                  controller: controller,
                                  isScanning: isScanning,
                                  captureType: captureType,
                                  accent: isReceiptMode
                                      ? AppColors.primary
                                      : selectedMode.accentColor,
                                  onPickImage: () => _pickAndAnalyze(context, ref),
                                  onCloseCamera: () => ref
                                      .read(cameraControllerProvider.notifier)
                                      .deactivate(),
                                );
                              }
                              if (canUseLiveCamera) {
                                if (isSurvival && !live) {
                                  return _SurvivalCompactCameraLauncher(
                                    accent: selectedMode.accentColor,
                                    onActivate: () => ref
                                        .read(cameraControllerProvider.notifier)
                                        .activate(),
                                  );
                                }
                                return _CameraIdlePanel(
                                  accent: isReceiptMode
                                      ? AppColors.primary
                                      : selectedMode.accentColor,
                                  captureType: captureType,
                                  scanMode: isReceiptMode ? null : selectedMode,
                                  onActivate: () => ref
                                      .read(cameraControllerProvider.notifier)
                                      .activate(),
                                  onPickImage: () => _pickAndAnalyze(context, ref),
                                );
                              }
                              return _CameraStatusPanel(
                                message: AppStrings.desktopGalleryHint,
                                onPickImage: () => _pickAndAnalyze(context, ref),
                              );
                            },
                            loading: () => _CameraStatusPanel(
                              message: AppStrings.cameraLoading,
                              showSpinner: true,
                            ),
                            error: (e, _) => _CameraStatusPanel(
                              message: AppStrings.cameraUnavailable,
                              onPickImage: () => _pickAndAnalyze(context, ref),
                              onActivate: canUseLiveCamera
                                  ? () => ref
                                      .read(cameraControllerProvider.notifier)
                                      .activate()
                                  : null,
                            ),
                          ),
                  ),
                  SizedBox(height: isSurvival ? 8 : 16),
                  if (!isReceiptMode && !isBarcodeMode) ...[
                    ModeSelector(
                      selected: selectedMode,
                      onSelected: (mode) async {
                        await ref
                            .read(selectedScanModeProvider.notifier)
                            .setMode(mode);
                        if (mode != ScanMode.survival) {
                          ref.read(survivalExpiryHintProvider.notifier).state =
                              '';
                        }
                      },
                    ),
                    if (selectedMode == ScanMode.survival) ...[
                      const SizedBox(height: 8),
                      const SurvivalExpiryHintField(),
                      const SizedBox(height: 8),
                      OutlinedButton.icon(
                        onPressed: isAnalyzing
                            ? null
                            : () => _generateFromSurvivalHint(context, ref),
                        icon: Icon(Icons.auto_awesome),
                        label: Text(AppStrings.freshnessSuggestRecipes),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: selectedMode.accentColor,
                          side: BorderSide(color: AppColors.border),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ],
                  ],
                  if (!isBarcodeMode &&
                      (isCameraLive || !canUseLiveCamera)) ...[
                    SizedBox(height: isSurvival ? 10 : 20),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (canUseLiveCamera && isCameraLive) ...[
                            _GalleryButton(
                              onPressed: cameraAsync.isLoading || isAnalyzing
                                  ? null
                                  : () => _pickAndAnalyze(context, ref),
                            ),
                            const SizedBox(width: 20),
                            _CaptureButton(
                              accent: isReceiptMode
                                  ? AppColors.primary
                                  : selectedMode.accentColor,
                              onPressed: cameraAsync.isLoading || isAnalyzing
                                  ? null
                                  : () => _onCapture(context, ref),
                            ),
                          ] else
                            _CaptureButton(
                              accent: AppColors.primary,
                              icon: Icons.photo_library_outlined,
                              onPressed: cameraAsync.isLoading || isAnalyzing
                                  ? null
                                  : () => _pickAndAnalyze(context, ref),
                            ),
                        ],
                      ),
                    ),
                  ],
                  if (!isBarcodeMode) ...[
                  SizedBox(height: isSurvival ? 6 : 12),
                  Text(
                    isReceiptMode
                        ? (isCameraLive
                            ? AppStrings.receiptCaptureAlign
                            : AppStrings.receiptCameraHint)
                        : canUseLiveCamera || isCameraLive
                            ? AppStrings.scanFooterHint(
                                selectedMode.label,
                                cameraLive: isCameraLive,
                              )
                            : AppStrings.pickPhotoHint,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: isSurvival ? 12 : 13,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textMuted,
                    ),
                  ),
                  SizedBox(height: isSurvival ? 0 : 8),
                  ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (isAnalyzing) const AnalysisOverlay(),
        ],
      ),
    );
  }

  Future<void> _onCapture(BuildContext context, WidgetRef ref) async {
    final notifier = ref.read(cameraControllerProvider.notifier);
    final file = await notifier.capturePhoto();

    if (!context.mounted) return;

    if (file == null) {
      _showError(
        context,
        AppStrings.captureFailed,
      );
      return;
    }

    final bytes = await File(file.path).readAsBytes();
    if (!context.mounted) return;
    await _confirmAndAnalyze(context, ref, bytes, fromGallery: false);
  }

  Future<void> _pickAndAnalyze(BuildContext context, WidgetRef ref) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (!context.mounted || picked == null) return;

    final bytes = await picked.readAsBytes();
    if (!context.mounted) return;
    await _confirmAndAnalyze(context, ref, bytes, fromGallery: true);
  }

  Future<void> _confirmAndAnalyze(
    BuildContext context,
    WidgetRef ref,
    Uint8List bytes, {
    required bool fromGallery,
  }) async {
    final mode = ref.read(selectedScanModeProvider);
    final captureType = ref.read(cameraCaptureTypeProvider);
    final confirmed = await showScanPhotoConfirmSheet(
      context,
      imageBytes: bytes,
      mode: mode,
      fromGallery: fromGallery,
      isReceipt: captureType.isReceipt,
    );
    if (!context.mounted || !confirmed) return;

    final quality = await ImageQualityCheck.analyze(bytes);
    if (!context.mounted) return;
    final proceed = await showImageQualityDialog(context, quality);
    if (!context.mounted || !proceed) return;

    if (captureType.isReceipt) {
      await runReceiptAnalysisFlow(context, ref, bytes: bytes);
    } else {
      await _analyzeBytes(context, ref, bytes);
    }
  }

  Future<void> _analyzeBytes(
    BuildContext context,
    WidgetRef ref,
    Uint8List bytes,
  ) async {
    final aiService = ref.read(aiServiceProvider);
    if (!aiService.isConfigured) {
      _showError(context, AppStrings.geminiKeyMissing);
      return;
    }

    final mode = ref.read(selectedScanModeProvider);
    final expiryHint = mode == ScanMode.survival
        ? ref.read(survivalExpiryHintProvider).trim()
        : null;
    ref.read(isAnalyzingProvider.notifier).state = true;

    void setAnalysisStep(String subtitle) {
      ref.read(analysisStatusProvider.notifier).state = (
        title: AppStrings.analysisTitle,
        subtitle: subtitle,
      );
    }

    await AiFlowGuard.run(
      context: context,
      ai: aiService,
      ref: ref,
      rewardAction: AiActionType.pantryScan,
      onFinally: () => ref.read(isAnalyzingProvider.notifier).state = false,
      action: () async {
        setAnalysisStep(AppStrings.stepPrepareImage);
        final prepared = await aiService.prepareImageForAnalysis(bytes);

        setAnalysisStep(AppStrings.stepAnalyzeAi);
        final diet = ref.read(dietProfileProvider);
        final locale = ref.read(localeProvider);
        final cuisineRegion = ref.read(effectiveCuisineRegionProvider);
        final result = await aiService.analyzePantryImage(
          imageBytes: prepared,
          mode: mode,
          survivalExpiryHint:
              expiryHint != null && expiryHint.isNotEmpty ? expiryHint : null,
          alreadyPrepared: true,
          diet: diet,
          locale: locale,
          cuisineRegion: cuisineRegion,
        );

        setAnalysisStep(AppStrings.stepBuildRecipes);

        if (!context.mounted) return;

        await ref.read(recentScansProvider.notifier).addScan(
              mode: mode,
              result: result,
            );

        if (!context.mounted) return;

        await _saveToPantryHistory(ref, mode, result, context);

        if (!context.mounted) return;

        final pantry = ref.read(pantryItemsProvider).valueOrNull ?? [];
        final mismatches = PantryCrossValidation.findPossibleMismatches(
          scanIngredients: result.ingredients,
          pantryItems: pantry,
        );
        if (mismatches.isNotEmpty && context.mounted) {
          AppFeedback.showInfo(
            context,
            AppStrings.pantryMismatchHint(mismatches),
          );
        }

        if (!context.mounted) return;

        await AppNavigator.pushRecipesResults(
          context,
          result: result,
          mode: mode,
        );
      },
    );
  }

  Future<void> _saveToPantryHistory(
    WidgetRef ref,
    ScanMode mode,
    PantryAnalysisResult result,
    BuildContext context,
  ) async {
    if (!SupabaseConfig.isConfigured) return;

    try {
      await ref.read(pantryRepositoryProvider).saveScan(
            mode: mode,
            result: result,
          );
      ref.invalidate(pantryHistoryProvider);
      if (!context.mounted) return;
      AppFeedback.showInfo(context, AppStrings.scanSavedHistory);
    } on PantryException catch (e) {
      if (context.mounted && e.type != PantryErrorType.notAuthenticated) {
        AppFeedback.showError(
          context,
          '${AppStrings.scanSaveFailedPrefix}: ${e.message}',
        );
      }
    }
  }

  Future<void> _generateFromSurvivalHint(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final aiService = ref.read(aiServiceProvider);
    if (!aiService.isConfigured) {
      _showError(context, AppStrings.geminiKeyMissing);
      return;
    }

    final raw = ref.read(survivalExpiryHintProvider).trim();
    final ingredients = raw
        .split(RegExp(r'[,;]'))
        .map((e) => e.trim())
        .where((e) => e.isNotEmpty)
        .toList();
    if (ingredients.isEmpty) {
      _showError(context, AppStrings.freshnessNoIngredientsForRecipes);
      return;
    }

    ref.read(isAnalyzingProvider.notifier).state = true;
    ref.read(analysisStatusProvider.notifier).state = (
      title: AppStrings.freshnessRecipeTitle,
      subtitle: AppStrings.stepBuildRecipes,
    );

    await AiFlowGuard.run(
      context: context,
      ai: aiService,
      ref: ref,
      rewardAction: AiActionType.recipeFromIngredients,
      onFinally: () => ref.read(isAnalyzingProvider.notifier).state = false,
      action: () async {
        final result = await aiService.generateRecipesFromIngredients(
          ingredients: ingredients,
          mode: ScanMode.survival,
          diet: ref.read(dietProfileProvider),
          locale: ref.read(localeProvider),
          cuisineRegion: ref.read(effectiveCuisineRegionProvider),
        );

        if (!context.mounted) return;
        await AppNavigator.pushRecipesResults(
          context,
          result: result,
          mode: ScanMode.survival,
        );
      },
    );
  }

  void _showError(BuildContext context, String message) {
    AppFeedback.showError(context, message);
  }
}

class _CameraIdlePanel extends StatelessWidget {
  const _CameraIdlePanel({
    required this.accent,
    required this.captureType,
    required this.onActivate,
    required this.onPickImage,
    this.scanMode,
  });

  final Color accent;
  final CameraCaptureType captureType;
  final ScanMode? scanMode;
  final VoidCallback onActivate;
  final VoidCallback onPickImage;

  @override
  Widget build(BuildContext context) {
    return NeonCameraFrame(
      accent: accent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (captureType.isReceipt)
            ScanningOverlay(
              active: true,
              captureType: captureType,
            ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onActivate,
                      customBorder: const CircleBorder(),
                      child: Ink(
                        width: 88,
                        height: 88,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: accent.withValues(alpha: 0.12),
                          border: Border.all(color: accent, width: 2),
                        ),
                        child: Icon(
                          Icons.photo_camera_outlined,
                          size: 40,
                          color: accent,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    AppStrings.cameraTapToOpen,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textSecondary,
                      height: 1.45,
                    ),
                  ),
                  if (scanMode != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: NeonDecorations.button(
                        accent: scanMode!.accentColor,
                        filled: true,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            scanMode!.icon,
                            size: 16,
                            color: scanMode!.accentColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            scanMode!.label,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: scanMode!.accentColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPickImage,
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: NeonDecorations.button(
                    accent: accent,
                    filled: true,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 18,
                          color: accent,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.galleryLabel,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CameraPreviewSection extends StatelessWidget {
  const _CameraPreviewSection({
    required this.controller,
    required this.isScanning,
    required this.captureType,
    required this.accent,
    required this.onPickImage,
    required this.onCloseCamera,
  });

  final CameraController? controller;
  final bool isScanning;
  final CameraCaptureType captureType;
  final Color accent;
  final VoidCallback onPickImage;
  final VoidCallback onCloseCamera;

  @override
  Widget build(BuildContext context) {
    if (controller == null || !controller!.value.isInitialized) {
      return _CameraStatusPanel(
        message: supportsLiveCamera
            ? AppStrings.noCameraOnDevice
            : AppStrings.desktopGalleryHint,
        onPickImage: onPickImage,
      );
    }

    return NeonCameraFrame(
      accent: accent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: controller!.value.previewSize?.height ?? 1,
              height: controller!.value.previewSize?.width ?? 1,
              child: CameraPreview(controller!),
            ),
          ),
          ScanningOverlay(active: isScanning, captureType: captureType),
          Positioned(
            top: 12,
            right: 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onCloseCamera,
                customBorder: const CircleBorder(),
                child: Tooltip(
                  message: AppStrings.closeCamera,
                  child: Ink(
                    decoration: NeonDecorations.button(filled: true),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 12,
            bottom: 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onPickImage,
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: NeonDecorations.button(filled: true),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.photo_library_outlined,
                          size: 18,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          AppStrings.galleryLabel,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 12,
            bottom: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: NeonDecorations.button(filled: true),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: isScanning ? AppColors.primary : AppColors.textMuted,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isScanning
                        ? AppStrings.overlayGuideOn
                        : AppStrings.overlayGuideOff,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SurvivalCompactCameraLauncher extends StatelessWidget {
  const _SurvivalCompactCameraLauncher({
    required this.accent,
    required this.onActivate,
  });

  final Color accent;
  final VoidCallback onActivate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onActivate,
          customBorder: const CircleBorder(),
          child: Ink(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accent.withValues(alpha: 0.12),
              border: Border.all(color: accent, width: 2),
            ),
            child: Icon(
              Icons.photo_camera_outlined,
              size: 36,
              color: accent,
            ),
          ),
        ),
      ),
    );
  }
}

class _CameraStatusPanel extends StatelessWidget {
  const _CameraStatusPanel({
    required this.message,
    this.showSpinner = false,
    this.onPickImage,
    this.onActivate,
  });

  final String message;
  final bool showSpinner;
  final VoidCallback? onPickImage;
  final VoidCallback? onActivate;

  @override
  Widget build(BuildContext context) {
    return NeonCameraFrame(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (showSpinner)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CircularProgressIndicator(
                    color: AppColors.primary,
                    strokeWidth: 2,
                  ),
                ),
              Icon(
                showSpinner
                    ? Icons.hourglass_empty
                    : Icons.videocam_off_outlined,
                size: 48,
                color: AppColors.textMuted,
              ),
              const SizedBox(height: 16),
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  color: AppColors.textSecondary,
                  height: 1.45,
                ),
              ),
              if (onActivate != null) ...[
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: onActivate,
                  icon: Icon(Icons.photo_camera_outlined),
                  label: Text(AppStrings.openCameraButton),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.border),
                  ),
                ),
              ],
              if (onPickImage != null) ...[
                const SizedBox(height: 12),
                OutlinedButton.icon(
                  onPressed: onPickImage,
                  icon: Icon(Icons.photo_library_outlined),
                  label: Text(AppStrings.pickPhotoButton),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.border),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _GalleryButton extends StatelessWidget {
  const _GalleryButton({required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null;
    return Tooltip(
      message: AppStrings.galleryPickMessage,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: enabled ? AppColors.border : AppColors.border,
            ),
            color: AppColors.surface,
          ),
          child: Icon(
            Icons.photo_library_outlined,
            color: enabled ? AppColors.textSecondary : AppColors.textMuted,
            size: 26,
          ),
        ),
      ),
    );
  }
}

class _CaptureButton extends StatelessWidget {
  const _CaptureButton({
    required this.onPressed,
    this.icon = Icons.camera_alt_rounded,
    this.accent,
  });

  final VoidCallback? onPressed;
  final IconData icon;
  final Color? accent;

  @override
  Widget build(BuildContext context) {
    final a = accent ?? AppColors.primary;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: onPressed == null ? AppColors.border : a,
            width: 2,
          ),
          color: AppColors.surface,
        ),
        child: Center(
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: onPressed == null
                  ? AppColors.surfaceElevated
                  : a.withValues(alpha: 0.12),
              border: Border.all(
                color: onPressed == null ? AppColors.border : a,
                width: 1,
              ),
            ),
            child: Icon(
              icon,
              color: onPressed == null ? AppColors.textMuted : a,
            ),
          ),
        ),
      ),
    );
  }
}


