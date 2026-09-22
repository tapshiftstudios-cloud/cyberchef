import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';



import '../../../core/config/supabase_config.dart';

import '../../../core/l10n/app_strings.dart';

import '../../../core/providers/user_preferences_provider.dart';

import '../../../core/theme/app_colors.dart';

import '../../../core/theme/app_scaffold_background.dart';

import '../../../core/theme/app_theme.dart';



class OnboardingScreen extends ConsumerStatefulWidget {

  const OnboardingScreen({super.key, required this.onComplete});



  final VoidCallback onComplete;



  @override

  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();

}



class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {

  final _pageController = PageController();

  int _page = 0;



  List<_OnboardingPageData> _buildPages() => [

        _OnboardingPageData(

          icon: Icons.kitchen_outlined,

          title: AppStrings.onboardingScanTitle,

          body: AppStrings.onboardingScanBody,

        ),

        _OnboardingPageData(

          icon: Icons.receipt_long_outlined,

          title: AppStrings.onboardingReceiptTitle,

          body: AppStrings.onboardingReceiptBody,

        ),

        _OnboardingPageData(

          icon: Icons.privacy_tip_outlined,

          title: AppStrings.onboardingPermissionsTitle,

          body: AppStrings.onboardingPermissionsBody,

        ),

        _OnboardingPageData(

          icon: Icons.shopping_cart_outlined,

          title: AppStrings.onboardingShoppingTitle,

          body: AppStrings.onboardingShoppingBody,

        ),

        _OnboardingPageData(

          icon: Icons.auto_awesome_outlined,

          title: AppStrings.onboardingRecipesTitle,

          body: AppStrings.onboardingRecipesBody,

        ),

        _OnboardingPageData(

          icon: Icons.favorite_border,

          title: AppStrings.onboardingFavoritesTitle,

          body: AppStrings.onboardingFavoritesBody,

        ),

        _OnboardingPageData(

          icon: Icons.cloud_outlined,

          title: AppStrings.onboardingCloudTitle,

          body: AppStrings.onboardingCloudBody,

          cloudOnly: true,

        ),

      ];



  List<_OnboardingPageData> get _visiblePages {

    final pages = _buildPages();

    if (SupabaseConfig.isConfigured) return pages;

    return pages.where((p) => !p.cloudOnly).toList();

  }



  @override

  void dispose() {

    _pageController.dispose();

    super.dispose();

  }



  void _next() {

    final last = _visiblePages.length - 1;

    if (_page < last) {

      _pageController.nextPage(

        duration: const Duration(milliseconds: 320),

        curve: Curves.easeOutCubic,

      );

      return;

    }

    widget.onComplete();

  }



  @override

  Widget build(BuildContext context) {

    ref.watch(localeProvider);

    final pages = _visiblePages;



    return Scaffold(

      body: AppScaffoldBackground(

        child: SafeArea(

          child: Column(

            children: [

              Padding(

                padding: const EdgeInsets.fromLTRB(8, 4, 16, 0),

                child: Row(

                  children: [

                    TextButton(

                      onPressed: widget.onComplete,

                      child: Text(

                        AppStrings.onboardingSkip,

                        style: GoogleFonts.inter(

                          color: AppColors.textMuted,

                          fontWeight: FontWeight.w500,

                        ),

                      ),

                    ),

                    const Spacer(),

                    Text(

                      AppStrings.onboardingProgress(_page + 1, pages.length),

                      style: GoogleFonts.inter(

                        fontSize: 13,

                        fontWeight: FontWeight.w600,

                        color: AppColors.textMuted,

                      ),

                    ),

                  ],

                ),

              ),

              Expanded(

                child: PageView.builder(

                  controller: _pageController,

                  itemCount: pages.length,

                  onPageChanged: (i) => setState(() => _page = i),

                  itemBuilder: (context, index) {

                    final data = pages[index];

                    return Padding(

                      padding: const EdgeInsets.symmetric(horizontal: 28),

                      child: Column(

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Container(

                            width: 96,

                            height: 96,

                            decoration: BoxDecoration(

                              color: AppColors.primary.withValues(alpha: 0.14),

                              borderRadius: BorderRadius.circular(24),

                              border: Border.all(

                                color: AppColors.primary.withValues(alpha: 0.35),

                              ),

                              boxShadow: [

                                BoxShadow(

                                  color: AppColors.primary.withValues(

                                    alpha: 0.18,

                                  ),

                                  blurRadius: 24,

                                  spreadRadius: 0,

                                ),

                              ],

                            ),

                            child: Icon(

                              data.icon,

                              size: 44,

                              color: AppColors.primary,

                            ),

                          ),

                          const SizedBox(height: 32),

                          Text(

                            data.title,

                            textAlign: TextAlign.center,

                            style: GoogleFonts.inter(

                              fontSize: 24,

                              fontWeight: FontWeight.w700,

                              color: AppColors.textPrimary,

                              letterSpacing: -0.3,

                            ),

                          ),

                          const SizedBox(height: 14),

                          Text(

                            data.body,

                            textAlign: TextAlign.center,

                            style: GoogleFonts.inter(

                              fontSize: 15,

                              height: 1.55,

                              color: AppColors.textSecondary,

                            ),

                          ),

                        ],

                      ),

                    );

                  },

                ),

              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: List.generate(

                  pages.length,

                  (i) => AnimatedContainer(

                    duration: const Duration(milliseconds: 200),

                    margin: const EdgeInsets.symmetric(horizontal: 4),

                    width: i == _page ? 20 : 8,

                    height: 8,

                    decoration: BoxDecoration(

                      color: i == _page ? AppColors.primary : AppColors.border,

                      borderRadius: BorderRadius.circular(4),

                    ),

                  ),

                ),

              ),

              const SizedBox(height: 24),

              Padding(

                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),

                child: SizedBox(

                  width: double.infinity,

                  child: AppTheme.neonButton(

                    label: _page == pages.length - 1

                        ? AppStrings.onboardingStart

                        : AppStrings.onboardingNext,

                    icon: _page == pages.length - 1

                        ? Icons.check_rounded

                        : Icons.arrow_forward_rounded,

                    onPressed: _next,

                  ),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}



class _OnboardingPageData {

  const _OnboardingPageData({

    required this.icon,

    required this.title,

    required this.body,

    this.cloudOnly = false,

  });



  final IconData icon;

  final String title;

  final String body;

  final bool cloudOnly;

}


