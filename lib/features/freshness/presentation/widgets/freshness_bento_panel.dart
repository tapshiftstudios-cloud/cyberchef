import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/app_locale.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/l10n/pantry_name_localizer.dart';
import '../../../../core/navigation/app_navigator.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../../../core/utils/pantry_item_utils.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../../../pantry/domain/models/pantry_item.dart';
import '../../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../../../services/freshness_notification_service.dart';
import '../../../savings/presentation/mark_meal_made.dart';
import '../../../savings/presentation/widgets/savings_bento_panel.dart';
import '../freshness_recipe_flow.dart';

/// Tazelik Paneli — bento grid ile aciliyet grupları.
class FreshnessBentoPanel extends ConsumerWidget {
  const FreshnessBentoPanel({super.key, this.compact = false});

  /// Sekme içindeyken "Tümünü gör" gizlenir.
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final locale = ref.read(localeProvider);
    final itemsAsync = ref.watch(pantryItemsProvider);

    ref.listen(pantryItemsProvider, (_, next) {
      next.whenData(
        (items) =>
            FreshnessNotificationService.instance.refreshFromItems(items),
      );
    });

    return itemsAsync.when(
      loading: () => const _FreshnessSkeleton(),
      error: (_, __) => const SizedBox.shrink(),
      data: (items) {
        if (items.isEmpty) {
          return _EmptyFreshnessCard();
        }

        final critical = items
            .where((e) => e.urgency == FreshnessUrgency.critical)
            .toList();
        final warning = items
            .where((e) => e.urgency == FreshnessUrgency.warning)
            .toList();
        final safe =
            items.where((e) => e.urgency == FreshnessUrgency.safe).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SavingsBentoPanel(),
            Row(
              children: [
                Text(
                  AppStrings.productCount(items.length),
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: AppColors.textMuted,
                  ),
                ),
                const Spacer(),
                if (!compact)
                  TextButton(
                    onPressed: () => AppNavigator.pushFreshnessList(context),
                    child: Text(
                      AppStrings.freshnessViewAll,
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => startFreshnessRecipeFlow(context, ref),
                icon: Icon(Icons.soup_kitchen_outlined, size: 18),
                label: Text(AppStrings.cookToday),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  side: BorderSide(color: AppColors.border),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 132,
              child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: critical.isNotEmpty ? 5 : 3,
                    child: _UrgencyBentoCard(
                      title: AppStrings.freshnessCritical,
                      emoji: '🔴',
                      accent: const Color(0xFFE85D5D),
                      items: critical,
                      locale: locale,
                      onMealMade: (item) =>
                          confirmAndMarkMealMade(context, ref, item),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: _UrgencyBentoCard(
                            title: AppStrings.freshnessWarning,
                            emoji: '🟡',
                            accent: const Color(0xFFE8B339),
                            items: warning,
                            compact: true,
                            locale: locale,
                            onMealMade: (item) =>
                                confirmAndMarkMealMade(context, ref, item),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Expanded(
                          child: _UrgencyBentoCard(
                            title: AppStrings.freshnessSafe,
                            emoji: '🟢',
                            accent: AppColors.primary,
                            items: safe,
                            compact: true,
                            locale: locale,
                            onMealMade: (item) =>
                                confirmAndMarkMealMade(context, ref, item),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ),
          ],
        );
      },
    );
  }
}

class _EmptyFreshnessCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: NeonDecorations.card(),
      child: Row(
        children: [
          Icon(Icons.inventory_2_outlined, color: AppColors.textMuted),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              AppStrings.freshnessEmpty,
              style: GoogleFonts.inter(
                fontSize: 13,
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

class _UrgencyBentoCard extends StatelessWidget {
  const _UrgencyBentoCard({
    required this.title,
    required this.emoji,
    required this.accent,
    required this.items,
    required this.onMealMade,
    required this.locale,
    this.compact = false,
  });

  final String title;
  final String emoji;
  final Color accent;
  final List<PantryItem> items;
  final void Function(PantryItem item) onMealMade;
  final AppLocale locale;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: NeonDecorations.card(accent: accent).copyWith(
        border: Border.all(color: accent.withValues(alpha: 0.35)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 14)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: compact ? 11 : 12,
                    fontWeight: FontWeight.w600,
                    color: accent,
                  ),
                ),
              ),
              Text(
                '${items.length}',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (items.isEmpty)
            Expanded(
              child: Center(
                child: Text(
                  '—',
                  style: GoogleFonts.inter(
                    color: AppColors.textMuted,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items.length.clamp(0, compact ? 3 : 6),
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final item = items[index];
                  final days = item.daysRemaining();
                  return _ItemChip(
                    item: item,
                    days: days,
                    compact: compact,
                    locale: locale,
                    onMealMade: () => onMealMade(item),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _ItemChip extends StatelessWidget {
  const _ItemChip({
    required this.item,
    required this.days,
    required this.onMealMade,
    required this.locale,
    this.compact = false,
  });

  final PantryItem item;
  final int days;
  final VoidCallback onMealMade;
  final AppLocale locale;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceElevated,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onMealMade,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 8 : 10,
            vertical: compact ? 6 : 8,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      PantryNameLocalizer.productName(item.cleanName, locale),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.inter(
                        fontSize: compact ? 11 : 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    if (!compact && item.quantity != null)
                      Text(
                        item.quantity!,
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          color: AppColors.textMuted,
                        ),
                      ),
                  ],
                ),
              ),
              Text(
                PantryItemUtils.formatDaysLabel(item),
                style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(width: 4),
              Icon(
                Icons.check_circle_outline,
                size: compact ? 16 : 18,
                color: AppColors.primary.withValues(alpha: 0.85),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FreshnessSkeleton extends StatelessWidget {
  const _FreshnessSkeleton();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 14,
          width: 120,
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 140,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  decoration: NeonDecorations.card(),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Expanded(child: Container(decoration: NeonDecorations.card())),
                    const SizedBox(height: 8),
                    Expanded(child: Container(decoration: NeonDecorations.card())),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


