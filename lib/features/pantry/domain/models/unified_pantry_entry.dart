import '../../../../core/l10n/app_strings.dart';
import 'pantry_item.dart';

enum PantryEntrySource { receipt, fridgeScan }

class UnifiedPantryEntry {
  const UnifiedPantryEntry({
    required this.id,
    required this.name,
    required this.source,
    this.expiryDate,
    this.daysRemaining,
    this.category,
    this.scanDate,
  });

  final String id;
  final String name;
  final PantryEntrySource source;
  final DateTime? expiryDate;
  final int? daysRemaining;
  final String? category;
  final DateTime? scanDate;

  factory UnifiedPantryEntry.fromPantryItem(PantryItem item) {
    return UnifiedPantryEntry(
      id: item.id,
      name: item.cleanName,
      source: PantryEntrySource.receipt,
      expiryDate: item.expiryDate,
      daysRemaining: item.daysRemaining(),
      category: item.category,
    );
  }

  String get sourceLabel => switch (source) {
        PantryEntrySource.receipt => AppStrings.unifiedSourceReceipt,
        PantryEntrySource.fridgeScan => AppStrings.unifiedSourceScan,
      };
}
