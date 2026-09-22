import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/config/supabase_config.dart';
import '../../../../core/storage/local_auth_storage.dart';
import '../../data/auth_repository.dart';

final localAuthModeProvider =
    AsyncNotifierProvider<LocalAuthModeNotifier, bool>(
  LocalAuthModeNotifier.new,
);

class LocalAuthModeNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() => LocalAuthStorage.isEnabled();

  Future<void> enable() async {
    await LocalAuthStorage.setEnabled(true);
    state = const AsyncData(true);
  }

  Future<void> disable() async {
    await LocalAuthStorage.setEnabled(false);
    state = const AsyncData(false);
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<AuthState?>((ref) {
  if (!SupabaseConfig.isConfigured) {
    return Stream.value(null);
  }
  final repo = ref.watch(authRepositoryProvider);
  if (!repo.isAvailable) {
    return Stream.value(null);
  }
  return repo.authStateChanges().handleError((error, stackTrace) {
    debugPrint('Auth state stream error: $error\n$stackTrace');
  });
});

final currentUserProvider = Provider<User?>((ref) {
  ref.watch(authStateProvider);
  return ref.watch(authRepositoryProvider).currentUser;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  if (!SupabaseConfig.isConfigured) return true;
  if (ref.watch(localAuthModeProvider).valueOrNull ?? false) return true;
  return ref.watch(currentUserProvider) != null;
});

final hasRegisteredAccountProvider = Provider<bool>((ref) {
  if (!SupabaseConfig.isConfigured) return false;
  return ref.watch(authRepositoryProvider).hasRegisteredAccount;
});

final isEmailVerifiedProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  if (user == null) return false;
  return user.emailConfirmedAt != null;
});
