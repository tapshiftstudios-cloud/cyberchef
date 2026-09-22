import 'dart:typed_data';

import 'package:image/image.dart' as img;

/// Fiş / pantry fotoğrafı için basit kalite kontrolü.
class ImageQualityResult {
  const ImageQualityResult({
    required this.isAcceptable,
    this.tooDark = false,
    this.tooBlurry = false,
  });

  final bool isAcceptable;
  final bool tooDark;
  final bool tooBlurry;
}

abstract final class ImageQualityCheck {
  static Future<ImageQualityResult> analyze(Uint8List bytes) async {
    final decoded = img.decodeImage(bytes);
    if (decoded == null) {
      return const ImageQualityResult(isAcceptable: false);
    }

    final w = decoded.width;
    final h = decoded.height;
    if (w < 200 || h < 200) {
      return const ImageQualityResult(isAcceptable: false, tooBlurry: true);
    }

    var luminanceSum = 0.0;
    var edgeSum = 0.0;
    var samples = 0;
    final step = (w > 800 ? 12 : 8);

    for (var y = 0; y < h - step; y += step) {
      for (var x = 0; x < w - step; x += step) {
        final p = decoded.getPixel(x, y);
        final lum = img.getLuminance(p);
        luminanceSum += lum;

        final p2 = decoded.getPixel(x + step, y);
        final p3 = decoded.getPixel(x, y + step);
        edgeSum += (lum - img.getLuminance(p2)).abs() +
            (lum - img.getLuminance(p3)).abs();
        samples++;
      }
    }

    if (samples == 0) {
      return const ImageQualityResult(isAcceptable: true);
    }

    final avgLum = luminanceSum / samples;
    final avgEdge = edgeSum / samples;

    final tooDark = avgLum < 45;
    final tooBlurry = avgEdge < 8;

    return ImageQualityResult(
      isAcceptable: !tooDark && !tooBlurry,
      tooDark: tooDark,
      tooBlurry: tooBlurry,
    );
  }
}
