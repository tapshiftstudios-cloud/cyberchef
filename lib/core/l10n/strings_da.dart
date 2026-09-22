import 'strings_base.dart';

class StringsDa implements StringsBase {
  const StringsDa();

  @override
  String get analysisTitle => 'Analyser pantry';
  @override
  String get stepPrepareImage => 'Forbereder billede...';
  @override
  String get stepAnalyzeAi => 'Registrerer ingredienser...';
  @override
  String get stepBuildRecipes => 'Bygge opskrifter...';
  @override
  String get receiptAnalysisTitle => 'Læsekvittering';
  @override
  String get stepReceiptPrepare => 'Forbereder kvitteringsbillede...';
  @override
  String get stepReceiptOcr => 'Genkender elementer...';
  @override
  String get stepReceiptInfer => 'Estimerer holdbarhed...';
  @override
  String get receiptNotRecognized =>
      'Kunne ikke læse kvitteringen. Prøv et klarere og fladere billede.';
  @override
  String get receiptNotDetected =>
      'Ingen kvittering fundet. Juster kvitteringen i rammen.';
  @override
  String get receiptConfirmTitle => 'Bekræft modtagelsesvarer';
  @override
  String get receiptConfirmSubtitle =>
      'Vælg elementer, der skal tilføjes. Langt tryk for at redigere.';
  @override
  String get receiptConfirmSave => 'Tilføj til spisekammer';
  @override
  String get receiptSelectOne => 'Vælg mindst ét ​​element.';
  @override
  String get receiptSaved => 'Varer tilføjet til friskhedsbeholdning';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Vil du sende dette kvitteringsbillede? OCR-analyse starter, når du har bekræftet.';
  @override
  String get navFreshness => 'Friskhed';
  @override
  String get freshnessPanelTitle => 'Friskhedspanel';
  @override
  String get freshnessCritical => 'Kritisk (0-2 dage)';
  @override
  String get freshnessWarning => 'Advarsel (3-5 dage)';
  @override
  String get freshnessSafe => 'Sikker (6+ dage)';
  @override
  String get freshnessEmpty =>
      'Ingen sporede varer endnu. Scan en kvittering for at opbygge beholdning.';
  @override
  String get freshnessListTitle => 'Friskhedsopgørelse';
  @override
  String get freshnessListEmpty => 'Ingen elementer i dette filter.';
  @override
  String get freshnessSuggestRecipes => 'Foreslå opskrifter med disse';
  @override
  String get savingsPanelTitle => 'Sparepanel';
  @override
  String get savingsPanelEmptyHint =>
      'Markér varer, der næsten er udløbet, som "Meal made" for at spore affald forhindret her.';
  @override
  String get savingsStatItems => 'Reddet';
  @override
  String get savingsStatWaste => 'Affald forhindret';
  @override
  String get savingsStatMoney => 'Est. opsparing';
  @override
  String get savingsDashboardTitle => 'Besparelsesanalyse';
  @override
  String get savingsDashboardSubtitle =>
      'Oversigt over mad, du har gemt fra skraldespanden - denne måned.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingrediens reddet fra affald denne måned'
          : '$count ingredienser sparet fra affald i denne måned';
  @override
  String savingsKgPrevented(String kg) => 'Madspild forhindres:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Estimeret økonomisk gevinst:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Sidste 4 uger';
  @override
  String get savingsRecentTitle => 'Nylige redninger';
  @override
  String get savingsEmptySubtitle =>
      'Ingen optegnelser endnu. Når du bruger en kritisk genstand eller advarsel, vises den her.';
  @override
  String get savingsHowItWorks =>
      'Genstande brugt inden for 5 dage efter udløb tæller som reddet. Vægt og værdi er estimeret ud fra kategorigennemsnit.';
  @override
  String get pantryNamesLocaleNote =>
      'Produkt- og butiksnavne vises som gemt på din kvittering; almindelige udtryk vises på engelsk.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Brugt sidste dag' : 'Brugt med$days dage tilbage';
  @override
  String get savingsMealMade => 'Måltid lavet';
  @override
  String savingsMealMadeConfirm(String name) => 'Mærke$name som forbrugt?';
  @override
  String savingsRescuedSnack(String money) => 'Besparelser registreret ·$money';
  @override
  String get freshnessRecipeTitle => 'Udarbejdelse af opskrifter';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Der kræves mindst ét ​​element til opskrifter.';
  @override
  String get freshnessCriticalBanner => 'Udløber snart';
  @override
  String get freshnessViewAll => 'Se alle';
  @override
  String get receiptCaptureHints =>
      'Hold kvitteringen flad, god belysning. Alle linjer er synlige i lodret ramme.';
  @override
  String get receiptPurchaseDate => 'Købsdato';
  @override
  String get receiptTapToEdit => 'Redigere';
  @override
  String get receiptEditItem => 'Rediger element';
  @override
  String get receiptEditSave => 'Spare';
  @override
  String get receiptExpiryDaysLabel => 'Estimeret holdbarhed (dage)';
  @override
  String get receiptMergedSnack => 'Nogle elementer er flettet med eksisterende poster';
  @override
  String get receiptCloudSyncFailed => 'Kunne ikke gemme til skyen';
  @override
  String get receiptCloudSynced => 'Elementer synkroniseret til skyen';
  @override
  String get pantrySyncAction => 'Synkroniser friskhedsdata';
  @override
  String get pantrySyncDone => 'Friskhedsdata opdateret';
  @override
  String get pantrySyncFailed => 'Synkronisering mislykkedes';
  @override
  String get freshnessNotificationsTitle => 'Meddelelser om friskhed';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritiske ting og daglig påmindelse';
  @override
  String get freshnessNotificationTimeLabel => 'Daglig påmindelsestid';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Hver dag kl$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Denne uge:$critical kritisk,$warning advarselsgenstande. Brug disse først.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Netværksfejl. Tjek din forbindelse, og prøv igen.';
  @override
  String get geminiQuotaExceeded =>
      'AI-kvoten overskredet. Vent et par minutter, og prøv igen.';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studio forudbetalingskreditter er opbrugt. Tilføj fakturering på ai.google.dev for at gendanne AI-funktioner.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automatisk genforsøg kan være tilgængelig i$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Daglig AI-oversættelsesgrænse nået (3/3). Opskrifter bruger grundlæggende oversættelse indtil i morgen.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Det har du$remaining AI-oversættelse(r) tilbage i dag.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Daglig spisekammerscanningsgrænse nået (3). Prøv venligst igen i morgen.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Daglig kvitteringsscanningsgrænse nået (2). Prøv venligst igen i morgen.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Daglig opskriftsgenereringsgrænse nået (3). Prøv venligst igen i morgen.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Vent venligst$seconds sekund(er), før du prøver igen.';
  @override
  String get adRewardTitlePantry => 'Pantry-scanningsgrænsen er nået';
  @override
  String get adRewardTitleReceipt => 'Kvitteringsscanningsgrænsen er nået';
  @override
  String get adRewardTitleRecipe => 'Grænsen for generering af opskrifter er nået';
  @override
  String get adRewardSubtitle =>
      'Se en kort annonce for at få +1 ekstra brug i dag (op til 3 pr. dag).';
  @override
  String get adRewardWatchButton => 'Se annonce (+1 brug)';
  @override
  String get adRewardGranted => 'Bevilget ekstra brug. Prøv igen.';
  @override
  String get adRewardNotCompleted =>
      'Annoncen blev ikke fuldført. Der blev ikke givet ekstra brug.';
  @override
  String get adRewardDailyCapReached =>
      'Du har nået dagens annoncebelønningsgrænse.';
  @override
  String get geminiTimeout =>
      'Anmodningen fik timeout. Tjek din forbindelse, og prøv igen.';
  @override
  String get geminiServerError =>
      'AI-tjeneste er midlertidigt utilgængelig. Prøv venligst igen senere.';
  @override
  String get imageNotRecognized =>
      'Billedet genkendes ikke. Forbedre belysningen, eller prøv en anden vinkel.';
  @override
  String get imageNotPantry =>
      'Køleskab eller spisekammer er ikke synligt. Fotografer venligst direkte.';
  @override
  String get parseError =>
      'Kunne ikke parse AI-svar. Scan venligst igen.';
  @override
  String get modelUnavailable =>
      'AI-model er ikke tilgængelig. Tjek din API-adgang.';
  @override
  String get genericError => 'Noget gik galt. Prøv venligst igen.';
  @override
  String get imageDecodeError => 'Kunne ikke læse billedet. Prøv et andet billede.';
  @override
  String get authSubtitle => 'Smart pantry adgang';
  @override
  String get authInitializing => 'Forbereder session...';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Adgangskode';
  @override
  String get emailRequired => 'E-mail påkrævet';
  @override
  String get emailInvalid => 'Ugyldig e-mail';
  @override
  String get passwordMin => 'Mindst 6 tegn';
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
  String get signIn => 'Log ind';
  @override
  String get signUp => 'Opret konto';
  @override
  String get toggleToSignIn => 'Har du allerede en konto? Log ind';
  @override
  String get toggleToSignUp => 'Ny her? Opret konto';
  @override
  String get guestContinue => 'Fortsæt som gæst';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Konto oprettet. Åbn bekræftelseslinket i din indbakke; appen giver dig besked, når den er bekræftet.';
  @override
  String get emailConfirmedSuccess =>
      'Din e-mail er bekræftet. Din konto er klar.';
  @override
  String get emailVerifiedLabel => 'E-mail bekræftet';
  @override
  String get proEmailRequiredTitle => 'E-mail-konto påkrævet til Pro';
  @override
  String get proEmailRequiredBody =>
      'Gæstekonti kan ikke købe Pro. Opret en e-mail-konto for at beholde dine data og låse op for fakturering.';
  @override
  String get proLinkAccountAction => 'Opret konto og fortsæt';
  @override
  String get proAccountLinked =>
      'Konto knyttet. Du kan fortsætte til Pro checkout nu.';
  @override
  String get supabaseNotConfigured =>
      'Kontotjenesten er ikke tilgængelig. Prøv venligst igen senere.';
  @override
  String get privacyTitle => 'Data og privatliv';
  @override
  String get privacySubtitle => 'Billeder og kontodata';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Kvitteringsbilleder gemmes ikke på serveren; kun produktlisten udtrækkes.\\n\\n'
      'Når du er logget ind, kan scanninger og opdateringsdata gemmes på din konto.'
      'Den gratis plan viser Google AdMob-annoncer; Pro har ingen annoncer.\\n\\n'
      'Åbn online privatlivspolitikken for den fulde tekst.';
  @override
  String get privacyViewOnline => 'Åbn privatlivspolitik';
  @override
  String get pantryHistoryTitle => 'Pantry historie';
  @override
  String get pantryHistoryEmpty =>
      'Ingen gemte scanninger endnu.\\nScan dit køleskab for at bygge historie.';
  @override
  String get pantryHistorySubtitle => 'Sky-gemte scanninger';
  @override
  String get splashTagline => 'Producer & pantry - én app';
  @override
  String get splashLoading => 'Indlæser...';
  @override
  String get onboardingSkip => 'Springe';
  @override
  String get onboardingNext => 'Næste';
  @override
  String get onboardingStart => 'Starte';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Seneste scanninger';
  @override
  String get cameraTapToOpen => 'Tryk på ikonet for at åbne kameraet';
  @override
  String get cameraOrGalleryHint => 'Åbn kamera eller vælg fra galleriet';
  @override
  String get captureOrGalleryHint => 'Fang eller vælg fra galleriet';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Luk kameraet';
  @override
  String get noIngredients => 'Ingen ingredienser fundet.';
  @override
  String get recipeInstructions => 'Instruktioner';
  @override
  String get untitledRecipe => 'Unavngivet opskrift';
  @override
  String get genericLoadError => 'Noget gik galt. Prøv venligst igen.';
  @override
  String get scanConfirmTitle => 'Bekræft billede';
  @override
  String get scanConfirmSubtitle =>
      'Send dette billede? Opskriftsanalyse starter, når du har bekræftet.';
  @override
  String get scanConfirmAnalyze => 'Analysere';
  @override
  String get scanConfirmCancel => 'Ophæve';
  @override
  String get scanConfirmRetake => 'Gentag';
  @override
  String get scanConfirmPickOther => 'Vælg en anden';
  @override
  String get clearRecentScans => 'Ryd de seneste scanninger';
  @override
  String get clearRecentScansSubtitle => 'Sletter lokal historie på enheden';
  @override
  String get clearRecentScansConfirmTitle => 'Vil du rydde de seneste scanninger?';
  @override
  String get clearRecentScansConfirmBody =>
      'Kan ikke fortrydes. Favoritter påvirkes ikke.';
  @override
  String get clearRecentScansDone => 'Seneste scanninger blev ryddet';
  @override
  String get deleteAction => 'Slet';
  @override
  String get imageQualityTitle => 'Lav fotokvalitet';
  @override
  String get imageQualityDark => 'Billedet er for mørkt. Tilføj lys og prøv igen.';
  @override
  String get imageQualityBlurry =>
      'Billedet kan være sløret. Hold fast og tag igen.';
  @override
  String get imageQualityContinue => 'Fortsæt alligevel';
  @override
  String get imageQualityRetake => 'Gentag';
  @override
  String receiptQueueTitle(int count) => '$count kvittering(er) venter offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Kvittering ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Behandle';
  @override
  String get receiptQueuedOffline =>
      'Offline. Kvittering i kø; proces, når den er tilsluttet.';
  @override
  String get receiptLowConfidenceBlock =>
      'Rediger emner med lav tillid, før du gemmer (blyantikon).';
  @override
  String get unifiedPantryTitle => 'Samlet beholdning';
  @override
  String get unifiedPantryEmpty => 'Ingen varer eller scanninger endnu.';
  @override
  String get searchHint => 'Søg efter produkter...';
  @override
  String get navShopping => 'Shopping';
  @override
  String get shoppingAddHint => 'Tilføj manglende vare';
  @override
  String get shoppingEmpty => 'Din indkøbsliste er tom.';
  @override
  String get shoppingClearDone => 'Ryd fuldført';
  @override
  String get shoppingDoneSection => 'Færdig';
  @override
  String get shoppingAddFromRecipe => 'Tilføj varer, der ikke er på kvitteringsbeholdningen';
  @override
  String get freshnessViewCalendar => 'Kalender';
  @override
  String get freshnessViewList => 'Liste';
  @override
  String get cookToday => 'Hvad skal der laves i dag?';
  @override
  String get cookTodayNoUrgent =>
      'Ingen presserende varer. Scan en kvittering for at spore friskhed.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Set i scanning, men ikke i kvitteringsbeholdning: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Eksporter lokale data';
  @override
  String get exportLocalDataSubtitle => 'Kopierer JSON til udklipsholder';
  @override
  String get exportLocalDataDone => 'Data kopieret til udklipsholder';
  @override
  String get clearLocalData => 'Slet lokale data';
  @override
  String get clearLocalDataSubtitle =>
      'Friskhed, shopping, præferencer (irreversibel)';
  @override
  String get clearLocalDataConfirmTitle => 'Vil du slette lokale data?';
  @override
  String get clearLocalDataConfirmBody =>
      'Friskhedsbeholdning og indkøbsliste fjernet fra enheden.';
  @override
  String get clearLocalDataDone => 'Lokale data ryddet';
  @override
  String get settingsTitle => 'Indstillinger';
  @override
  String get languageTitle => 'Sprog';
  @override
  String get languageSubtitle => 'App-sprog · 27 sprog';
  @override
  String get localePreparingTitle => 'Opdaterer sprog';
  @override
  String get localePreparingSubtitle =>
      'Oversættelse af opskrifter og scanningsresultater...';
  @override
  String get dietTitle => 'Diætpræference';
  @override
  String get dietSubtitle => 'Anvendt på opskriftsforslag';
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
  String get aiUsageLimitsLoading => 'Indlæser...';
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
  String get aiUsageLabelPantry => 'Spisekammer';
  @override
  String get aiUsageLabelReceipt => 'Modtagelse';
  @override
  String get aiUsageLabelRecipe => 'Opskrift';
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
  String get storeUnavailable => 'Butikken er ikke tilgængelig. Prøv igen senere.';
  @override
  String get proProductIdsNotConfigured => 'Pro-produkt-ID\'er er ikke konfigureret.';
  @override
  String get noProProductsFound => 'Ingen Pro-produkter fundet til køb.';
  @override
  String get purchaseFlowFailed => 'Købet kunne ikke startes.';
  @override
  String get purchaseCompletedProActivated => 'Køb gennemført. Pro-plan aktiveret.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Køb gennemført. Verifikation mislykkedes; prøv igen snart.';
  @override
  String get purchaseFailed => 'Købet mislykkedes.';
  @override
  String get restorePurchases => 'Gendan køb';
  @override
  String get restorePurchasesStarted => 'Tjekker tidligere køb i Play Store…';
  @override
  String get nutritionTitle => 'Ernæring (estimat)';
  @override
  String get nutritionPerServing => 'per portion';
  @override
  String get nutritionCalories => 'Kalorier';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Kulhydrater';
  @override
  String get nutritionFat => 'Fedt';
  @override
  String get nutritionEstimateNote =>
      'Kun AI-estimat; ikke læge- eller kostråd.';
  @override
  String get barcodeScanTitle => 'Scan stregkoden';
  @override
  String get barcodeScanHint =>
      'Juster stregkoden i rammen. Produktopslag via Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produkt ikke fundet. Prøv i stedet for kvittering eller køleskabsscanning.';
  @override
  String get barcodeConfirmTitle => 'Bekræft produktet';
  @override
  String get barcodeAddToPantry => 'Tilføj til friskhedsbeholdning';
  @override
  String get navScan => 'Scan';
  @override
  String get captureTypeFridge => 'Køleskab';
  @override
  String get captureTypeReceipt => 'Modtagelse';
  @override
  String get captureTypeBarcode => 'Stregkode';
  @override
  String get sectionAccount => 'Konto';
  @override
  String get sectionPreferences => 'Præferencer';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Privatliv';
  @override
  String get sessionTitle => 'Session';
  @override
  String get guestUser => 'Gæstebruger';
  @override
  String get favoritesTitle => 'Favoritter';
  @override
  String get favoritesSubtitle => 'Opskrifter du har gemt';
  @override
  String get freshnessInventorySubtitle =>
      'Produkter fra kvitteringer og udløbsdatoer';
  @override
  String get pantrySyncSubtitle => 'Træk friskhedsbeholdning fra skyen';
  @override
  String get showOnboardingAgain => 'Vis onboarding-tur igen';
  @override
  String get signOut => 'Log ud';
  @override
  String get scanSubtitleSmart => 'Smart pantry scanning';
  @override
  String get scanSubtitleReceipt => 'Kvitteringsscanning og friskhedssporing';
  @override
  String get tooltipSettings => 'Indstillinger';
  @override
  String get tooltipToggleGuide => 'Skift rammeguide';
  @override
  String get tooltipModesAbout => 'Om scanningstilstande';
  @override
  String get galleryLabel => 'Galleri';
  @override
  String get cameraLoading => 'Forbereder kamera...';
  @override
  String get cameraUnavailable =>
      'Kameraet er ikke tilgængeligt.\\nTjek tilladelser, og prøv igen.';
  @override
  String get captureFailed =>
      'Optagelse mislykkedes. Tjek kameratilladelsen, og prøv igen.';
  @override
  String get receiptCaptureAlign =>
      'Juster kvitteringen i lodret ramme og optag';
  @override
  String get receiptCameraHint =>
      'Åbn kameraet, eller vælg et kvitteringsbillede fra galleriet';
  @override
  String get pickPhotoHint => 'Tryk på knappen for at vælge et billede';
  @override
  String get desktopGalleryHint =>
      'Skrivebordstilstand — vælg et køleskabsbillede fra galleriet.';
  @override
  String get noCameraOnDevice => 'Der blev ikke fundet noget kamera på denne enhed.';
  @override
  String get openCameraButton => 'Åbn kamera';
  @override
  String get pickPhotoButton => 'Vælg billede';
  @override
  String get overlayGuideOn => 'Vejledning på';
  @override
  String get overlayGuideOff => 'Guide af';
  @override
  String get modeSheetTitle => 'Scanningstilstande';
  @override
  String get modeSheetSubtitle =>
      'Vælg før optagelse; det ændrer AI-opskriftsreglerne.';
  @override
  String get scanModeQuickLabel => 'Hurtig scanning';
  @override
  String get scanModeQuickSubtitle => 'Opskrifter under 15 min';
  @override
  String get scanModeQuickDesc =>
      'Praktiske hverdagsmåltider. Alle opskrifter i alt 15 minutter eller mindre; enkle teknikker (en pande, salat, hurtig stegning).';
  @override
  String get scanModeSurvivalLabel => 'Redde';
  @override
  String get scanModeSurvivalSubtitle => 'Brug først udløbende varer';
  @override
  String get scanModeSurvivalDesc =>
      'Reducerer spild. Prioriterer genstande, der ser tæt på at ødelægge. Valgfrie tipfeltpunkter prioriteres.';
  @override
  String get scanModeChefLabel => 'Chef-tilstand';
  @override
  String get scanModeChefSubtitle => 'Gourmet & detaljeret';
  @override
  String get scanModeChefDesc =>
      'Mere raffinerede opskrifter. Lagdelte teknikker, længere tilberedningstider; mindst to opskrifter markeret hårdt.';
  @override
  String get scanModeQuickBestFor =>
      'Ugens måltider med minimale ingredienser og tid';
  @override
  String get scanModeQuickExamples =>
      '• 10-minutters omelet\\n• Pasta i en gryde\\n• Wrap eller skål uden tilberedning';
  @override
  String get scanModeSurvivalBestFor =>
      'Brug af genstande før de udløber og skære affald';
  @override
  String get scanModeSurvivalExamples =>
      '• Rengør grøntsagssuppe\\n• Ovnfrittata\\n• Rester af stegte ris';
  @override
  String get scanModeChefBestFor =>
      'Særlige middage, gæster eller lære en teknik';
  @override
  String get scanModeChefExamples =>
      '• Pandesauceprotein\\n• Sprød + cremet tallerken\\n• Karameliseret grøntsagspynt';
  @override
  String get scanModeIdealForLabel => 'Bedst til';
  @override
  String get scanModeExamplesLabel => 'Eksempel retter';
  @override
  String get survivalHintAddFromPantry => 'Tilføj fra friskhed';
  @override
  String get filterAll => 'Alle';
  @override
  String get filterCritical => 'Kritisk';
  @override
  String get filterWarning => 'Advarsel';
  @override
  String get filterSafe => 'Sikker';
  @override
  String get recipesScreenTitle => 'Opskrifter';
  @override
  String get copyRecipe => 'Kopi';
  @override
  String get shareRecipe => 'Dele';
  @override
  String get recipeCopiedSnack => 'Opskriften er kopieret til udklipsholderen';
  @override
  String get survivalHintTitle => 'Udløber snart';
  @override
  String get survivalHintOptional => 'Valgfrit — f.eks. mælk, tomat, yoghurt';
  @override
  String get survivalHintPlaceholder => 'Adskil med kommaer';
  @override
  String get scanConfirmReceiptLabel => 'Kvitteringsscanning';
  @override
  String get scanSavedHistory => 'Scanningen er gemt i pantryhistorikken';
  @override
  String get scanSaveFailedPrefix => 'Kunne ikke gemme scanningen';
  @override
  String get daysUnit => 'dage';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Detekterede ingredienser';
  @override
  String recipesAiCount(int count) => 'AI-opskrifter ·$count';
  @override
  String get galleryPickMessage => 'Vælg billede fra galleriet';
  @override
  String get favoritesEmpty =>
      'Ingen favoritopskrifter endnu.\\nTryk på hjertet på opskriftsresultater.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Opskrift kr{index + 1}' : 'Opskrift';

  @override
  String get timeAgoJustNow => 'Lige nu';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m siden';
  @override
  String timeAgoHours(int hours) => '${hours}h siden';
  @override
  String timeAgoDays(int days) => '${days}d siden';
  @override
  String get daysExpired => 'Udløbet';
  @override
  String get daysToday => 'I dag';
  @override
  String get daysTomorrow => 'I morgen';
  @override
  String daysCount(int days) => '$days dage';
  @override
  String unifiedDaysRemaining(int days) => '$days dage tilbage';
  @override
  String productCount(int count) => '$count genstande';
  @override
  String get unifiedSourceReceipt => 'Modtagelse';
  @override
  String get unifiedSourceScan => 'Scan';
  @override
  String unifiedLastScan(String date) => 'Sidste scanning ·$date';
  @override
  String get receiptFieldProductName => 'Produktnavn';
  @override
  String get receiptFieldQuantity => 'Mængde';
  @override
  String get receiptFieldCategory => 'Kategori';
  @override
  String expiryApprox(int days) => 'Bedst før ~$days dage';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Manglende ingredienser tilføjet til indkøbslisten';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingredienser ·$recipes opskrifter';
  @override
  String get favoriteAddTooltip => 'Tilføj til favoritter';
  @override
  String get favoriteRemoveTooltip => 'Fjern fra favoritter';
  @override
  String get favoriteAddedSnack => 'Tilføjet til favoritter';
  @override
  String get favoriteRemovedSnack => 'Fjernet fra favoritter';
  @override
  String get onboardingScanTitle => 'Scan dit spisekammer';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Indkøbsliste';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favoritter og seneste scanninger';
  @override
  String get onboardingFavoritesBody =>
      'Gem opskrifter, du kan lide. Nylige scanninger åbner hurtigt fra startskærmen.';
  @override
  String get onboardingCloudTitle => 'Cloud historie';
  @override
  String get onboardingCloudBody =>
      'Log ind for at gemme scanningshistorik på din konto og vende tilbage når som helst.';
  @override
  String get onboardingPermissionsTitle => 'Kamera og notifikationer';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef har brug for kamera til at scanne køleskab, kvitteringer og stregkoder. Valgfrie notifikationer minder dig om mad der snart udløber.';
  @override
  String get emptyStateScanReceipt => 'Scan kvittering';
  @override
  String get emptyStateStartScan => 'Start skanning';
  @override
  String get manageSubscriptions => 'Administrer abonnement';
  @override
  String get notificationCriticalChannelName => 'Friskhedsadvarsler';
  @override
  String get notificationCriticalChannelDesc => 'Varer udløber snart';
  @override
  String get notificationDailyChannelName => 'Daglig oversigt';
  @override
  String get notificationDailyChannelDesc => 'Daglig friskhedspåmindelse';
  @override
  String get notificationCriticalTitle => 'Varer udløber snart';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Tjek friskhedspanelet.';
  @override
  String get notificationDailyTitle => 'Friskhedstjek';
  @override
  String get notificationDailyBody =>
      'Gennemgå elementer, du bør bruge i dag.';
  @override
  String get widgetFreshnessGood => 'Friskheden ser godt ud';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count varer kan udløbe i dag';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritisk ·$warning advarsel';
  @override
  String get categoryDairy => 'Mejeri';
  @override
  String get categoryMeat => 'Kød/fisk';
  @override
  String get categoryFruit => 'Frugt';
  @override
  String get categoryVegetable => 'Grøntsag';
  @override
  String get categoryBeverage => 'Drik';
  @override
  String get categoryBakery => 'Bageri';
  @override
  String get categoryPantry => 'Spisekammer';
  @override
  String calendarMonthName(int month) => const [
        'januar',
        'februar',
        'marts',
        'april',
        'maj',
        'juni',
        'juli',
        'august',
        'september',
        'oktober',
        'november',
        'december',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Opskrifter';
  @override
  String get recipesPlaceholderBody =>
      'Opskriftsresultater vises her efter en vellykket scanning.';
  @override
  String get recipeSamplePlating => 'Prøvebelægning';
  @override
  String get recipeShareInstructionsHeader => 'Instruktioner:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Farvepalet og baggrund';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Standard mørkegrøn';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Cool blå toner';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Varme ravfarvede accenter';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Mørk lilla accent';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Lys baggrund';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Varm creme med orange accent';
}
