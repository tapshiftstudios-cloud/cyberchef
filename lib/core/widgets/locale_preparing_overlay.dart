import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../l10n/app_strings.dart';
import '../theme/app_colors.dart';

/// Non-blocking banner shown while favorites are being translated.
class LocalePreparingOverlay extends StatelessWidget {
  const LocalePreparingOverlay({
    super.key,
    required this.visible,
    this.completed,
    this.total,
  });

  final bool visible;
  final int? completed;
  final int? total;

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();

    final showProgress = total != null && total! > 0;

    return IgnorePointer(
      child: Align(
      alignment: Alignment.topCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: Material(
            color: AppColors.surface,
            elevation: 6,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 22,
                    height: 22,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          AppStrings.localePreparingTitle,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Text(
                          showProgress
                              ? '${AppStrings.localePreparingSubtitle} (${completed ?? 0}/$total)'
                              : AppStrings.localePreparingSubtitle,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}
