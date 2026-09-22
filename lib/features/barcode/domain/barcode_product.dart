import '../../pantry/domain/models/pantry_item.dart';

class BarcodeProduct {
  const BarcodeProduct({
    required this.barcode,
    required this.name,
    required this.category,
    required this.estimatedExpiryDays,
    this.brand,
  });

  final String barcode;
  final String name;
  final String? brand;
  final String category;
  final int estimatedExpiryDays;

  PantryItem toPantryItem() {
    return PantryItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      cleanName: name,
      category: category,
      purchaseDate: DateTime.now(),
      estimatedExpiryDays: estimatedExpiryDays,
      rawName: barcode,
      quantity: '1',
      storeName: brand,
      confidence: 0.9,
    );
  }
}
