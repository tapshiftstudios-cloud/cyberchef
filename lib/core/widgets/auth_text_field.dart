import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';



import '../l10n/app_strings.dart';

import '../theme/app_colors.dart';

import '../theme/neon_decorations.dart';



/// Email/password fields — uses system font for input (Google Fonts can block

/// visible typing on some Android devices).

class AuthTextField extends StatefulWidget {

  const AuthTextField({

    super.key,

    required this.controller,

    required this.label,

    this.focusNode,

    this.obscureText = false,

    this.enablePasswordToggle = false,

    this.keyboardType,

    this.textInputAction,

    this.enabled = true,

    this.autofocus = false,

    this.validator,

    this.onFieldSubmitted,

  });



  final TextEditingController controller;

  final FocusNode? focusNode;

  final String label;

  final bool obscureText;

  final bool enablePasswordToggle;

  final TextInputType? keyboardType;

  final TextInputAction? textInputAction;

  final bool enabled;

  final bool autofocus;

  final String? Function(String?)? validator;

  final void Function(String)? onFieldSubmitted;



  @override

  State<AuthTextField> createState() => _AuthTextFieldState();

}



class _AuthTextFieldState extends State<AuthTextField> {

  late final FocusNode _focusNode;

  bool _ownsFocusNode = false;

  late bool _obscured;



  @override

  void initState() {

    super.initState();

    if (widget.focusNode != null) {

      _focusNode = widget.focusNode!;

    } else {

      _focusNode = FocusNode();

      _ownsFocusNode = true;

    }

    _obscured = widget.obscureText;

  }



  @override

  void didUpdateWidget(covariant AuthTextField oldWidget) {

    super.didUpdateWidget(oldWidget);

    if (!widget.enablePasswordToggle &&

        widget.obscureText != oldWidget.obscureText) {

      _obscured = widget.obscureText;

    }

  }



  @override

  void dispose() {

    if (_ownsFocusNode) {

      _focusNode.dispose();

    }

    super.dispose();

  }



  void _openKeyboard() {

    if (!widget.enabled) return;

    _focusNode.requestFocus();

    SystemChannels.textInput.invokeMethod<void>('TextInput.show');

  }



  bool get _isObscured =>

      widget.enablePasswordToggle ? _obscured : widget.obscureText;



  @override

  Widget build(BuildContext context) {

    return GestureDetector(

      behavior: HitTestBehavior.opaque,

      onTap: _openKeyboard,

      child: TextFormField(

        controller: widget.controller,

        focusNode: _focusNode,

        obscureText: _isObscured,

        keyboardType: widget.keyboardType,

        textInputAction: widget.textInputAction,

        enabled: widget.enabled,

        autofocus: widget.autofocus,

        validator: widget.validator,

        onFieldSubmitted: widget.onFieldSubmitted,

        onTap: _openKeyboard,

        enableInteractiveSelection: true,

        autocorrect: !_isObscured,

        enableSuggestions: !_isObscured,

        style: TextStyle(

          color: AppColors.textPrimary,

          fontSize: 16,

          fontWeight: FontWeight.w400,

          decorationColor: AppColors.textPrimary,

        ),

        cursorColor: AppColors.primary,

        decoration: InputDecoration(

          labelText: widget.label,

          labelStyle: GoogleFonts.inter(

            fontSize: 13,

            fontWeight: FontWeight.w500,

            color: AppColors.textMuted,

          ),

          hintStyle: TextStyle(color: AppColors.textMuted.withValues(alpha: 0.8)),

          suffixIcon: widget.enablePasswordToggle

              ? IconButton(

                  tooltip: _isObscured

                      ? AppStrings.passwordVisibilityShow

                      : AppStrings.passwordVisibilityHide,

                  onPressed: widget.enabled

                      ? () => setState(() => _obscured = !_obscured)

                      : null,

                  icon: Icon(

                    _isObscured

                        ? Icons.visibility_outlined

                        : Icons.visibility_off_outlined,

                    color: AppColors.textMuted,

                    size: 22,

                  ),

                )

              : null,

          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),

            borderSide: BorderSide(color: AppColors.border),

          ),

          focusedBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),

            borderSide: BorderSide(color: AppColors.primary, width: 1.5),

          ),

          errorBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),

            borderSide: BorderSide(color: AppColors.error),

          ),

          focusedErrorBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),

            borderSide: BorderSide(color: AppColors.error, width: 1.5),

          ),

          filled: true,

          fillColor: AppColors.surfaceElevated,

        ),

      ),

    );

  }

}


