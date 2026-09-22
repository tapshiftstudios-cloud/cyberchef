import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';

/// Placeholder until recipe results UI is built.
class RecipesPlaceholderScreen extends ConsumerWidget {
  const RecipesPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppStrings.recipesPlaceholderTitle)),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(28),
          decoration: NeonDecorations.card(),
          child: Text(
            AppStrings.recipesPlaceholderBody,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w400,
              height: 1.45,
            ),
          ),
        ),
      ),
    );
  }
}
