import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/app_strings.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import '../data/open_food_facts_service.dart';
import '../domain/barcode_product.dart';
import 'widgets/barcode_confirm_sheet.dart';

Future<void> handleBarcodeDetected(
  BuildContext context,
  WidgetRef ref,
  String barcode,
) async {
  BarcodeProduct? product;
  try {
    product = await OpenFoodFactsService.lookup(barcode);
  } catch (_) {
    product = null;
  }

  if (!context.mounted) return;

  if (product == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppStrings.barcodeNotFound)),
    );
    return;
  }

  final confirmed = await showBarcodeConfirmSheet(context, product: product);
  if (!context.mounted || confirmed != true) return;

  final result = await ref
      .read(pantryItemsProvider.notifier)
      .addItems([product.toPantryItem()]);

  if (!context.mounted) return;

  var msg = AppStrings.receiptSaved;
  if (result.mergedCount > 0) {
    msg = '$msg · ${AppStrings.receiptMergedSnack}';
  }
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg)),
  );
}
