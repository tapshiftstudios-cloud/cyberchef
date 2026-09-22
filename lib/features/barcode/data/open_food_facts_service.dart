import 'dart:convert';

import 'package:http/http.dart' as http;

import '../domain/barcode_product.dart';

/// Open Food Facts ürün araması (ücretsiz API).
abstract final class OpenFoodFactsService {
  static const _base = 'https://world.openfoodfacts.org/api/v2/product';

  static Future<BarcodeProduct?> lookup(String barcode) async {
    final code = barcode.trim();
    if (code.length < 8) return null;

    final uri = Uri.parse('$_base/$code.json');
    final response = await http
        .get(uri, headers: {'User-Agent': 'CyberChef/1.0'})
        .timeout(const Duration(seconds: 12));

    if (response.statusCode != 200) return null;

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    if (json['status'] != 1) return null;

    final product = json['product'] as Map<String, dynamic>?;
    if (product == null) return null;

    final name = (product['product_name'] as String?)?.trim() ??
        (product['generic_name'] as String?)?.trim() ??
        '';
    if (name.isEmpty) return null;

    final brand = (product['brands'] as String?)?.split(',').first.trim();
    final categories = product['categories_tags'] as List<dynamic>? ?? [];
    final category = _mapCategory(categories);

    return BarcodeProduct(
      barcode: code,
      name: name,
      brand: brand?.isEmpty == true ? null : brand,
      category: category,
      estimatedExpiryDays: _expiryDaysForCategory(category),
    );
  }

  static String _mapCategory(List<dynamic> tags) {
    final joined = tags.map((e) => e.toString().toLowerCase()).join(' ');
    if (joined.contains('dairy') || joined.contains('milk')) return 'Dairy';
    if (joined.contains('meat') || joined.contains('fish')) return 'Meat';
    if (joined.contains('fruit')) return 'Fruit';
    if (joined.contains('vegetable')) return 'Vegetable';
    if (joined.contains('beverage') || joined.contains('drink')) {
      return 'Beverage';
    }
    if (joined.contains('bread') || joined.contains('cereal')) {
      return 'Bakery';
    }
    return 'Pantry';
  }

  static int _expiryDaysForCategory(String category) => switch (category) {
        'Dairy' => 7,
        'Meat' => 4,
        'Fruit' => 5,
        'Vegetable' => 6,
        'Beverage' => 30,
        'Bakery' => 5,
        _ => 14,
      };
}
