import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/utils/auth_network_utils.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/auth_text_field.dart';
import '../../../core/widgets/responsive_shell.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/neon_decorations.dart';
import '../data/auth_repository.dart';
import 'providers/auth_provider.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isSignUp = false;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final repo = ref.read(authRepositoryProvider);
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      if (_isSignUp) {
        await repo.signUpWithEmail(email: email, password: password);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(AppStrings.accountCreated),
            ),
          );
        }
      } else {
        await repo.signInWithEmail(email: email, password: password);
      }
    } on AuthFailure catch (e) {
      setState(
        () => _errorMessage = _authErrorMessage(e),
      );
    } catch (e) {
      setState(
        () => _errorMessage = isAuthNetworkFailure(e)
            ? AppStrings.authSupabaseUnreachable
            : AppStrings.genericError,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  String _authErrorMessage(AuthFailure e) {
    if (isAuthNetworkFailure(e.message)) {
      return AppStrings.authSupabaseUnreachable;
    }
    return localizeAuthError(e.message);
  }

  Future<void> _continueOffline() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    await ref.read(localAuthModeProvider.notifier).enable();
    if (mounted) setState(() => _isLoading = false);
  }

  Future<void> _guestSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(authRepositoryProvider).signInAsGuest();
    } on AuthFailure catch (e) {
      if (isAuthNetworkFailure(e.message)) {
        await ref.read(localAuthModeProvider.notifier).enable();
        return;
      }
      setState(() => _errorMessage = _authErrorMessage(e));
    } catch (e) {
      if (isAuthNetworkFailure(e)) {
        await ref.read(localAuthModeProvider.notifier).enable();
        return;
      }
      setState(() => _errorMessage = AppStrings.networkError);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _googleSignIn() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    } on AuthFailure catch (e) {
      setState(() => _errorMessage = _authErrorMessage(e));
    } catch (e) {
      setState(
        () => _errorMessage = isAuthNetworkFailure(e)
            ? AppStrings.authSupabaseUnreachable
            : AppStrings.genericError,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 36),
          child: ResponsiveShell(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppStrings.appBrandName,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  AppStrings.authSubtitle,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: NeonDecorations.card(),
                  child: Column(
                    children: [
                      AuthTextField(
                        controller: _emailController,
                        label: AppStrings.emailLabel,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) {
                            return AppStrings.emailRequired;
                          }
                          if (!v.contains('@')) return AppStrings.emailInvalid;
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        controller: _passwordController,
                        label: AppStrings.passwordLabel,
                        enablePasswordToggle: true,
                        obscureText: true,
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _submit(),
                        validator: (v) {
                          if (v == null || v.length < 6) {
                            return AppStrings.passwordMin;
                          }
                          return null;
                        },
                      ),
                      if (_errorMessage != null) ...[
                        const SizedBox(height: 12),
                        Text(
                          _errorMessage!,
                          style: GoogleFonts.inter(
                            color: AppColors.error,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: AppTheme.neonButton(
                          label: _isSignUp ? AppStrings.signUp : AppStrings.signIn,
                          icon: Icons.login,
                          onPressed: _isLoading ? null : _submit,
                        ),
                      ),
                      const SizedBox(height: 12),
                      TextButton(
                        onPressed: _isLoading
                            ? null
                            : () => setState(() => _isSignUp = !_isSignUp),
                        child: Text(
                          _isSignUp
                              ? AppStrings.toggleToSignIn
                              : AppStrings.toggleToSignUp,
                          style: GoogleFonts.inter(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  AppStrings.authOrContinueWith,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _isLoading ? null : _googleSignIn,
                    icon: const Icon(Icons.g_mobiledata_rounded, size: 28),
                    label: Text(AppStrings.signInWithGoogle),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: BorderSide(color: AppColors.border),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Center(
                  child: AppTheme.neonButton(
                    label: AppStrings.guestContinue,
                    icon: Icons.person_outline,
                    accent: AppColors.secondary,
                    onPressed: _isLoading ? null : _guestSignIn,
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: _isLoading ? null : _continueOffline,
                  child: Text(
                    AppStrings.authContinueOffline,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                      fontSize: 13,
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
    );
  }
}
