import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/providers/user_preferences_provider.dart';
import '../../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../domain/models/waste_savings_event.dart';
import '../../domain/waste_savings_service.dart';

final wasteSavingsSummaryProvider =
    FutureProvider<WasteSavingsSummary>((ref) async {
  ref.watch(localeProvider);
  ref.watch(pantryItemsProvider);
  final locale = ref.read(localeProvider);
  return WasteSavingsService.buildSummary(locale: locale);
});
