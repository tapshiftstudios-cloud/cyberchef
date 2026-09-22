import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/ai_backend_proxy.dart';
import '../../services/ai_service.dart';
import '../../services/purchase_service.dart';
import '../../services/supabase_bootstrap.dart';
import '../ai/ai_device_identity.dart';
import '../config/app_env.dart';

final aiBackendProxyProvider = Provider<AiBackendProxy>((ref) {
  final url = AppEnv.aiBackendProxyUrl;
  if (url == null || url.trim().isEmpty) {
    return NoopAiBackendProxy();
  }
  return HttpAiBackendProxy(
    baseUrl: url,
    bearerToken: AppEnv.value('AI_BACKEND_PROXY_BEARER'),
    authBearerProvider: () async =>
        SupabaseBootstrap.client?.auth.currentSession?.accessToken,
    deviceIdProvider: AiDeviceIdentity.getOrCreate,
  );
});

final aiServiceProvider = Provider<AiService>(
  (ref) => AiService(proxy: ref.read(aiBackendProxyProvider)),
);

final purchaseServiceProvider =
    Provider<PurchaseService>((ref) => PurchaseService());

final isAnalyzingProvider = StateProvider<bool>((ref) => false);
