import 'package:cyberchef/services/purchase_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

void main() {
  group('isPurchaseTerminal', () {
    test('returns true for purchased, restored, error, canceled', () {
      for (final status in [
        PurchaseStatus.purchased,
        PurchaseStatus.restored,
        PurchaseStatus.error,
        PurchaseStatus.canceled,
      ]) {
        expect(
          isPurchaseTerminal(_FakePurchase(status)),
          isTrue,
          reason: status.name,
        );
      }
    });

    test('returns false for pending', () {
      expect(
        isPurchaseTerminal(_FakePurchase(PurchaseStatus.pending)),
        isFalse,
      );
    });
  });
}

class _FakePurchase extends PurchaseDetails {
  _FakePurchase(this._status)
      : super(
          purchaseID: 'test',
          productID: 'com.cyberchef.pantry.pro.monthly',
          verificationData: PurchaseVerificationData(
            localVerificationData: '',
            serverVerificationData: '',
            source: 'google_play',
          ),
          transactionDate: null,
          status: _status,
        );

  final PurchaseStatus _status;

  @override
  PurchaseStatus get status => _status;
}
