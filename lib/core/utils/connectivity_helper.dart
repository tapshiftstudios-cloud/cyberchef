import 'dart:io';

/// Basit ağ kontrolü (Gemini çağrısı öncesi).
abstract final class ConnectivityHelper {
  static Future<bool> hasConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com')
          .timeout(const Duration(seconds: 3));
      return result.isNotEmpty && result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
