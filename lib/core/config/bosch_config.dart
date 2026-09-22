import 'app_env.dart';

/// Home Connect REST API (simulator vs production).
abstract final class BoschConfig {
  static String get apiHost {
    final raw = AppEnv.value('BOSCH_API_HOST');
    if (raw != null && raw.isNotEmpty) {
      return raw.endsWith('/') ? raw.substring(0, raw.length - 1) : raw;
    }
    return 'https://simulator.home-connect.com';
  }

  static const jsonAccept = 'application/vnd.bsh.sdk.v1+json';

  static bool get isSimulator =>
      apiHost.contains('simulator.home-connect.com');
}
