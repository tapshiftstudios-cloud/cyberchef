import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/config/supabase_config.dart';

abstract final class SupabaseBootstrap {
  static bool _initialized = false;

  static bool get isReady => _initialized;

  static SupabaseClient? get client =>
      _initialized ? Supabase.instance.client : null;

  static Future<void> initialize() async {
    if (_initialized) return;

    if (!SupabaseConfig.isConfigured) {
      return;
    }

    await Supabase.initialize(
      url: SupabaseConfig.url!,
      anonKey: SupabaseConfig.anonKey!,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.pkce,
      ),
    );
    _initialized = true;
  }
}
