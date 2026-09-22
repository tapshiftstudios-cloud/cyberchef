import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/l10n/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../../core/widgets/auth_text_field.dart';
import '../../../core/widgets/responsive_shell.dart';
import '../../auth/data/auth_repository.dart';
import '../../auth/presentation/providers/auth_provider.dart';

/// Full-screen flow to link anonymous session to email before Pro purchase.
class ProAccountLinkScreen extends ConsumerStatefulWidget {
  const ProAccountLinkScreen({super.key});

  static Future<bool> open(BuildContext context) {
    return Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (_) => const ProAccountLinkScreen(),
      ),
    ).then((value) => value ?? false);
  }

  @override
  ConsumerState<ProAccountLinkScreen> createState() =>
      _ProAccountLinkScreenState();
}

class _ProAccountLinkScreenState extends ConsumerState<ProAccountLinkScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocus = FocusNode();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(authRepositoryProvider).linkEmailAccount(
            email: _emailController.text,
            password: _passwordController.text,
          );
      if (!mounted) return;
      Navigator.of(context).pop(true);
    } on AuthFailure catch (e) {
      setState(() => _errorMessage = localizeAuthError(e.message));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(AppStrings.proEmailRequiredTitle),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: ResponsiveShell(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppStrings.proEmailRequiredBody,
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: AppColors.textMuted,
                      height: 1.45,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: NeonDecorations.card(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AuthTextField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          label: AppStrings.emailLabel,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          enabled: !_isLoading,
                          autofocus: true,
                          validator: (v) {
                            if (v == null || v.trim().isEmpty) {
                              return AppStrings.emailRequired;
                            }
                            if (!v.contains('@')) {
                              return AppStrings.emailInvalid;
                            }
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
                          enabled: !_isLoading,
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
                            label: AppStrings.proLinkAccountAction,
                            icon: Icons.mail_outline,
                            onPressed: _isLoading ? null : _submit,
                          ),
                        ),
                      ],
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
