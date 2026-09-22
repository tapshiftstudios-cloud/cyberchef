import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/theme/app_color_palette.dart';
import '../../../core/theme/app_colors.dart';
import 'widgets/floating_produce_background.dart';

/// Açılış: tema uyumlu gradient + hareketli meyve/sebze + uygulama simgesi.
class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _intro;
  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;

  @override
  void initState() {
    super.initState();
    _intro = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _logoFade = CurvedAnimation(parent: _intro, curve: Curves.easeOut);
    _logoScale = Tween<double>(begin: 0.9, end: 1).animate(
      CurvedAnimation(parent: _intro, curve: Curves.easeOutBack),
    );
    _intro.forward();
  }

  @override
  void dispose() {
    _intro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(appThemeProvider);
    ref.watch(localeProvider);
    final palette = AppColors.palette;
    final bottomColor = palette.scaffoldBottomColor;
    final overlayStyle = SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
          palette.isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: bottomColor,
      systemNavigationBarIconBrightness:
          palette.isLight ? Brightness.dark : Brightness.light,
      systemNavigationBarContrastEnforced: false,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
      backgroundColor: bottomColor,
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          _SplashBackground(palette: palette),
          FloatingProduceBackground(isLight: palette.isLight),
          SafeArea(
            child: Column(
              children: [
                const Spacer(flex: 2),
                FadeTransition(
                  opacity: _logoFade,
                  child: ScaleTransition(
                    scale: _logoScale,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _CenterAppIcon(isLight: palette.isLight),
                        const SizedBox(height: 28),
                        Text(
                          AppStrings.appBrandName,
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.6,
                            color: palette.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 36),
                          child: Text(
                            AppStrings.splashTagline,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              height: 1.45,
                              color: palette.textSecondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Spacer(flex: 3),
                SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(
                    color: palette.primary,
                    strokeWidth: 2.5,
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}

class _SplashBackground extends StatelessWidget {
  const _SplashBackground({required this.palette});

  final AppColorPalette palette;

  @override
  Widget build(BuildContext context) {
    final topGlow = palette.primary.withValues(
      alpha: palette.isLight ? 0.12 : 0.22,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: palette.scaffoldDecoration),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                topGlow,
                Colors.transparent,
              ],
              stops: const [0.0, 0.55],
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: const Alignment(0, -0.35),
              radius: 0.9,
              colors: [
                palette.primary.withValues(
                  alpha: palette.isLight ? 0.08 : 0.14,
                ),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _CenterAppIcon extends StatelessWidget {
  const _CenterAppIcon({required this.isLight});

  final bool isLight;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;
    return Container(
      width: 132,
      height: 132,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: primary.withValues(alpha: isLight ? 0.35 : 0.5),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: isLight ? 0.25 : 0.45),
            blurRadius: isLight ? 28 : 36,
            spreadRadius: isLight ? 0 : 2,
          ),
          if (isLight)
            BoxShadow(
              color: AppColors.border.withValues(alpha: 0.8),
              blurRadius: 12,
            ),
        ],
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/icon/app_icon.png',
          width: 132,
          height: 132,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
