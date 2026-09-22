import 'dart:async';

import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../core/ads/ad_config.dart';

enum RewardedAdResult {
  completed,
  unavailable,
  dismissed,
  failed,
}

final class AdService {
  AdService._();

  static final AdService instance = AdService._();

  bool _initialized = false;
  RewardedAd? _rewardedAd;
  bool _rewardedLoading = false;
  Completer<RewardedAdResult>? _rewardCompleter;

  Future<void> initialize() async {
    if (_initialized || !AdConfig.isConfigured) return;
    await MobileAds.instance.initialize();
    _initialized = true;
    unawaited(_preloadRewarded());
  }

  BannerAd? createBannerAd({
    required void Function(Ad ad) onLoaded,
    required void Function(Ad ad, LoadAdError error) onFailed,
  }) {
    if (!AdConfig.isConfigured) return null;
    final banner = BannerAd(
      adUnitId: AdConfig.bannerUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: onLoaded,
        onAdFailedToLoad: onFailed,
      ),
    );
    banner.load();
    return banner;
  }

  Future<void> _preloadRewarded() async {
    if (!AdConfig.isConfigured || _rewardedLoading || _rewardedAd != null) {
      return;
    }
    _rewardedLoading = true;
    try {
      await RewardedAd.load(
        adUnitId: AdConfig.rewardedUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (ad) {
            _rewardedAd = ad;
            _rewardedLoading = false;
          },
          onAdFailedToLoad: (_) {
            _rewardedLoading = false;
            _completeReward(RewardedAdResult.unavailable);
          },
        ),
      );
    } catch (_) {
      _rewardedLoading = false;
      _completeReward(RewardedAdResult.failed);
    }
  }

  void _completeReward(RewardedAdResult result) {
    final completer = _rewardCompleter;
    if (completer != null && !completer.isCompleted) {
      completer.complete(result);
    }
    _rewardCompleter = null;
  }

  Future<RewardedAdResult> showRewardedAd() async {
    if (!AdConfig.isConfigured) return RewardedAdResult.unavailable;

    if (_rewardedAd == null) {
      await _preloadRewarded();
      await Future<void>.delayed(const Duration(milliseconds: 400));
    }

    final ad = _rewardedAd;
    if (ad == null) return RewardedAdResult.unavailable;

    _rewardCompleter = Completer<RewardedAdResult>();
    var earned = false;

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (dismissedAd) {
        dismissedAd.dispose();
        _rewardedAd = null;
        _completeReward(
          earned ? RewardedAdResult.completed : RewardedAdResult.dismissed,
        );
        unawaited(_preloadRewarded());
      },
      onAdFailedToShowFullScreenContent: (failedAd, _) {
        failedAd.dispose();
        _rewardedAd = null;
        _completeReward(RewardedAdResult.failed);
        unawaited(_preloadRewarded());
      },
    );

    await ad.show(
      onUserEarnedReward: (_, __) {
        earned = true;
      },
    );

    return _rewardCompleter!.future;
  }
}
