import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Tüm ekranlarda hafif gradient arka plan + üstte ambient glow.
class AppScaffoldBackground extends StatelessWidget {
  const AppScaffoldBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final palette = AppColors.palette;
    final glowAlpha = palette.isLight ? 0.07 : 0.11;

    return DecoratedBox(
      decoration: palette.scaffoldDecoration,
      child: Stack(
        fit: StackFit.expand,
        children: [
          IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: const Alignment(0, -0.72),
                  radius: 1.05,
                  colors: [
                    palette.primary.withValues(alpha: glowAlpha),
                    Colors.transparent,
                  ],
                  stops: const [0.0, 0.55],
                ),
              ),
            ),
          ),
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
