import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/app_theme_variant.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_color_palette.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';

Future<AppThemeVariant?> showThemePickerSheet(
  BuildContext context, {
  required AppThemeVariant current,
}) {
  return showModalBottomSheet<AppThemeVariant>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (ctx) {
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.border,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.themeTitle,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                AppStrings.themeSubtitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 20),
              ...AppThemeVariant.values.map((variant) {
                final p = variant.palette;
                final selected = variant == current;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => Navigator.pop(ctx, variant),
                      borderRadius:
                          BorderRadius.circular(NeonDecorations.cardRadius),
                      child: Ink(
                        decoration: NeonDecorations.button(
                          accent: p.primary,
                          filled: selected,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14),
                          child: Row(
                            children: [
                              _ThemePreview(palette: p),
                              const SizedBox(width: 14),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      variant.label,
                                      style: GoogleFonts.inter(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15,
                                        color: selected
                                            ? p.primary
                                            : AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      variant.subtitle,
                                      style: GoogleFonts.inter(
                                        fontSize: 12,
                                        color: AppColors.textMuted,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (selected)
                                Icon(Icons.check_circle, color: p.primary)
                              else
                                Icon(
                                  Icons.circle_outlined,
                                  color: AppColors.border,
                                  size: 22,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      );
    },
  );
}

class _ThemePreview extends StatelessWidget {
  const _ThemePreview({required this.palette});

  final AppColorPalette palette;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(child: ColoredBox(color: palette.background)),
                Expanded(child: ColoredBox(color: palette.surface)),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(child: ColoredBox(color: palette.primary)),
                Expanded(child: ColoredBox(color: palette.secondary)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
