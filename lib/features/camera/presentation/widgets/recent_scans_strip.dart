import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/l10n/l10n_format.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../../../pantry/domain/recent_scan.dart';
import '../../../pantry/presentation/providers/recent_scans_provider.dart';
import '../../../recipes/presentation/recipes_results_screen.dart';

class RecentScansStrip extends ConsumerWidget {
  const RecentScansStrip({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final recentAsync = ref.watch(recentScansProvider);

    return recentAsync.when(
      data: (scans) {
        if (scans.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppStrings.recentScansTitle,
              style: GoogleFonts.inter(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.2,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 88,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: scans.length,
                separatorBuilder: (_, __) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final scan = scans[index];
                  return _RecentScanCard(
                    scan: scan,
                    timeLabel: L10nFormat.timeAgo(scan.scannedAt),
                    onTap: () {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute<void>(
                          builder: (_) => RecipesResultsScreen(
                            result: scan.analysis,
                            mode: scan.mode,
                          ),
                        ),
                      );
                    },
                    onDismiss: () => ref
                        .read(recentScansProvider.notifier)
                        .remove(scan.id),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _RecentScanCard extends StatelessWidget {
  const _RecentScanCard({
    required this.scan,
    required this.timeLabel,
    required this.onTap,
    required this.onDismiss,
  });

  final RecentScan scan;
  final String timeLabel;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
        child: Ink(
          width: 200,
          decoration: NeonDecorations.card(
            radius: NeonDecorations.controlRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        scan.mode.label,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: scan.mode.accentColor,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onDismiss,
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Expanded(
                  child: Text(
                    scan.headline,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                      height: 1.25,
                    ),
                  ),
                ),
                Text(
                  timeLabel,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.textMuted,
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

