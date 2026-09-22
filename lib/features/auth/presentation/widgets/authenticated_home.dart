import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/presentation/main_shell.dart';
import 'auth_session_refresh_listener.dart';
import '../../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../../../services/freshness_notification_service.dart';

/// Oturum açıldığında tazelik verisini buluttan çeker.
class AuthenticatedHome extends ConsumerStatefulWidget {
  const AuthenticatedHome({super.key});

  @override
  ConsumerState<AuthenticatedHome> createState() => _AuthenticatedHomeState();
}

class _AuthenticatedHomeState extends ConsumerState<AuthenticatedHome> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _sync());
  }

  Future<void> _sync() async {
    await ref.read(pantryItemsProvider.notifier).syncFromCloud(showErrors: false);
    if (!mounted) return;
    final items = ref.read(pantryItemsProvider).valueOrNull ?? [];
    await FreshnessNotificationService.instance.refreshFromItems(items);
  }

  @override
  Widget build(BuildContext context) {
    return const AuthSessionRefreshListener(
      child: MainShell(),
    );
  }
}
