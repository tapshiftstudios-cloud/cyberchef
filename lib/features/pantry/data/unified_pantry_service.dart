import '../domain/models/pantry_item.dart';
import '../domain/models/unified_pantry_entry.dart';
import '../domain/recent_scan.dart';

/// Fiş envanteri + son buzdolabı taraması malzemelerini birleştirir.
abstract final class UnifiedPantryService {
  static List<UnifiedPantryEntry> build({
    required List<PantryItem> receiptItems,
    required List<RecentScan> recentScans,
  }) {
    final entries = <UnifiedPantryEntry>[];
    final seen = <String>{};

    for (final item in receiptItems) {
      if (item.isConsumed) continue;
      final key = item.cleanName.toLowerCase();
      if (seen.add(key)) {
        entries.add(UnifiedPantryEntry.fromPantryItem(item));
      }
    }

    for (final scan in recentScans.take(5)) {
      for (final ing in scan.analysis.ingredients) {
        final key = ing.toLowerCase();
        if (seen.add(key)) {
          entries.add(
            UnifiedPantryEntry(
              id: 'scan_${scan.id}_$key',
              name: ing,
              source: PantryEntrySource.fridgeScan,
              scanDate: scan.scannedAt,
            ),
          );
        }
      }
    }

    entries.sort((a, b) {
      final ad = a.daysRemaining ?? 999;
      final bd = b.daysRemaining ?? 999;
      return ad.compareTo(bd);
    });

    return entries;
  }
}
