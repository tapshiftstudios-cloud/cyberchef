import 'strings_base.dart';

class StringsEn implements StringsBase {
  const StringsEn();

  @override
  String get analysisTitle => 'Analyzing pantry';
  @override
  String get stepPrepareImage => 'Preparing photo…';
  @override
  String get stepAnalyzeAi => 'Detecting ingredients…';
  @override
  String get stepBuildRecipes => 'Building recipes…';
  @override
  String get receiptAnalysisTitle => 'Reading receipt';
  @override
  String get stepReceiptPrepare => 'Preparing receipt image…';
  @override
  String get stepReceiptOcr => 'Recognizing items…';
  @override
  String get stepReceiptInfer => 'Estimating shelf life…';
  @override
  String get receiptNotRecognized =>
      'Could not read receipt. Try a clearer, flatter photo.';
  @override
  String get receiptNotDetected =>
      'No receipt detected. Align the receipt in the frame.';
  @override
  String get receiptConfirmTitle => 'Confirm receipt items';
  @override
  String get receiptConfirmSubtitle =>
      'Select items to add. Long press to edit.';
  @override
  String get receiptConfirmSave => 'Add to pantry';
  @override
  String get receiptSelectOne => 'Select at least one item.';
  @override
  String get receiptSaved => 'Items added to freshness inventory';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Send this receipt photo? OCR analysis starts after you confirm.';
  @override
  String get navFreshness => 'Freshness';
  @override
  String get freshnessPanelTitle => 'Freshness panel';
  @override
  String get freshnessCritical => 'Critical (0–2 days)';
  @override
  String get freshnessWarning => 'Warning (3–5 days)';
  @override
  String get freshnessSafe => 'Safe (6+ days)';
  @override
  String get freshnessEmpty =>
      'No tracked items yet. Scan a receipt to build inventory.';
  @override
  String get freshnessListTitle => 'Freshness inventory';
  @override
  String get freshnessListEmpty => 'No items in this filter.';
  @override
  String get freshnessSuggestRecipes => 'Suggest recipes with these';
  @override
  String get savingsPanelTitle => 'Savings panel';
  @override
  String get savingsPanelEmptyHint =>
      'Mark near-expiry items as “Meal made” to track waste prevented here.';
  @override
  String get savingsStatItems => 'Rescued';
  @override
  String get savingsStatWaste => 'Waste prevented';
  @override
  String get savingsStatMoney => 'Est. savings';
  @override
  String get savingsDashboardTitle => 'Savings analytics';
  @override
  String get savingsDashboardSubtitle =>
      'Summary of food you saved from the bin — this month.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingredient saved from waste this month'
          : '$count ingredients saved from waste this month';
  @override
  String savingsKgPrevented(String kg) => 'Food waste prevented: $kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Estimated financial gain: $amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Last 4 weeks';
  @override
  String get savingsRecentTitle => 'Recent rescues';
  @override
  String get savingsEmptySubtitle =>
      'No records yet. When you use a critical or warning item, it appears here.';
  @override
  String get savingsHowItWorks =>
      'Items used within 5 days of expiry count as rescued. Weight and value are estimated from category averages.';
  @override
  String get pantryNamesLocaleNote =>
      'Product and store names appear as saved on your receipt; common terms are shown in English.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Used on last day' : 'Used with $days days left';
  @override
  String get savingsMealMade => 'Meal made';
  @override
  String savingsMealMadeConfirm(String name) => 'Mark $name as consumed?';
  @override
  String savingsRescuedSnack(String money) => 'Savings recorded · $money';
  @override
  String get freshnessRecipeTitle => 'Preparing recipes';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'At least one item is required for recipes.';
  @override
  String get freshnessCriticalBanner => 'Expiring soon';
  @override
  String get freshnessViewAll => 'View all';
  @override
  String get receiptCaptureHints =>
      'Hold receipt flat, good lighting. All lines visible in vertical frame.';
  @override
  String get receiptPurchaseDate => 'Purchase date';
  @override
  String get receiptTapToEdit => 'Edit';
  @override
  String get receiptEditItem => 'Edit item';
  @override
  String get receiptEditSave => 'Save';
  @override
  String get receiptExpiryDaysLabel => 'Estimated shelf life (days)';
  @override
  String get receiptMergedSnack => 'Some items merged with existing records';
  @override
  String get receiptCloudSyncFailed => 'Could not save to cloud';
  @override
  String get receiptCloudSynced => 'Items synced to cloud';
  @override
  String get pantrySyncAction => 'Sync freshness data';
  @override
  String get pantrySyncDone => 'Freshness data updated';
  @override
  String get pantrySyncFailed => 'Sync failed';
  @override
  String get freshnessNotificationsTitle => 'Freshness notifications';
  @override
  String get freshnessNotificationsSubtitle =>
      'Critical items and daily reminder';
  @override
  String get freshnessNotificationTimeLabel => 'Daily reminder time';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Every day at $time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'This week: $critical critical, $warning warning items. Use these first.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Network error. Check your connection and try again.';
  @override
  String get geminiQuotaExceeded =>
      'AI quota exceeded. Wait a few minutes and try again.';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studio prepayment credits are depleted. Add billing at ai.google.dev to restore AI features.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automatic retry may be available in $minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Daily AI translation limit reached (3/3). Recipes use basic translation until tomorrow.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'You have $remaining AI translation(s) left today.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Daily pantry scan limit reached (3). Please try again tomorrow.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Daily receipt scan limit reached (2). Please try again tomorrow.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Daily recipe generation limit reached (3). Please try again tomorrow.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Please wait $seconds second(s) before trying again.';
  @override
  String get adRewardTitlePantry => 'Pantry scan limit reached';
  @override
  String get adRewardTitleReceipt => 'Receipt scan limit reached';
  @override
  String get adRewardTitleRecipe => 'Recipe generation limit reached';
  @override
  String get adRewardSubtitle =>
      'Watch a short ad to earn +1 extra use today (up to 3 per day).';
  @override
  String get adRewardWatchButton => 'Watch ad (+1 use)';
  @override
  String get adRewardGranted => 'Extra use granted. Try again.';
  @override
  String get adRewardNotCompleted =>
      'Ad was not completed. No extra use was granted.';
  @override
  String get adRewardDailyCapReached =>
      'You reached today\'s ad reward limit.';
  @override
  String get geminiTimeout =>
      'Request timed out. Check your connection and try again.';
  @override
  String get geminiServerError =>
      'AI service is temporarily unavailable. Please try again later.';
  @override
  String get imageNotRecognized =>
      'Image not recognized. Improve lighting or try another angle.';
  @override
  String get imageNotPantry =>
      'Fridge or pantry not visible. Please photograph directly.';
  @override
  String get parseError =>
      'Could not parse AI response. Please scan again.';
  @override
  String get modelUnavailable =>
      'AI model unavailable. Check your API access.';
  @override
  String get genericError => 'Something went wrong. Please try again.';
  @override
  String get imageDecodeError => 'Could not read photo. Try another image.';
  @override
  String get authSubtitle => 'Smart pantry access';
  @override
  String get authInitializing => 'Preparing session…';
  @override
  String get emailLabel => 'Email';
  @override
  String get passwordLabel => 'Password';
  @override
  String get emailRequired => 'Email required';
  @override
  String get emailInvalid => 'Invalid email';
  @override
  String get passwordMin => 'At least 6 characters';
  @override
  String get passwordVisibilityShow => 'Show password';
  @override
  String get passwordVisibilityHide => 'Hide password';
  @override
  String get authOrContinueWith => 'or continue with';
  @override
  String get signInWithGoogle => 'Continue with Google';
  @override
  String get googleSignInFailed => 'Google sign-in failed. Try again.';
  @override
  String get signIn => 'Sign in';
  @override
  String get signUp => 'Create account';
  @override
  String get toggleToSignIn => 'Already have an account? Sign in';
  @override
  String get toggleToSignUp => 'New here? Create account';
  @override
  String get guestContinue => 'Continue as guest';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Account created. Open the confirmation link in your inbox; the app will notify you when verified.';
  @override
  String get emailConfirmedSuccess =>
      'Your email is confirmed. Your account is ready.';
  @override
  String get emailVerifiedLabel => 'Email verified';
  @override
  String get proEmailRequiredTitle => 'Email account required for Pro';
  @override
  String get proEmailRequiredBody =>
      'Guest accounts cannot purchase Pro. Create an email account to keep your data and unlock billing.';
  @override
  String get proLinkAccountAction => 'Create account and continue';
  @override
  String get proAccountLinked =>
      'Account linked. You can continue to Pro checkout now.';
  @override
  String get supabaseNotConfigured =>
      'Account service unavailable. Please try again later.';
  @override
  String get privacyTitle => 'Data & privacy';
  @override
  String get privacySubtitle => 'Photos and account data';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Receipt images are not stored on the server; only the product list is extracted.\n\n'
      'When signed in, scans and freshness data may be saved to your account. '
      'The free plan shows Google AdMob ads; Pro has no ads.\n\n'
      'Open the online privacy policy for the full text.';
  @override
  String get privacyViewOnline => 'Open privacy policy';
  @override
  String get pantryHistoryTitle => 'Pantry history';
  @override
  String get pantryHistoryEmpty =>
      'No saved scans yet.\nScan your fridge to build history.';
  @override
  String get pantryHistorySubtitle => 'Cloud-saved scans';
  @override
  String get splashTagline => 'Produce & pantry — one app';
  @override
  String get splashLoading => 'Loading…';
  @override
  String get onboardingSkip => 'Skip';
  @override
  String get onboardingNext => 'Next';
  @override
  String get onboardingStart => 'Start';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Recent scans';
  @override
  String get cameraTapToOpen => 'Tap icon to open camera';
  @override
  String get cameraOrGalleryHint => 'Open camera or pick from gallery';
  @override
  String get captureOrGalleryHint => 'Capture or pick from gallery';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Close camera';
  @override
  String get noIngredients => 'No ingredients detected.';
  @override
  String get recipeInstructions => 'Instructions';
  @override
  String get untitledRecipe => 'Untitled recipe';
  @override
  String get genericLoadError => 'Something went wrong. Please try again.';
  @override
  String get scanConfirmTitle => 'Confirm photo';
  @override
  String get scanConfirmSubtitle =>
      'Send this photo? Recipe analysis starts after you confirm.';
  @override
  String get scanConfirmAnalyze => 'Analyze';
  @override
  String get scanConfirmCancel => 'Cancel';
  @override
  String get scanConfirmRetake => 'Retake';
  @override
  String get scanConfirmPickOther => 'Choose another';
  @override
  String get clearRecentScans => 'Clear recent scans';
  @override
  String get clearRecentScansSubtitle => 'Deletes local history on device';
  @override
  String get clearRecentScansConfirmTitle => 'Clear recent scans?';
  @override
  String get clearRecentScansConfirmBody =>
      'Cannot be undone. Favorites are not affected.';
  @override
  String get clearRecentScansDone => 'Recent scans cleared';
  @override
  String get deleteAction => 'Delete';
  @override
  String get imageQualityTitle => 'Low photo quality';
  @override
  String get imageQualityDark => 'Image is too dark. Add light and retry.';
  @override
  String get imageQualityBlurry =>
      'Image may be blurry. Hold steady and retake.';
  @override
  String get imageQualityContinue => 'Continue anyway';
  @override
  String get imageQualityRetake => 'Retake';
  @override
  String receiptQueueTitle(int count) => '$count receipt(s) waiting offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Receipt · $d/$m · $h:${min.toString().padLeft(2, '0')}';
  @override
  String get receiptQueueProcess => 'Process';
  @override
  String get receiptQueuedOffline =>
      'Offline. Receipt queued; process when connected.';
  @override
  String get receiptLowConfidenceBlock =>
      'Edit low-confidence items before saving (pencil icon).';
  @override
  String get unifiedPantryTitle => 'Unified inventory';
  @override
  String get unifiedPantryEmpty => 'No items or scans yet.';
  @override
  String get searchHint => 'Search products…';
  @override
  String get navShopping => 'Shopping';
  @override
  String get shoppingAddHint => 'Add missing item';
  @override
  String get shoppingEmpty => 'Your shopping list is empty.';
  @override
  String get shoppingClearDone => 'Clear completed';
  @override
  String get shoppingDoneSection => 'Done';
  @override
  String get shoppingAddFromRecipe => 'Add items not in receipt inventory';
  @override
  String get freshnessViewCalendar => 'Calendar';
  @override
  String get freshnessViewList => 'List';
  @override
  String get cookToday => 'What to cook today?';
  @override
  String get cookTodayNoUrgent =>
      'No urgent items. Scan a receipt to track freshness.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Seen in scan but not in receipt inventory: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Export local data';
  @override
  String get exportLocalDataSubtitle => 'Copies JSON to clipboard';
  @override
  String get exportLocalDataDone => 'Data copied to clipboard';
  @override
  String get clearLocalData => 'Delete local data';
  @override
  String get clearLocalDataSubtitle =>
      'Freshness, shopping, preferences (irreversible)';
  @override
  String get clearLocalDataConfirmTitle => 'Delete local data?';
  @override
  String get clearLocalDataConfirmBody =>
      'Freshness inventory and shopping list removed from device.';
  @override
  String get clearLocalDataDone => 'Local data cleared';
  @override
  String get settingsTitle => 'Settings';
  @override
  String get languageTitle => 'Language';
  @override
  String get languageSubtitle => 'App language · 27 languages';
  @override
  String get localePreparingTitle => 'Updating language';
  @override
  String get localePreparingSubtitle =>
      'Translating recipes and scan results…';
  @override
  String get dietTitle => 'Diet preference';
  @override
  String get dietSubtitle => 'Applied to recipe suggestions';
  @override
  String get dietNone => 'No restriction';
  @override
  String get dietVegetarian => 'Vegetarian';
  @override
  String get dietVegan => 'Vegan';
  @override
  String get dietGlutenFree => 'Gluten-free';
  @override
  String get dietLowCarb => 'Low carb';
  @override
  String get dietHalal => 'Halal';
  @override
  String get cuisineTitle => 'Cuisine / region';
  @override
  String get cuisineSubtitle => 'Recipe style for AI suggestions';
  @override
  String get cuisineAutomatic => 'Automatic';
  @override
  String get aiUsageLimitsTitle => 'AI usage limits';
  @override
  String get aiUsageLimitsLoading => 'Loading…';
  @override
  String get aiUsageCanSendNow => 'You can send a new request now.';
  @override
  String get aiUsageDailyReset => 'Daily reset';
  @override
  String get aiUsageUpgrade => 'Upgrade';
  @override
  String get aiUsagePlanPro => 'Plan: Pro';
  @override
  String get aiUsagePlanFree => 'Plan: Free';
  @override
  String get aiUsageLabelPantry => 'Pantry';
  @override
  String get aiUsageLabelReceipt => 'Receipt';
  @override
  String get aiUsageLabelRecipe => 'Recipe';
  @override
  String aiUsageRemainingLine(
    int pantryRemaining,
    int pantryMax,
    int receiptRemaining,
    int receiptMax,
    int recipeRemaining,
    int recipeMax,
  ) =>
      '$aiUsageLabelPantry: $pantryRemaining/$pantryMax  ·  $aiUsageLabelReceipt: $receiptRemaining/$receiptMax  ·  $aiUsageLabelRecipe: $recipeRemaining/$recipeMax';
  @override
  String aiUsageDailyResetLine(String time) => '$aiUsageDailyReset: $time';
  @override
  String get upgradeToProTitle => 'Upgrade to Pro';
  @override
  String get upgradeToProSubtitle =>
      'Higher daily limits for AI features.';
  @override
  String get upgradeToProLimitsDetail =>
      'Pro limits: Pantry 30/day · Receipt 15/day · Recipes 30/day · Translation 20/day';
  @override
  String get upgradeToProContinue => 'Continue to Pro';
  @override
  String get storeUnavailable =>
      'Store is currently unavailable. Try again later.';
  @override
  String get proProductIdsNotConfigured =>
      'Pro product IDs are not configured.';
  @override
  String get noProProductsFound => 'No purchasable Pro products found.';
  @override
  String get purchaseFlowFailed => 'Could not start purchase flow.';
  @override
  String get purchaseCompletedProActivated =>
      'Purchase completed. Pro plan activated.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Purchase completed. Could not verify yet, try again shortly.';
  @override
  String get purchaseFailed => 'Purchase failed.';
  @override
  String get restorePurchases => 'Restore purchases';
  @override
  String get restorePurchasesStarted =>
      'Checking Play Store for previous purchases…';
  @override
  String get nutritionTitle => 'Nutrition (estimate)';
  @override
  String get nutritionPerServing => 'per serving';
  @override
  String get nutritionCalories => 'Calories';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Carbs';
  @override
  String get nutritionFat => 'Fat';
  @override
  String get nutritionEstimateNote =>
      'AI estimate only; not medical or dietary advice.';
  @override
  String get barcodeScanTitle => 'Scan barcode';
  @override
  String get barcodeScanHint =>
      'Align barcode in frame. Product lookup via Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Product not found. Try receipt or fridge scan instead.';
  @override
  String get barcodeConfirmTitle => 'Confirm product';
  @override
  String get barcodeAddToPantry => 'Add to freshness inventory';
  @override
  String get navScan => 'Scan';
  @override
  String get captureTypeFridge => 'Fridge';
  @override
  String get captureTypeReceipt => 'Receipt';
  @override
  String get captureTypeBarcode => 'Barcode';
  @override
  String get sectionAccount => 'Account';
  @override
  String get sectionPreferences => 'Preferences';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Privacy';
  @override
  String get sessionTitle => 'Session';
  @override
  String get guestUser => 'Guest user';
  @override
  String get favoritesTitle => 'Favorites';
  @override
  String get favoritesSubtitle => 'Recipes you saved';
  @override
  String get freshnessInventorySubtitle =>
      'Products from receipts and expiry dates';
  @override
  String get pantrySyncSubtitle => 'Pull freshness inventory from cloud';
  @override
  String get showOnboardingAgain => 'Show onboarding tour again';
  @override
  String get signOut => 'Sign out';
  @override
  String get scanSubtitleSmart => 'Smart pantry scan';
  @override
  String get scanSubtitleReceipt => 'Receipt scan & freshness tracking';
  @override
  String get tooltipSettings => 'Settings';
  @override
  String get tooltipToggleGuide => 'Toggle frame guide';
  @override
  String get tooltipModesAbout => 'About scan modes';
  @override
  String get galleryLabel => 'Gallery';
  @override
  String get cameraLoading => 'Preparing camera…';
  @override
  String get cameraUnavailable =>
      'Camera unavailable.\nCheck permissions and try again.';
  @override
  String get captureFailed =>
      'Capture failed. Check camera permission and try again.';
  @override
  String get receiptCaptureAlign =>
      'Align receipt in vertical frame and capture';
  @override
  String get receiptCameraHint =>
      'Open camera or pick a receipt photo from gallery';
  @override
  String get pickPhotoHint => 'Tap the button to pick a photo';
  @override
  String get desktopGalleryHint =>
      'Desktop mode — pick a fridge photo from gallery.';
  @override
  String get noCameraOnDevice => 'No camera found on this device.';
  @override
  String get openCameraButton => 'Open camera';
  @override
  String get pickPhotoButton => 'Pick photo';
  @override
  String get overlayGuideOn => 'Guide on';
  @override
  String get overlayGuideOff => 'Guide off';
  @override
  String get modeSheetTitle => 'Scan modes';
  @override
  String get modeSheetSubtitle =>
      'Choose before capture; it changes AI recipe rules.';
  @override
  String get scanModeQuickLabel => 'Quick scan';
  @override
  String get scanModeQuickSubtitle => 'Recipes under 15 min';
  @override
  String get scanModeQuickDesc =>
      'Practical everyday meals. All recipes total 15 minutes or less; simple techniques (one pan, salad, quick fry).';
  @override
  String get scanModeSurvivalLabel => 'Rescue';
  @override
  String get scanModeSurvivalSubtitle => 'Use expiring items first';
  @override
  String get scanModeSurvivalDesc =>
      'Reduces waste. Prioritizes items that look close to spoiling. Optional hint field items are prioritized.';
  @override
  String get scanModeChefLabel => 'Chef mode';
  @override
  String get scanModeChefSubtitle => 'Gourmet & detailed';
  @override
  String get scanModeChefDesc =>
      'More refined recipes. Layered techniques, longer cook times; at least two recipes marked hard.';
  @override
  String get scanModeQuickBestFor =>
      'Weeknight meals with minimal ingredients and time';
  @override
  String get scanModeQuickExamples =>
      '• 10-min omelet\n• One-pan pasta\n• No-cook wrap or bowl';
  @override
  String get scanModeSurvivalBestFor =>
      'Using items before they expire and cutting waste';
  @override
  String get scanModeSurvivalExamples =>
      '• Clean-out veggie soup\n• Oven frittata\n• Leftover fried rice';
  @override
  String get scanModeChefBestFor =>
      'Special dinners, guests, or learning a technique';
  @override
  String get scanModeChefExamples =>
      '• Pan sauce protein\n• Crispy + creamy plate\n• Caramelized veg garnish';
  @override
  String get scanModeIdealForLabel => 'Best for';
  @override
  String get scanModeExamplesLabel => 'Example dishes';
  @override
  String get survivalHintAddFromPantry => 'Add from freshness';
  @override
  String get filterAll => 'All';
  @override
  String get filterCritical => 'Critical';
  @override
  String get filterWarning => 'Warning';
  @override
  String get filterSafe => 'Safe';
  @override
  String get recipesScreenTitle => 'Recipes';
  @override
  String get copyRecipe => 'Copy';
  @override
  String get shareRecipe => 'Share';
  @override
  String get recipeCopiedSnack => 'Recipe copied to clipboard';
  @override
  String get survivalHintTitle => 'Expiring soon';
  @override
  String get survivalHintOptional => 'Optional — e.g. milk, tomato, yogurt';
  @override
  String get survivalHintPlaceholder => 'Separate with commas';
  @override
  String get scanConfirmReceiptLabel => 'Receipt scan';
  @override
  String get scanSavedHistory => 'Scan saved to pantry history';
  @override
  String get scanSaveFailedPrefix => 'Could not save scan';
  @override
  String get daysUnit => 'days';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Detected ingredients';
  @override
  String recipesAiCount(int count) => 'AI recipes · $count';
  @override
  String get galleryPickMessage => 'Pick photo from gallery';
  @override
  String get favoritesEmpty =>
      'No favorite recipes yet.\nTap the heart on recipe results.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Recipe ${index + 1}' : 'Recipe';

  @override
  String get timeAgoJustNow => 'Just now';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m ago';
  @override
  String timeAgoHours(int hours) => '${hours}h ago';
  @override
  String timeAgoDays(int days) => '${days}d ago';
  @override
  String get daysExpired => 'Expired';
  @override
  String get daysToday => 'Today';
  @override
  String get daysTomorrow => 'Tomorrow';
  @override
  String daysCount(int days) => '$days days';
  @override
  String unifiedDaysRemaining(int days) => '$days days left';
  @override
  String productCount(int count) => '$count items';
  @override
  String get unifiedSourceReceipt => 'Receipt';
  @override
  String get unifiedSourceScan => 'Scan';
  @override
  String unifiedLastScan(String date) => 'Last scan · $date';
  @override
  String get receiptFieldProductName => 'Product name';
  @override
  String get receiptFieldQuantity => 'Quantity';
  @override
  String get receiptFieldCategory => 'Category';
  @override
  String expiryApprox(int days) => 'Best before ~$days days';
  @override
  String barcodeEan(String code) => 'EAN $code';
  @override
  String get shoppingListAddedSnack =>
      'Missing ingredients added to shopping list';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingredients · $recipes recipes';
  @override
  String get favoriteAddTooltip => 'Add to favorites';
  @override
  String get favoriteRemoveTooltip => 'Remove from favorites';
  @override
  String get favoriteAddedSnack => 'Added to favorites';
  @override
  String get favoriteRemovedSnack => 'Removed from favorites';
  @override
  String get onboardingScanTitle => 'Scan your pantry';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Shopping list';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favorites & recent scans';
  @override
  String get onboardingFavoritesBody =>
      'Save recipes you like. Recent scans open quickly from the home screen.';
  @override
  String get onboardingCloudTitle => 'Cloud history';
  @override
  String get onboardingCloudBody =>
      'Sign in to save scan history to your account and return anytime.';
  @override
  String get onboardingPermissionsTitle => 'Camera & notifications';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef needs camera access to scan your fridge, receipts, and barcodes. '
      'Optional notifications remind you when food is about to expire.';
  @override
  String get emptyStateScanReceipt => 'Scan receipt';
  @override
  String get emptyStateStartScan => 'Start scanning';
  @override
  String get manageSubscriptions => 'Manage subscription';
  @override
  String get notificationCriticalChannelName => 'Freshness alerts';
  @override
  String get notificationCriticalChannelDesc => 'Items expiring soon';
  @override
  String get notificationDailyChannelName => 'Daily summary';
  @override
  String get notificationDailyChannelDesc => 'Daily freshness reminder';
  @override
  String get notificationCriticalTitle => 'Items expiring soon';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Check the Freshness panel.';
  @override
  String get notificationDailyTitle => 'Freshness check';
  @override
  String get notificationDailyBody =>
      'Review items you should use today.';
  @override
  String get widgetFreshnessGood => 'Freshness looks good';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count items may expire today';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical critical · $warning warning';
  @override
  String get categoryDairy => 'Dairy';
  @override
  String get categoryMeat => 'Meat / fish';
  @override
  String get categoryFruit => 'Fruit';
  @override
  String get categoryVegetable => 'Vegetable';
  @override
  String get categoryBeverage => 'Beverage';
  @override
  String get categoryBakery => 'Bakery';
  @override
  String get categoryPantry => 'Pantry';
  @override
  String calendarMonthName(int month) => const [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Recipes';
  @override
  String get recipesPlaceholderBody =>
      'Recipe results will appear here after a successful scan.';
  @override
  String get recipeSamplePlating => 'Sample plating';
  @override
  String get recipeShareInstructionsHeader => 'Instructions:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Theme';
  @override
  String get themeSubtitle => 'Color palette and background';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Default dark green';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Cool blue tones';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Warm amber accents';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Purple accent dark';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Light background';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Warm cream with orange accent';
}
