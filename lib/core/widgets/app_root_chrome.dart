import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../layout/app_breakpoints.dart';
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

    final bp = AppBreakpoints.of(context);
    final mq = MediaQuery.of(context);
    final scaledChild = bp.displayTextScale == 1.0
        ? child
        : MediaQuery(
            data: mq.copyWith(
              textScaler: TextScaler.linear(
                mq.textScaler.scale(1) * bp.displayTextScale,
              ),
            ),
            child: child,
          );

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
        scaledChild,
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
