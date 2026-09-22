import 'dart:typed_data';

import 'package:image/image.dart' as img;

import '../l10n/app_strings.dart';
import '../../services/ai_service.dart';

/// Resizes pantry photos to [AiService.targetImageSize] before Gemini upload.
Future<Uint8List> resizeImageToSquare(
  Uint8List rawBytes, {
  int size = AiService.targetImageSize,
  int jpegQuality = 85,
}) async {
  final decoded = img.decodeImage(rawBytes);
  if (decoded == null) {
    throw ImageResizeException(AppStrings.imageDecodeError);
  }

  final resized = img.copyResize(
    decoded,
    width: size,
    height: size,
    interpolation: img.Interpolation.linear,
  );

  return Uint8List.fromList(img.encodeJpg(resized, quality: jpegQuality));
}

/// Fiş fotoğrafları için dikey oran (uzun fiş metni korunur).
Future<Uint8List> resizeImageForReceipt(
  Uint8List rawBytes, {
  int maxWidth = 720,
  int maxHeight = 1280,
  int jpegQuality = 88,
}) async {
  final decoded = img.decodeImage(rawBytes);
  if (decoded == null) {
    throw ImageResizeException(AppStrings.imageDecodeError);
  }

  var w = decoded.width;
  var h = decoded.height;
  final scale = (w > maxWidth || h > maxHeight)
      ? (w / maxWidth > h / maxHeight ? maxWidth / w : maxHeight / h)
      : 1.0;
  if (scale < 1) {
    w = (w * scale).round();
    h = (h * scale).round();
  }

  final resized = img.copyResize(
    decoded,
    width: w,
    height: h,
    interpolation: img.Interpolation.linear,
  );

  return Uint8List.fromList(img.encodeJpg(resized, quality: jpegQuality));
}

class ImageResizeException implements Exception {
  const ImageResizeException(this.message);
  final String message;

  @override
  String toString() => message;
}
