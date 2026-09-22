import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/config/supabase_config.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/storage/onboarding_storage.dart';
import '../../../core/theme/app_colors.dart';
import '../../pantry/data/pantry_item_storage.dart';
import '../../../services/freshness_notification_service.dart';
import '../../../services/pantry_widget_service.dart';
import '../../../services/supabase_bootstrap.dart';
import 'splash_screen.dart';
import '../../auth/presentation/widgets/auth_gate.dart';
import '../../onboarding/presentation/onboarding_screen.dart';

/// İlk kare: animasyonlu splash; arka planda servis + onboarding yüklenir.
class AppLauncher extends StatefulWidget {
  const AppLauncher({super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  static const _minSplashDuration = Duration(milliseconds: 1800);

  bool _bootstrapDone = false;
  bool _onboardingComplete = false;
  String? _bootstrapError;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap() async {
    try {
      final results = await Future.wait([
        OnboardingStorage.isComplete(),
        _initializeServices(),
        Future<void>.delayed(_minSplashDuration),
      ]);

      final onboarding = results[0] as bool;
      if (!mounted) return;
      setState(() {
        _onboardingComplete = onboarding;
        _bootstrapDone = true;
        _bootstrapError = null;
      });

      await _postSplashWarmup();
    } catch (e, st) {
      debugPrint('Bootstrap error: $e\n$st');
      if (!mounted) return;
      setState(() {
        _bootstrapDone = true;
        _bootstrapError = AppStrings.genericLoadError;
      });
    }
  }

  Future<void> _initializeServices() async {
    await SupabaseBootstrap.initialize();
    await FreshnessNotificationService.instance.initialize();
  }

  Future<void> _postSplashWarmup() async {
    try {
      final items = await PantryItemStorage.loadAll();
      await FreshnessNotificationService.instance.refreshFromItems(items);
      await PantryWidgetService.updateFromItems(items);
      if (SupabaseConfig.isConfigured) {
        // AuthGate / pantry provider cloud sync runs after sign-in.
      }
    } catch (e) {
      debugPrint('Post-splash warmup: $e');
    }
  }

  Future<void> _finishOnboarding() async {
    await OnboardingStorage.markComplete();
    if (mounted) setState(() => _onboardingComplete = true);
  }

  void _retryBootstrap() {
    setState(() {
      _bootstrapDone = false;
      _bootstrapError = null;
    });
    _bootstrap();
  }

  Widget _buildMainContent() {
    if (_bootstrapError != null) {
      return _BootstrapErrorView(
        key: const ValueKey('bootstrap-error'),
        message: _bootstrapError!,
        onRetry: _retryBootstrap,
      );
    }
    if (!_onboardingComplete) {
      return OnboardingScreen(
        key: const ValueKey('onboarding'),
        onComplete: _finishOnboarding,
      );
    }
    return const AuthGate(key: ValueKey('auth'));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeOut,
      child: !_bootstrapDone
          ? const SplashScreen(key: ValueKey('splash'))
          : _buildMainContent(),
    );
  }
}

class _BootstrapErrorView extends StatelessWidget {
  const _BootstrapErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: AppColors.error,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 20),
              IconButton.filled(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
