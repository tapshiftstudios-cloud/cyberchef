/// Fiş taramasından eklenen tazelik takip öğesi.
class PantryItem {
  const PantryItem({
    required this.id,
    required this.cleanName,
    required this.category,
    required this.purchaseDate,
    required this.estimatedExpiryDays,
    this.isConsumed = false,
    this.rawName,
    this.quantity,
    this.storeName,
    this.confidence,
    this.consumedAt,
    this.purchasePrice,
  });

  final String id;
  final String cleanName;
  final String category;
  final DateTime purchaseDate;
  final int estimatedExpiryDays;
  final bool isConsumed;
  final String? rawName;
  final String? quantity;
  final String? storeName;
  final double? confidence;
  final DateTime? consumedAt;
  /// Fiş satır fiyatı (OCR); yoksa kategori tahmini kullanılır.
  final double? purchasePrice;

  DateTime get expiryDate =>
      purchaseDate.add(Duration(days: estimatedExpiryDays));

  int daysRemaining([DateTime? from]) {
    if (isConsumed) return -1;
    final now = from ?? DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final expiryDay = DateTime(
      expiryDate.year,
      expiryDate.month,
      expiryDate.day,
    );
    return expiryDay.difference(today).inDays;
  }

  FreshnessUrgency get urgency {
    final remaining = daysRemaining();
    if (isConsumed || remaining < 0) return FreshnessUrgency.consumed;
    if (remaining <= 2) return FreshnessUrgency.critical;
    if (remaining <= 5) return FreshnessUrgency.warning;
    return FreshnessUrgency.safe;
  }

  bool get isLowConfidence => (confidence ?? 1) < 0.55;

  PantryItem copyWith({
    String? id,
    String? cleanName,
    String? category,
    DateTime? purchaseDate,
    int? estimatedExpiryDays,
    bool? isConsumed,
    String? rawName,
    String? quantity,
    String? storeName,
    double? confidence,
    DateTime? consumedAt,
    double? purchasePrice,
  }) {
    return PantryItem(
      id: id ?? this.id,
      cleanName: cleanName ?? this.cleanName,
      category: category ?? this.category,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      estimatedExpiryDays:
          estimatedExpiryDays ?? this.estimatedExpiryDays,
      isConsumed: isConsumed ?? this.isConsumed,
      rawName: rawName ?? this.rawName,
      quantity: quantity ?? this.quantity,
      storeName: storeName ?? this.storeName,
      confidence: confidence ?? this.confidence,
      consumedAt: consumedAt ?? this.consumedAt,
      purchasePrice: purchasePrice ?? this.purchasePrice,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'clean_name': cleanName,
        'category': category,
        'purchase_date': purchaseDate.toIso8601String(),
        'estimated_expiry_days': estimatedExpiryDays,
        'is_consumed': isConsumed,
        if (rawName != null) 'raw_name': rawName,
        if (quantity != null) 'quantity': quantity,
        if (storeName != null) 'store_name': storeName,
        if (confidence != null) 'confidence': confidence,
        if (consumedAt != null) 'consumed_at': consumedAt!.toIso8601String(),
        if (purchasePrice != null) 'purchase_price': purchasePrice,
      };

  factory PantryItem.fromJson(Map<String, dynamic> json) {
    return PantryItem(
      id: json['id'] as String,
      cleanName: json['clean_name'] as String? ?? json['cleanName'] as String,
      category: json['category'] as String,
      purchaseDate: DateTime.parse(
        json['purchase_date'] as String? ?? json['purchaseDate'] as String,
      ),
      estimatedExpiryDays: (json['estimated_expiry_days'] ??
              json['estimatedExpiryDays']) as int,
      isConsumed: json['is_consumed'] as bool? ??
          json['isConsumed'] as bool? ??
          false,
      rawName: json['raw_name'] as String? ?? json['rawName'] as String?,
      quantity: json['quantity'] as String?,
      storeName: json['store_name'] as String? ?? json['storeName'] as String?,
      confidence: (json['confidence'] as num?)?.toDouble(),
      consumedAt: json['consumed_at'] != null
          ? DateTime.parse(json['consumed_at'] as String)
          : null,
      purchasePrice: (json['purchase_price'] as num?)?.toDouble(),
    );
  }

  factory PantryItem.fromSupabaseRow(Map<String, dynamic> row) {
    return PantryItem(
      id: row['id'] as String,
      cleanName: row['clean_name'] as String,
      category: row['category'] as String,
      purchaseDate: DateTime.parse(row['purchase_date'] as String),
      estimatedExpiryDays: row['estimated_expiry_days'] as int,
      isConsumed: row['is_consumed'] as bool? ?? false,
      rawName: row['raw_name'] as String?,
      quantity: row['quantity'] as String?,
      storeName: row['store_name'] as String?,
      confidence: (row['confidence'] as num?)?.toDouble(),
      consumedAt: row['consumed_at'] != null
          ? DateTime.parse(row['consumed_at'] as String)
          : null,
      purchasePrice: (row['purchase_price'] as num?)?.toDouble(),
    );
  }

  bool get hasCloudId =>
      id.contains('-') && id.length >= 32;

  Map<String, dynamic> toSupabaseUpdate() => {
        'clean_name': cleanName,
        'category': category,
        'purchase_date': purchaseDate.toUtc().toIso8601String(),
        'estimated_expiry_days': estimatedExpiryDays,
        if (rawName != null) 'raw_name': rawName,
        if (quantity != null) 'quantity': quantity,
        if (storeName != null) 'store_name': storeName,
        if (confidence != null) 'confidence': confidence,
        if (purchasePrice != null) 'purchase_price': purchasePrice,
      };

  Map<String, dynamic> toSupabaseInsert(String userId) => {
        'user_id': userId,
        'clean_name': cleanName,
        'category': category,
        'purchase_date': purchaseDate.toUtc().toIso8601String(),
        'estimated_expiry_days': estimatedExpiryDays,
        'is_consumed': isConsumed,
        if (rawName != null) 'raw_name': rawName,
        if (quantity != null) 'quantity': quantity,
        if (storeName != null) 'store_name': storeName,
        if (confidence != null) 'confidence': confidence,
        if (consumedAt != null)
          'consumed_at': consumedAt!.toUtc().toIso8601String(),
        if (purchasePrice != null) 'purchase_price': purchasePrice,
      };
}

enum FreshnessUrgency {
  critical,
  warning,
  safe,
  consumed,
}

/// addItems sonucu: kaç birleştirildi, bulut durumu.
class PantryAddItemsResult {
  const PantryAddItemsResult({
    required this.addedCount,
    this.mergedCount = 0,
    this.cloudSynced = false,
    this.cloudError,
  });

  final int addedCount;
  final int mergedCount;
  final bool cloudSynced;
  final String? cloudError;
}
