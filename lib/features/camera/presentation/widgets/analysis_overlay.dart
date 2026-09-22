import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/enums/camera_capture_type.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../providers/camera_scan_providers.dart';

/// Full-screen overlay while Gemini processes the captured image.
class AnalysisOverlay extends ConsumerWidget {
  const AnalysisOverlay({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(analysisStatusProvider);
    final isReceipt =
        ref.watch(cameraCaptureTypeProvider) == CameraCaptureType.receipt;

    return AbsorbPointer(
      child: Container(
        color: AppColors.background.withValues(alpha: 0.92),
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 36),
            decoration: NeonDecorations.card(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isReceipt) ...[
                  const _ShimmerBar(),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      minHeight: 3,
                      backgroundColor: AppColors.surfaceElevated,
                      color: AppColors.primary,
                    ),
                  ),
                ] else
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                      strokeWidth: 2.5,
                    ),
                  ),
                const SizedBox(height: 22),
                Text(
                  status.title,
                  style: GoogleFonts.inter(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  status.subtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textSecondary,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ShimmerBar extends StatefulWidget {
  const _ShimmerBar();

  @override
  State<_ShimmerBar> createState() => _ShimmerBarState();
}

class _ShimmerBarState extends State<_ShimmerBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Column(
          children: List.generate(3, (i) {
            final phase = (_controller.value + i * 0.15) % 1.0;
            final opacity = 0.35 + (phase < 0.5 ? phase : 1 - phase) * 0.5;
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: opacity),
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}

