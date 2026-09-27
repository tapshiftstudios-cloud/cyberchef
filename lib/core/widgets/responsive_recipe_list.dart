import 'package:flutter/material.dart';

import '../layout/app_breakpoints.dart';

/// Recipe cards in one column on phones, grid on tablet / wide displays.
class ResponsiveRecipeList extends StatelessWidget {
  const ResponsiveRecipeList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cols = AppBreakpoints.of(context)
            .recipeGridColumns(constraints.maxWidth);
        if (cols <= 1) {
          return Column(
            children: [
              for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
            ],
          );
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: cols,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.78,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        );
      },
    );
  }
}
