import 'dart:io';

import 'package:flutter/foundation.dart';

import '../config/app_env.dart';

abstract final class AdConfig {
  static const String appIdKey = 'ADMOB_APP_ID';
  static const String bannerUnitKey = 'ADMOB_BANNER_UNIT_ID';
  static const String rewardedUnitKey = 'ADMOB_REWARDED_UNIT_ID';
  static const String adsEnabledKey = 'ADS_ENABLED';

  static const String _testAppId = 'ca-app-pub-3940256099942544~3347511713';
  static const String _testAndroidBanner =
      'ca-app-pub-3940256099942544/6300978111';
  static const String _testAndroidRewarded =
      'ca-app-pub-3940256099942544/5224354917';
  static const String _testIosBanner = 'ca-app-pub-3940256099942544/2934735716';
  static const String _testIosRewarded =
      'ca-app-pub-3940256099942544/1712485313';

  static bool get isEnabled {
    final raw = AppEnv.value(adsEnabledKey)?.toLowerCase();
    if (raw == 'false' || raw == '0' || raw == 'no') return false;
    return true;
  }

  static String get appId {
    final configured = AppEnv.value(appIdKey);
    if (configured != null && configured.isNotEmpty) return configured;
    return _testAppId;
  }

  static String get bannerUnitId {
    final configured = AppEnv.value(bannerUnitKey);
    if (configured != null && configured.isNotEmpty) return configured;
    if (Platform.isIOS) return _testIosBanner;
    return _testAndroidBanner;
  }

  static String get rewardedUnitId {
    final configured = AppEnv.value(rewardedUnitKey);
    if (configured != null && configured.isNotEmpty) return configured;
    if (Platform.isIOS) return _testIosRewarded;
    return _testAndroidRewarded;
  }

  static bool get usingTestUnits {
    final hasBanner = AppEnv.value(bannerUnitKey)?.isNotEmpty ?? false;
    final hasRewarded = AppEnv.value(rewardedUnitKey)?.isNotEmpty ?? false;
    return !hasBanner || !hasRewarded;
  }

  @visibleForTesting
  static bool configuredForRuntime({
    required bool enabled,
    required bool hasBanner,
    required bool hasRewarded,
  }) {
    return enabled && hasBanner && hasRewarded;
  }

  static bool get isConfigured {
    if (!isEnabled) return false;
    if (kReleaseMode && usingTestUnits) {
      assert(() {
        debugPrint(
          'AdConfig: release build has no production AdMob unit IDs — ads disabled.',
        );
        return true;
      }());
      return false;
    }
    return bannerUnitId.isNotEmpty && rewardedUnitId.isNotEmpty;
  }
}
