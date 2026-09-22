import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/image_quality_check.dart';

/// Kalite düşükse kullanıcıya uyarı; true = devam et.
Future<bool> showImageQualityDialog(
  BuildContext context,
  ImageQualityResult result,
) async {
  if (result.isAcceptable) return true;

  final message = result.tooDark
      ? AppStrings.imageQualityDark
      : result.tooBlurry
          ? AppStrings.imageQualityBlurry
          : AppStrings.imageQualityBlurry;

  final choice = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.surface,
      title: Text(
        AppStrings.imageQualityTitle,
        style: GoogleFonts.inter(fontWeight: FontWeight.w600),
      ),
      content: Text(message, style: GoogleFonts.inter(fontSize: 14)),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(AppStrings.imageQualityRetake),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(AppStrings.imageQualityContinue),
        ),
      ],
    ),
  );

  return choice ?? false;
}
