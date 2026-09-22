import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../providers/auth_provider.dart';

/// Refreshes Supabase session after auth deep links so [User.emailConfirmedAt] updates.
class AuthSessionRefreshListener extends ConsumerStatefulWidget {
  const AuthSessionRefreshListener({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<AuthSessionRefreshListener> createState() =>
      _AuthSessionRefreshListenerState();
}

class _AuthSessionRefreshListenerState
    extends ConsumerState<AuthSessionRefreshListener> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<AuthState?>>(authStateProvider, (previous, next) {
      final event = next.value?.event;
      if (event == null) return;
      if (event == AuthChangeEvent.initialSession) return;

      if (event == AuthChangeEvent.signedIn ||
          event == AuthChangeEvent.userUpdated) {
        unawaited(() async {
          try {
            await ref.read(authRepositoryProvider).refreshSession();
          } catch (_) {}
        }());
      }
    });

    return widget.child;
  }
}
