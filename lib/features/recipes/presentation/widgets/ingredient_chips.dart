import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';

class IngredientChips extends StatelessWidget {
  const IngredientChips({super.key, required this.ingredients});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    if (ingredients.isEmpty) {
      return Text(
        AppStrings.noIngredients,
        style: GoogleFonts.inter(
          color: AppColors.textMuted,
          fontWeight: FontWeight.w400,
        ),
      );
    }

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: ingredients.map((item) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: NeonDecorations.button(filled: true),
          child: Text(
            item,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary,
            ),
          ),
        );
      }).toList(),
    );
  }
}
