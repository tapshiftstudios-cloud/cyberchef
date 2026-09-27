import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Window size buckets aligned with Material adaptive layout (dp).
enum AppWindowSize {
  compact,
  medium,
  expanded,
  large,
}

/// Layout helpers for phones, tablets, and wide appliance displays.
class AppBreakpoints {
  const AppBreakpoints._({
    required this.size,
    required this.width,
    required this.height,
  });

  final AppWindowSize size;
  final double width;
  final double height;

  bool get isLandscape => width > height;

  /// Side rail instead of bottom bar (tablet / landscape fridge).
  bool get useSideNavigation => width >= 600;

  /// Embedded or kiosk-style displays (e.g. smart fridge panel).
  bool get isLargeDisplay =>
      size == AppWindowSize.large ||
      (size == AppWindowSize.expanded && isLandscape);

  double get contentMaxWidth => switch (size) {
        AppWindowSize.compact => 480,
        AppWindowSize.medium => 720,
        AppWindowSize.expanded => 960,
        AppWindowSize.large => 1200,
      };

  /// Extra scale on wide displays only; respects user text scaling elsewhere.
  double get displayTextScale => isLargeDisplay ? 1.1 : 1.0;

  int recipeGridColumns(double innerWidth) {
    if (innerWidth < 520) return 1;
    if (innerWidth < 820) return 2;
    return 3;
  }

  /// Camera preview cap so preview stays readable on wide screens.
  double cameraPreviewMaxWidth(double screenWidth) {
    return switch (size) {
      AppWindowSize.compact => screenWidth,
      AppWindowSize.medium => 520,
      AppWindowSize.expanded => 640,
      AppWindowSize.large => 720,
    };
  }

  static AppBreakpoints of(BuildContext context) {
    final mq = MediaQuery.sizeOf(context);
    return AppBreakpoints._(
      size: classify(mq.width, mq.height),
      width: mq.width,
      height: mq.height,
    );
  }

  static AppWindowSize classify(double width, double height) {
    final shortest = math.min(width, height);
    // Treat short wide panels (fridge UI) like expanded even if width < 840.
    if (shortest >= 600 && width / height >= 1.25) {
      return width >= 1200 ? AppWindowSize.large : AppWindowSize.expanded;
    }
    if (width < 600) return AppWindowSize.compact;
    if (width < 840) return AppWindowSize.medium;
    if (width < 1200) return AppWindowSize.expanded;
    return AppWindowSize.large;
  }

  /// At startup (no [BuildContext]): allow rotation on tablet-class devices.
  static bool allowAllOrientationsAtStartup({
    required double logicalWidth,
    required double logicalHeight,
  }) {
    final shortest = math.min(logicalWidth, logicalHeight);
    return shortest >= 600;
  }
}
