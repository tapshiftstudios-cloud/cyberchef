import 'strings_base.dart';

class StringsHi implements StringsBase {
  const StringsHi();

  @override
  String get analysisTitle => 'पेंट्री का विश्लेषण';
  @override
  String get stepPrepareImage => 'फ़ोटो तैयार की जा रही है...';
  @override
  String get stepAnalyzeAi => 'सामग्री का पता लगाया जा रहा है...';
  @override
  String get stepBuildRecipes => 'बिल्डिंग रेसिपी...';
  @override
  String get receiptAnalysisTitle => 'पढ़ने की रसीद';
  @override
  String get stepReceiptPrepare => 'रसीद छवि तैयार की जा रही है…';
  @override
  String get stepReceiptOcr => 'आइटम पहचान रहे हैं...';
  @override
  String get stepReceiptInfer => 'शेल्फ जीवन का अनुमान लगाया जा रहा है...';
  @override
  String get receiptNotRecognized =>
      'रसीद नहीं पढ़ सका. एक स्पष्ट, सपाट फ़ोटो आज़माएँ।';
  @override
  String get receiptNotDetected =>
      'कोई रसीद नहीं मिली. रसीद को फ़्रेम में संरेखित करें.';
  @override
  String get receiptConfirmTitle => 'रसीद आइटम की पुष्टि करें';
  @override
  String get receiptConfirmSubtitle =>
      'जोड़ने के लिए आइटम चुनें. संपादित करने के लिए देर तक दबाएँ.';
  @override
  String get receiptConfirmSave => 'पेंट्री में जोड़ें';
  @override
  String get receiptSelectOne => 'कम से कम एक आइटम चुनें.';
  @override
  String get receiptSaved => 'ताजगी सूची में जोड़े गए आइटम';
  @override
  String get scanConfirmSubtitleReceipt =>
      'यह रसीद फ़ोटो भेजें? आपकी पुष्टि के बाद ओसीआर विश्लेषण शुरू होता है।';
  @override
  String get navFreshness => 'ताज़गी';
  @override
  String get freshnessPanelTitle => 'ताज़गी पैनल';
  @override
  String get freshnessCritical => 'गंभीर (0-2 दिन)';
  @override
  String get freshnessWarning => 'चेतावनी (3-5 दिन)';
  @override
  String get freshnessSafe => 'सुरक्षित (6+ दिन)';
  @override
  String get freshnessEmpty =>
      'अभी तक कोई ट्रैक किया गया आइटम नहीं. इन्वेंट्री बनाने के लिए रसीद को स्कैन करें।';
  @override
  String get freshnessListTitle => 'ताजगी सूची';
  @override
  String get freshnessListEmpty => 'इस फ़िल्टर में कोई आइटम नहीं.';
  @override
  String get freshnessSuggestRecipes => 'इनके साथ व्यंजन सुझाएं';
  @override
  String get savingsPanelTitle => 'बचत पैनल';
  @override
  String get savingsPanelEmptyHint =>
      'यहां अपशिष्ट को रोकने के लिए समाप्ति तिथि वाली वस्तुओं को "भोजन से बना" के रूप में चिह्नित करें।';
  @override
  String get savingsStatItems => 'बचाया';
  @override
  String get savingsStatWaste => 'बर्बादी रोकी';
  @override
  String get savingsStatMoney => 'ईएसटी। बचत';
  @override
  String get savingsDashboardTitle => 'बचत विश्लेषण';
  @override
  String get savingsDashboardSubtitle =>
      'इस महीने आपके द्वारा कूड़ेदान से बचाए गए भोजन का सारांश।';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? 'इस महीने 1 सामग्री को बर्बाद होने से बचाया गया'
          : '$count इस महीने सामग्री को बर्बाद होने से बचाया गया';
  @override
  String savingsKgPrevented(String kg) => 'भोजन की बर्बादी रोकी गई:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'अनुमानित वित्तीय लाभ:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'पिछले 4 सप्ताह';
  @override
  String get savingsRecentTitle => 'हाल के बचाव';
  @override
  String get savingsEmptySubtitle =>
      'अभी तक कोई रिकॉर्ड नहीं. जब आप किसी महत्वपूर्ण या चेतावनी वाली वस्तु का उपयोग करते हैं, तो वह यहां दिखाई देती है।';
  @override
  String get savingsHowItWorks =>
      'समाप्ति के 5 दिनों के भीतर उपयोग की गई वस्तुओं को बचाया गया माना जाता है। वजन और मूल्य का अनुमान श्रेणी औसत से लगाया जाता है।';
  @override
  String get pantryNamesLocaleNote =>
      'उत्पाद और स्टोर के नाम आपकी रसीद पर सहेजे गए के रूप में दिखाई देते हैं; सामान्य शब्द अंग्रेजी में दिखाए गए हैं।';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'अंतिम दिन प्रयोग किया गया' : 'साथ उपयोग करना$days दिन शेष';
  @override
  String get savingsMealMade => 'भोजन बनाया';
  @override
  String savingsMealMadeConfirm(String name) => 'निशान$name उपभोग के रूप में?';
  @override
  String savingsRescuedSnack(String money) => 'दर्ज की गई बचत ·$money';
  @override
  String get freshnessRecipeTitle => 'रेसिपी तैयार करना';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'व्यंजनों के लिए कम से कम एक वस्तु आवश्यक है।';
  @override
  String get freshnessCriticalBanner => 'जल्द ही समाप्त हो रहा है';
  @override
  String get freshnessViewAll => 'सभी को देखें';
  @override
  String get receiptCaptureHints =>
      'रसीद को समतल रखें, अच्छी रोशनी हो। सभी रेखाएँ ऊर्ध्वाधर फ्रेम में दिखाई देती हैं।';
  @override
  String get receiptPurchaseDate => 'खरीद की तारीख';
  @override
  String get receiptTapToEdit => 'संपादन करना';
  @override
  String get receiptEditItem => 'आइटम संपादित करें';
  @override
  String get receiptEditSave => 'बचाना';
  @override
  String get receiptExpiryDaysLabel => 'अनुमानित शेल्फ जीवन (दिन)';
  @override
  String get receiptMergedSnack => 'कुछ आइटम मौजूदा रिकॉर्ड के साथ विलय हो गए';
  @override
  String get receiptCloudSyncFailed => 'क्लाउड में सहेजा नहीं जा सका';
  @override
  String get receiptCloudSynced => 'आइटम क्लाउड से समन्वयित किए गए';
  @override
  String get pantrySyncAction => 'ताजगी डेटा सिंक करें';
  @override
  String get pantrySyncDone => 'ताजगी डेटा अपडेट किया गया';
  @override
  String get pantrySyncFailed => 'समन्वयन विफल';
  @override
  String get freshnessNotificationsTitle => 'ताजगी सूचनाएं';
  @override
  String get freshnessNotificationsSubtitle =>
      'महत्वपूर्ण वस्तुएं और दैनिक अनुस्मारक';
  @override
  String get freshnessNotificationTimeLabel => 'दैनिक अनुस्मारक समय';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'हर दिन पर$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'इस सप्ताह:$critical गंभीर,$warning चेतावनी आइटम. पहले इनका प्रयोग करें.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'नेटवर्क त्रुटि। अपना कनेक्शन जांचें और पुनः प्रयास करें।';
  @override
  String get geminiQuotaExceeded =>
      'एआई कोटा पार हो गया. कुछ मिनट प्रतीक्षा करें और पुनः प्रयास करें।';
  @override
  String get geminiBillingDepleted =>
      'Google AI स्टूडियो प्रीपेमेंट क्रेडिट समाप्त हो गए हैं। AI सुविधाओं को पुनर्स्थापित करने के लिए ai.google.dev पर बिलिंग जोड़ें।';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'स्वचालित पुनः प्रयास उपलब्ध हो सकता है$minutes मि.';
  @override
  String get aiTranslationDailyLimitReached =>
      'दैनिक एआई अनुवाद सीमा (3/3) तक पहुंच गई। व्यंजन कल तक मूल अनुवाद का उपयोग करते हैं।';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'आपके पास$remaining एआई अनुवाद आज शेष है।';
  @override
  String get aiPantryScanDailyLimitReached =>
      'दैनिक पेंट्री स्कैन सीमा (3) तक पहुंच गई। कृपया कल पुनः प्रयास करें.';
  @override
  String get aiReceiptDailyLimitReached =>
      'दैनिक रसीद स्कैन सीमा (2) तक पहुंच गई। कृपया कल पुनः प्रयास करें.';
  @override
  String get aiRecipeDailyLimitReached =>
      'दैनिक नुस्खा निर्माण सीमा (3) तक पहुंच गई। कृपया कल पुनः प्रयास करें.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'कृपया प्रतीक्षा करें$seconds पुनः प्रयास करने से पहले दूसरा।';
  @override
  String get adRewardTitlePantry => 'पैंट्री स्कैन की सीमा पूरी हो गई';
  @override
  String get adRewardTitleReceipt => 'रसीद स्कैन की सीमा पूरी हो गई';
  @override
  String get adRewardTitleRecipe => 'रेसिपी बनाने की सीमा पूरी हो गई';
  @override
  String get adRewardSubtitle =>
      'आज +1 अतिरिक्त उपयोग (प्रति दिन 3 तक) अर्जित करने के लिए एक छोटा विज्ञापन देखें।';
  @override
  String get adRewardWatchButton => 'विज्ञापन देखें (+1 उपयोग)';
  @override
  String get adRewardGranted => 'अतिरिक्त उपयोग की अनुमति दी गई. पुनः प्रयास करें।';
  @override
  String get adRewardNotCompleted =>
      'विज्ञापन पूरा नहीं हुआ. कोई अतिरिक्त उपयोग की अनुमति नहीं दी गई.';
  @override
  String get adRewardDailyCapReached =>
      'आप आज की विज्ञापन इनाम सीमा तक पहुंच गए हैं.';
  @override
  String get geminiTimeout =>
      'अनुरोध का समय समाप्त हो गया. अपना कनेक्शन जांचें और पुनः प्रयास करें।';
  @override
  String get geminiServerError =>
      'AI सेवा अस्थायी रूप से अनुपलब्ध है. कृपया बाद में पुन: प्रयास करें।';
  @override
  String get imageNotRecognized =>
      'छवि पहचानी नहीं गई. प्रकाश व्यवस्था सुधारें या कोई अन्य कोण आज़माएँ।';
  @override
  String get imageNotPantry =>
      'फ्रिज या पैंट्री दिखाई नहीं दे रही है. कृपया सीधे फोटोग्राफ करें.';
  @override
  String get parseError =>
      'एआई प्रतिक्रिया को पार्स नहीं किया जा सका। कृपया दोबारा स्कैन करें.';
  @override
  String get modelUnavailable =>
      'एआई मॉडल अनुपलब्ध. अपनी एपीआई पहुंच जांचें.';
  @override
  String get genericError => 'कुछ गलत हो गया। कृपया पुन: प्रयास करें।';
  @override
  String get imageDecodeError => 'फ़ोटो नहीं पढ़ सका. कोई अन्य छवि आज़माएँ.';
  @override
  String get authSubtitle => 'स्मार्ट पेंट्री एक्सेस';
  @override
  String get authInitializing => 'सत्र की तैयारी...';
  @override
  String get emailLabel => 'ईमेल';
  @override
  String get passwordLabel => 'पासवर्ड';
  @override
  String get emailRequired => 'ईमेल आवश्यक है';
  @override
  String get emailInvalid => 'अमान्य ईमेल';
  @override
  String get passwordMin => 'कम से कम 6 वर्ण';
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
  String get signIn => 'दाखिल करना';
  @override
  String get signUp => 'खाता बनाएं';
  @override
  String get toggleToSignIn => 'क्या आपके पास पहले से एक खाता मौजूद है? दाखिल करना';
  @override
  String get toggleToSignUp => 'अब यहां? खाता बनाएं';
  @override
  String get guestContinue => 'अतिथि के रूप में जारी रखें';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'खाता बनाया गया. अपने इनबॉक्स में पुष्टिकरण लिंक खोलें; सत्यापित होने पर ऐप आपको सूचित करेगा।';
  @override
  String get emailConfirmedSuccess =>
      'आपके ईमेल की पुष्टि हो गई है. आपका खाता तैयार है.';
  @override
  String get emailVerifiedLabel => 'ईमेल सत्यापित';
  @override
  String get proEmailRequiredTitle => 'प्रो के लिए ईमेल खाता आवश्यक है';
  @override
  String get proEmailRequiredBody =>
      'अतिथि खाते प्रो नहीं खरीद सकते. अपना डेटा रखने और बिलिंग अनलॉक करने के लिए एक ईमेल खाता बनाएं।';
  @override
  String get proLinkAccountAction => 'खाता बनाएं और जारी रखें';
  @override
  String get proAccountLinked =>
      'खाता लिंक किया गया. अब आप प्रो चेकआउट जारी रख सकते हैं।';
  @override
  String get supabaseNotConfigured =>
      'खाता सेवा अनुपलब्ध है. कृपया बाद में पुन: प्रयास करें।';
  @override
  String get privacyTitle => 'डाटा प्राइवेसी';
  @override
  String get privacySubtitle => 'फ़ोटो और खाता डेटा';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'रसीद छवियाँ सर्वर पर संग्रहीत नहीं हैं; केवल उत्पाद सूची निकाली जाती है।\\n\\n'
      'साइन इन करने पर, स्कैन और ताज़ा डेटा आपके खाते में सहेजा जा सकता है।'
      'मुफ़्त योजना Google AdMob विज्ञापन दिखाती है; प्रो के पास कोई विज्ञापन नहीं है.\\n\\n'
      'संपूर्ण पाठ के लिए ऑनलाइन गोपनीयता नीति खोलें।';
  @override
  String get privacyViewOnline => 'गोपनीयता नीति खोलें';
  @override
  String get pantryHistoryTitle => 'पेंट्री इतिहास';
  @override
  String get pantryHistoryEmpty =>
      'अभी तक कोई सहेजा गया स्कैन नहीं।\\nइतिहास बनाने के लिए अपने फ्रिज को स्कैन करें।';
  @override
  String get pantryHistorySubtitle => 'क्लाउड-सेव्ड स्कैन';
  @override
  String get splashTagline => 'उत्पादन और पेंट्री - एक ऐप';
  @override
  String get splashLoading => 'लोड हो रहा है...';
  @override
  String get onboardingSkip => 'छोडना';
  @override
  String get onboardingNext => 'अगला';
  @override
  String get onboardingStart => 'शुरू';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'हाल के स्कैन';
  @override
  String get cameraTapToOpen => 'कैमरा खोलने के लिए आइकन टैप करें';
  @override
  String get cameraOrGalleryHint => 'कैमरा खोलें या गैलरी से चुनें';
  @override
  String get captureOrGalleryHint => 'गैलरी से कैप्चर करें या चुनें';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'कैमरा बंद करें';
  @override
  String get noIngredients => 'कोई सामग्री नहीं पाई गई.';
  @override
  String get recipeInstructions => 'निर्देश';
  @override
  String get untitledRecipe => 'शीर्षक रहित नुस्खा';
  @override
  String get genericLoadError => 'कुछ गलत हो गया। कृपया पुन: प्रयास करें।';
  @override
  String get scanConfirmTitle => 'फ़ोटो की पुष्टि करें';
  @override
  String get scanConfirmSubtitle =>
      'यह फ़ोटो भेजें? आपकी पुष्टि के बाद रेसिपी विश्लेषण शुरू होता है।';
  @override
  String get scanConfirmAnalyze => 'विश्लेषण करें';
  @override
  String get scanConfirmCancel => 'रद्द करना';
  @override
  String get scanConfirmRetake => 'फिर से लेना';
  @override
  String get scanConfirmPickOther => 'दुसरे का चयन करें';
  @override
  String get clearRecentScans => 'हाल के स्कैन साफ़ करें';
  @override
  String get clearRecentScansSubtitle => 'डिवाइस पर स्थानीय इतिहास हटाता है';
  @override
  String get clearRecentScansConfirmTitle => 'हाल के स्कैन साफ़ करें?';
  @override
  String get clearRecentScansConfirmBody =>
      'पूर्ववत नहीं किया जा सकता. पसंदीदा प्रभावित नहीं होते.';
  @override
  String get clearRecentScansDone => 'हाल के स्कैन से साफ़ हो गया';
  @override
  String get deleteAction => 'मिटाना';
  @override
  String get imageQualityTitle => 'निम्न फ़ोटो गुणवत्ता';
  @override
  String get imageQualityDark => 'छवि बहुत गहरी है. प्रकाश जोड़ें और पुनः प्रयास करें.';
  @override
  String get imageQualityBlurry =>
      'छवि धुंधली हो सकती है. स्थिर रहें और दोबारा लें।';
  @override
  String get imageQualityContinue => 'फिर भी जारी रखें';
  @override
  String get imageQualityRetake => 'फिर से लेना';
  @override
  String receiptQueueTitle(int count) => '$count रसीदें ऑफ़लाइन प्रतीक्षा कर रही हैं';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'रसीद ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'प्रक्रिया';
  @override
  String get receiptQueuedOffline =>
      'ऑफ़लाइन. रसीद कतारबद्ध; कनेक्ट होने पर प्रक्रिया करें.';
  @override
  String get receiptLowConfidenceBlock =>
      'सहेजने से पहले कम आत्मविश्वास वाले आइटम संपादित करें (पेंसिल आइकन)।';
  @override
  String get unifiedPantryTitle => 'एकीकृत सूची';
  @override
  String get unifiedPantryEmpty => 'अभी तक कोई आइटम या स्कैन नहीं.';
  @override
  String get searchHint => 'उत्पादों को खोजना…';
  @override
  String get navShopping => 'खरीदारी';
  @override
  String get shoppingAddHint => 'लुप्त वस्तु जोड़ें';
  @override
  String get shoppingEmpty => 'आपकी खरीदारी की सूची खाली है।';
  @override
  String get shoppingClearDone => 'स्पष्टतः पूरा';
  @override
  String get shoppingDoneSection => 'हो गया';
  @override
  String get shoppingAddFromRecipe => 'वे आइटम जोड़ें जो रसीद सूची में नहीं हैं';
  @override
  String get freshnessViewCalendar => 'कैलेंडर';
  @override
  String get freshnessViewList => 'सूची';
  @override
  String get cookToday => 'आज खाने मेँ क्या बनाना हे?';
  @override
  String get cookTodayNoUrgent =>
      'कोई जरूरी सामान नहीं. ताजगी का पता लगाने के लिए रसीद को स्कैन करें।';
  @override
  String pantryMismatchHint(List<String> items) =>
      'स्कैन में देखा गया लेकिन रसीद सूची में नहीं: ${items.join(', ')}';
  @override
  String get exportLocalData => 'स्थानीय डेटा निर्यात करें';
  @override
  String get exportLocalDataSubtitle => 'JSON को क्लिपबोर्ड पर कॉपी करता है';
  @override
  String get exportLocalDataDone => 'डेटा क्लिपबोर्ड पर कॉपी किया गया';
  @override
  String get clearLocalData => 'स्थानीय डेटा हटाएँ';
  @override
  String get clearLocalDataSubtitle =>
      'ताजगी, खरीदारी, प्राथमिकताएँ (अपरिवर्तनीय)';
  @override
  String get clearLocalDataConfirmTitle => 'स्थानीय डेटा हटाएं?';
  @override
  String get clearLocalDataConfirmBody =>
      'डिवाइस से ताजगी सूची और खरीदारी सूची हटा दी गई।';
  @override
  String get clearLocalDataDone => 'स्थानीय डेटा साफ़ किया गया';
  @override
  String get settingsTitle => 'सेटिंग्स';
  @override
  String get languageTitle => 'भाषा';
  @override
  String get languageSubtitle => 'ऐप भाषा · 27 भाषाएँ';
  @override
  String get localePreparingTitle => 'भाषा अद्यतन हो रही है';
  @override
  String get localePreparingSubtitle =>
      'व्यंजनों का अनुवाद और परिणामों को स्कैन करें...';
  @override
  String get dietTitle => 'आहार प्राथमिकता';
  @override
  String get dietSubtitle => 'रेसिपी सुझावों पर लागू किया गया';
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
  String get aiUsageLimitsLoading => 'लोड हो रहा है...';
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
  String get aiUsageLabelPantry => 'कोठार';
  @override
  String get aiUsageLabelReceipt => 'रसीद';
  @override
  String get aiUsageLabelRecipe => 'व्यंजन विधि';
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
  String get storeUnavailable => 'स्टोर अभी उपलब्ध नहीं है। बाद में पुनः प्रयास करें।';
  @override
  String get proProductIdsNotConfigured => 'Pro उत्पाद ID कॉन्फ़िगर नहीं हैं।';
  @override
  String get noProProductsFound => 'कोई खरीद योग्य Pro उत्पाद नहीं मिला।';
  @override
  String get purchaseFlowFailed => 'खरीद प्रक्रिया शुरू नहीं हो सकी।';
  @override
  String get purchaseCompletedProActivated => 'खरीद पूर्ण। Pro योजना सक्रिय।';
  @override
  String get purchaseCompletedVerifyFailed =>
      'खरीद पूर्ण, सत्यापन असफल; कृपया थोड़ी देर बाद पुनः प्रयास करें।';
  @override
  String get purchaseFailed => 'खरीद विफल।';
  @override
  String get restorePurchases => 'खरीद पुनर्स्थापित करें';
  @override
  String get restorePurchasesStarted => 'Play Store में पिछली खरीद जाँची जा रही है…';
  @override
  String get nutritionTitle => 'पोषण (अनुमान)';
  @override
  String get nutritionPerServing => 'सेवारत प्रति';
  @override
  String get nutritionCalories => 'कैलोरी';
  @override
  String get nutritionProtein => 'प्रोटीन';
  @override
  String get nutritionCarbs => 'कार्बोहाइड्रेट';
  @override
  String get nutritionFat => 'मोटा';
  @override
  String get nutritionEstimateNote =>
      'केवल एआई अनुमान; चिकित्सीय या आहार संबंधी सलाह नहीं।';
  @override
  String get barcodeScanTitle => 'बारकोड स्कैन करें';
  @override
  String get barcodeScanHint =>
      'बारकोड को फ़्रेम में संरेखित करें. ओपन फ़ूड फैक्ट्स के माध्यम से उत्पाद की खोज।';
  @override
  String get barcodeNotFound =>
      'उत्पाद नहीं मिला। इसके बजाय रसीद या फ्रिज स्कैन का प्रयास करें।';
  @override
  String get barcodeConfirmTitle => 'उत्पाद की पुष्टि करें';
  @override
  String get barcodeAddToPantry => 'ताजगी सूची में जोड़ें';
  @override
  String get navScan => 'स्कैन';
  @override
  String get captureTypeFridge => 'फ़्रिज';
  @override
  String get captureTypeReceipt => 'रसीद';
  @override
  String get captureTypeBarcode => 'बारकोड';
  @override
  String get sectionAccount => 'खाता';
  @override
  String get sectionPreferences => 'प्राथमिकताएँ';
  @override
  String get sectionApp => 'अनुप्रयोग';
  @override
  String get sectionPrivacy => 'गोपनीयता';
  @override
  String get sessionTitle => 'सत्र';
  @override
  String get guestUser => 'अतिथि उपयोक्ता';
  @override
  String get favoritesTitle => 'पसंदीदा';
  @override
  String get favoritesSubtitle => 'आपके द्वारा सहेजे गए व्यंजन';
  @override
  String get freshnessInventorySubtitle =>
      'रसीदों और समाप्ति तिथियों से उत्पाद';
  @override
  String get pantrySyncSubtitle => 'क्लाउड से ताजगी सूची खींचें';
  @override
  String get showOnboardingAgain => 'ऑनबोर्डिंग टूर दोबारा दिखाएं';
  @override
  String get signOut => 'साइन आउट';
  @override
  String get scanSubtitleSmart => 'स्मार्ट पेंट्री स्कैन';
  @override
  String get scanSubtitleReceipt => 'रसीद स्कैन और ताजगी ट्रैकिंग';
  @override
  String get tooltipSettings => 'सेटिंग्स';
  @override
  String get tooltipToggleGuide => 'फ़्रेम गाइड टॉगल करें';
  @override
  String get tooltipModesAbout => 'स्कैन मोड के बारे में';
  @override
  String get galleryLabel => 'गैलरी';
  @override
  String get cameraLoading => 'कैमरा तैयार किया जा रहा है...';
  @override
  String get cameraUnavailable =>
      'कैमरा अनुपलब्ध है.\\nअनुमतियाँ जांचें और पुनः प्रयास करें.';
  @override
  String get captureFailed =>
      'कैप्चर विफल रहा. कैमरे की अनुमति जांचें और पुनः प्रयास करें।';
  @override
  String get receiptCaptureAlign =>
      'रसीद को ऊर्ध्वाधर फ्रेम में संरेखित करें और कैप्चर करें';
  @override
  String get receiptCameraHint =>
      'कैमरा खोलें या गैलरी से रसीद फ़ोटो चुनें';
  @override
  String get pickPhotoHint => 'फ़ोटो चुनने के लिए बटन टैप करें';
  @override
  String get desktopGalleryHint =>
      'डेस्कटॉप मोड - गैलरी से फ्रिज का फोटो चुनें।';
  @override
  String get noCameraOnDevice => 'इस डिवाइस पर कोई कैमरा नहीं मिला.';
  @override
  String get openCameraButton => 'कैमरा खोलें';
  @override
  String get pickPhotoButton => 'फ़ोटो चुनें';
  @override
  String get overlayGuideOn => 'मार्गदर्शन करें';
  @override
  String get overlayGuideOff => 'मार्गदर्शन करें';
  @override
  String get modeSheetTitle => 'स्कैन मोड';
  @override
  String get modeSheetSubtitle =>
      'कब्जा करने से पहले चुनें; यह एआई रेसिपी नियमों को बदलता है।';
  @override
  String get scanModeQuickLabel => 'त्वरित स्कैन';
  @override
  String get scanModeQuickSubtitle => '15 मिनट से कम की रेसिपी';
  @override
  String get scanModeQuickDesc =>
      'व्यावहारिक रोजमर्रा का भोजन. सभी व्यंजनों का कुल समय 15 मिनट या उससे कम है; सरल तकनीकें (एक पैन, सलाद, त्वरित तलना)।';
  @override
  String get scanModeSurvivalLabel => 'बचाव';
  @override
  String get scanModeSurvivalSubtitle => 'पहले समाप्त हो रही वस्तुओं का उपयोग करें';
  @override
  String get scanModeSurvivalDesc =>
      'बर्बादी कम करता है. उन वस्तुओं को प्राथमिकता देता है जो खराब होने के करीब दिखती हैं। वैकल्पिक संकेत फ़ील्ड आइटम को प्राथमिकता दी जाती है।';
  @override
  String get scanModeChefLabel => 'बावर्ची मोड';
  @override
  String get scanModeChefSubtitle => 'रुचिकर और विस्तृत';
  @override
  String get scanModeChefDesc =>
      'अधिक परिष्कृत व्यंजन. स्तरित तकनीक, पकाने में अधिक समय; कम से कम दो व्यंजनों को कठिन रूप से चिह्नित किया गया है।';
  @override
  String get scanModeQuickBestFor =>
      'न्यूनतम सामग्री और समय के साथ सप्ताह रात्रि का भोजन';
  @override
  String get scanModeQuickExamples =>
      '• 10 मिनट का ऑमलेट\\n• एक-पैन पास्ता\\n• नो-कुक रैप या कटोरा';
  @override
  String get scanModeSurvivalBestFor =>
      'वस्तुओं के समाप्त होने से पहले उनका उपयोग करना और अपशिष्ट को काटना';
  @override
  String get scanModeSurvivalExamples =>
      '• साफ-सुथरा वेजी सूप\\n• ओवन फ्रिटाटा\\n• बचा हुआ तला हुआ चावल';
  @override
  String get scanModeChefBestFor =>
      'विशेष रात्रिभोज, मेहमान, या कोई तकनीक सीखना';
  @override
  String get scanModeChefExamples =>
      '• पैन सॉस प्रोटीन\\n• क्रिस्पी + क्रीमी प्लेट\\n• कारमेलाइज्ड वेज गार्निश';
  @override
  String get scanModeIdealForLabel => 'के लिए सर्वोत्तम';
  @override
  String get scanModeExamplesLabel => 'उदाहरण व्यंजन';
  @override
  String get survivalHintAddFromPantry => 'ताजगी से जोड़ें';
  @override
  String get filterAll => 'सभी';
  @override
  String get filterCritical => 'गंभीर';
  @override
  String get filterWarning => 'चेतावनी';
  @override
  String get filterSafe => 'सुरक्षित';
  @override
  String get recipesScreenTitle => 'व्यंजनों';
  @override
  String get copyRecipe => 'प्रतिलिपि';
  @override
  String get shareRecipe => 'शेयर करना';
  @override
  String get recipeCopiedSnack => 'रेसिपी को क्लिपबोर्ड पर कॉपी किया गया';
  @override
  String get survivalHintTitle => 'जल्द ही समाप्त हो रहा है';
  @override
  String get survivalHintOptional => 'वैकल्पिक - उदा. दूध, टमाटर, दही';
  @override
  String get survivalHintPlaceholder => 'अल्पविराम से अलग करें';
  @override
  String get scanConfirmReceiptLabel => 'रसीद स्कैन';
  @override
  String get scanSavedHistory => 'स्कैन को पेंट्री इतिहास में सहेजा गया';
  @override
  String get scanSaveFailedPrefix => 'स्कैन सहेजा नहीं जा सका';
  @override
  String get daysUnit => 'दिन';
  @override
  String get okButton => 'ठीक है';
  @override
  String get recipesDetectedIngredients => 'पता चला सामग्री';
  @override
  String recipesAiCount(int count) => 'एआई रेसिपी ·$count';
  @override
  String get galleryPickMessage => 'गैलरी से फोटो चुनें';
  @override
  String get favoritesEmpty =>
      'अभी तक कोई पसंदीदा रेसिपी नहीं है।\\nरेसिपी परिणामों पर दिल पर टैप करें।';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'नुस्खा ${index + 1}' : 'व्यंजन विधि';

  @override
  String get timeAgoJustNow => 'बस अब';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}मी पहले';
  @override
  String timeAgoHours(int hours) => '${hours}घंटे पहले';
  @override
  String timeAgoDays(int days) => '${days}घ पहले';
  @override
  String get daysExpired => 'खत्म हो चुका';
  @override
  String get daysToday => 'आज';
  @override
  String get daysTomorrow => 'कल';
  @override
  String daysCount(int days) => '$days दिन';
  @override
  String unifiedDaysRemaining(int days) => '$days दिन शेष';
  @override
  String productCount(int count) => '$count सामान';
  @override
  String get unifiedSourceReceipt => 'रसीद';
  @override
  String get unifiedSourceScan => 'स्कैन';
  @override
  String unifiedLastScan(String date) => 'अंतिम स्कैन ·$date';
  @override
  String get receiptFieldProductName => 'प्रोडक्ट का नाम';
  @override
  String get receiptFieldQuantity => 'मात्रा';
  @override
  String get receiptFieldCategory => 'वर्ग';
  @override
  String expiryApprox(int days) => '~पहले सर्वश्रेष्ठ$days दिन';
  @override
  String barcodeEan(String code) => 'ईएएन$code';
  @override
  String get shoppingListAddedSnack =>
      'गुम सामग्री को खरीदारी सूची में जोड़ा गया';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients सामग्री ·$recipes व्यंजनों';
  @override
  String get favoriteAddTooltip => 'पसंदीदा में जोड़े';
  @override
  String get favoriteRemoveTooltip => 'पसंदीदा से हटाएँ';
  @override
  String get favoriteAddedSnack => 'पसंदीदा में जोड़ा गया';
  @override
  String get favoriteRemovedSnack => 'पसंदीदा से हटाया गया';
  @override
  String get onboardingScanTitle => 'अपनी पेंट्री स्कैन करें';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'खरीदारी की सूची';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'पसंदीदा और हालिया स्कैन';
  @override
  String get onboardingFavoritesBody =>
      'अपनी पसंद की रेसिपी सहेजें. हाल के स्कैन होम स्क्रीन से तुरंत खुलते हैं।';
  @override
  String get onboardingCloudTitle => 'बादल का इतिहास';
  @override
  String get onboardingCloudBody =>
      'स्कैन इतिहास को अपने खाते में सहेजने के लिए साइन इन करें और किसी भी समय वापस लौटें।';
  @override
  String get onboardingPermissionsTitle => 'कैमरा और सूचनाएँ';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef को फ्रिज, रसीद और बारकोड स्कैन के लिए कैमरा चाहिए। वैकल्पिक सूचनाएँ समाप्ति के करीब भोजन की याद दिलाती हैं।';
  @override
  String get emptyStateScanReceipt => 'रसीद स्कैन करें';
  @override
  String get emptyStateStartScan => 'स्कैन शुरू करें';
  @override
  String get manageSubscriptions => 'सदस्यता प्रबंधित करें';
  @override
  String get notificationCriticalChannelName => 'ताज़गी का अलर्ट';
  @override
  String get notificationCriticalChannelDesc => 'आइटम जल्द ही समाप्त हो रहे हैं';
  @override
  String get notificationDailyChannelName => 'दैनिक सारांश';
  @override
  String get notificationDailyChannelDesc => 'दैनिक ताजगी अनुस्मारक';
  @override
  String get notificationCriticalTitle => 'आइटम जल्द ही समाप्त हो रहे हैं';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra - फ्रेशनेस पैनल की जांच करें।';
  @override
  String get notificationDailyTitle => 'ताजगी की जांच';
  @override
  String get notificationDailyBody =>
      'उन वस्तुओं की समीक्षा करें जिनका आपको आज ही उपयोग करना चाहिए।';
  @override
  String get widgetFreshnessGood => 'ताज़गी अच्छी लगती है';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count आइटम आज समाप्त हो सकते हैं';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical गंभीर ·$warning चेतावनी';
  @override
  String get categoryDairy => 'डेरी';
  @override
  String get categoryMeat => 'मांस/मछली';
  @override
  String get categoryFruit => 'फल';
  @override
  String get categoryVegetable => 'सब्ज़ी';
  @override
  String get categoryBeverage => 'पेय';
  @override
  String get categoryBakery => 'बेकरी';
  @override
  String get categoryPantry => 'कोठार';
  @override
  String calendarMonthName(int month) => const [
        'जनवरी',
        'फ़रवरी',
        'मार्च',
        'अप्रैल',
        'मई',
        'जून',
        'जुलाई',
        'अगस्त',
        'सितम्बर',
        'अक्टूबर',
        'नवंबर',
        'दिसंबर',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'व्यंजनों';
  @override
  String get recipesPlaceholderBody =>
      'सफल स्कैन के बाद रेसिपी के परिणाम यहां दिखाई देंगे।';
  @override
  String get recipeSamplePlating => 'नमूना चढ़ाना';
  @override
  String get recipeShareInstructionsHeader => 'निर्देश:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'ऍक्स्प.';
  @override
  String get themeTitle => 'विषय';
  @override
  String get themeSubtitle => 'रंग पैलेट और पृष्ठभूमि';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'डिफ़ॉल्ट गहरा हरा';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'शांत नीले स्वर';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'गर्म एम्बर लहजे';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'बैंगनी रंग का उच्चारण गहरा';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'हल्की पृष्ठभूमि';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'नारंगी लहजे के साथ गर्म क्रीम';
}
