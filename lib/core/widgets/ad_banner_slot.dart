import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../ads/ad_config.dart';
import '../../services/ad_service.dart';

/// Alt banner reklam alanı — kamera ekranı hariç pasif sekmelerde.
class AdBannerSlot extends StatefulWidget {
  const AdBannerSlot({super.key, this.show = true});

  final bool show;

  @override
  State<AdBannerSlot> createState() => _AdBannerSlotState();
}

class _AdBannerSlotState extends State<AdBannerSlot> {
  BannerAd? _banner;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadBanner();
  }

  @override
  void didUpdateWidget(covariant AdBannerSlot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.show != widget.show) {
      if (!widget.show) {
        _banner?.dispose();
        _banner = null;
        _loaded = false;
      } else {
        _loadBanner();
      }
    }
  }

  void _loadBanner() {
    if (!widget.show || !AdConfig.isConfigured) return;
    _banner?.dispose();
    _loaded = false;
    _banner = AdService.instance.createBannerAd(
      onLoaded: (ad) {
        if (!mounted) return;
        setState(() => _loaded = true);
      },
      onFailed: (ad, _) {
        ad.dispose();
        if (!mounted) return;
        setState(() {
          _banner = null;
          _loaded = false;
        });
      },
    );
  }

  @override
  void dispose() {
    _banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.show || !AdConfig.isConfigured) {
      return const SizedBox.shrink();
    }
    final banner = _banner;
    if (!_loaded || banner == null) {
      return const SizedBox(height: 0);
    }
    return SafeArea(
      top: false,
      child: SizedBox(
        width: banner.size.width.toDouble(),
        height: banner.size.height.toDouble(),
        child: AdWidget(ad: banner),
      ),
    );
  }
}
