import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/layout/app_breakpoints.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/providers/main_shell_tab_provider.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../camera/presentation/camera_screen.dart';
import '../../freshness/presentation/freshness_list_screen.dart';
import '../../pantry/domain/models/pantry_item.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../shopping/presentation/shopping_list_screen.dart';

/// Ana uygulama: Tarama + Tazelik + Alışveriş sekmeleri.
class MainShell extends ConsumerStatefulWidget {
  const MainShell({super.key});

  @override
  ConsumerState<MainShell> createState() => _MainShellState();
}

class _MainShellState extends ConsumerState<MainShell> {
  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    ref.watch(appThemeProvider);
    final index = ref.watch(mainShellTabIndexProvider);
    final items = ref.watch(pantryItemsProvider).valueOrNull ?? [];
    final criticalCount = items
        .where((e) => e.urgency == FreshnessUrgency.critical)
        .length;

    final bp = AppBreakpoints.of(context);
    final body = IndexedStack(
      index: index,
      children: const [
        CameraScreen(),
        FreshnessListScreen(inTab: true),
        ShoppingListScreen(),
      ],
    );

    if (bp.useSideNavigation) {
      final iconSize = bp.isLargeDisplay ? 28.0 : 24.0;
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: index,
              extended: bp.isLargeDisplay,
              minWidth: bp.isLargeDisplay ? 88 : 72,
              minExtendedWidth: 180,
              backgroundColor: AppColors.surface,
              indicatorColor: AppColors.primary.withValues(alpha: 0.2),
              onDestinationSelected: _selectTab,
              labelType: bp.isLargeDisplay
                  ? NavigationRailLabelType.none
                  : NavigationRailLabelType.selected,
              destinations: [
                NavigationRailDestination(
                  icon: Icon(Icons.document_scanner_outlined, size: iconSize),
                  selectedIcon: Icon(Icons.document_scanner, size: iconSize),
                  label: Text(AppStrings.navScan),
                ),
                NavigationRailDestination(
                  icon: _badgedIcon(Icons.inventory_2_outlined, criticalCount,
                      size: iconSize),
                  selectedIcon: _badgedIcon(Icons.inventory_2, criticalCount,
                      size: iconSize),
                  label: Text(AppStrings.navFreshness),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.shopping_cart_outlined, size: iconSize),
                  selectedIcon: Icon(Icons.shopping_cart, size: iconSize),
                  label: Text(AppStrings.navShopping),
                ),
              ],
            ),
            const VerticalDivider(width: 1, thickness: 1),
            Expanded(child: body),
          ],
        ),
      );
    }

    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        backgroundColor: AppColors.surface,
        indicatorColor: AppColors.primary.withValues(alpha: 0.2),
        onDestinationSelected: _selectTab,
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.document_scanner_outlined),
            selectedIcon: const Icon(Icons.document_scanner),
            label: AppStrings.navScan,
            tooltip: AppStrings.navScan,
          ),
          NavigationDestination(
            icon: _badgedIcon(Icons.inventory_2_outlined, criticalCount),
            selectedIcon: _badgedIcon(Icons.inventory_2, criticalCount),
            label: AppStrings.navFreshness,
            tooltip: AppStrings.navFreshness,
          ),
          NavigationDestination(
            icon: const Icon(Icons.shopping_cart_outlined),
            selectedIcon: const Icon(Icons.shopping_cart),
            label: AppStrings.navShopping,
            tooltip: AppStrings.navShopping,
          ),
        ],
      ),
    );
  }

  void _selectTab(int index) {
    ref.read(mainShellTabIndexProvider.notifier).state = index;
  }

  static Widget _badgedIcon(IconData icon, int count, {double size = 24}) {
    if (count <= 0) return Icon(icon, size: size);
    return Badge(
      label: Text(
        count > 9 ? '9+' : '$count',
        style: const TextStyle(fontSize: 10),
      ),
      backgroundColor: const Color(0xFFE85D5D),
      child: Icon(icon, size: size),
    );
  }
}

/// Misafir / oturum: bulut senkronu + tazelik bildirimi.
class MainShellHost extends ConsumerStatefulWidget {
  const MainShellHost({super.key});

  @override
  ConsumerState<MainShellHost> createState() => _MainShellHostState();
}

class _MainShellHostState extends ConsumerState<MainShellHost> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncPantry());
  }

  Future<void> _syncPantry() async {
    await ref.read(pantryItemsProvider.notifier).syncFromCloud(showErrors: false);
  }

  @override
  Widget build(BuildContext context) => const MainShell();
}

