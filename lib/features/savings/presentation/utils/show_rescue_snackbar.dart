import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/providers/user_preferences_provider.dart';
import '../../domain/models/waste_savings_event.dart';
import '../../domain/waste_savings_estimator.dart';
import 'savings_format.dart';

/// Snackbar after a qualifying rescue (bento or swipe consume).
void showRescueSnackBar(
  BuildContext context,
  WidgetRef ref,
  WasteSavingsEvent event,
) {
  final locale = ref.read(localeProvider);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        AppStrings.savingsRescuedSnack(
          SavingsFormat.money(
            WasteSavingsEstimator.displayMoneyForEvent(event, locale),
            WasteSavingsEstimator.displayCurrencyForEvent(event, locale),
          ),
        ),
      ),
    ),
  );
}
