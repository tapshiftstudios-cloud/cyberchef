import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/l10n/l10n_format.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../pantry/domain/models/pantry_item.dart';

/// SKT tarihine göre aylık takvim görünümü.
class FreshnessCalendarView extends StatefulWidget {
  const FreshnessCalendarView({super.key, required this.items});

  final List<PantryItem> items;

  @override
  State<FreshnessCalendarView> createState() => _FreshnessCalendarViewState();
}

class _FreshnessCalendarViewState extends State<FreshnessCalendarView> {
  late DateTime _focusedMonth;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _focusedMonth = DateTime(now.year, now.month);
  }

  Map<DateTime, List<PantryItem>> _groupByExpiryDay() {
    final map = <DateTime, List<PantryItem>>{};
    for (final item in widget.items) {
      if (item.isConsumed) continue;
      final d = item.expiryDate;
      final key = DateTime(d.year, d.month, d.day);
      map.putIfAbsent(key, () => []).add(item);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final byDay = _groupByExpiryDay();
    final activeCount = widget.items.where((e) => !e.isConsumed).length;
    final today = DateTime.now();
    final todayKey = DateTime(today.year, today.month, today.day);
    final weekItems = widget.items
        .where((e) => !e.isConsumed)
        .where((e) {
          final days = e.daysRemaining(today);
          return days >= 0 && days <= 6;
        })
        .toList()
      ..sort((a, b) => a.daysRemaining(today).compareTo(b.daysRemaining(today)));
    if (activeCount == 0) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: NeonDecorations.card(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.calendar_month_outlined,
                  color: AppColors.textMuted,
                  size: 28,
                ),
                const SizedBox(height: 10),
                Text(
                  L10nFormat.calendarMonthFull(_focusedMonth.month),
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  AppStrings.freshnessEmpty,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    height: 1.4,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    final daysInMonth =
        DateTime(_focusedMonth.year, _focusedMonth.month + 1, 0).day;
    final firstWeekday =
        DateTime(_focusedMonth.year, _focusedMonth.month, 1).weekday;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month - 1,
                  );
                }),
              ),
              Text(
                '${L10nFormat.calendarMonthFull(_focusedMonth.month)} ${_focusedMonth.year}',
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: Icon(Icons.chevron_right),
                onPressed: () => setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month + 1,
                  );
                }),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              7,
              (i) => Text(
                L10nFormat.weekdayShort(i + 1),
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 1,
            ),
            itemCount: firstWeekday - 1 + daysInMonth,
            itemBuilder: (context, index) {
              if (index < firstWeekday - 1) return const SizedBox.shrink();
              final day = index - (firstWeekday - 1) + 1;
              final date = DateTime(
                _focusedMonth.year,
                _focusedMonth.month,
                day,
              );
              final dayItems = byDay[date] ?? [];
              final hasCritical = dayItems.any(
                (e) => e.urgency == FreshnessUrgency.critical,
              );
              final hasWarning = dayItems.any(
                (e) => e.urgency == FreshnessUrgency.warning,
              );
              final isToday = date == todayKey;
              final dotColor = hasCritical
                  ? const Color(0xFFE85D5D)
                  : hasWarning
                      ? const Color(0xFFE8B339)
                      : AppColors.primary;

              return InkWell(
                onTap: dayItems.isEmpty
                    ? null
                    : () => _showDaySheet(context, date, dayItems),
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: NeonDecorations.card(
                    accent: dayItems.isEmpty ? AppColors.border : dotColor,
                  ).copyWith(
                    border: Border.all(
                      color: isToday ? AppColors.primary : AppColors.border,
                      width: isToday ? 1.4 : 1,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$day',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color:
                              isToday ? AppColors.primary : AppColors.textPrimary,
                        ),
                      ),
                      if (dayItems.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: dotColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 4),
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Container(
              decoration: NeonDecorations.card(),
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.freshnessCriticalBanner,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: weekItems.isEmpty
                        ? Center(
                            child: Text(
                              AppStrings.cookTodayNoUrgent,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: AppColors.textMuted,
                              ),
                            ),
                          )
                        : ListView.separated(
                            itemCount: weekItems.length.clamp(0, 6),
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 6),
                            itemBuilder: (context, index) {
                              final item = weekItems[index];
                              final days = item.daysRemaining(today);
                              return Row(
                                children: [
                                  Container(
                                    width: 6,
                                    height: 6,
                                    decoration: BoxDecoration(
                                      color: item.urgency == FreshnessUrgency.critical
                                          ? const Color(0xFFE85D5D)
                                          : const Color(0xFFE8B339),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      item.cleanName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.inter(fontSize: 12),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    L10nFormat.formatDaysLabel(days),
                                    style: GoogleFonts.inter(
                                      fontSize: 11,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showDaySheet(
    BuildContext context,
    DateTime date,
    List<PantryItem> items,
  ) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${date.day}.${date.month}.${date.year}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              ...items.map(
                (e) => Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(e.cleanName),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

