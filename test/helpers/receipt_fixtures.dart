import 'package:cyberchef/features/pantry/domain/models/receipt_analysis_result.dart';

ReceiptLineItem testReceiptLine({
  String rawName = 'Süt 1L',
  String cleanName = 'süt',
  String category = 'Dairy',
  double confidence = 0.9,
}) {
  return ReceiptLineItem(
    rawName: rawName,
    cleanName: cleanName,
    quantity: '1',
    category: category,
    estimatedExpiryDays: 7,
    confidence: confidence,
  );
}
