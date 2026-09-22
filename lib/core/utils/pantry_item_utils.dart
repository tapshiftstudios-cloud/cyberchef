import '../../features/pantry/domain/models/pantry_item.dart';
import '../l10n/l10n_format.dart';

abstract final class PantryItemUtils {
  static String normalizeName(String name) =>
      name.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim();

  static String formatExpiryDate(PantryItem item) =>
      L10nFormat.formatExpiryDate(item.expiryDate);

  static String formatDaysLabel(PantryItem item) =>
      L10nFormat.formatDaysLabel(item.daysRemaining());

  static bool namesMatch(PantryItem a, PantryItem b) {
    return normalizeName(a.cleanName) == normalizeName(b.cleanName);
  }
}
