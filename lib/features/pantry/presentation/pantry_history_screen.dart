import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/enums/camera_capture_type.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/scan_tab_navigation.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../core/theme/neon_decorations.dart';
import 'providers/pantry_provider.dart';

String _formatTimestamp(DateTime dt) {
  final month = dt.month.toString().padLeft(2, '0');
  final day = dt.day.toString().padLeft(2, '0');
  final hour = dt.hour.toString().padLeft(2, '0');
  final minute = dt.minute.toString().padLeft(2, '0');
  return '${dt.year}-$month-$day $hour:$minute';
}

class PantryHistoryScreen extends ConsumerWidget {
  const PantryHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final historyAsync = ref.watch(pantryHistoryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.pantryHistoryTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () => ref.read(pantryHistoryProvider.notifier).refresh(),
          ),
        ],
      ),
      body: historyAsync.when(
        data: (scans) {
          if (scans.isEmpty) {
            return EmptyStateCard(
              icon: Icons.history,
              message: AppStrings.pantryHistoryEmpty,
              actionLabel: AppStrings.emptyStateStartScan,
              onAction: () {
                Navigator.of(context).pop();
                openScanTab(ref, captureType: CameraCaptureType.fridge);
              },
            );
          }

          return RefreshIndicator(
            color: AppColors.primary,
            onRefresh: () => ref.read(pantryHistoryProvider.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: scans.length,
              itemBuilder: (context, index) {
                final scan = scans[index];
                final date = _formatTimestamp(scan.createdAt);

                return Dismissible(
                  key: ValueKey(scan.id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.12),
                      borderRadius:
                          BorderRadius.circular(NeonDecorations.cardRadius),
                    ),
                    child: Icon(Icons.delete_outline, color: AppColors.error),
                  ),
                  onDismissed: (_) {
                    ref.read(pantryHistoryProvider.notifier).deleteScan(scan.id);
                  },
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () => AppNavigator.pushRecipesResults(
                        context,
                        result: scan.analysis,
                        mode: scan.mode,
                      ),
                      borderRadius:
                          BorderRadius.circular(NeonDecorations.cardRadius),
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(20),
                        decoration: NeonDecorations.card(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  scan.mode.label,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: scan.mode.accentColor,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  date,
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              AppStrings.pantryHistorySummary(
                                scan.ingredients.length,
                                scan.recipes.length,
                              ),
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            if (scan.ingredients.isNotEmpty) ...[
                              const SizedBox(height: 10),
                              Text(
                                scan.ingredients.take(4).join(', ') +
                                    (scan.ingredients.length > 4 ? '…' : ''),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              AppStrings.genericLoadError,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                color: AppColors.error,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

