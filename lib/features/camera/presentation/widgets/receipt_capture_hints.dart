import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';

/// Fiş modunda çekim öncesi kısa ipuçları.
class ReceiptCaptureHints extends StatelessWidget {
  const ReceiptCaptureHints({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: NeonDecorations.card(radius: NeonDecorations.controlRadius),
      child: Row(
        children: [
          Icon(Icons.lightbulb_outline, size: 18, color: AppColors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              AppStrings.receiptCaptureHints,
              style: GoogleFonts.inter(
                fontSize: 12,
                height: 1.4,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

