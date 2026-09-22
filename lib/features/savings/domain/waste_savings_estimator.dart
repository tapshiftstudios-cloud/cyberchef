import '../../../core/enums/app_locale.dart';
import '../../pantry/domain/models/pantry_item.dart';
import 'models/waste_savings_event.dart';
import 'savings_currency.dart';

/// Tahmini ağırlık ve maliyet (kategori + miktar ipucu + fiş fiyatı).
abstract final class WasteSavingsEstimator {
  static const Map<String, double> _defaultKgByCategory = {
    'Dairy': 0.45,
    'Meat': 0.35,
    'Fruit': 0.28,
    'Vegetable': 0.32,
    'Beverage': 0.55,
    'Bakery': 0.22,
    'Pantry': 0.28,
    'Frozen': 0.40,
    'Other': 0.30,
  };

  static const Map<String, double> _tryPerKgByCategory = {
    'Dairy': 190,
    'Meat': 430,
    'Fruit': 115,
    'Vegetable': 95,
    'Beverage': 70,
    'Bakery': 85,
    'Pantry': 160,
    'Frozen': 120,
    'Other': 100,
  };

  static const Map<String, double> _usdPerKgByCategory = {
    'Dairy': 13.0,
    'Meat': 22.0,
    'Fruit': 7.0,
    'Vegetable': 6.0,
    'Beverage': 4.8,
    'Bakery': 6.0,
    'Pantry': 8.5,
    'Frozen': 7.5,
    'Other': 6.5,
  };

  static const Map<String, double> _eurPerKgByCategory = {
    'Dairy': 12.0,
    'Meat': 20.0,
    'Fruit': 6.5,
    'Vegetable': 5.5,
    'Beverage': 4.5,
    'Bakery': 5.5,
    'Pantry': 8.0,
    'Frozen': 7.0,
    'Other': 6.0,
  };

  /// Ürün adına göre kategori fiyatını biraz ayarlar.
  static const Map<String, double> _nameMultiplier = {
    'tavuk': 1.10,
    'chicken': 1.10,
    'et': 1.20,
    'meat': 1.20,
    'balik': 1.25,
    'balık': 1.25,
    'fish': 1.25,
    'peynir': 1.12,
    'cheese': 1.12,
    'yogurt': 0.92,
    'yoğurt': 0.92,
    'sut': 0.86,
    'süt': 0.86,
    'milk': 0.86,
    'domates': 0.90,
    'tomato': 0.90,
    'mantar': 1.05,
    'mushroom': 1.05,
    'ekmek': 0.95,
    'bread': 0.95,
    'krema': 1.18,
    'cream': 1.18,
  };

  /// Kurtarma sayılır: son tüketim tarihi yakın (≤5 gün).
  static const maxDaysRemainingForRescue = 5;

  static bool qualifiesForRescue(PantryItem item) {
    if (item.isConsumed) return false;
    final days = item.daysRemaining();
    return days >= 0 && days <= maxDaysRemainingForRescue;
  }

  static WasteSavingsEvent buildEvent({
    required PantryItem item,
    required AppLocale locale,
    DateTime? rescuedAt,
  }) {
    final currencyCode = SavingsCurrency.codeForLocale(locale);
    final kg = _estimateKg(item);
    final money = _estimateMoney(item, currencyCode);
    final when = rescuedAt ?? DateTime.now();
    return WasteSavingsEvent(
      id: '${when.microsecondsSinceEpoch}_${item.id}',
      itemName: item.cleanName,
      category: item.category,
      rescuedAt: when,
      daysRemainingAtRescue: item.daysRemaining(when),
      estimatedKg: kg,
      estimatedMoney: money,
      currencyCode: currencyCode,
    );
  }

  static double _estimateKg(PantryItem item) {
    final base = _defaultKgByCategory[item.category] ?? 0.28;
    final qty = item.quantity?.toLowerCase() ?? '';
    if (qty.contains('kg')) {
      final match = RegExp(r'(\d+[,.]?\d*)').firstMatch(qty);
      if (match != null) {
        final parsed = double.tryParse(match.group(1)!.replaceAll(',', '.'));
        if (parsed != null && parsed > 0) return parsed.clamp(0.05, 5.0);
      }
    }
    if (qty.contains('g') && !qty.contains('kg')) {
      final match = RegExp(r'(\d+)').firstMatch(qty);
      if (match != null) {
        final grams = int.tryParse(match.group(1)!);
        if (grams != null) return (grams / 1000).clamp(0.05, 2.0);
      }
    }
    if (qty.contains('l') || qty.contains('lt')) {
      return (base + 0.2).clamp(0.2, 2.0);
    }
    return base;
  }

  static double _estimateMoney(PantryItem item, String currencyCode) {
    final receiptPrice = item.purchasePrice;
    if (receiptPrice != null && receiptPrice > 0) {
      return _clampMoney(receiptPrice, currencyCode);
    }

    final kg = _estimateKg(item);
    final perKg =
        _categoryPerKg(item.category, currencyCode) * _itemNameFactor(item.cleanName);
    return _clampMoney(kg * perKg, currencyCode);
  }

  /// Tek kayıt için gösterim tutarı.
  /// Kayıtlı para birimi UI ile aynıysa stored [estimatedMoney] kullanılır;
  /// aksi halde mevcut locale kuruna göre yeniden hesaplanır.
  static double displayMoneyForEvent(WasteSavingsEvent event, AppLocale locale) {
    final currencyCode = SavingsCurrency.codeForLocale(locale);
    if (event.currencyCode == currencyCode && event.estimatedMoney > 0) {
      return event.estimatedMoney;
    }
    final categoryPerKg = _categoryPerKg(event.category, currencyCode);
    final nameFactor = _itemNameFactor(event.itemName);
    return _clampMoney(event.estimatedKg * categoryPerKg * nameFactor, currencyCode);
  }

  static String displayCurrencyForEvent(
    WasteSavingsEvent event,
    AppLocale locale,
  ) {
    final currencyCode = SavingsCurrency.codeForLocale(locale);
    if (event.currencyCode == currencyCode) return event.currencyCode;
    return currencyCode;
  }

  static double sumDisplayMoney(
    Iterable<WasteSavingsEvent> events,
    AppLocale locale,
  ) {
    var total = 0.0;
    for (final event in events) {
      total += displayMoneyForEvent(event, locale);
    }
    return total;
  }

  static double _categoryPerKg(String category, String currencyCode) {
    final Map<String, double> table = switch (currencyCode) {
      'TRY' => _tryPerKgByCategory,
      'EUR' => _eurPerKgByCategory,
      'USD' => _usdPerKgByCategory,
      _ => _usdPerKgByCategory,
    };
    final base = table[category] ?? table['Other'] ?? 6.5;
    if (currencyCode == 'TRY' ||
        currencyCode == 'EUR' ||
        currencyCode == 'USD') {
      return base;
    }
    final usdBase = _usdPerKgByCategory[category] ?? _usdPerKgByCategory['Other']!;
    return usdBase * SavingsCurrency.usdRate(currencyCode);
  }

  static double _clampMoney(double raw, String currencyCode) {
    final (min, max) = SavingsCurrency.clampBounds(currencyCode);
    return raw.clamp(min, max);
  }

  static double _itemNameFactor(String name) {
    final lower = name.toLowerCase();
    for (final entry in _nameMultiplier.entries) {
      if (lower.contains(entry.key)) return entry.value;
    }
    return 1.0;
  }
}
