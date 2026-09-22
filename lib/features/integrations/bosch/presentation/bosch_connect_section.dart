import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/app_env.dart';
import '../../../../core/presentation/app_feedback.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../services/bosch/bosch_connection_store.dart';
import '../../../../services/bosch/bosch_oauth_api.dart';
import '../bosch_connect_copy.dart';
import '../bosch_fridge_pantry_sync.dart';
import 'bosch_oauth_webview_screen.dart';

final boschLinkedProvider = FutureProvider<bool>((ref) async {
  return BoschConnectionStore().isLinked;
});

final boschGrantedScopeProvider = FutureProvider<String?>((ref) async {
  final store = BoschConnectionStore();
  if (!await store.isLinked) return null;
  return store.grantedScope;
});

class BoschConnectSection extends ConsumerStatefulWidget {
  const BoschConnectSection({super.key});

  @override
  ConsumerState<BoschConnectSection> createState() =>
      _BoschConnectSectionState();
}

class _BoschConnectSectionState extends ConsumerState<BoschConnectSection> {
  var _connecting = false;
  var _syncing = false;

  @override
  Widget build(BuildContext context) {
    if (AppEnv.boschBackendUrl == null) {
      return const SizedBox.shrink();
    }

    final linkedAsync = ref.watch(boschLinkedProvider);
    final scopeAsync = ref.watch(boschGrantedScopeProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _SectionHeader(
          title: BoschConnectCopy.sectionTitle,
          subtitle: BoschConnectCopy.sectionSubtitle,
        ),
        linkedAsync.when(
          data: (linked) => Column(
            children: [
              _SettingsTile(
                icon: Icons.kitchen_outlined,
                title: BoschConnectCopy.connectTitle,
                subtitle: _connecting
                    ? BoschConnectCopy.connectingSubtitle
                    : linked
                        ? _linkedSubtitle(scopeAsync.valueOrNull)
                        : BoschConnectCopy.connectSubtitle,
                onTap: _connecting
                    ? null
                    : linked
                        ? () => _confirmDisconnect(context, ref)
                        : () => _startConnect(context, ref),
              ),
              if (linked)
                _SettingsTile(
                  icon: Icons.camera_alt_outlined,
                  title: BoschConnectCopy.syncFromFridgeTitle,
                  subtitle: _syncing
                      ? BoschConnectCopy.syncFetchingPhoto
                      : BoschConnectCopy.syncFromFridgeSubtitle,
                  onTap: _syncing
                      ? null
                      : () => _syncFromFridge(context, ref),
                ),
            ],
          ),
          loading: () => _SettingsTile(
            icon: Icons.kitchen_outlined,
            title: BoschConnectCopy.connectTitle,
            subtitle: BoschConnectCopy.connectSubtitle,
            onTap: _connecting ? null : () => _startConnect(context, ref),
          ),
          error: (_, __) => _SettingsTile(
            icon: Icons.kitchen_outlined,
            title: BoschConnectCopy.connectTitle,
            subtitle: BoschConnectCopy.connectSubtitle,
            onTap: _connecting ? null : () => _startConnect(context, ref),
          ),
        ),
      ],
    );
  }

  Future<void> _startConnect(BuildContext context, WidgetRef ref) async {
    if (AppEnv.boschBackendUrl == null) {
      AppFeedback.showError(context, BoschConnectCopy.backendMissing);
      return;
    }
    if (_connecting) return;
    setState(() => _connecting = true);
    try {
      final session = await BoschOAuthApi().fetchAuthorizationUrl();
      if (!context.mounted) return;
      final ok = await Navigator.of(context, rootNavigator: true).push<bool>(
        MaterialPageRoute(
          builder: (_) => BoschOAuthWebViewScreen(
            authorizationUrl: session.authorizationUrl,
            expectedState: session.state,
            redirectUri: session.redirectUri,
          ),
        ),
      );
      if (ok == true) {
        ref.invalidate(boschLinkedProvider);
        ref.invalidate(boschGrantedScopeProvider);
      }
    } on BoschOAuthApiException catch (e) {
      if (!context.mounted) return;
      final hint = e.code.startsWith('auth_url_http')
          ? ' ${BoschConnectCopy.backendUnreachableHint}'
          : '';
      AppFeedback.showError(
        context,
        '${BoschConnectCopy.connectFailed}: ${e.message ?? e.code}$hint',
      );
    } catch (e) {
      if (!context.mounted) return;
      AppFeedback.showError(
        context,
        '${BoschConnectCopy.connectFailed}: $e\n${BoschConnectCopy.backendUnreachableHint}',
      );
    } finally {
      if (mounted) setState(() => _connecting = false);
    }
  }

  Future<void> _syncFromFridge(BuildContext context, WidgetRef ref) async {
    if (_syncing) return;
    setState(() => _syncing = true);
    try {
      await BoschFridgePantrySync.run(context: context, ref: ref);
    } finally {
      if (mounted) setState(() => _syncing = false);
    }
  }

  String _linkedSubtitle(String? scope) {
    if (scope == null || scope.isEmpty) {
      return BoschConnectCopy.connectedDemoMode;
    }
    final lower = scope.toLowerCase();
    if (!lower.contains('images')) {
      return BoschConnectCopy.connectedDemoMode;
    }
    return BoschConnectCopy.connectedWithScope(scope);
  }

  Future<void> _confirmDisconnect(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(BoschConnectCopy.disconnectTitle),
        content: Text(BoschConnectCopy.disconnectBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(MaterialLocalizations.of(ctx).cancelButtonLabel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              BoschConnectCopy.disconnectTitle,
              style: TextStyle(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true) return;
    await BoschConnectionStore().clear();
    ref.invalidate(boschLinkedProvider);
    ref.invalidate(boschGrantedScopeProvider);
    if (context.mounted) {
      AppFeedback.showInfo(context, BoschConnectCopy.disconnectTitle);
    }
  }
}

/// Re-export settings private widgets — use public tiles from settings file.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.subtitle});
  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          if (subtitle != null && subtitle!.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              subtitle!,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
          ],
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: onTap == null ? null : const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
