import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/pantry/data/pantry_item_storage.dart';
import '../../features/savings/data/waste_savings_storage.dart';
import '../../features/shopping/data/shopping_list_storage.dart';

/// Gizlilik: yerel veriyi JSON olarak dışa aktar / sil.
abstract final class LocalDataExport {
  static Future<String> exportJson() async {
    final prefs = await SharedPreferences.getInstance();
    final pantry = await PantryItemStorage.loadAll();
    final shopping = await ShoppingListStorage.loadAll();

    final prefsMap = <String, dynamic>{};
    for (final k in prefs.getKeys()) {
      if (k.contains('pantry') ||
          k.contains('shopping') ||
          k.contains('cyberchef') ||
          k.contains('recent') ||
          k.contains('onboarding') ||
          k.contains('favorite') ||
          k.contains('waste_savings')) {
        prefsMap[k] = prefs.get(k);
      }
    }

    final savings = await WasteSavingsStorage.loadAll();

    return const JsonEncoder.withIndent('  ').convert({
      'exported_at': DateTime.now().toIso8601String(),
      'pantry_items': pantry.map((e) => e.toJson()).toList(),
      'shopping_list': shopping.map((e) => e.toJson()).toList(),
      'waste_savings': savings.map((e) => e.toJson()).toList(),
      'preferences': prefsMap,
    });
  }

  static Future<void> clearAllLocal() async {
    final prefs = await SharedPreferences.getInstance();
    for (final k in prefs.getKeys().toList()) {
      if (k.contains('pantry') ||
          k.contains('shopping') ||
          k.contains('cyberchef') ||
          k.contains('recent') ||
          k.contains('favorite') ||
          k.contains('waste_savings')) {
        await prefs.remove(k);
      }
    }
    await PantryItemStorage.saveAll([]);
    await ShoppingListStorage.saveAll([]);
    await WasteSavingsStorage.clear();
  }
}
