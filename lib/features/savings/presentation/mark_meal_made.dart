import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/l10n/pantry_name_localizer.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../pantry/domain/models/pantry_item.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import 'utils/show_rescue_snackbar.dart';

Future<void> confirmAndMarkMealMade(
  BuildContext context,
  WidgetRef ref,
  PantryItem item,
) async {
  final confirmed = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      ref.watch(localeProvider);
      final locale = ref.read(localeProvider);
      return AlertDialog(
        title: Text(AppStrings.savingsMealMade),
        content: Text(
          AppStrings.savingsMealMadeConfirm(
            PantryNameLocalizer.productName(item.cleanName, locale),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(AppStrings.scanConfirmCancel),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(AppStrings.savingsMealMade),
          ),
        ],
      );
    },
  );

  if (confirmed != true || !context.mounted) return;

  final event =
      await ref.read(pantryItemsProvider.notifier).markConsumed(item.id);

  if (!context.mounted) return;

  if (event != null) {
    showRescueSnackBar(context, ref, event);
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppStrings.savingsMealMade)),
    );
  }
}
