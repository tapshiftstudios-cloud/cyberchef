import 'app_env.dart';

/// Deep link used after Supabase email confirmation / magic links.
abstract final class SupabaseAuthConfig {
  static const String scheme = 'com.cyberchef.pantry';
  static const String host = 'login-callback';

  /// `com.cyberchef.pantry://login-callback`
  static String get redirectUrl =>
      AppEnv.value('SUPABASE_AUTH_REDIRECT_URL') ??
      '$scheme://$host';
}
