import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/config/supabase_config.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/neon_decorations.dart';
import '../../../app/presentation/main_shell.dart';
import 'authenticated_home.dart';
import '../auth_screen.dart';
import '../providers/auth_provider.dart';

/// Routes to auth or main app based on Supabase session or offline mode.
class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!SupabaseConfig.isConfigured) {
      return const MainShellHost();
    }

    final localAuth = ref.watch(localAuthModeProvider);
    if (localAuth.valueOrNull == true) {
      return const MainShellHost();
    }

    final authAsync = ref.watch(authStateProvider);
    final repo = ref.watch(authRepositoryProvider);

    return authAsync.when(
      data: (state) {
        final session = state?.session;
        if (session != null) {
          return const AuthenticatedHome();
        }
        return const AuthScreen();
      },
      loading: () {
        if (repo.currentUser != null) {
          return const AuthenticatedHome();
        }
        if (localAuth.isLoading) {
          return const _AuthLoading();
        }
        return const _AuthLoading();
      },
      error: (e, st) {
        debugPrint('AuthGate error: $e\n$st');
        if (repo.currentUser != null) {
          return const AuthenticatedHome();
        }
        return _AuthError(
          message: AppStrings.authSupabaseUnreachable,
          onRetry: () => ref.invalidate(authStateProvider),
          onContinueOffline: () =>
              ref.read(localAuthModeProvider.notifier).enable(),
        );
      },
    );
  }
}

class _AuthLoading extends StatelessWidget {
  const _AuthLoading();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(36),
          decoration: NeonDecorations.card(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2,
              ),
              const SizedBox(height: 18),
              Text(
                AppStrings.authInitializing,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AuthError extends StatelessWidget {
  const _AuthError({
    required this.message,
    required this.onRetry,
    required this.onContinueOffline,
  });

  final String message;
  final VoidCallback onRetry;
  final VoidCallback onContinueOffline;

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
                tooltip: AppStrings.genericLoadError,
                icon: const Icon(Icons.refresh),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: onContinueOffline,
                child: Text(AppStrings.authContinueOffline),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
