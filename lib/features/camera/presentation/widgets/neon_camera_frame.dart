import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';

/// Camera preview container with bento-style frame.
class NeonCameraFrame extends StatelessWidget {
  const NeonCameraFrame({
    super.key,
    required this.child,
    this.accent,
  });

  final Widget child;
  final Color? accent;

  /// Portrait preview ratio (9:16) — matches typical phone screens.
  static const double previewAspectRatio = 9 / 16;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    // On desktop/tablet, keep a phone-like width so the preview is not stretched.
    final maxPreviewWidth = screenWidth > 480 ? 400.0 : screenWidth;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxPreviewWidth),
        child: Container(
          width: double.infinity,
          decoration: NeonDecorations.card(radius: NeonDecorations.cardRadius),
          clipBehavior: Clip.antiAlias,
          child: AspectRatio(
            aspectRatio: previewAspectRatio,
            child: child,
          ),
        ),
      ),
    );
  }
}
