import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/camera_capture_type.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';

/// Üst kısımda buzdolabı / fiş / barkod geçişi.
class CameraCaptureToggle extends ConsumerWidget {
  const CameraCaptureToggle({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final CameraCaptureType selected;
  final ValueChanged<CameraCaptureType> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: NeonDecorations.card(radius: NeonDecorations.controlRadius),
      child: Row(
        children: [
          _Segment(
            label: AppStrings.captureTypeFridge,
            icon: Icons.kitchen_outlined,
            selected: selected == CameraCaptureType.fridge,
            onTap: () => onChanged(CameraCaptureType.fridge),
          ),
          _Segment(
            label: AppStrings.captureTypeReceipt,
            icon: Icons.receipt_long_outlined,
            selected: selected == CameraCaptureType.receipt,
            onTap: () => onChanged(CameraCaptureType.receipt),
          ),
          _Segment(
            label: AppStrings.captureTypeBarcode,
            icon: Icons.qr_code_scanner,
            selected: selected == CameraCaptureType.barcode,
            onTap: () => onChanged(CameraCaptureType.barcode),
          ),
        ],
      ),
    );
  }
}

class _Segment extends StatelessWidget {
  const _Segment({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(NeonDecorations.controlRadius - 2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.primary.withValues(alpha: 0.18)
                  : Colors.transparent,
              borderRadius:
                  BorderRadius.circular(NeonDecorations.controlRadius - 2),
              border: selected
                  ? Border.all(
                      color: AppColors.primary.withValues(alpha: 0.55),
                    )
                  : null,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: selected ? AppColors.primary : AppColors.textMuted,
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: selected
                        ? AppColors.textPrimary
                        : AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
