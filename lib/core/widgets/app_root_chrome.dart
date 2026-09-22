import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/recipe_localization_provider.dart';
import '../providers/user_preferences_provider.dart';
import '../theme/app_colors.dart';
import 'locale_preparing_overlay.dart';

/// Global background + locale banner. Decorative layers never absorb touches.
class AppRootChrome extends ConsumerWidget {
  const AppRootChrome({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(appThemeProvider);
    final recipePrep = ref.watch(recipeLocalizationProvider);
    final palette = AppColors.palette;

    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: palette.scaffoldDecoration,
            ),
          ),
        ),
        child,
        if (recipePrep.isPreparing)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LocalePreparingOverlay(
              visible: true,
              completed: recipePrep.completed,
              total: recipePrep.total,
            ),
          ),
      ],
    );
  }
}
