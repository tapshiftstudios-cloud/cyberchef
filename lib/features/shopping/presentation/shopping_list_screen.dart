import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/providers/main_shell_tab_provider.dart';
import '../../../core/providers/subscription_tier_provider.dart';
import '../../../core/widgets/empty_state_card.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../../core/widgets/ad_banner_slot.dart';
import '../../../core/providers/user_preferences_provider.dart';
import 'providers/shopping_list_provider.dart';

class ShoppingListScreen extends ConsumerStatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  ConsumerState<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends ConsumerState<ShoppingListScreen> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _add() async {
    await ref.read(shoppingListProvider.notifier).add(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    final items = ref.watch(shoppingListProvider);
    final active = items.where((e) => !e.checked).toList();
    final done = items.where((e) => e.checked).toList();
    final showAds = ref.watch(showAdsProvider).valueOrNull ?? true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.navShopping,
          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
        ),
        actions: [
          if (done.isNotEmpty)
            TextButton(
              onPressed: () =>
                  ref.read(shoppingListProvider.notifier).clearChecked(),
              child: Text(AppStrings.shoppingClearDone),
            ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: AppStrings.shoppingAddHint,
                      filled: true,
                      fillColor: AppColors.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (_) => _add(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton.filled(
                  onPressed: _add,
                  icon: Icon(Icons.add),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: items.isEmpty
                ? EmptyStateCard(
                    icon: Icons.shopping_cart_outlined,
                    message: AppStrings.shoppingEmpty,
                    actionLabel: AppStrings.navScan,
                    onAction: () => ref
                        .read(mainShellTabIndexProvider.notifier)
                        .state = 0,
                  )
                : ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      ...active.map(
                        (e) => _ShoppingTile(
                          id: e.id,
                          name: e.name,
                          subtitle: e.fromRecipe,
                          checked: false,
                        ),
                      ),
                      if (done.isNotEmpty) ...[
                        const SizedBox(height: 16),
                        Text(
                          AppStrings.shoppingDoneSection,
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppColors.textMuted,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ...done.map(
                          (e) => _ShoppingTile(
                            id: e.id,
                            name: e.name,
                            subtitle: e.fromRecipe,
                            checked: true,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
          AdBannerSlot(show: showAds),
        ],
      ),
    );
  }
}

class _ShoppingTile extends ConsumerWidget {
  const _ShoppingTile({
    required this.id,
    required this.name,
    this.subtitle,
    required this.checked,
  });

  final String id;
  final String name;
  final String? subtitle;
  final bool checked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (_) =>
          ref.read(shoppingListProvider.notifier).remove(id),
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(NeonDecorations.cardRadius),
        ),
        child: Icon(Icons.delete_outline, color: AppColors.error),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: NeonDecorations.card(),
        child: CheckboxListTile(
          value: checked,
          onChanged: (_) =>
              ref.read(shoppingListProvider.notifier).toggle(id),
          title: Text(
            name,
            style: GoogleFonts.inter(
              decoration: checked ? TextDecoration.lineThrough : null,
              color: checked ? AppColors.textMuted : AppColors.textPrimary,
            ),
          ),
          subtitle: subtitle != null
              ? Text(
                  subtitle!,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    color: AppColors.textMuted,
                  ),
                )
              : null,
          activeColor: AppColors.primary,
        ),
      ),
    );
  }
}

