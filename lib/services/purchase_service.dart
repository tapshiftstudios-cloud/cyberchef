import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';

final class PurchaseService {
  PurchaseService({InAppPurchase? iap}) : _iap = iap ?? InAppPurchase.instance;

  final InAppPurchase _iap;

  Stream<List<PurchaseDetails>> get purchaseStream => _iap.purchaseStream;

  Future<bool> get isAvailable => _iap.isAvailable();

  Future<List<ProductDetails>> queryProducts(Set<String> ids) async {
    if (ids.isEmpty) return const [];
    final response = await _iap.queryProductDetails(ids);
    if (response.error != null) return const [];
    return response.productDetails;
  }

  Future<bool> buy(ProductDetails product) async {
    final param = PurchaseParam(productDetails: product);
    return _iap.buyNonConsumable(purchaseParam: param);
  }

  Future<void> restorePurchases() => _iap.restorePurchases();

  Future<void> completePending(PurchaseDetails purchase) async {
    if (!purchase.pendingCompletePurchase) return;
    await _iap.completePurchase(purchase);
  }
}

const _terminalStatuses = {
  PurchaseStatus.error,
  PurchaseStatus.purchased,
  PurchaseStatus.restored,
  PurchaseStatus.canceled,
};

bool isPurchaseTerminal(PurchaseDetails purchase) =>
    _terminalStatuses.contains(purchase.status);
