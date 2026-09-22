import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'service_providers.dart';

final subscriptionTierProvider = FutureProvider<String>((ref) async {
  final status = await ref.read(aiServiceProvider).fetchBackendUsageStatus();
  return status?.tier.toLowerCase() ?? 'free';
});

final showAdsProvider = FutureProvider<bool>((ref) async {
  final tier = await ref.watch(subscriptionTierProvider.future);
  return tier != 'pro';
});
