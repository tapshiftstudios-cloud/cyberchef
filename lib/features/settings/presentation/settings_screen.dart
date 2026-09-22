import 'dart:math' as math;
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/ai/ai_usage_guard.dart';
import '../../../core/monetization/pro_products.dart';
import '../../monetization/presentation/pro_account_link_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/config/privacy_config.dart';
import '../../../core/config/support_config.dart';
import '../../../core/config/supabase_config.dart';
import '../../../core/providers/recipe_localization_provider.dart';
import '../../../core/l10n/app_strings.dart';
import '../../../core/navigation/app_navigator.dart';
import '../../../core/presentation/app_feedback.dart';
import '../../../core/providers/service_providers.dart';
import '../../../core/theme/app_color_palette.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/neon_decorations.dart';
import '../../../core/widgets/responsive_shell.dart';
import '../../auth/presentation/providers/auth_provider.dart';
import '../../pantry/presentation/providers/recent_scans_provider.dart';
import '../../pantry/presentation/providers/pantry_items_provider.dart';
import '../../../core/data/local_data_export.dart';
import '../../../core/providers/subscription_tier_provider.dart';
import '../../../core/providers/user_preferences_provider.dart';
import '../../../core/enums/cuisine_region.dart';
import '../../../core/enums/diet_profile.dart';
import '../../../core/models/notification_time.dart';
import '../../../services/freshness_notification_service.dart';
import '../../../services/purchase_service.dart';
import '../../shopping/presentation/providers/shopping_list_provider.dart';
import 'widgets/language_picker_sheet.dart';
import 'widgets/theme_picker_sheet.dart';
import '../../integrations/bosch/presentation/bosch_connect_section.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(localeProvider);
    ref.watch(appThemeProvider);
    final isSignedIn = ref.watch(isAuthenticatedProvider);
    final user = ref.watch(currentUserProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.settingsTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
        children: [
          ResponsiveShell(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (SupabaseConfig.isConfigured && user != null) ...[
                  _SectionHeader(title: AppStrings.sectionAccount),
                  const _AccountSessionTile(),
                ],
                _SectionHeader(title: AppStrings.sectionPreferences),
                _SettingsTile(
                  icon: Icons.language_outlined,
                  title: AppStrings.languageTitle,
                  subtitle: AppStrings.languageSubtitle,
                  onTap: () => _pickLanguage(context, ref),
                ),
                _ThemePreferenceTile(),
                _DietPreferenceTile(),
                const _CuisinePreferenceTile(),
                _SectionHeader(title: AppStrings.sectionApp),
                const _AiUsageStatusTile(),
                const _ManageSubscriptionTile(),
                _SettingsTile(
                  icon: Icons.favorite_border,
                  title: AppStrings.favoritesTitle,
                  subtitle: AppStrings.favoritesSubtitle,
                  onTap: () => AppNavigator.pushFavorites(context),
                ),
                if (SupabaseConfig.isConfigured)
                  _SettingsTile(
                    icon: Icons.history,
                    title: AppStrings.pantryHistoryTitle,
                    subtitle: AppStrings.pantryHistorySubtitle,
                    onTap: () => AppNavigator.pushPantryHistory(context),
                  ),
                _SettingsTile(
                  icon: Icons.inventory_2_outlined,
                  title: AppStrings.freshnessListTitle,
                  subtitle: AppStrings.freshnessInventorySubtitle,
                  onTap: () => AppNavigator.pushFreshnessList(context),
                ),
                if (SupabaseConfig.isConfigured && isSignedIn)
                  _SettingsTile(
                    icon: Icons.cloud_sync_outlined,
                    title: AppStrings.pantrySyncAction,
                    subtitle: AppStrings.pantrySyncSubtitle,
                    onTap: () async {
                      final ok = await ref
                          .read(pantryItemsProvider.notifier)
                          .syncFromCloud();
                      if (!context.mounted) return;
                      AppFeedback.showInfo(
                        context,
                        ok
                            ? AppStrings.pantrySyncDone
                            : ref.read(pantrySyncStatusProvider) ??
                                AppStrings.pantrySyncFailed,
                      );
                    },
                  ),
                const _FreshnessNotificationsTile(),
                _SettingsTile(
                  icon: Icons.delete_outline,
                  title: AppStrings.clearRecentScans,
                  subtitle: AppStrings.clearRecentScansSubtitle,
                  onTap: () => _confirmClearRecentScans(context, ref),
                ),
                _SettingsTile(
                  icon: Icons.school_outlined,
                  title: AppStrings.showOnboardingAgain,
                  onTap: () => AppNavigator.pushOnboardingPreview(context),
                ),
                _SettingsTile(
                  icon: Icons.feedback_outlined,
                  title: AppStrings.sendFeedbackTitle,
                  subtitle: AppStrings.sendFeedbackSubtitle,
                  onTap: () => _openFeedback(context),
                ),
                const BoschConnectSection(),
                _SectionHeader(title: AppStrings.sectionPrivacy),
                _SettingsTile(
                  icon: Icons.privacy_tip_outlined,
                  title: AppStrings.privacyTitle,
                  subtitle: AppStrings.privacySubtitle,
                  onTap: () => _openPrivacyPolicy(context),
                ),
                _SettingsTile(
                  icon: Icons.download_outlined,
                  title: AppStrings.exportLocalData,
                  subtitle: AppStrings.exportLocalDataSubtitle,
                  onTap: () async {
                    final json = await LocalDataExport.exportJson();
                    await Clipboard.setData(ClipboardData(text: json));
                    if (context.mounted) {
                      AppFeedback.showInfo(
                        context,
                        AppStrings.exportLocalDataDone,
                      );
                    }
                  },
                ),
                _SettingsTile(
                  icon: Icons.delete_forever_outlined,
                  title: AppStrings.clearLocalData,
                  subtitle: AppStrings.clearLocalDataSubtitle,
                  titleColor: AppColors.error,
                  onTap: () => _confirmClearLocalData(context, ref),
                ),
                if (SupabaseConfig.isConfigured && isSignedIn) ...[
                  const SizedBox(height: 8),
                  _SettingsTile(
                    icon: Icons.logout,
                    title: AppStrings.signOut,
                    titleColor: AppColors.error,
                    onTap: () async {
                      await ref.read(authRepositoryProvider).signOut();
                      await ref
                          .read(localAuthModeProvider.notifier)
                          .disable();
                      if (context.mounted) Navigator.of(context).pop();
                    },
                  ),
                ],
                const SizedBox(height: 24),
                const _AppVersionFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickLanguage(BuildContext context, WidgetRef ref) async {
    final current = ref.read(localeProvider);
    final picked = await LanguagePickerSheet.show(context, current);
    if (picked != null && picked != current) {
      await ref.read(localeProvider.notifier).setLocale(picked);
      await _waitForLocalePrepare(ref);
    }
  }

  Future<void> _openFeedback(BuildContext context) async {
    final info = await PackageInfo.fromPlatform();
    final uri = SupportConfig.feedbackMailto(
      appVersion: '${info.version}+${info.buildNumber}',
    );
    if (!context.mounted) return;
    final launched = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!context.mounted) return;
    if (!launched) {
      AppFeedback.showError(context, AppStrings.genericError);
    }
  }

  Future<void> _waitForLocalePrepare(WidgetRef ref) async {
    for (var i = 0; i < 80; i++) {
      if (!ref.read(recipeLocalizationProvider).isPreparing) return;
      await Future<void>.delayed(const Duration(milliseconds: 100));
    }
  }

  Future<void> _confirmClearRecentScans(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.cardRadius),
          side: BorderSide(color: AppColors.border),
        ),
        title: Text(
          AppStrings.clearRecentScansConfirmTitle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          AppStrings.clearRecentScansConfirmBody,
          style: GoogleFonts.inter(
            fontSize: 14,
            height: 1.5,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(
              AppStrings.scanConfirmCancel,
              style: GoogleFonts.inter(color: AppColors.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              AppStrings.deleteAction,
              style: GoogleFonts.inter(color: AppColors.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    await ref.read(recentScansProvider.notifier).clearAll();
    if (context.mounted) {
      AppFeedback.showInfo(context, AppStrings.clearRecentScansDone);
    }
  }

  Future<void> _confirmClearLocalData(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text(AppStrings.clearLocalDataConfirmTitle),
        content: Text(AppStrings.clearLocalDataConfirmBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(AppStrings.scanConfirmCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              AppStrings.deleteAction,
              style: GoogleFonts.inter(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;
    await LocalDataExport.clearAllLocal();
    ref.invalidate(pantryItemsProvider);
    await ref.read(shoppingListProvider.notifier).refresh();
    if (context.mounted) {
      AppFeedback.showInfo(context, AppStrings.clearLocalDataDone);
    }
  }

  Future<void> _openPrivacyPolicy(BuildContext context) async {
    final policyUrl = PrivacyConfig.policyUrl;
    final uri = Uri.tryParse(policyUrl);
    if (uri == null) {
      _showPrivacyDialog(context);
      return;
    }
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched && context.mounted) {
        _showPrivacyDialog(context);
      }
    } catch (_) {
      if (context.mounted) {
        _showPrivacyDialog(context);
      }
    }
  }

  void _showPrivacyDialog(BuildContext context) {
    final policyUrl = PrivacyConfig.policyUrl;
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(NeonDecorations.cardRadius),
          side: BorderSide(color: AppColors.border),
        ),
        title: Text(
          AppStrings.privacyTitle,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        content: SingleChildScrollView(
          child: Text(
            AppStrings.privacyBody,
            style: GoogleFonts.inter(
              fontSize: 14,
              height: 1.5,
              color: AppColors.textSecondary,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              final uri = Uri.tryParse(policyUrl);
              if (uri == null) return;
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            },
            child: Text(
              AppStrings.privacyViewOnline,
              style: GoogleFonts.inter(color: AppColors.primary),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              AppStrings.okButton,
              style: GoogleFonts.inter(color: AppColors.primary),
            ),
          ),
        ],
      ),
    );
  }
}

class _ThemePreferenceTile extends ConsumerWidget {
  const _ThemePreferenceTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return _SettingsTile(
      icon: Icons.palette_outlined,
      title: AppStrings.themeTitle,
      subtitle: '${AppStrings.themeSubtitle} · ${theme.label}',
      trailing: _ThemeSwatchStrip(palette: theme.palette),
      onTap: () async {
        final picked = await showThemePickerSheet(
          context,
          current: theme,
        );
        if (picked != null) {
          await ref.read(appThemeProvider.notifier).setTheme(picked);
        }
      },
    );
  }
}

class _ThemeSwatchStrip extends StatelessWidget {
  const _ThemeSwatchStrip({required this.palette});

  final AppColorPalette palette;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: palette.previewSwatches.map((c) {
        return Container(
          width: 14,
          height: 14,
          margin: const EdgeInsets.only(left: 3),
          decoration: BoxDecoration(
            color: c,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border),
          ),
        );
      }).toList(),
    );
  }
}

class _DietPreferenceTile extends ConsumerWidget {
  const _DietPreferenceTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final diet = ref.watch(dietProfileProvider);
    final locale = ref.watch(localeProvider);

    return _SettingsTile(
      icon: Icons.restaurant_menu_outlined,
      title: AppStrings.dietTitle,
      subtitle:
          '${AppStrings.dietSubtitle} · ${diet.label(locale)}',
      onTap: () async {
        final picked = await showModalBottomSheet<DietProfile>(
          context: context,
          backgroundColor: AppColors.surface,
          builder: (ctx) => SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: DietProfile.values.map((d) {
                return ListTile(
                  title: Text(d.label(locale)),
                  trailing: diet == d
                      ? Icon(Icons.check, color: AppColors.primary)
                      : null,
                  onTap: () => Navigator.pop(ctx, d),
                );
              }).toList(),
            ),
          ),
        );
        if (picked != null) {
          await ref.read(dietProfileProvider.notifier).setDiet(picked);
        }
      },
    );
  }
}

class _CuisinePreferenceTile extends ConsumerWidget {
  const _CuisinePreferenceTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final preference = ref.watch(cuisinePreferenceProvider);
    final effective = ref.watch(effectiveCuisineRegionProvider);

    return _SettingsTile(
      icon: Icons.restaurant_outlined,
      title: AppStrings.cuisineTitle,
      subtitle:
          '${AppStrings.cuisineSubtitle} · ${AppStrings.cuisineDisplaySummary(preference, effective)}',
      onTap: () async {
        final picked = await showModalBottomSheet<CuisinePreference>(
          context: context,
          backgroundColor: AppColors.surface,
          builder: (ctx) => SafeArea(
            child: ListView(
              shrinkWrap: true,
              children: CuisinePreference.values.map((c) {
                final label = c.isAutomatic
                    ? AppStrings.cuisineAutomatic
                    : c.pickerLabel;
                final trailing = preference == c
                    ? Icon(Icons.check, color: AppColors.primary)
                    : null;
                final subtitle = c.isAutomatic
                    ? effective.pickerLabel
                    : null;
                return ListTile(
                  title: Text(label),
                  subtitle: subtitle != null ? Text(subtitle) : null,
                  trailing: trailing,
                  onTap: () => Navigator.pop(ctx, c),
                );
              }).toList(),
            ),
          ),
        );
        if (picked != null) {
          await ref.read(cuisinePreferenceProvider.notifier).setCuisine(picked);
        }
      },
    );
  }
}

class _FreshnessNotificationsTile extends ConsumerStatefulWidget {
  const _FreshnessNotificationsTile();

  @override
  ConsumerState<_FreshnessNotificationsTile> createState() =>
      _FreshnessNotificationsTileState();
}

class _ManageSubscriptionTile extends ConsumerWidget {
  const _ManageSubscriptionTile();

  static final Uri _playSubscriptions = Uri.parse(
    'https://play.google.com/store/account/subscriptions?package=com.cyberchef.pantry',
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!Platform.isAndroid) return const SizedBox.shrink();

    final tierAsync = ref.watch(subscriptionTierProvider);
    return tierAsync.when(
      data: (tier) {
        if (tier != 'pro') return const SizedBox.shrink();
        return _SettingsTile(
          icon: Icons.subscriptions_outlined,
          title: AppStrings.manageSubscriptions,
          subtitle: AppStrings.upgradeToProSubtitle,
          onTap: () async {
            final opened = await launchUrl(
              _playSubscriptions,
              mode: LaunchMode.externalApplication,
            );
            if (!opened && context.mounted) {
              AppFeedback.showError(context, AppStrings.genericError);
            }
          },
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}

class _AiUsageSnapshot {
  const _AiUsageSnapshot({
    required this.tier,
    required this.pantryRemaining,
    required this.receiptRemaining,
    required this.recipeRemaining,
    required this.actionCooldownRemaining,
    required this.quotaCooldownRemaining,
    required this.dailyResetAt,
  });

  final String tier;
  final int pantryRemaining;
  final int receiptRemaining;
  final int recipeRemaining;
  final Duration actionCooldownRemaining;
  final Duration quotaCooldownRemaining;
  final DateTime dailyResetAt;
}

class _AiUsageStatusTile extends ConsumerStatefulWidget {
  const _AiUsageStatusTile();

  @override
  ConsumerState<_AiUsageStatusTile> createState() => _AiUsageStatusTileState();
}

class _AiUsageStatusTileState extends ConsumerState<_AiUsageStatusTile> {
  Future<_AiUsageSnapshot>? _future;
  StreamSubscription<List<PurchaseDetails>>? _purchaseSub;

  @override
  void initState() {
    super.initState();
    _future = _load();
    _purchaseSub = ref
        .read(purchaseServiceProvider)
        .purchaseStream
        .listen(_onPurchaseUpdates);
  }

  @override
  void dispose() {
    _purchaseSub?.cancel();
    super.dispose();
  }

  Future<_AiUsageSnapshot> _load() async {
    final ai = ref.read(aiServiceProvider);
    final backend = await ai.fetchBackendUsageStatus();

    if (backend != null) {
      final now = DateTime.now();
      final resetAt = DateTime.tryParse(backend.resetAtIso) ??
          DateTime(now.year, now.month, now.day + 1);
      return _AiUsageSnapshot(
        tier: backend.tier,
        pantryRemaining: backend.pantryRemaining,
        receiptRemaining: backend.receiptRemaining,
        recipeRemaining: backend.recipeRemaining,
        actionCooldownRemaining: Duration(
          seconds: backend.cooldownSeconds.clamp(0, 9999),
        ),
        quotaCooldownRemaining: ai.cooldownRemaining,
        dailyResetAt: resetAt.toLocal(),
      );
    }

    final pantryRemaining = await AiUsageGuard.remainingToday(
      AiActionType.pantryScan,
    );
    final receiptRemaining = await AiUsageGuard.remainingToday(
      AiActionType.receiptScan,
    );
    final recipeRemaining = await AiUsageGuard.remainingToday(
      AiActionType.recipeFromIngredients,
    );

    final pantryCooldown = await AiUsageGuard.cooldownRemaining(
      AiActionType.pantryScan,
    );
    final receiptCooldown = await AiUsageGuard.cooldownRemaining(
      AiActionType.receiptScan,
    );
    final recipeCooldown = await AiUsageGuard.cooldownRemaining(
      AiActionType.recipeFromIngredients,
    );

    final actionCooldown = Duration(
      milliseconds: math.max(
        pantryCooldown.inMilliseconds,
        math.max(
          receiptCooldown.inMilliseconds,
          recipeCooldown.inMilliseconds,
        ),
      ),
    );

    final now = DateTime.now();
    final resetAt = DateTime(now.year, now.month, now.day + 1);

    return _AiUsageSnapshot(
      tier: 'free',
      pantryRemaining: pantryRemaining,
      receiptRemaining: receiptRemaining,
      recipeRemaining: recipeRemaining,
      actionCooldownRemaining: actionCooldown,
      quotaCooldownRemaining: ai.cooldownRemaining,
      dailyResetAt: resetAt,
    );
  }

  String _fmtHhMm(DateTime value) {
    final h = value.hour.toString().padLeft(2, '0');
    final m = value.minute.toString().padLeft(2, '0');
    return '$h:$m';
  }

  String _nextRequestText(_AiUsageSnapshot s) {
    if (s.quotaCooldownRemaining > Duration.zero) {
      if (s.quotaCooldownRemaining < const Duration(minutes: 1)) {
        final seconds =
            ((s.quotaCooldownRemaining.inMilliseconds + 999) ~/ 1000)
                .clamp(1, 999);
        return AppStrings.aiActionCooldownSeconds(seconds);
      }
      final minutes = ((s.quotaCooldownRemaining.inSeconds + 59) ~/ 60)
          .clamp(1, 999);
      return AppStrings.aiQuotaRetryInMinutes(minutes);
    }
    if (s.actionCooldownRemaining > Duration.zero) {
      final seconds = ((s.actionCooldownRemaining.inMilliseconds + 999) ~/ 1000)
          .clamp(1, 999);
      return AppStrings.aiActionCooldownSeconds(seconds);
    }
    return AppStrings.aiUsageCanSendNow;
  }

  String _remainingText(_AiUsageSnapshot s) {
    final isPro = s.tier.toLowerCase() == 'pro';
    final plan = isPro ? AppStrings.aiUsagePlanPro : AppStrings.aiUsagePlanFree;
    final pantryMax = isPro
        ? AiUsageGuard.proPantryScanDailyLimit
        : AiUsageGuard.pantryScanDailyLimit;
    final receiptMax = isPro
        ? AiUsageGuard.proReceiptScanDailyLimit
        : AiUsageGuard.receiptScanDailyLimit;
    final recipeMax = isPro
        ? AiUsageGuard.proRecipeFromIngredientsDailyLimit
        : AiUsageGuard.recipeFromIngredientsDailyLimit;
    return '$plan\n${AppStrings.aiUsageRemainingLine(
      s.pantryRemaining,
      pantryMax,
      s.receiptRemaining,
      receiptMax,
      s.recipeRemaining,
      recipeMax,
    )}';
  }

  Future<bool> _ensureRegisteredForPro() async {
    if (!SupabaseConfig.isConfigured) {
      if (mounted) {
        AppFeedback.showError(context, AppStrings.supabaseNotConfigured);
      }
      return false;
    }

    final repo = ref.read(authRepositoryProvider);
    if (repo.hasRegisteredAccount) return true;

    if (!mounted) return false;
    final linked = await ProAccountLinkScreen.open(context);
    if (!mounted) return false;
    if (!linked) return false;

    if (!ref.read(authRepositoryProvider).hasRegisteredAccount) {
      if (mounted) {
        AppFeedback.showInfo(context, AppStrings.accountCreated);
      }
      return false;
    }

    if (mounted) {
      AppFeedback.showInfo(context, AppStrings.proAccountLinked);
    }
    return true;
  }

  Future<void> _showUpgradeSheet() async {
    if (!mounted) return;
    if (!await _ensureRegisteredForPro()) return;
    if (!mounted) return;
    await showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.upgradeToProTitle,
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.upgradeToProSubtitle,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                AppStrings.upgradeToProLimitsDetail,
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    Navigator.of(ctx).pop();
                    await _startProCheckout();
                  },
                  child: Text(AppStrings.upgradeToProContinue),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    Navigator.of(ctx).pop();
                    await _restorePurchases();
                  },
                  child: Text(AppStrings.restorePurchases),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _restorePurchases() async {
    if (!await _ensureRegisteredForPro()) return;
    final purchase = ref.read(purchaseServiceProvider);
    if (!await purchase.isAvailable) {
      if (mounted) {
        AppFeedback.showError(context, AppStrings.storeUnavailable);
      }
      return;
    }
    if (mounted) {
      AppFeedback.showInfo(context, AppStrings.restorePurchasesStarted);
    }
    await purchase.restorePurchases();
  }

  Future<void> _startProCheckout() async {
    if (!await _ensureRegisteredForPro()) return;
    final purchase = ref.read(purchaseServiceProvider);
    final isStoreAvailable = await purchase.isAvailable;
    if (!mounted) return;
    if (!isStoreAvailable) {
      AppFeedback.showError(context, AppStrings.storeUnavailable);
      return;
    }

    final ids = ProProducts.ids();
    if (ids.isEmpty) {
      AppFeedback.showError(context, AppStrings.proProductIdsNotConfigured);
      return;
    }

    final products = await purchase.queryProducts(ids);
    if (!mounted) return;
    if (products.isEmpty) {
      AppFeedback.showError(context, AppStrings.noProProductsFound);
      return;
    }

    products.sort((a, b) => a.rawPrice.compareTo(b.rawPrice));
    final ok = await purchase.buy(products.first);
    if (!mounted) return;
    if (!ok) {
      AppFeedback.showError(context, AppStrings.purchaseFlowFailed);
    }
  }

  Future<void> _onPurchaseUpdates(List<PurchaseDetails> updates) async {
    final purchase = ref.read(purchaseServiceProvider);
    final ai = ref.read(aiServiceProvider);
    for (final item in updates) {
      await purchase.completePending(item);
      if (!mounted) return;

      if (!isPurchaseTerminal(item)) continue;

      if (item.status == PurchaseStatus.purchased ||
          item.status == PurchaseStatus.restored) {
        if (!ref.read(authRepositoryProvider).hasRegisteredAccount) {
          AppFeedback.showError(context, AppStrings.proEmailRequiredBody);
          continue;
        }
        final packageName = await PackageInfo.fromPlatform()
            .then((v) => v.packageName)
            .catchError((_) => '');
        final purchaseToken = item.verificationData.serverVerificationData;
        final activated = await ai.activateProTier(
          source: 'iap',
          platform: Platform.isAndroid ? 'android' : 'unknown',
          productId: item.productID,
          packageName: packageName,
          purchaseToken: purchaseToken,
          purchaseId: item.purchaseID,
        );
        if (!mounted) return;
        AppFeedback.showInfo(
          context,
          activated
              ? AppStrings.purchaseCompletedProActivated
              : AppStrings.purchaseCompletedVerifyFailed,
        );
        setState(() => _future = _load());
        continue;
      }

      if (item.status == PurchaseStatus.error) {
        AppFeedback.showError(
          context,
          item.error?.message ?? AppStrings.purchaseFailed,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(localeProvider);
    return FutureBuilder<_AiUsageSnapshot>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return _SettingsTile(
            icon: Icons.speed_outlined,
            title: AppStrings.aiUsageLimitsTitle,
            subtitle: AppStrings.aiUsageLimitsLoading,
            onTap: () {
              setState(() => _future = _load());
            },
          );
        }

        final data = snapshot.data!;
        final subtitle =
            '${_remainingText(data)}\n${_nextRequestText(data)}\n${AppStrings.aiUsageDailyResetLine(_fmtHhMm(data.dailyResetAt))}';

        return _SettingsTile(
          icon: Icons.speed_outlined,
          title: AppStrings.aiUsageLimitsTitle,
          subtitle: subtitle,
          trailing: data.tier.toLowerCase() == 'pro'
              ? Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.primary),
                  ),
                  child: Text(
                    'PRO',
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ),
                )
              : OutlinedButton(
                  onPressed: _showUpgradeSheet,
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    foregroundColor: AppColors.primary,
                    side: BorderSide(color: AppColors.border),
                  ),
                  child: Text(
                    AppStrings.aiUsageUpgrade,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
          onTap: () => setState(() => _future = _load()),
        );
      },
    );
  }
}

class _FreshnessNotificationsTileState
    extends ConsumerState<_FreshnessNotificationsTile> {
  bool _enabled = true;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final enabled = await FreshnessNotificationService.instance.isEnabled();
    if (mounted) {
      setState(() {
        _enabled = enabled;
        _loaded = true;
      });
    }
  }

  Future<void> _onChanged(bool value) async {
    setState(() => _enabled = value);
    await FreshnessNotificationService.instance.setEnabled(value);
    if (value) {
      await FreshnessNotificationService.instance.requestPermission();
    }
  }

  Future<void> _pickReminderTime(NotificationTime current) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: current.hour, minute: current.minute),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surface,
            ),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
    if (picked == null || !mounted) return;

    await ref.read(freshnessNotificationTimeProvider.notifier).setTime(
          NotificationTime(hour: picked.hour, minute: picked.minute),
        );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final locale = ref.watch(localeProvider);
    if (!_loaded) return const SizedBox.shrink();

    final reminderTime = ref.watch(freshnessNotificationTimeProvider);
    final timeLabel = reminderTime.formatForLocale(locale);

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: NeonDecorations.card(
            radius: NeonDecorations.controlRadius,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.notifications_outlined,
                      color: AppColors.textSecondary,
                      size: 22,
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.freshnessNotificationsTitle,
                            style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            AppStrings.freshnessNotificationsSubtitle,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: _enabled,
                      onChanged: _onChanged,
                      activeThumbColor: AppColors.primary,
                    ),
                  ],
                ),
                if (_enabled) ...[
                  const Divider(height: 20),
                  InkWell(
                    onTap: () => _pickReminderTime(reminderTime),
                    borderRadius: BorderRadius.circular(8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.schedule_outlined,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.freshnessNotificationTimeLabel,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  AppStrings.freshnessNotificationTimeValue(
                                    timeLabel,
                                  ),
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            timeLabel,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.chevron_right,
                            color: AppColors.textMuted,
                            size: 22,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountSessionTile extends ConsumerWidget {
  const _AccountSessionTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(authStateProvider);
    final user = ref.watch(currentUserProvider);
    if (user == null) return const SizedBox.shrink();

    final email = user.email?.trim();
    final displayEmail =
        email != null && email.isNotEmpty ? email : AppStrings.guestUser;
    final verified = ref.watch(isEmailVerifiedProvider);

    return _SettingsTile(
      icon: Icons.person_outline,
      title: AppStrings.sessionTitle,
      subtitleWidget: _SessionEmailSubtitle(
        email: displayEmail,
        verified: verified,
      ),
    );
  }
}

class _SessionEmailSubtitle extends StatelessWidget {
  const _SessionEmailSubtitle({
    required this.email,
    required this.verified,
  });

  final String email;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            email,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: AppColors.textMuted,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (verified) ...[
          const SizedBox(width: 6),
          Tooltip(
            message: AppStrings.emailVerifiedLabel,
            child: Icon(
              Icons.verified_rounded,
              size: 16,
              color: AppColors.success,
            ),
          ),
        ],
      ],
    );
  }
}

class _AppVersionFooter extends StatelessWidget {
  const _AppVersionFooter();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        final info = snapshot.data;
        final label = info == null
            ? '…'
            : '${info.version}+${info.buildNumber}';
        return Text(
          AppStrings.appVersionLabel(label),
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            fontSize: 12,
            color: AppColors.textMuted,
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 20, 4, 8),
      child: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.subtitleWidget,
    this.onTap,
    this.titleColor,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? subtitleWidget;
  final VoidCallback? onTap;
  final Color? titleColor;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(NeonDecorations.controlRadius),
          child: Ink(
            decoration: NeonDecorations.card(
              radius: NeonDecorations.controlRadius,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Icon(icon, color: AppColors.textSecondary, size: 22),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: GoogleFonts.inter(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: titleColor ?? AppColors.textPrimary,
                          ),
                        ),
                        if (subtitleWidget != null) ...[
                          const SizedBox(height: 2),
                          subtitleWidget!,
                        ] else if (subtitle != null) ...[
                          const SizedBox(height: 2),
                          Text(
                            subtitle!,
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) ...[
                    trailing!,
                    const SizedBox(width: 8),
                  ],
                  if (onTap != null)
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.textMuted,
                      size: 20,
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


