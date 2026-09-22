import '../../features/pantry/domain/models/receipt_analysis_result.dart';

/// Fiş satırlarından yiyecek dışı / düşük kaliteli satırları ayıklar.
abstract final class ReceiptItemFilter {
  static const _skipPatterns = [
    'toplam',
    'total',
    'kdv',
    'vat',
    'indirim',
    'discount',
    'nakit',
    'kart',
    'visa',
    'master',
    'pos',
    'fis',
    'fiş',
    'magaza',
    'poşet',
    'poset',
    'bag',
    'para üstü',
    'musteri',
    'müşteri',
  ];

  static List<ReceiptLineItem> filterFoodItems(List<ReceiptLineItem> items) {
    return items.where(_isLikelyFood).toList();
  }

  static bool _isLikelyFood(ReceiptLineItem item) {
    final raw = item.rawName.trim().toLowerCase();
    final clean = item.cleanName.trim().toLowerCase();
    if (raw.length < 2 && clean.length < 2) return false;
    if (item.category.toLowerCase() == 'other' &&
        raw.length < 4 &&
        item.confidence < 0.4) {
      return false;
    }
    for (final p in _skipPatterns) {
      if (raw.contains(p) || clean.contains(p)) return false;
    }
    return true;
  }
}
