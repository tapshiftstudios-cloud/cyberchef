import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/config/supabase_auth_config.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/utils/auth_network_utils.dart';
import '../../../services/supabase_bootstrap.dart';

class AuthRepository {
  AuthRepository({SupabaseClient? client})
      : _client = client ?? SupabaseBootstrap.client;

  final SupabaseClient? _client;

  bool get isAvailable => _client != null;

  Stream<AuthState> authStateChanges() {
    final client = _client;
    if (client == null) {
      return Stream.value(const AuthState(AuthChangeEvent.signedOut, null));
    }
    return client.auth.onAuthStateChange;
  }

  User? get currentUser => _client?.auth.currentUser;

  bool get isSignedIn => currentUser != null;

  bool get isAnonymousUser => currentUser?.isAnonymous ?? false;

  bool get hasRegisteredAccount {
    final user = currentUser;
    if (user == null) return false;
    if (user.isAnonymous) return false;
    final email = user.email;
    return email != null && email.trim().isNotEmpty;
  }

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    _requireClient();
    try {
      await _client!.auth.signInWithPassword(
        email: email.trim(),
        password: password,
      );
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } catch (e) {
      if (isAuthNetworkFailure(e)) {
        throw AuthFailure(AppStrings.networkError);
      }
      rethrow;
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    _requireClient();
    try {
      await _client!.auth.signUp(
        email: email.trim(),
        password: password,
        emailRedirectTo: SupabaseAuthConfig.redirectUrl,
      );
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    }
  }

  Future<void> signInAsGuest() async {
    _requireClient();
    try {
      await _client!.auth.signInAnonymously();
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    } catch (e) {
      if (isAuthNetworkFailure(e)) {
        throw AuthFailure(AppStrings.networkError);
      }
      rethrow;
    }
  }

  Future<void> signInWithGoogle() async {
    _requireClient();
    try {
      await _client!.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: SupabaseAuthConfig.redirectUrl,
        authScreenLaunchMode: LaunchMode.externalApplication,
      );
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    }
  }

  /// Converts the current anonymous session into a permanent email account.
  Future<void> linkEmailAccount({
    required String email,
    required String password,
  }) async {
    _requireClient();
    final user = currentUser;
    if (user == null) {
      throw const AuthFailure('Not signed in.');
    }
    if (!user.isAnonymous) {
      throw const AuthFailure('Account already registered.');
    }
    try {
      await _client!.auth.updateUser(
        UserAttributes(
          email: email.trim(),
          password: password,
        ),
        emailRedirectTo: SupabaseAuthConfig.redirectUrl,
      );
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    }
  }

  Future<void> refreshSession() async {
    final client = _client;
    if (client == null) return;
    try {
      await client.auth.refreshSession();
    } on AuthException catch (e) {
      throw AuthFailure(e.message);
    }
  }

  Future<void> signOut() async {
    final client = _client;
    if (client == null) return;
    await client.auth.signOut();
  }

  void _requireClient() {
    if (_client == null) {
      throw AuthFailure(AppStrings.supabaseNotConfigured);
    }
  }
}

class AuthFailure implements Exception {
  const AuthFailure(this.message);
  final String message;

  @override
  String toString() => message;
}
