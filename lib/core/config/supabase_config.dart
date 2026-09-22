import 'app_env.dart';

abstract final class SupabaseConfig {
  static String? get url {
    final value = AppEnv.value('SUPABASE_URL');
    if (value == null || value.trim().isEmpty) return null;
    return value.trim();
  }

  static String? get anonKey {
    final value = AppEnv.value('SUPABASE_ANON_KEY');
    if (value == null || value.trim().isEmpty) return null;
    return value.trim();
  }

  static bool get isConfigured => url != null && anonKey != null;
}
