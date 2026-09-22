import 'app_env.dart';

/// Public privacy policy URL (also set via PRIVACY_POLICY_URL in release builds).
abstract final class PrivacyConfig {
  static const String defaultPolicyUrl =
      'https://sites.google.com/view/cyberchefprivacy/ana-sayfa';

  static String get policyUrl =>
      AppEnv.value('PRIVACY_POLICY_URL') ?? defaultPolicyUrl;
}
