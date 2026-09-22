/// Buzdolabı, fiş ve barkod tarama modları.

enum CameraCaptureType {

  fridge,

  receipt,

  barcode;



  bool get isReceipt => this == CameraCaptureType.receipt;

  bool get isFridge => this == CameraCaptureType.fridge;

  bool get isBarcode => this == CameraCaptureType.barcode;

}

