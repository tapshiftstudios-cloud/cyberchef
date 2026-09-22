import 'package:flutter/material.dart';

import '../../../../core/enums/camera_capture_type.dart';
import '../../../../core/theme/app_colors.dart';

/// Minimal center framing guide for the camera preview (no scan-line animation).
class ScanningOverlay extends StatelessWidget {
  const ScanningOverlay({
    super.key,
    this.active = true,
    this.captureType = CameraCaptureType.fridge,
    this.duration = const Duration(milliseconds: 2200),
  });

  final bool active;
  final CameraCaptureType captureType;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    if (!active) {
      return const SizedBox.expand();
    }

    return CustomPaint(
      painter: _FramingGuidePainter(
        captureType: captureType,
        strokeColor: AppColors.primary,
        fallbackStrokeColor: Colors.white.withValues(alpha: 0.85),
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _FramingGuidePainter extends CustomPainter {
  _FramingGuidePainter({
    required this.captureType,
    required this.strokeColor,
    required this.fallbackStrokeColor,
  });

  final CameraCaptureType captureType;
  final Color strokeColor;
  final Color fallbackStrokeColor;

  @override
  void paint(Canvas canvas, Size size) {
    final isReceipt = captureType.isReceipt;
    final frameWidth = isReceipt ? size.width * 0.62 : size.width * 0.72;
    final frameHeight =
        isReceipt ? size.height * 0.78 : size.height * 0.58;
    final left = (size.width - frameWidth) / 2;
    final top = (size.height - frameHeight) / 2;
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(left, top, frameWidth, frameHeight),
      const Radius.circular(12),
    );

    final paint = Paint()
      ..color = strokeColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawRRect(rect, paint);

    // Subtle inner highlight for depth
    final inner = Paint()
      ..color = fallbackStrokeColor.withValues(alpha: 0.25)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    canvas.drawRRect(rect.deflate(1), inner);
  }

  @override
  bool shouldRepaint(covariant _FramingGuidePainter oldDelegate) =>
      oldDelegate.strokeColor != strokeColor ||
      oldDelegate.captureType != captureType;
}
