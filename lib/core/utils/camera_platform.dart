import 'package:flutter/foundation.dart';

/// Live camera preview is only supported on Android and iOS in this app.
bool get supportsLiveCamera {
  if (kIsWeb) return false;
  return switch (defaultTargetPlatform) {
    TargetPlatform.android || TargetPlatform.iOS => true,
    _ => false,
  };
}
