import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../../../pantry/domain/models/pantry_item.dart';
import '../../../pantry/presentation/providers/pantry_items_provider.dart';

/// Kritik tazelik ürünleri için uygulama içi uyarı şeridi.
class FreshnessCriticalBanner extends ConsumerWidget {
  const FreshnessCriticalBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    final items = ref.watch(pantryItemsProvider).valueOrNull ?? [];
    final critical = items
        .where((e) => e.urgency == FreshnessUrgency.critical)
        .toList();
    if (critical.isEmpty) return const SizedBox.shrink();

    final names = critical.take(3).map((e) => e.cleanName).join(', ');
    final extra = critical.length > 3 ? ' +${critical.length - 3}' : '';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: NeonDecorations.card().copyWith(
        border: Border.all(color: const Color(0xFFE85D5D).withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          const Text('🔴', style: TextStyle(fontSize: 16)),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '${AppStrings.freshnessCriticalBanner}: $names$extra',
              style: GoogleFonts.inter(
                fontSize: 12,
                height: 1.35,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
