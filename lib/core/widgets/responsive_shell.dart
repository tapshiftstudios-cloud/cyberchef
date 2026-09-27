import 'package:flutter/material.dart';

import '../layout/app_breakpoints.dart';

/// Centers content and grows max width on tablet / appliance displays.
class ResponsiveShell extends StatelessWidget {
  const ResponsiveShell({
    super.key,
    required this.child,
    this.maxWidth,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
  });

  final Widget child;

  /// When null, uses [AppBreakpoints.contentMaxWidth] for the current window.
  final double? maxWidth;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final limit = maxWidth ?? AppBreakpoints.of(context).contentMaxWidth;
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: limit),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}
