import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/scan_mode.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/theme/neon_decorations.dart';

/// Tam ekran önizleme + onay; `true` dönerse analiz başlatılır.
Future<bool> showScanPhotoConfirmSheet(
  BuildContext context, {
  required Uint8List imageBytes,
  required ScanMode mode,
  required bool fromGallery,
  bool isReceipt = false,
}) async {
  final result = await Navigator.of(context).push<bool>(
    MaterialPageRoute<bool>(
      fullscreenDialog: true,
      builder: (context) => ScanPhotoConfirmScreen(
        imageBytes: imageBytes,
        mode: mode,
        fromGallery: fromGallery,
        isReceipt: isReceipt,
      ),
    ),
  );
  return result ?? false;
}

class ScanPhotoConfirmScreen extends StatelessWidget {
  const ScanPhotoConfirmScreen({
    super.key,
    required this.imageBytes,
    required this.mode,
    required this.fromGallery,
    this.isReceipt = false,
  });

  final Uint8List imageBytes;
  final ScanMode mode;
  final bool fromGallery;
  final bool isReceipt;

  void _cancel(BuildContext context) => Navigator.of(context).pop(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          AppStrings.scanConfirmTitle,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.close),
          tooltip: AppStrings.scanConfirmCancel,
          onPressed: () => _cancel(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isReceipt)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: NeonDecorations.button(
                        accent: mode.accentColor,
                        filled: true,
                      ),
                      child: Text(
                        mode.label,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: mode.accentColor,
                        ),
                      ),
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: NeonDecorations.button(filled: true),
                      child: Text(
                        AppStrings.scanConfirmReceiptLabel,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    isReceipt
                        ? AppStrings.scanConfirmSubtitleReceipt
                        : AppStrings.scanConfirmSubtitle,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      height: 1.45,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(NeonDecorations.cardRadius),
                  child: Container(
                    width: double.infinity,
                    color: AppColors.surface,
                    child: Image.memory(
                      imageBytes,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: AppTheme.neonButton(
                      label: AppStrings.scanConfirmAnalyze,
                      icon: Icons.auto_awesome_outlined,
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => _cancel(context),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.textSecondary,
                            side: BorderSide(color: AppColors.border),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                NeonDecorations.controlRadius,
                              ),
                            ),
                          ),
                          child: Text(
                            AppStrings.scanConfirmCancel,
                            style:
                                GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextButton(
                          onPressed: () => _cancel(context),
                          child: Text(
                            fromGallery
                                ? AppStrings.scanConfirmPickOther
                                : AppStrings.scanConfirmRetake,
                            style: GoogleFonts.inter(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


