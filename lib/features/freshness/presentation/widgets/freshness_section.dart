import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import 'freshness_bento_panel.dart';
import 'freshness_critical_banner.dart';

/// Tazelik paneli — dar ekranda daraltılabilir.
class FreshnessSection extends StatefulWidget {
  const FreshnessSection({
    super.key,
    this.initiallyExpanded = true,
  });

  final bool initiallyExpanded;

  @override
  State<FreshnessSection> createState() => _FreshnessSectionState();
}

class _FreshnessSectionState extends State<FreshnessSection> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  void didUpdateWidget(covariant FreshnessSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.initiallyExpanded && oldWidget.initiallyExpanded) {
      _expanded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              child: Row(
                children: [
                  Text(
                    AppStrings.freshnessPanelTitle,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _expanded
                        ? Icons.expand_less
                        : Icons.expand_more,
                    color: AppColors.textMuted,
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
        if (_expanded) ...[
          const SizedBox(height: 4),
          FreshnessCriticalBanner(),
          FreshnessBentoPanel(),
        ],
      ],
    );
  }
}
