import 'package:cyberchef/core/layout/app_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AppBreakpoints.classify', () {
    test('phone portrait is compact', () {
      expect(
        AppBreakpoints.classify(390, 844),
        AppWindowSize.compact,
      );
    });

    test('tablet portrait is medium', () {
      expect(
        AppBreakpoints.classify(768, 1024),
        AppWindowSize.medium,
      );
    });

    test('landscape wide panel is large at 1280dp', () {
      expect(
        AppBreakpoints.classify(1280, 800),
        AppWindowSize.large,
      );
    });

    test('landscape appliance panel is expanded below 1200dp', () {
      expect(
        AppBreakpoints.classify(1024, 768),
        AppWindowSize.expanded,
      );
    });
  });

  testWidgets('recipe grid columns scale with width', (tester) async {
    late AppBreakpoints bp;
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(size: Size(960, 600)),
        child: Builder(
          builder: (context) {
            bp = AppBreakpoints.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );
    expect(bp.recipeGridColumns(400), 1);
    expect(bp.recipeGridColumns(700), 2);
    expect(bp.recipeGridColumns(900), 3);
  });
}
