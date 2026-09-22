import '../enums/app_locale.dart';
import '../enums/cuisine_region.dart';
import 'strings_base.dart';
import 'strings_registry.dart';

/// Kullanıcı metinleri — seçili dile göre [stringsForLocale].
abstract final class AppStrings {
  static StringsBase _s = stringsForLocale(AppLocale.en);
  static AppLocale _locale = AppLocale.en;

  static AppLocale get currentLocale => _locale;

  static void useLocale(AppLocale locale) {
    _locale = locale;
    _s = stringsForLocale(locale);
  }

  static bool get isEnglish => _locale == AppLocale.en;

  static bool get isTurkish => _locale == AppLocale.tr;

  static bool get isRtl => _locale.isRtl;

  static String get analysisTitle => _s.analysisTitle;
  static String get stepPrepareImage => _s.stepPrepareImage;
  static String get stepAnalyzeAi => _s.stepAnalyzeAi;
  static String get stepBuildRecipes => _s.stepBuildRecipes;
  static String get receiptAnalysisTitle => _s.receiptAnalysisTitle;
  static String get stepReceiptPrepare => _s.stepReceiptPrepare;
  static String get stepReceiptOcr => _s.stepReceiptOcr;
  static String get stepReceiptInfer => _s.stepReceiptInfer;
  static String get receiptNotRecognized => _s.receiptNotRecognized;
  static String get receiptNotDetected => _s.receiptNotDetected;
  static String get receiptConfirmTitle => _s.receiptConfirmTitle;
  static String get receiptConfirmSubtitle => _s.receiptConfirmSubtitle;
  static String get receiptConfirmSave => _s.receiptConfirmSave;
  static String get receiptSelectOne => _s.receiptSelectOne;
  static String get receiptSaved => _s.receiptSaved;
  static String get scanConfirmSubtitleReceipt => _s.scanConfirmSubtitleReceipt;
  static String get navFreshness => _s.navFreshness;
  static String get freshnessPanelTitle => _s.freshnessPanelTitle;
  static String get freshnessCritical => _s.freshnessCritical;
  static String get freshnessWarning => _s.freshnessWarning;
  static String get freshnessSafe => _s.freshnessSafe;
  static String get freshnessEmpty => _s.freshnessEmpty;
  static String get freshnessListTitle => _s.freshnessListTitle;
  static String get freshnessListEmpty => _s.freshnessListEmpty;
  static String get freshnessSuggestRecipes => _s.freshnessSuggestRecipes;
  static String get savingsPanelTitle => _s.savingsPanelTitle;
  static String get savingsPanelEmptyHint => _s.savingsPanelEmptyHint;
  static String get savingsStatItems => _s.savingsStatItems;
  static String get savingsStatWaste => _s.savingsStatWaste;
  static String get savingsStatMoney => _s.savingsStatMoney;
  static String get savingsDashboardTitle => _s.savingsDashboardTitle;
  static String get savingsDashboardSubtitle => _s.savingsDashboardSubtitle;
  static String savingsItemsThisMonth(int count) =>
      _s.savingsItemsThisMonth(count);
  static String savingsKgPrevented(String kg) => _s.savingsKgPrevented(kg);
  static String savingsFinancialGain(String amount) =>
      _s.savingsFinancialGain(amount);
  static String savingsMoneyTry(int amount) => _s.savingsMoneyTry(amount);
  static String get savingsTrendTitle => _s.savingsTrendTitle;
  static String get savingsRecentTitle => _s.savingsRecentTitle;
  static String get savingsEmptySubtitle => _s.savingsEmptySubtitle;
  static String get savingsHowItWorks => _s.savingsHowItWorks;
  static String get pantryNamesLocaleNote => _s.pantryNamesLocaleNote;
  static String savingsRescuedDaysLeft(int days) =>
      _s.savingsRescuedDaysLeft(days);
  static String get savingsMealMade => _s.savingsMealMade;
  static String savingsMealMadeConfirm(String name) =>
      _s.savingsMealMadeConfirm(name);
  static String savingsRescuedSnack(String money) =>
      _s.savingsRescuedSnack(money);
  static String get freshnessRecipeTitle => _s.freshnessRecipeTitle;
  static String get freshnessNoIngredientsForRecipes =>
      _s.freshnessNoIngredientsForRecipes;
  static String get freshnessCriticalBanner => _s.freshnessCriticalBanner;
  static String get freshnessViewAll => _s.freshnessViewAll;
  static String get receiptCaptureHints => _s.receiptCaptureHints;
  static String get receiptPurchaseDate => _s.receiptPurchaseDate;
  static String get receiptTapToEdit => _s.receiptTapToEdit;
  static String get receiptEditItem => _s.receiptEditItem;
  static String get receiptEditSave => _s.receiptEditSave;
  static String get receiptExpiryDaysLabel => _s.receiptExpiryDaysLabel;
  static String get receiptMergedSnack => _s.receiptMergedSnack;
  static String get receiptCloudSyncFailed => _s.receiptCloudSyncFailed;
  static String get receiptCloudSynced => _s.receiptCloudSynced;
  static String get pantrySyncAction => _s.pantrySyncAction;
  static String get pantrySyncDone => _s.pantrySyncDone;
  static String get pantrySyncFailed => _s.pantrySyncFailed;
  static String get freshnessNotificationsTitle =>
      _s.freshnessNotificationsTitle;
  static String get freshnessNotificationsSubtitle =>
      _s.freshnessNotificationsSubtitle;
  static String get freshnessNotificationTimeLabel =>
      _s.freshnessNotificationTimeLabel;
  static String freshnessNotificationTimeValue(String time24) =>
      _s.freshnessNotificationTimeValue(time24);
  static String freshnessWeeklySummary(int critical, int warning) =>
      _s.freshnessWeeklySummary(critical, warning);
  static String get geminiKeyMissing => _s.geminiKeyMissing;
  static String get networkError => _s.networkError;
  static String get geminiQuotaExceeded => _s.geminiQuotaExceeded;
  static String get geminiBillingDepleted => _s.geminiBillingDepleted;
  static String aiQuotaRetryInMinutes(int minutes) =>
      _s.aiQuotaRetryInMinutes(minutes);
  static String get aiTranslationDailyLimitReached =>
      _s.aiTranslationDailyLimitReached;
  static String aiTranslationRemainingToday(int remaining) =>
      _s.aiTranslationRemainingToday(remaining);
  static String get aiPantryScanDailyLimitReached =>
      _s.aiPantryScanDailyLimitReached;
  static String get aiReceiptDailyLimitReached => _s.aiReceiptDailyLimitReached;
  static String get aiRecipeDailyLimitReached => _s.aiRecipeDailyLimitReached;
  static String aiActionCooldownSeconds(int seconds) =>
      _s.aiActionCooldownSeconds(seconds);
  static String get adRewardTitlePantry => _s.adRewardTitlePantry;
  static String get adRewardTitleReceipt => _s.adRewardTitleReceipt;
  static String get adRewardTitleRecipe => _s.adRewardTitleRecipe;
  static String get adRewardSubtitle => _s.adRewardSubtitle;
  static String get adRewardWatchButton => _s.adRewardWatchButton;
  static String get adRewardGranted => _s.adRewardGranted;
  static String get adRewardNotCompleted => _s.adRewardNotCompleted;
  static String get adRewardDailyCapReached => _s.adRewardDailyCapReached;
  static String get geminiTimeout => _s.geminiTimeout;
  static String get geminiServerError => _s.geminiServerError;
  static String get imageNotRecognized => _s.imageNotRecognized;
  static String get imageNotPantry => _s.imageNotPantry;
  static String get parseError => _s.parseError;
  static String get modelUnavailable => _s.modelUnavailable;
  static String get genericError => _s.genericError;
  static String get imageDecodeError => _s.imageDecodeError;
  static String get authSubtitle => _s.authSubtitle;
  static String get authInitializing => _s.authInitializing;
  static String get emailLabel => _s.emailLabel;
  static String get passwordLabel => _s.passwordLabel;
  static String get emailRequired => _s.emailRequired;
  static String get emailInvalid => _s.emailInvalid;
  static String get passwordMin => _s.passwordMin;
  static String get passwordVisibilityShow => _s.passwordVisibilityShow;
  static String get passwordVisibilityHide => _s.passwordVisibilityHide;
  static String get authOrContinueWith => _s.authOrContinueWith;
  static String get signInWithGoogle => _s.signInWithGoogle;
  static String get googleSignInFailed => _s.googleSignInFailed;
  static String get signIn => _s.signIn;
  static String get signUp => _s.signUp;
  static String get toggleToSignIn => _s.toggleToSignIn;
  static String get toggleToSignUp => _s.toggleToSignUp;
  static String get guestContinue => _s.guestContinue;
  static String get authContinueOffline => _s.authContinueOffline;
  static String get authSupabaseUnreachable => _s.authSupabaseUnreachable;
  static String get accountCreated => _s.accountCreated;
  static String get emailConfirmedSuccess => _s.emailConfirmedSuccess;
  static String get emailVerifiedLabel => _s.emailVerifiedLabel;
  static String get proEmailRequiredTitle => _s.proEmailRequiredTitle;
  static String get proEmailRequiredBody => _s.proEmailRequiredBody;
  static String get proLinkAccountAction => _s.proLinkAccountAction;
  static String get proAccountLinked => _s.proAccountLinked;
  static String get supabaseNotConfigured => _s.supabaseNotConfigured;
  static String get privacyTitle => _s.privacyTitle;
  static String get privacySubtitle => _s.privacySubtitle;
  static String get privacyBody => _s.privacyBody;
  static String get privacyViewOnline => _s.privacyViewOnline;
  static String get pantryHistoryTitle => _s.pantryHistoryTitle;
  static String get pantryHistoryEmpty => _s.pantryHistoryEmpty;
  static String get pantryHistorySubtitle => _s.pantryHistorySubtitle;
  static String get splashTagline => _s.splashTagline;
  static String get splashLoading => _s.splashLoading;
  static String get onboardingSkip => _s.onboardingSkip;
  static String get onboardingNext => _s.onboardingNext;
  static String get onboardingStart => _s.onboardingStart;
  static String onboardingProgress(int current, int total) =>
      _s.onboardingProgress(current, total);
  static String get sendFeedbackTitle => _s.sendFeedbackTitle;
  static String get sendFeedbackSubtitle => _s.sendFeedbackSubtitle;
  static String get recentScansTitle => _s.recentScansTitle;
  static String get cameraTapToOpen => _s.cameraTapToOpen;
  static String get cameraOrGalleryHint => _s.cameraOrGalleryHint;
  static String get captureOrGalleryHint => _s.captureOrGalleryHint;
  static String scanFooterHint(String modeLabel, {required bool cameraLive}) =>
      _s.scanFooterHint(modeLabel, cameraLive: cameraLive);
  static String get closeCamera => _s.closeCamera;
  static String get noIngredients => _s.noIngredients;
  static String get recipeInstructions => _s.recipeInstructions;
  static String get untitledRecipe => _s.untitledRecipe;
  static String get genericLoadError => _s.genericLoadError;
  static String get scanConfirmTitle => _s.scanConfirmTitle;
  static String get scanConfirmSubtitle => _s.scanConfirmSubtitle;
  static String get scanConfirmAnalyze => _s.scanConfirmAnalyze;
  static String get scanConfirmCancel => _s.scanConfirmCancel;
  static String get scanConfirmRetake => _s.scanConfirmRetake;
  static String get scanConfirmPickOther => _s.scanConfirmPickOther;
  static String get clearRecentScans => _s.clearRecentScans;
  static String get clearRecentScansSubtitle => _s.clearRecentScansSubtitle;
  static String get clearRecentScansConfirmTitle =>
      _s.clearRecentScansConfirmTitle;
  static String get clearRecentScansConfirmBody => _s.clearRecentScansConfirmBody;
  static String get clearRecentScansDone => _s.clearRecentScansDone;
  static String get deleteAction => _s.deleteAction;
  static String get imageQualityTitle => _s.imageQualityTitle;
  static String get imageQualityDark => _s.imageQualityDark;
  static String get imageQualityBlurry => _s.imageQualityBlurry;
  static String get imageQualityContinue => _s.imageQualityContinue;
  static String get imageQualityRetake => _s.imageQualityRetake;
  static String receiptQueueTitle(int count) => _s.receiptQueueTitle(count);
  static String receiptQueueItem(int d, int m, int h, int min) =>
      _s.receiptQueueItem(d, m, h, min);
  static String get receiptQueueProcess => _s.receiptQueueProcess;
  static String get receiptQueuedOffline => _s.receiptQueuedOffline;
  static String get receiptLowConfidenceBlock => _s.receiptLowConfidenceBlock;
  static String get unifiedPantryTitle => _s.unifiedPantryTitle;
  static String get unifiedPantryEmpty => _s.unifiedPantryEmpty;
  static String get searchHint => _s.searchHint;
  static String get navShopping => _s.navShopping;
  static String get shoppingAddHint => _s.shoppingAddHint;
  static String get shoppingEmpty => _s.shoppingEmpty;
  static String get shoppingClearDone => _s.shoppingClearDone;
  static String get shoppingDoneSection => _s.shoppingDoneSection;
  static String get shoppingAddFromRecipe => _s.shoppingAddFromRecipe;
  static String get freshnessViewCalendar => _s.freshnessViewCalendar;
  static String get freshnessViewList => _s.freshnessViewList;
  static String get cookToday => _s.cookToday;
  static String get cookTodayNoUrgent => _s.cookTodayNoUrgent;
  static String pantryMismatchHint(List<String> items) =>
      _s.pantryMismatchHint(items);
  static String get exportLocalData => _s.exportLocalData;
  static String get exportLocalDataSubtitle => _s.exportLocalDataSubtitle;
  static String get exportLocalDataDone => _s.exportLocalDataDone;
  static String get clearLocalData => _s.clearLocalData;
  static String get clearLocalDataSubtitle => _s.clearLocalDataSubtitle;
  static String get clearLocalDataConfirmTitle => _s.clearLocalDataConfirmTitle;
  static String get clearLocalDataConfirmBody => _s.clearLocalDataConfirmBody;
  static String get clearLocalDataDone => _s.clearLocalDataDone;
  static String get settingsTitle => _s.settingsTitle;
  static String get languageTitle => _s.languageTitle;
  static String get languageSubtitle => _s.languageSubtitle;
  static String get localePreparingTitle => _s.localePreparingTitle;
  static String get localePreparingSubtitle => _s.localePreparingSubtitle;
  static String get dietTitle => _s.dietTitle;
  static String get dietSubtitle => _s.dietSubtitle;
  static String get dietNone => _s.dietNone;
  static String get dietVegetarian => _s.dietVegetarian;
  static String get dietVegan => _s.dietVegan;
  static String get dietGlutenFree => _s.dietGlutenFree;
  static String get dietLowCarb => _s.dietLowCarb;
  static String get dietHalal => _s.dietHalal;
  static String get cuisineTitle => _s.cuisineTitle;
  static String get cuisineSubtitle => _s.cuisineSubtitle;
  static String get cuisineAutomatic => _s.cuisineAutomatic;
  static String cuisineDisplaySummary(
    CuisinePreference preference,
    CuisineRegion effectiveRegion,
  ) {
    if (preference.isAutomatic) {
      return '${_s.cuisineAutomatic} · ${effectiveRegion.pickerLabel}';
    }
    return preference.pickerLabel;
  }

  static String get aiUsageLimitsTitle => _s.aiUsageLimitsTitle;
  static String get aiUsageLimitsLoading => _s.aiUsageLimitsLoading;
  static String get aiUsageCanSendNow => _s.aiUsageCanSendNow;
  static String get aiUsageDailyReset => _s.aiUsageDailyReset;
  static String get aiUsageUpgrade => _s.aiUsageUpgrade;
  static String get aiUsagePlanPro => _s.aiUsagePlanPro;
  static String get aiUsagePlanFree => _s.aiUsagePlanFree;
  static String get aiUsageLabelPantry => _s.aiUsageLabelPantry;
  static String get aiUsageLabelReceipt => _s.aiUsageLabelReceipt;
  static String get aiUsageLabelRecipe => _s.aiUsageLabelRecipe;
  static String aiUsageRemainingLine(
    int pantryRemaining,
    int pantryMax,
    int receiptRemaining,
    int receiptMax,
    int recipeRemaining,
    int recipeMax,
  ) =>
      _s.aiUsageRemainingLine(
        pantryRemaining,
        pantryMax,
        receiptRemaining,
        receiptMax,
        recipeRemaining,
        recipeMax,
      );
  static String aiUsageDailyResetLine(String time) =>
      _s.aiUsageDailyResetLine(time);
  static String get upgradeToProTitle => _s.upgradeToProTitle;
  static String get upgradeToProSubtitle => _s.upgradeToProSubtitle;
  static String get upgradeToProLimitsDetail => _s.upgradeToProLimitsDetail;
  static String get upgradeToProContinue => _s.upgradeToProContinue;
  static String get storeUnavailable => _s.storeUnavailable;
  static String get proProductIdsNotConfigured => _s.proProductIdsNotConfigured;
  static String get noProProductsFound => _s.noProProductsFound;
  static String get purchaseFlowFailed => _s.purchaseFlowFailed;
  static String get purchaseCompletedProActivated =>
      _s.purchaseCompletedProActivated;
  static String get purchaseCompletedVerifyFailed =>
      _s.purchaseCompletedVerifyFailed;
  static String get purchaseFailed => _s.purchaseFailed;
  static String get restorePurchases => _s.restorePurchases;
  static String get restorePurchasesStarted => _s.restorePurchasesStarted;
  static String get nutritionTitle => _s.nutritionTitle;
  static String get nutritionPerServing => _s.nutritionPerServing;
  static String get nutritionCalories => _s.nutritionCalories;
  static String get nutritionProtein => _s.nutritionProtein;
  static String get nutritionCarbs => _s.nutritionCarbs;
  static String get nutritionFat => _s.nutritionFat;
  static String get nutritionEstimateNote => _s.nutritionEstimateNote;
  static String get barcodeScanTitle => _s.barcodeScanTitle;
  static String get barcodeScanHint => _s.barcodeScanHint;
  static String get barcodeNotFound => _s.barcodeNotFound;
  static String get barcodeConfirmTitle => _s.barcodeConfirmTitle;
  static String get barcodeAddToPantry => _s.barcodeAddToPantry;
  static String get navScan => _s.navScan;
  static String get captureTypeFridge => _s.captureTypeFridge;
  static String get captureTypeReceipt => _s.captureTypeReceipt;
  static String get captureTypeBarcode => _s.captureTypeBarcode;
  static String get sectionAccount => _s.sectionAccount;
  static String get sectionPreferences => _s.sectionPreferences;
  static String get sectionApp => _s.sectionApp;
  static String get sectionPrivacy => _s.sectionPrivacy;
  static String get sessionTitle => _s.sessionTitle;
  static String get guestUser => _s.guestUser;
  static String get favoritesTitle => _s.favoritesTitle;
  static String get favoritesSubtitle => _s.favoritesSubtitle;
  static String get freshnessInventorySubtitle => _s.freshnessInventorySubtitle;
  static String get pantrySyncSubtitle => _s.pantrySyncSubtitle;
  static String get showOnboardingAgain => _s.showOnboardingAgain;
  static String get signOut => _s.signOut;
  static String get scanSubtitleSmart => _s.scanSubtitleSmart;
  static String get scanSubtitleReceipt => _s.scanSubtitleReceipt;
  static String get tooltipSettings => _s.tooltipSettings;
  static String get tooltipToggleGuide => _s.tooltipToggleGuide;
  static String get tooltipModesAbout => _s.tooltipModesAbout;
  static String get galleryLabel => _s.galleryLabel;
  static String get cameraLoading => _s.cameraLoading;
  static String get cameraUnavailable => _s.cameraUnavailable;
  static String get captureFailed => _s.captureFailed;
  static String get receiptCaptureAlign => _s.receiptCaptureAlign;
  static String get receiptCameraHint => _s.receiptCameraHint;
  static String get pickPhotoHint => _s.pickPhotoHint;
  static String get desktopGalleryHint => _s.desktopGalleryHint;
  static String get noCameraOnDevice => _s.noCameraOnDevice;
  static String get openCameraButton => _s.openCameraButton;
  static String get pickPhotoButton => _s.pickPhotoButton;
  static String get overlayGuideOn => _s.overlayGuideOn;
  static String get overlayGuideOff => _s.overlayGuideOff;
  static String get modeSheetTitle => _s.modeSheetTitle;
  static String get modeSheetSubtitle => _s.modeSheetSubtitle;
  static String get scanModeQuickLabel => _s.scanModeQuickLabel;
  static String get scanModeQuickSubtitle => _s.scanModeQuickSubtitle;
  static String get scanModeQuickDesc => _s.scanModeQuickDesc;
  static String get scanModeSurvivalLabel => _s.scanModeSurvivalLabel;
  static String get scanModeSurvivalSubtitle => _s.scanModeSurvivalSubtitle;
  static String get scanModeSurvivalDesc => _s.scanModeSurvivalDesc;
  static String get scanModeChefLabel => _s.scanModeChefLabel;
  static String get scanModeChefSubtitle => _s.scanModeChefSubtitle;
  static String get scanModeChefDesc => _s.scanModeChefDesc;
  static String get scanModeQuickBestFor => _s.scanModeQuickBestFor;
  static String get scanModeQuickExamples => _s.scanModeQuickExamples;
  static String get scanModeSurvivalBestFor => _s.scanModeSurvivalBestFor;
  static String get scanModeSurvivalExamples => _s.scanModeSurvivalExamples;
  static String get scanModeChefBestFor => _s.scanModeChefBestFor;
  static String get scanModeChefExamples => _s.scanModeChefExamples;
  static String get scanModeIdealForLabel => _s.scanModeIdealForLabel;
  static String get scanModeExamplesLabel => _s.scanModeExamplesLabel;
  static String get survivalHintAddFromPantry => _s.survivalHintAddFromPantry;
  static String get filterAll => _s.filterAll;
  static String get filterCritical => _s.filterCritical;
  static String get filterWarning => _s.filterWarning;
  static String get filterSafe => _s.filterSafe;
  static String get recipesScreenTitle => _s.recipesScreenTitle;
  static String get copyRecipe => _s.copyRecipe;
  static String get shareRecipe => _s.shareRecipe;
  static String get recipeCopiedSnack => _s.recipeCopiedSnack;
  static String get survivalHintTitle => _s.survivalHintTitle;
  static String get survivalHintOptional => _s.survivalHintOptional;
  static String get survivalHintPlaceholder => _s.survivalHintPlaceholder;
  static String get scanConfirmReceiptLabel => _s.scanConfirmReceiptLabel;
  static String get scanSavedHistory => _s.scanSavedHistory;
  static String get scanSaveFailedPrefix => _s.scanSaveFailedPrefix;
  static String get daysUnit => _s.daysUnit;
  static String get okButton => _s.okButton;
  static String get recipesDetectedIngredients =>
      _s.recipesDetectedIngredients;
  static String recipesAiCount(int count) => _s.recipesAiCount(count);
  static String get galleryPickMessage => _s.galleryPickMessage;
  static String get favoritesEmpty => _s.favoritesEmpty;
  static String recipeDetailTitle(int? index) => _s.recipeDetailTitle(index);
  static String get timeAgoJustNow => _s.timeAgoJustNow;
  static String timeAgoMinutes(int minutes) => _s.timeAgoMinutes(minutes);
  static String timeAgoHours(int hours) => _s.timeAgoHours(hours);
  static String timeAgoDays(int days) => _s.timeAgoDays(days);
  static String get daysExpired => _s.daysExpired;
  static String get daysToday => _s.daysToday;
  static String get daysTomorrow => _s.daysTomorrow;
  static String daysCount(int days) => _s.daysCount(days);
  static String unifiedDaysRemaining(int days) => _s.unifiedDaysRemaining(days);
  static String productCount(int count) => _s.productCount(count);
  static String get unifiedSourceReceipt => _s.unifiedSourceReceipt;
  static String get unifiedSourceScan => _s.unifiedSourceScan;
  static String unifiedLastScan(String date) => _s.unifiedLastScan(date);
  static String get receiptFieldProductName => _s.receiptFieldProductName;
  static String get receiptFieldQuantity => _s.receiptFieldQuantity;
  static String get receiptFieldCategory => _s.receiptFieldCategory;
  static String expiryApprox(int days) => _s.expiryApprox(days);
  static String barcodeEan(String code) => _s.barcodeEan(code);
  static String get shoppingListAddedSnack => _s.shoppingListAddedSnack;
  static String pantryHistorySummary(int ingredients, int recipes) =>
      _s.pantryHistorySummary(ingredients, recipes);
  static String get favoriteAddTooltip => _s.favoriteAddTooltip;
  static String get favoriteRemoveTooltip => _s.favoriteRemoveTooltip;
  static String get favoriteAddedSnack => _s.favoriteAddedSnack;
  static String get favoriteRemovedSnack => _s.favoriteRemovedSnack;
  static String get onboardingScanTitle => _s.onboardingScanTitle;
  static String get onboardingScanBody => _s.onboardingScanBody;
  static String get onboardingReceiptTitle => _s.onboardingReceiptTitle;
  static String get onboardingReceiptBody => _s.onboardingReceiptBody;
  static String get onboardingShoppingTitle => _s.onboardingShoppingTitle;
  static String get onboardingShoppingBody => _s.onboardingShoppingBody;
  static String get onboardingRecipesTitle => _s.onboardingRecipesTitle;
  static String get onboardingRecipesBody => _s.onboardingRecipesBody;
  static String get onboardingFavoritesTitle => _s.onboardingFavoritesTitle;
  static String get onboardingFavoritesBody => _s.onboardingFavoritesBody;
  static String get onboardingCloudTitle => _s.onboardingCloudTitle;
  static String get onboardingCloudBody => _s.onboardingCloudBody;
  static String get onboardingPermissionsTitle => _s.onboardingPermissionsTitle;
  static String get onboardingPermissionsBody => _s.onboardingPermissionsBody;
  static String get emptyStateScanReceipt => _s.emptyStateScanReceipt;
  static String get emptyStateStartScan => _s.emptyStateStartScan;
  static String get manageSubscriptions => _s.manageSubscriptions;
  static String get notificationCriticalChannelName =>
      _s.notificationCriticalChannelName;
  static String get notificationCriticalChannelDesc =>
      _s.notificationCriticalChannelDesc;
  static String get notificationDailyChannelName =>
      _s.notificationDailyChannelName;
  static String get notificationDailyChannelDesc =>
      _s.notificationDailyChannelDesc;
  static String get notificationCriticalTitle => _s.notificationCriticalTitle;
  static String notificationCriticalBody(String names, String extra) =>
      _s.notificationCriticalBody(names, extra);
  static String get notificationDailyTitle => _s.notificationDailyTitle;
  static String get notificationDailyBody => _s.notificationDailyBody;
  static String get widgetFreshnessGood => _s.widgetFreshnessGood;
  static String widgetFreshnessCritical(int count) =>
      _s.widgetFreshnessCritical(count);
  static String widgetCountsSummary(int critical, int warning) =>
      _s.widgetCountsSummary(critical, warning);
  static String get categoryDairy => _s.categoryDairy;
  static String get categoryMeat => _s.categoryMeat;
  static String get categoryFruit => _s.categoryFruit;
  static String get categoryVegetable => _s.categoryVegetable;
  static String get categoryBeverage => _s.categoryBeverage;
  static String get categoryBakery => _s.categoryBakery;
  static String get categoryPantry => _s.categoryPantry;
  static String calendarMonthName(int month) => _s.calendarMonthName(month);
  static String get appBrandName => _s.appBrandName;
  static String appVersionLabel(String version) => _s.appVersionLabel(version);
  static String get recipesPlaceholderTitle => _s.recipesPlaceholderTitle;
  static String get recipesPlaceholderBody => _s.recipesPlaceholderBody;
  static String get recipeSamplePlating => _s.recipeSamplePlating;
  static String get recipeShareInstructionsHeader =>
      _s.recipeShareInstructionsHeader;
  static String get recipeShareFooter => _s.recipeShareFooter;
  static String get expiryDatePrefix => _s.expiryDatePrefix;
  static String get themeTitle => _s.themeTitle;
  static String get themeSubtitle => _s.themeSubtitle;
  static String get themeNeonLabel => _s.themeNeonLabel;
  static String get themeNeonSubtitle => _s.themeNeonSubtitle;
  static String get themeOceanLabel => _s.themeOceanLabel;
  static String get themeOceanSubtitle => _s.themeOceanSubtitle;
  static String get themeEmberLabel => _s.themeEmberLabel;
  static String get themeEmberSubtitle => _s.themeEmberSubtitle;
  static String get themeLavenderLabel => _s.themeLavenderLabel;
  static String get themeLavenderSubtitle => _s.themeLavenderSubtitle;
  static String get themeDaylightLabel => _s.themeDaylightLabel;
  static String get themeDaylightSubtitle => _s.themeDaylightSubtitle;
  static String get themeCreamLabel => _s.themeCreamLabel;
  static String get themeCreamSubtitle => _s.themeCreamSubtitle;
}

String localizeAuthError(String message) {
  final m = message.toLowerCase();
  final isEn = AppStrings.isEnglish;
  if (m.contains('invalid login credentials') ||
      m.contains('invalid credentials')) {
    return isEn ? 'Invalid email or password.' : 'E-posta veya şifre hatalı.';
  }
  if (m.contains('email not confirmed')) {
    return isEn
        ? 'Please confirm your email address.'
        : 'E-posta adresinizi onaylamanız gerekiyor.';
  }
  if (m.contains('user already registered')) {
    return isEn
        ? 'An account with this email already exists.'
        : 'Bu e-posta ile zaten bir hesap var.';
  }
  if (m.contains('password') && m.contains('weak')) {
    return isEn
        ? 'Password is too weak. Choose a stronger one.'
        : 'Şifre çok zayıf. Daha güçlü bir şifre seçin.';
  }
  if (m.contains('network') || m.contains('socket')) {
    return AppStrings.networkError;
  }
  return message;
}
