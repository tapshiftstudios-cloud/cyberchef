/// Çöpe gitmekten kurtarılan tek bir ürün kaydı.
class WasteSavingsEvent {
  const WasteSavingsEvent({
    required this.id,
    required this.itemName,
    required this.category,
    required this.rescuedAt,
    required this.daysRemainingAtRescue,
    required this.estimatedKg,
    required this.estimatedMoney,
    required this.currencyCode,
  });

  final String id;
  final String itemName;
  final String category;
  final DateTime rescuedAt;
  final int daysRemainingAtRescue;
  final double estimatedKg;
  final double estimatedMoney;
  final String currencyCode;

  Map<String, dynamic> toJson() => {
        'id': id,
        'item_name': itemName,
        'category': category,
        'rescued_at': rescuedAt.toIso8601String(),
        'days_remaining': daysRemainingAtRescue,
        'estimated_kg': estimatedKg,
        'estimated_money': estimatedMoney,
        'currency_code': currencyCode,
      };

  factory WasteSavingsEvent.fromJson(Map<String, dynamic> json) {
    return WasteSavingsEvent(
      id: json['id'] as String,
      itemName: json['item_name'] as String,
      category: json['category'] as String? ?? 'Pantry',
      rescuedAt: DateTime.parse(json['rescued_at'] as String),
      daysRemainingAtRescue: json['days_remaining'] as int? ?? 0,
      estimatedKg: (json['estimated_kg'] as num).toDouble(),
      estimatedMoney: (json['estimated_money'] as num).toDouble(),
      currencyCode: json['currency_code'] as String? ?? 'TRY',
    );
  }
}

/// Haftalık trend çubuğu.
class WasteSavingsWeekBucket {
  const WasteSavingsWeekBucket({
    required this.weekStart,
    required this.itemCount,
    required this.totalKg,
    required this.totalMoney,
  });

  final DateTime weekStart;
  final int itemCount;
  final double totalKg;
  final double totalMoney;
}

/// Aylık özet + trend.
class WasteSavingsSummary {
  const WasteSavingsSummary({
    required this.itemsRescuedThisMonth,
    required this.totalKgThisMonth,
    required this.totalMoneyThisMonth,
    required this.currencyCode,
    required this.weeklyTrend,
    required this.recentEvents,
    required this.allTimeItems,
  });

  final int itemsRescuedThisMonth;
  final double totalKgThisMonth;
  final double totalMoneyThisMonth;
  final String currencyCode;
  final List<WasteSavingsWeekBucket> weeklyTrend;
  final List<WasteSavingsEvent> recentEvents;
  final int allTimeItems;

  bool get hasAnyData => allTimeItems > 0;
}
