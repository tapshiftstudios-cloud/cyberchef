import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/l10n/l10n_format.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../data/unified_pantry_service.dart';
import '../domain/models/unified_pantry_entry.dart';
import 'providers/pantry_items_provider.dart';
import 'providers/recent_scans_provider.dart';

class UnifiedPantryScreen extends ConsumerStatefulWidget {
  const UnifiedPantryScreen({super.key});

  @override
  ConsumerState<UnifiedPantryScreen> createState() =>
      _UnifiedPantryScreenState();
}

class _UnifiedPantryScreenState extends ConsumerState<UnifiedPantryScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    final items = ref.watch(pantryItemsProvider).valueOrNull ?? [];
    final scans = ref.watch(recentScansProvider).valueOrNull ?? [];
    final unified = UnifiedPantryService.build(
      receiptItems: items,
      recentScans: scans,
    );
    final q = _query.trim().toLowerCase();
    final filtered = q.isEmpty
        ? unified
        : unified.where((e) => e.name.toLowerCase().contains(q)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.unifiedPantryTitle,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.searchHint,
                prefixIcon: Icon(Icons.search, size: 20),
                filled: true,
                fillColor: AppColors.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? Center(
                    child: Text(
                      AppStrings.unifiedPantryEmpty,
                      style: GoogleFonts.inter(color: AppColors.textMuted),
                    ),
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (context, index) {
                      final e = filtered[index];
                      return _UnifiedTile(entry: e);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _UnifiedTile extends StatelessWidget {
  const _UnifiedTile({required this.entry});

  final UnifiedPantryEntry entry;

  @override
  Widget build(BuildContext context) {
    final categoryLabel = entry.category != null && entry.category!.isNotEmpty
        ? L10nFormat.localizeCategory(entry.category!)
        : '';
    final subtitle = switch (entry.source) {
      PantryEntrySource.receipt =>
        entry.daysRemaining != null
            ? (categoryLabel.isNotEmpty
                ? '$categoryLabel · ${AppStrings.unifiedDaysRemaining(entry.daysRemaining!)}'
                : AppStrings.unifiedDaysRemaining(entry.daysRemaining!))
            : categoryLabel,
      PantryEntrySource.fridgeScan =>
        AppStrings.unifiedLastScan(_formatDate(entry.scanDate)),
    };

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: NeonDecorations.card(),
      child: Row(
        children: [
          Icon(
            entry.source == PantryEntrySource.receipt
                ? Icons.receipt_long_outlined
                : Icons.kitchen_outlined,
            color: AppColors.primary,
            size: 22,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                ),
                Text(
                  '${entry.sourceLabel} · $subtitle',
                  style: GoogleFonts.inter(
                    fontSize: 11,
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

  static String _formatDate(DateTime? d) {
    if (d == null) return '—';
    return '${d.day}.${d.month}.${d.year}';
  }
}

