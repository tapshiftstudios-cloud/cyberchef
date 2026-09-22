import 'pantry_item.dart';

/// Gemini fiş OCR çıktısı.
class ReceiptAnalysisResult {
  const ReceiptAnalysisResult({
    required this.receiptDetected,
    required this.items,
    this.purchaseDate,
    this.storeName,
  });

  final bool receiptDetected;
  final List<ReceiptLineItem> items;
  final DateTime? purchaseDate;
  final String? storeName;

  factory ReceiptAnalysisResult.fromJson(Map<String, dynamic> json) {
    final itemsRaw = json['items'];
    final items = itemsRaw is List
        ? itemsRaw
            .whereType<Map>()
            .map((e) => ReceiptLineItem.fromJson(
                  Map<String, dynamic>.from(e),
                ))
            .toList()
        : <ReceiptLineItem>[];

    DateTime? purchaseDate;
    final pd = json['purchase_date'] ?? json['purchaseDate'];
    if (pd is String && pd.isNotEmpty) {
      purchaseDate = DateTime.tryParse(pd);
    }

    return ReceiptAnalysisResult(
      receiptDetected:
          json['receipt_detected'] as bool? ??
          json['receiptDetected'] as bool? ??
          false,
      items: items,
      purchaseDate: purchaseDate,
      storeName: json['store_name'] as String? ?? json['storeName'] as String?,
    );
  }
}

class ReceiptLineItem {
  const ReceiptLineItem({
    required this.rawName,
    required this.cleanName,
    required this.quantity,
    required this.category,
    required this.estimatedExpiryDays,
    this.confidence = 1.0,
    this.selected = true,
    this.linePrice,
  });

  final String rawName;
  final String cleanName;
  final String quantity;
  final String category;
  final int estimatedExpiryDays;
  final double confidence;
  final bool selected;
  /// Satır toplamı fişte görünüyorsa (sayı, yerel para birimi).
  final double? linePrice;

  bool get isLowConfidence => confidence < 0.55;

  ReceiptLineItem copyWith({
    String? rawName,
    String? cleanName,
    String? quantity,
    String? category,
    int? estimatedExpiryDays,
    double? confidence,
    bool? selected,
    double? linePrice,
  }) =>
      ReceiptLineItem(
        rawName: rawName ?? this.rawName,
        cleanName: cleanName ?? this.cleanName,
        quantity: quantity ?? this.quantity,
        category: category ?? this.category,
        estimatedExpiryDays:
            estimatedExpiryDays ?? this.estimatedExpiryDays,
        confidence: confidence ?? this.confidence,
        selected: selected ?? this.selected,
        linePrice: linePrice ?? this.linePrice,
      );

  factory ReceiptLineItem.fromJson(Map<String, dynamic> json) {
    final name = json['name'] as String?;
    return ReceiptLineItem(
      rawName: json['raw_name'] as String? ?? name ?? '',
      cleanName: json['clean_name'] as String? ?? name ?? '',
      quantity: json['quantity'] as String? ?? '1',
      category: json['category'] as String? ?? 'Other',
      estimatedExpiryDays:
          (json['estimated_expiry_days'] as num?)?.toInt() ??
          (json['estimatedShelfLifeDays'] as num?)?.toInt() ??
          7,
      confidence: (json['confidence'] as num?)?.toDouble() ?? 0.85,
      linePrice: _parseLinePrice(json),
    );
  }

  static double? _parseLinePrice(Map<String, dynamic> json) {
    final raw = json['line_price'] ?? json['linePrice'] ?? json['price'];
    if (raw is num) return raw.toDouble();
    if (raw is String) {
      final cleaned = raw.replaceAll(RegExp(r'[^\d,.\-]'), '').replaceAll(',', '.');
      return double.tryParse(cleaned);
    }
    return null;
  }

  PantryItem toPantryItem({
    DateTime? purchaseDate,
    String? storeName,
  }) {
    return PantryItem(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      cleanName: cleanName,
      category: category,
      purchaseDate: purchaseDate ?? DateTime.now(),
      estimatedExpiryDays: estimatedExpiryDays,
      rawName: rawName,
      quantity: quantity,
      storeName: storeName,
      confidence: confidence,
      purchasePrice: linePrice,
    );
  }
}
