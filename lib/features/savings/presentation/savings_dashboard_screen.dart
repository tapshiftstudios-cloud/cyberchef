import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/enums/app_locale.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/l10n/pantry_name_localizer.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../domain/savings_currency.dart';
import 'providers/waste_savings_provider.dart';
import 'utils/savings_format.dart';
import '../domain/models/waste_savings_event.dart';
import '../domain/waste_savings_estimator.dart';

class SavingsDashboardScreen extends ConsumerWidget {
  const SavingsDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final uiLocale = AppStrings.currentLocale;
    final displayCurrencyCode = SavingsCurrency.codeForLocale(uiLocale);
    final summaryAsync = ref.watch(wasteSavingsSummaryProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.savingsDashboardTitle,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      body: summaryAsync.when(
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (_, __) => Center(child: Text(AppStrings.genericLoadError)),
        data: (summary) {
          final maxBar = summary.weeklyTrend
              .map((b) => b.itemCount)
              .fold<int>(0, (a, b) => a > b ? a : b);

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
            children: [
              Text(
                AppStrings.savingsDashboardSubtitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  height: 1.45,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 16),
              _HeroCard(
                summary: summary,
                displayCurrencyCode: displayCurrencyCode,
              ),
              const SizedBox(height: 16),
              Text(
                AppStrings.savingsTrendTitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 140,
                padding: const EdgeInsets.all(16),
                decoration: NeonDecorations.card(),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: summary.weeklyTrend.map((bucket) {
                    final count = bucket.itemCount;
                    final heightFactor =
                        maxBar == 0 ? 0.08 : (count / maxBar).clamp(0.08, 1.0);
                    return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '$count',
                              style: GoogleFonts.inter(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: FractionallySizedBox(
                                  heightFactor: heightFactor,
                                  widthFactor: 0.55,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary.withValues(
                                        alpha: 0.85,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              SavingsFormat.weekLabel(
                                bucket.weekStart,
                                uiLocale,
                              ),
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                AppStrings.savingsRecentTitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 8),
              if (summary.recentEvents.isEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: NeonDecorations.card(),
                  child: Text(
                    AppStrings.savingsEmptySubtitle,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                )
              else
                ...summary.recentEvents.map(
                  (e) => _RecentEventTile(
                    event: e,
                    locale: uiLocale,
                  ),
                ),
              const SizedBox(height: 12),
              if (AppStrings.pantryNamesLocaleNote.isNotEmpty)
                Text(
                  AppStrings.pantryNamesLocaleNote,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    height: 1.4,
                    color: AppColors.textMuted,
                  ),
                ),
              if (AppStrings.pantryNamesLocaleNote.isNotEmpty)
                const SizedBox(height: 8),
              Text(
                AppStrings.savingsHowItWorks,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  height: 1.45,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeroCard extends StatelessWidget {
  const _HeroCard({
    required this.summary,
    required this.displayCurrencyCode,
  });

  final WasteSavingsSummary summary;
  final String displayCurrencyCode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: NeonDecorations.card(accent: AppColors.primary).copyWith(
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.35),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppStrings.savingsItemsThisMonth(summary.itemsRescuedThisMonth),
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _HeroMetric(
                  icon: Icons.eco_outlined,
                  label: AppStrings.savingsKgPrevented(
                    SavingsFormat.kg(summary.totalKgThisMonth),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _HeroMetric(
                  icon: Icons.payments_outlined,
                  label: AppStrings.savingsFinancialGain(
                    SavingsFormat.money(
                      summary.totalMoneyThisMonth,
                      displayCurrencyCode,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeroMetric extends StatelessWidget {
  const _HeroMetric({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: AppColors.primary),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              height: 1.35,
              fontWeight: FontWeight.w600,
              color: AppColors.textSecondary,
            ),
          ),
        ),
      ],
    );
  }
}

class _RecentEventTile extends StatelessWidget {
  const _RecentEventTile({
    required this.event,
    required this.locale,
  });

  final WasteSavingsEvent event;
  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: NeonDecorations.card(),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.check, size: 18, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PantryNameLocalizer.productName(event.itemName, locale),
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  AppStrings.savingsRescuedDaysLeft(event.daysRemainingAtRescue),
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          ),
          Text(
            SavingsFormat.money(
              WasteSavingsEstimator.displayMoneyForEvent(event, locale),
              WasteSavingsEstimator.displayCurrencyForEvent(event, locale),
            ),
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
