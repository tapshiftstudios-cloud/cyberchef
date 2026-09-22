import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/scan_mode.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';

class ModeSelector extends StatelessWidget {
  const ModeSelector({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final ScanMode selected;
  final ValueChanged<ScanMode> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ScanMode.values.map((mode) {
        final isSelected = mode == selected;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onSelected(mode),
                borderRadius:
                    BorderRadius.circular(NeonDecorations.controlRadius),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                  decoration: NeonDecorations.button(
                    accent: mode.accentColor,
                    filled: isSelected,
                  ),
                  child: Column(
                    children: [
                      Icon(
                        mode.icon,
                        size: 22,
                        color: isSelected
                            ? mode.accentColor
                            : AppColors.textMuted,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        mode.label,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.2,
                          color: isSelected
                              ? mode.accentColor
                              : AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        mode.subtitle,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.inter(
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          height: 1.25,
                          color: isSelected
                              ? AppColors.textSecondary
                              : AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
