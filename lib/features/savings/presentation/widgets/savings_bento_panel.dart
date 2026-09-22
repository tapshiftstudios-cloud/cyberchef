import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/navigation/app_navigator.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../providers/waste_savings_provider.dart';
import '../utils/savings_format.dart';

/// Bento üstü — aylık tasarruf özeti.
class SavingsBentoPanel extends ConsumerWidget {
  const SavingsBentoPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final summaryAsync = ref.watch(wasteSavingsSummaryProvider);

    return summaryAsync.when(
      loading: () => const SizedBox(height: 4),
      error: (_, __) => const SizedBox.shrink(),
      data: (summary) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => AppNavigator.pushSavingsDashboard(context),
              borderRadius: BorderRadius.circular(NeonDecorations.cardRadius),
              child: Ink(
                decoration: NeonDecorations.card(
                  accent: AppColors.primary,
                ).copyWith(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withValues(alpha: 0.12),
                      AppColors.surface,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.savings_outlined,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              AppStrings.savingsPanelTitle,
                              style: GoogleFonts.inter(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: AppColors.textMuted,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _StatCell(
                              label: AppStrings.savingsStatItems,
                              value: summary.hasAnyData
                                  ? '${summary.itemsRescuedThisMonth}'
                                  : '0',
                            ),
                          ),
                          _divider(),
                          Expanded(
                            child: _StatCell(
                              label: AppStrings.savingsStatWaste,
                              value: summary.hasAnyData
                                  ? SavingsFormat.kg(summary.totalKgThisMonth)
                                  : SavingsFormat.kg(0),
                            ),
                          ),
                          _divider(),
                          Expanded(
                            child: _StatCell(
                              label: AppStrings.savingsStatMoney,
                              value: summary.hasAnyData
                                  ? SavingsFormat.money(
                                      summary.totalMoneyThisMonth,
                                      summary.currencyCode,
                                    )
                                  : SavingsFormat.money(
                                      0,
                                      summary.currencyCode,
                                    ),
                              highlight: true,
                            ),
                          ),
                        ],
                      ),
                      if (!summary.hasAnyData) ...[
                        const SizedBox(height: 8),
                        Text(
                          AppStrings.savingsPanelEmptyHint,
                          style: GoogleFonts.inter(
                            fontSize: 11,
                            height: 1.35,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _divider() => Container(
        width: 1,
        height: 36,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        color: AppColors.border,
      );
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.label,
    required this.value,
    this.highlight = false,
  });

  final String label;
  final String value;
  final bool highlight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: highlight ? 15 : 14,
            fontWeight: FontWeight.w800,
            color: highlight ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: GoogleFonts.inter(
            fontSize: 10,
            height: 1.2,
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
