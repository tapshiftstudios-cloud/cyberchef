import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/enums/camera_capture_type.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/navigation/scan_tab_navigation.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../core/l10n/l10n_format.dart';
import '../../../core/l10n/pantry_name_localizer.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../../core/utils/pantry_item_utils.dart';
import '../../pantry/domain/models/pantry_item.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../savings/presentation/utils/show_rescue_snackbar.dart';
import 'widgets/freshness_bento_panel.dart';
import 'freshness_calendar_view.dart';
import 'freshness_recipe_flow.dart';
import '../../../core/providers/subscription_tier_provider.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/widgets/ad_banner_slot.dart';

enum FreshnessFilter { all, critical, warning, safe }

enum FreshnessViewMode { list, calendar }

class FreshnessListScreen extends ConsumerStatefulWidget {
  const FreshnessListScreen({super.key, this.inTab = false});

  /// Alt sekmede gösterildiğinde üst başlık sadeleştirilir.
  final bool inTab;

  @override
  ConsumerState<FreshnessListScreen> createState() =>
      _FreshnessListScreenState();
}

class _FreshnessListScreenState extends ConsumerState<FreshnessListScreen> {
  FreshnessFilter _filter = FreshnessFilter.all;
  String _category = '';
  String _search = '';
  FreshnessViewMode _viewMode = FreshnessViewMode.list;

  List<PantryItem> _applyFilters(List<PantryItem> items) {
    var list = items;
    switch (_filter) {
      case FreshnessFilter.critical:
        list = list.where((e) => e.urgency == FreshnessUrgency.critical).toList();
        break;
      case FreshnessFilter.warning:
        list = list.where((e) => e.urgency == FreshnessUrgency.warning).toList();
        break;
      case FreshnessFilter.safe:
        list = list.where((e) => e.urgency == FreshnessUrgency.safe).toList();
        break;
      case FreshnessFilter.all:
        break;
    }
    final allLabel = AppStrings.filterAll;
    if (_category.isNotEmpty && _category != allLabel) {
      list = list.where((e) => e.category == _category).toList();
    }
    final q = _search.trim().toLowerCase();
    if (q.isNotEmpty) {
      list = list
          .where(
            (e) =>
                e.cleanName.toLowerCase().contains(q) ||
                e.category.toLowerCase().contains(q),
          )
          .toList();
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    final itemsAsync = ref.watch(pantryItemsProvider);
    final notifier = ref.read(pantryItemsProvider.notifier);
    final showAds = ref.watch(showAdsProvider).valueOrNull ?? true;

    return Scaffold(
      appBar: widget.inTab
          ? null
          : AppBar(
              title: Text(
                AppStrings.freshnessListTitle,
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
              ),
              actions: [
                IconButton(
                  tooltip: AppStrings.unifiedPantryTitle,
                  icon: Icon(Icons.hub_outlined),
                  onPressed: () => AppNavigator.pushUnifiedPantry(context),
                ),
                IconButton(
                  tooltip: AppStrings.tooltipSettings,
                  icon: Icon(Icons.settings_outlined),
                  onPressed: () => AppNavigator.pushSettings(context),
                ),
              ],
            ),
      body: Column(
        children: [
          Expanded(
            child: _wrapTabBody(
              itemsAsync.when(
        loading: () => Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.genericLoadError,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(color: AppColors.error),
              ),
              const SizedBox(height: 16),
              IconButton.filled(
                onPressed: () => ref.invalidate(pantryItemsProvider),
                tooltip: AppStrings.genericLoadError,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyStateCard(
              icon: Icons.inventory_2_outlined,
              message: AppStrings.freshnessEmpty,
              actionLabel: AppStrings.emptyStateScanReceipt,
              onAction: () => openScanTab(
                ref,
                captureType: CameraCaptureType.receipt,
              ),
            );
          }

          final summary = notifier.weeklySummary(items);
          final allLabel = AppStrings.filterAll;
          final categories = {
            allLabel,
            ...items.map((e) => e.category),
          }.toList();
          if (_category.isEmpty || !categories.contains(_category)) {
            _category = allLabel;
          }
          final filtered = _applyFilters(items);

          if (_viewMode == FreshnessViewMode.calendar) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._headerWidgets(
                    items: items,
                    summary: summary,
                    categories: categories,
                    allLabel: allLabel,
                    includeFilters: false,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.65,
                    child: FreshnessCalendarView(items: items),
                  ),
                ],
              ),
            );
          }

          return CustomScrollView(
            slivers: [
              ..._headerSlivers(
                items: items,
                summary: summary,
                categories: categories,
                allLabel: allLabel,
              ),
              if (filtered.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(
                    child: Text(
                      AppStrings.freshnessListEmpty,
                      style: GoogleFonts.inter(color: AppColors.textMuted),
                    ),
                  ),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = filtered[index];
                        return Dismissible(
                          key: ValueKey(item.id),
                          direction: DismissDirection.endToStart,
                          background: Container(
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20),
                            margin: const EdgeInsets.only(bottom: 8),
                            decoration: BoxDecoration(
                              color: AppColors.primary.withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(
                                NeonDecorations.cardRadius,
                              ),
                            ),
                            child: Icon(Icons.check, color: AppColors.primary),
                          ),
                          onDismissed: (_) {
                            ref
                                .read(pantryItemsProvider.notifier)
                                .markConsumed(item.id)
                                .then((event) {
                              if (!context.mounted || event == null) return;
                              showRescueSnackBar(context, ref, event);
                            });
                          },
                          child: _FreshnessListTile(item: item),
                        );
                      },
                      childCount: filtered.length,
                    ),
                  ),
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
                  child: Column(
                    children: [
                      OutlinedButton.icon(
                        onPressed: freshnessItemsForRecipes(items).isEmpty
                            ? null
                            : () => startFreshnessRecipeFlow(context, ref),
                        icon: Icon(Icons.soup_kitchen_outlined),
                        label: Text(AppStrings.cookToday),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: BorderSide(color: AppColors.border),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
            ),
          ),
          if (widget.inTab) AdBannerSlot(show: showAds),
        ],
      ),
    );
  }

  Widget _wrapTabBody(Widget child) {
    if (!widget.inTab) return child;
    return SafeArea(bottom: false, child: child);
  }

  List<Widget> _headerSlivers({
    required List<PantryItem> items,
    required FreshnessWeeklySummary summary,
    required List<String> categories,
    required String allLabel,
  }) {
    return [
      if (widget.inTab)
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
          sliver: SliverToBoxAdapter(
            child: FreshnessBentoPanel(compact: true),
          ),
        ),
      if (summary.atRisk > 0)
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: NeonDecorations.card(),
              child: Text(
                AppStrings.freshnessWeeklySummary(
                  summary.critical,
                  summary.warning,
                ),
                style: GoogleFonts.inter(
                  fontSize: 13,
                  height: 1.4,
                  color: AppColors.textSecondary,
                ),
              ),
            ),
          ),
        ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        sliver: SliverToBoxAdapter(
          child: TextField(
            decoration: InputDecoration(
              hintText: AppStrings.searchHint,
              prefixIcon: Icon(Icons.search, size: 20),
              isDense: true,
              filled: true,
              fillColor: AppColors.surface,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (v) => setState(() => _search = v),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        sliver: SliverToBoxAdapter(
          child: SegmentedButton<FreshnessViewMode>(
            segments: [
              ButtonSegment(
                value: FreshnessViewMode.list,
                label: Text(AppStrings.freshnessViewList),
                icon: Icon(Icons.list, size: 18),
              ),
              ButtonSegment(
                value: FreshnessViewMode.calendar,
                label: Text(AppStrings.freshnessViewCalendar),
                icon: Icon(Icons.calendar_month, size: 18),
              ),
            ],
            selected: {_viewMode},
            onSelectionChanged: (s) => setState(() => _viewMode = s.first),
          ),
        ),
      ),
      if (_viewMode == FreshnessViewMode.list) ...[
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          sliver: SliverToBoxAdapter(
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: FreshnessFilter.values.map((f) {
                final selected = _filter == f;
                return FilterChip(
                  label: Text(_filterLabel(f)),
                  selected: selected,
                  onSelected: (_) => setState(() => _filter = f),
                  selectedColor: AppColors.primary.withValues(alpha: 0.2),
                  checkmarkColor: AppColors.primary,
                );
              }).toList(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: categories.map((c) {
                final selected = _category == c;
                return Padding(
                  padding: const EdgeInsets.only(right: 8, top: 8),
                  child: ChoiceChip(
                    label: Text(
                      c == allLabel ? c : L10nFormat.localizeCategory(c),
                      style: const TextStyle(fontSize: 12),
                    ),
                    selected: selected,
                    onSelected: (_) => setState(() => _category = c),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    ];
  }

  List<Widget> _headerWidgets({
    required List<PantryItem> items,
    required FreshnessWeeklySummary summary,
    required List<String> categories,
    required String allLabel,
    required bool includeFilters,
  }) {
    return [
      if (widget.inTab)
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: FreshnessBentoPanel(compact: true),
        ),
      if (summary.atRisk > 0)
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: NeonDecorations.card(),
            child: Text(
              AppStrings.freshnessWeeklySummary(
                summary.critical,
                summary.warning,
              ),
              style: GoogleFonts.inter(
                fontSize: 13,
                height: 1.4,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: TextField(
          decoration: InputDecoration(
            hintText: AppStrings.searchHint,
            prefixIcon: Icon(Icons.search, size: 20),
            isDense: true,
            filled: true,
            fillColor: AppColors.surface,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          onChanged: (v) => setState(() => _search = v),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: SegmentedButton<FreshnessViewMode>(
          segments: [
            ButtonSegment(
              value: FreshnessViewMode.list,
              label: Text(AppStrings.freshnessViewList),
              icon: Icon(Icons.list, size: 18),
            ),
            ButtonSegment(
              value: FreshnessViewMode.calendar,
              label: Text(AppStrings.freshnessViewCalendar),
              icon: Icon(Icons.calendar_month, size: 18),
            ),
          ],
          selected: {_viewMode},
          onSelectionChanged: (s) => setState(() => _viewMode = s.first),
        ),
      ),
      if (includeFilters) ...[
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: FreshnessFilter.values.map((f) {
              final selected = _filter == f;
              return FilterChip(
                label: Text(_filterLabel(f)),
                selected: selected,
                onSelected: (_) => setState(() => _filter = f),
                selectedColor: AppColors.primary.withValues(alpha: 0.2),
                checkmarkColor: AppColors.primary,
              );
            }).toList(),
          ),
        ),
        SizedBox(
          height: 44,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: categories.map((c) {
              final selected = _category == c;
              return Padding(
                padding: const EdgeInsets.only(right: 8, top: 8),
                child: ChoiceChip(
                  label: Text(
                    c == allLabel ? c : L10nFormat.localizeCategory(c),
                    style: const TextStyle(fontSize: 12),
                  ),
                  selected: selected,
                  onSelected: (_) => setState(() => _category = c),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    ];
  }

  String _filterLabel(FreshnessFilter f) => switch (f) {
        FreshnessFilter.all => AppStrings.filterAll,
        FreshnessFilter.critical => AppStrings.filterCritical,
        FreshnessFilter.warning => AppStrings.filterWarning,
        FreshnessFilter.safe => AppStrings.filterSafe,
      };
}

class _FreshnessListTile extends ConsumerWidget {
  const _FreshnessListTile({required this.item});

  final PantryItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final locale = ref.read(localeProvider);
    final urgencyColor = switch (item.urgency) {
      FreshnessUrgency.critical => const Color(0xFFE85D5D),
      FreshnessUrgency.warning => const Color(0xFFE8B339),
      FreshnessUrgency.safe => AppColors.primary,
      FreshnessUrgency.consumed => AppColors.textMuted,
    };

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: NeonDecorations.card(accent: urgencyColor),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 44,
            decoration: BoxDecoration(
              color: urgencyColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        PantryNameLocalizer.productName(item.cleanName, locale),
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    if (item.isLowConfidence)
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 18,
                        color: Color(0xFFE8B339),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${L10nFormat.localizeCategory(item.category)} · ${PantryItemUtils.formatDaysLabel(item)} · ${AppStrings.expiryDatePrefix} ${PantryItemUtils.formatExpiryDate(item)}',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                ),
                if (item.storeName != null)
                  Text(
                    PantryNameLocalizer.storeName(item.storeName!, locale),
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: AppColors.textMuted,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


