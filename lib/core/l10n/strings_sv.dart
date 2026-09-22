import 'strings_base.dart';

class StringsSv implements StringsBase {
  const StringsSv();

  @override
  String get analysisTitle => 'Analyserar skafferi';
  @override
  String get stepPrepareImage => 'Förbereder foto...';
  @override
  String get stepAnalyzeAi => 'Upptäcker ingredienser...';
  @override
  String get stepBuildRecipes => 'Bygger recept...';
  @override
  String get receiptAnalysisTitle => 'Läskvitto';
  @override
  String get stepReceiptPrepare => 'Förbereder kvittobild...';
  @override
  String get stepReceiptOcr => 'Känner igen objekt...';
  @override
  String get stepReceiptInfer => 'Estimating shelf life…';
  @override
  String get receiptNotRecognized =>
      'Kunde inte läsa kvittot. Prova ett tydligare och plattare foto.';
  @override
  String get receiptNotDetected =>
      'Inget kvitto upptäckt. Rikta in kvittot i ramen.';
  @override
  String get receiptConfirmTitle => 'Bekräfta mottagningsartiklar';
  @override
  String get receiptConfirmSubtitle =>
      'Välj objekt att lägga till. Tryck länge för att redigera.';
  @override
  String get receiptConfirmSave => 'Lägg till skafferiet';
  @override
  String get receiptSelectOne => 'Välj minst ett objekt.';
  @override
  String get receiptSaved => 'Artiklar läggs till färskhet inventering';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Skicka detta kvittofoto? OCR-analys startar efter att du har bekräftat.';
  @override
  String get navFreshness => 'Friskhet';
  @override
  String get freshnessPanelTitle => 'Färskhetspanel';
  @override
  String get freshnessCritical => 'Kritisk (0–2 dagar)';
  @override
  String get freshnessWarning => 'Varning (3–5 dagar)';
  @override
  String get freshnessSafe => 'Säker (6+ dagar)';
  @override
  String get freshnessEmpty =>
      'Inga spårade föremål ännu. Skanna ett kvitto för att bygga lager.';
  @override
  String get freshnessListTitle => 'Färskhetsinventering';
  @override
  String get freshnessListEmpty => 'Inga objekt i detta filter.';
  @override
  String get freshnessSuggestRecipes => 'Föreslå recept med dessa';
  @override
  String get savingsPanelTitle => 'Sparpanel';
  @override
  String get savingsPanelEmptyHint =>
      'Markera varor som nästan löper ut som "Meal made" för att spåra avfall som förhindrats här.';
  @override
  String get savingsStatItems => 'Räddade';
  @override
  String get savingsStatWaste => 'Avfall förhindras';
  @override
  String get savingsStatMoney => 'Uppskattad besparingar';
  @override
  String get savingsDashboardTitle => 'Besparingsanalyser';
  @override
  String get savingsDashboardSubtitle =>
      'Sammanfattning av mat du sparat från papperskorgen - den här månaden.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingrediens sparad från avfall denna månad'
          : '$count ingredienser som sparats från avfall denna månad';
  @override
  String savingsKgPrevented(String kg) => 'Förhindrat matsvinn:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Beräknad ekonomisk vinst:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Senaste 4 veckorna';
  @override
  String get savingsRecentTitle => 'Senaste räddningar';
  @override
  String get savingsEmptySubtitle =>
      'Inga rekord ännu. När du använder ett kritiskt eller varningsobjekt visas det här.';
  @override
  String get savingsHowItWorks =>
      'Föremål som används inom 5 dagar efter utgången räknas som räddade. Vikt och värde uppskattas från kategorigenomsnitt.';
  @override
  String get pantryNamesLocaleNote =>
      'Produkt- och butiksnamn visas som sparade på ditt kvitto; vanliga termer visas på engelska.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Använd sista dagen' : 'Används med$days dagar kvar';
  @override
  String get savingsMealMade => 'Måltid gjord';
  @override
  String savingsMealMadeConfirm(String name) => 'Mark$name som konsumeras?';
  @override
  String savingsRescuedSnack(String money) => 'Sparade besparingar ·$money';
  @override
  String get freshnessRecipeTitle => 'Förbereder recept';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Minst ett objekt krävs för recept.';
  @override
  String get freshnessCriticalBanner => 'Går snart ut';
  @override
  String get freshnessViewAll => 'Visa alla';
  @override
  String get receiptCaptureHints =>
      'Håll kvittot platt, bra belysning. Alla linjer syns i vertikal ram.';
  @override
  String get receiptPurchaseDate => 'Inköpsdatum';
  @override
  String get receiptTapToEdit => 'Redigera';
  @override
  String get receiptEditItem => 'Redigera objekt';
  @override
  String get receiptEditSave => 'Spara';
  @override
  String get receiptExpiryDaysLabel => 'Beräknad hållbarhet (dagar)';
  @override
  String get receiptMergedSnack => 'Vissa objekt slogs samman med befintliga poster';
  @override
  String get receiptCloudSyncFailed => 'Det gick inte att spara till molnet';
  @override
  String get receiptCloudSynced => 'Objekt synkroniserade till molnet';
  @override
  String get pantrySyncAction => 'Synkronisera färskhetsdata';
  @override
  String get pantrySyncDone => 'Färskhetsdata uppdaterad';
  @override
  String get pantrySyncFailed => 'Synkronisering misslyckades';
  @override
  String get freshnessNotificationsTitle => 'Färskhetsmeddelanden';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritiska föremål och daglig påminnelse';
  @override
  String get freshnessNotificationTimeLabel => 'Daglig påminnelsetid';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Varje dag kl$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Denna vecka:$critical kritisk,$warning varningsartiklar. Använd dessa först.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Nätverksfel. Kontrollera din anslutning och försök igen.';
  @override
  String get geminiQuotaExceeded =>
      'AI-kvoten har överskridits. Vänta några minuter och försök igen.';
  @override
  String get geminiBillingDepleted =>
      'Förskottsbetalningskrediter för Google AI Studio är förbrukade. Lägg till fakturering på ai.google.dev för att återställa AI-funktioner.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automatiskt försök igen kan vara tillgängligt i$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Daglig AI-översättningsgräns nådd (3/3). Recept använder grundläggande översättning till imorgon.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Du har$remaining AI-översättning(ar) kvar idag.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Daglig skafferiskanningsgräns nådd (3). Försök igen imorgon.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Daglig gräns för scanning av kvitton nådd (2). Försök igen imorgon.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Daglig receptgenereringsgräns nådd (3). Försök igen imorgon.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Vänta$seconds sekund(er) innan du försöker igen.';
  @override
  String get adRewardTitlePantry => 'Skaffningsgränsen har nåtts';
  @override
  String get adRewardTitleReceipt => 'Gränsen för kvittoskanning har nåtts';
  @override
  String get adRewardTitleRecipe => 'Gränsen för receptgenerering har nåtts';
  @override
  String get adRewardSubtitle =>
      'Titta på en kort annons för att få +1 extra användning idag (upp till 3 per dag).';
  @override
  String get adRewardWatchButton => 'Titta på annons (+1 användning)';
  @override
  String get adRewardGranted => 'Extra användning beviljad. Försök igen.';
  @override
  String get adRewardNotCompleted =>
      'Annonsen slutfördes inte. Ingen extra användning beviljades.';
  @override
  String get adRewardDailyCapReached =>
      'Du har nått dagens annonsbelöningsgräns.';
  @override
  String get geminiTimeout =>
      'Begäran tog timeout. Kontrollera din anslutning och försök igen.';
  @override
  String get geminiServerError =>
      'AI-tjänsten är inte tillgänglig för tillfället. Försök igen senare.';
  @override
  String get imageNotRecognized =>
      'Bilden känns inte igen. Förbättra belysningen eller prova en annan vinkel.';
  @override
  String get imageNotPantry =>
      'Kylskåp eller skafferi syns inte. Vänligen fotografera direkt.';
  @override
  String get parseError =>
      'Det gick inte att analysera AI-svar. Vänligen skanna igen.';
  @override
  String get modelUnavailable =>
      'AI-modell inte tillgänglig. Kontrollera din API-åtkomst.';
  @override
  String get genericError => 'Något gick fel. Försök igen.';
  @override
  String get imageDecodeError => 'Kunde inte läsa fotot. Prova en annan bild.';
  @override
  String get authSubtitle => 'Smart skafferi tillgång';
  @override
  String get authInitializing => 'Förbereder session...';
  @override
  String get emailLabel => 'E-post';
  @override
  String get passwordLabel => 'Lösenord';
  @override
  String get emailRequired => 'E-post krävs';
  @override
  String get emailInvalid => 'Ogiltig e-postadress';
  @override
  String get passwordMin => 'Minst 6 tecken';
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
  String get signIn => 'Logga in';
  @override
  String get signUp => 'Skapa konto';
  @override
  String get toggleToSignIn => 'Har du redan ett konto? Logga in';
  @override
  String get toggleToSignUp => 'Ny här? Skapa konto';
  @override
  String get guestContinue => 'Fortsätt som gäst';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Konto skapat. Öppna bekräftelselänken i din inkorg; appen kommer att meddela dig när den har verifierats.';
  @override
  String get emailConfirmedSuccess =>
      'Din e-post är bekräftad. Ditt konto är klart.';
  @override
  String get emailVerifiedLabel => 'E-post verifierad';
  @override
  String get proEmailRequiredTitle => 'E-postkonto krävs för Pro';
  @override
  String get proEmailRequiredBody =>
      'Gästkonton kan inte köpa Pro. Skapa ett e-postkonto för att behålla din data och låsa upp fakturering.';
  @override
  String get proLinkAccountAction => 'Skapa konto och fortsätt';
  @override
  String get proAccountLinked =>
      'Kontot länkat. Du kan fortsätta till Pro-checkout nu.';
  @override
  String get supabaseNotConfigured =>
      'Kontotjänsten är inte tillgänglig. Försök igen senare.';
  @override
  String get privacyTitle => 'Data & integritet';
  @override
  String get privacySubtitle => 'Foton och kontodata';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Kvittobilder lagras inte på servern; endast produktlistan extraheras.\\n\\n'
      'När du är inloggad kan skanningar och uppdateringsdata sparas på ditt konto.'
      'Den kostnadsfria planen visar Google AdMob-annonser; Pro har inga annonser.\\n\\n'
      'Öppna sekretesspolicyn online för hela texten.';
  @override
  String get privacyViewOnline => 'Öppna sekretesspolicy';
  @override
  String get pantryHistoryTitle => 'Skafferi historia';
  @override
  String get pantryHistoryEmpty =>
      'Inga sparade skanningar ännu.\\nSkanna ditt kylskåp för att skapa historik.';
  @override
  String get pantryHistorySubtitle => 'Molnsparade skanningar';
  @override
  String get splashTagline => 'Producera och skafferi — en app';
  @override
  String get splashLoading => 'Belastning…';
  @override
  String get onboardingSkip => 'Hoppa';
  @override
  String get onboardingNext => 'Nästa';
  @override
  String get onboardingStart => 'Start';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Senaste skanningar';
  @override
  String get cameraTapToOpen => 'Tryck på ikonen för att öppna kameran';
  @override
  String get cameraOrGalleryHint => 'Öppna kameran eller välj från galleriet';
  @override
  String get captureOrGalleryHint => 'Fånga eller välj från galleriet';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Stäng kameran';
  @override
  String get noIngredients => 'Inga ingredienser upptäckts.';
  @override
  String get recipeInstructions => 'Instruktioner';
  @override
  String get untitledRecipe => 'Namnlöst recept';
  @override
  String get genericLoadError => 'Något gick fel. Försök igen.';
  @override
  String get scanConfirmTitle => 'Bekräfta fotot';
  @override
  String get scanConfirmSubtitle =>
      'Skicka detta foto? Receptanalys startar efter att du bekräftat.';
  @override
  String get scanConfirmAnalyze => 'Analysera';
  @override
  String get scanConfirmCancel => 'Avboka';
  @override
  String get scanConfirmRetake => 'Ta om';
  @override
  String get scanConfirmPickOther => 'Välj en annan';
  @override
  String get clearRecentScans => 'Rensa de senaste skanningarna';
  @override
  String get clearRecentScansSubtitle => 'Tar bort lokal historik på enheten';
  @override
  String get clearRecentScansConfirmTitle => 'Rensa de senaste skanningarna?';
  @override
  String get clearRecentScansConfirmBody =>
      'Kan inte ångras. Favoriter påverkas inte.';
  @override
  String get clearRecentScansDone => 'De senaste skanningarna rensades';
  @override
  String get deleteAction => 'Radera';
  @override
  String get imageQualityTitle => 'Låg fotokvalitet';
  @override
  String get imageQualityDark => 'Bilden är för mörk. Lägg till ljus och försök igen.';
  @override
  String get imageQualityBlurry =>
      'Bilden kan vara suddig. Håll stadigt och ta om.';
  @override
  String get imageQualityContinue => 'Fortsätt i alla fall';
  @override
  String get imageQualityRetake => 'Ta om';
  @override
  String receiptQueueTitle(int count) => '$count kvitto väntar offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Kvitto ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Behandla';
  @override
  String get receiptQueuedOffline =>
      'Off-line. Kvitto i kö; process när den är ansluten.';
  @override
  String get receiptLowConfidenceBlock =>
      'Redigera objekt med låg förtroende innan du sparar (pennikon).';
  @override
  String get unifiedPantryTitle => 'Enhetlig inventering';
  @override
  String get unifiedPantryEmpty => 'Inga objekt eller skanningar ännu.';
  @override
  String get searchHint => 'Sök efter produkter...';
  @override
  String get navShopping => 'Shopping';
  @override
  String get shoppingAddHint => 'Lägg till saknad artikel';
  @override
  String get shoppingEmpty => 'Din inköpslista är tom.';
  @override
  String get shoppingClearDone => 'Rensa klar';
  @override
  String get shoppingDoneSection => 'Gjort';
  @override
  String get shoppingAddFromRecipe => 'Lägg till artiklar som inte finns i kvittolager';
  @override
  String get freshnessViewCalendar => 'Kalender';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => 'Vad ska man laga idag?';
  @override
  String get cookTodayNoUrgent =>
      'Inga brådskande föremål. Skanna ett kvitto för att spåra färskhet.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Sett i skanning men inte i kvittolager: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Exportera lokal data';
  @override
  String get exportLocalDataSubtitle => 'Kopierar JSON till urklipp';
  @override
  String get exportLocalDataDone => 'Data har kopierats till urklipp';
  @override
  String get clearLocalData => 'Ta bort lokal data';
  @override
  String get clearLocalDataSubtitle =>
      'Färskhet, shopping, preferenser (oåterkalleligt)';
  @override
  String get clearLocalDataConfirmTitle => 'Ta bort lokal data?';
  @override
  String get clearLocalDataConfirmBody =>
      'Färskhetsinventering och inköpslista har tagits bort från enheten.';
  @override
  String get clearLocalDataDone => 'Lokal data raderades';
  @override
  String get settingsTitle => 'Inställningar';
  @override
  String get languageTitle => 'Språk';
  @override
  String get languageSubtitle => 'Appens språk · 27 språk';
  @override
  String get localePreparingTitle => 'Uppdaterar språk';
  @override
  String get localePreparingSubtitle =>
      'Översätter recept och skanningsresultat...';
  @override
  String get dietTitle => 'Diet preferens';
  @override
  String get dietSubtitle => 'Tillämpas på receptförslag';
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
  String get aiUsageLimitsLoading => 'Belastning…';
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
  String get aiUsageLabelPantry => 'Skafferi';
  @override
  String get aiUsageLabelReceipt => 'Mottagande';
  @override
  String get aiUsageLabelRecipe => 'Recept';
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
  String get storeUnavailable => 'Butiken är inte tillgänglig. Försök igen senare.';
  @override
  String get proProductIdsNotConfigured => 'Pro-produkt-ID:n är inte konfigurerade.';
  @override
  String get noProProductsFound => 'Inga Pro-produkter hittades att köpa.';
  @override
  String get purchaseFlowFailed => 'Köpet kunde inte startas.';
  @override
  String get purchaseCompletedProActivated => 'Köp slutfört. Pro-plan aktiverad.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Köp slutfört. Verifiering misslyckades; försök igen snart.';
  @override
  String get purchaseFailed => 'Köpet misslyckades.';
  @override
  String get restorePurchases => 'Återställ köp';
  @override
  String get restorePurchasesStarted => 'Kontrollerar tidigare köp i Play Store…';
  @override
  String get nutritionTitle => 'Näring (uppskattning)';
  @override
  String get nutritionPerServing => 'per portion';
  @override
  String get nutritionCalories => 'Kalorier';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Kolhydrater';
  @override
  String get nutritionFat => 'Fett';
  @override
  String get nutritionEstimateNote =>
      'Endast AI-uppskattning; inte medicinska eller kostråd.';
  @override
  String get barcodeScanTitle => 'Skanna streckkoden';
  @override
  String get barcodeScanHint =>
      'Rikta in streckkoden i ramen. Produktsökning via Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produkten hittades inte. Testa kvitto eller kylskåpsskanning istället.';
  @override
  String get barcodeConfirmTitle => 'Bekräfta produkten';
  @override
  String get barcodeAddToPantry => 'Lägg till färskhet inventering';
  @override
  String get navScan => 'Avsöka';
  @override
  String get captureTypeFridge => 'Kylskåp';
  @override
  String get captureTypeReceipt => 'Mottagande';
  @override
  String get captureTypeBarcode => 'Streckkod';
  @override
  String get sectionAccount => 'Konto';
  @override
  String get sectionPreferences => 'Inställningar';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Privatliv';
  @override
  String get sessionTitle => 'Session';
  @override
  String get guestUser => 'Gästanvändare';
  @override
  String get favoritesTitle => 'Favoriter';
  @override
  String get favoritesSubtitle => 'Recept du sparat';
  @override
  String get freshnessInventorySubtitle =>
      'Produkter från kvitton och utgångsdatum';
  @override
  String get pantrySyncSubtitle => 'Dra färskhetsinventering från molnet';
  @override
  String get showOnboardingAgain => 'Visa ombordturen igen';
  @override
  String get signOut => 'Logga ut';
  @override
  String get scanSubtitleSmart => 'Smart skafferiskanning';
  @override
  String get scanSubtitleReceipt => 'Kvittoskanning och färskhetsspårning';
  @override
  String get tooltipSettings => 'Inställningar';
  @override
  String get tooltipToggleGuide => 'Växla ramguide';
  @override
  String get tooltipModesAbout => 'Om skanningslägen';
  @override
  String get galleryLabel => 'Galleri';
  @override
  String get cameraLoading => 'Förbereder kamera...';
  @override
  String get cameraUnavailable =>
      'Kameran är inte tillgänglig.\\nKontrollera behörigheter och försök igen.';
  @override
  String get captureFailed =>
      'Infångningen misslyckades. Kontrollera kamerabehörighet och försök igen.';
  @override
  String get receiptCaptureAlign =>
      'Rikta in kvittot i vertikal ram och fånga';
  @override
  String get receiptCameraHint =>
      'Öppna kameran eller välj ett kvittofoto från galleriet';
  @override
  String get pickPhotoHint => 'Tryck på knappen för att välja ett foto';
  @override
  String get desktopGalleryHint =>
      'Skrivbordsläge — välj ett kylskåpsfoto från galleriet.';
  @override
  String get noCameraOnDevice => 'Ingen kamera hittades på den här enheten.';
  @override
  String get openCameraButton => 'Öppna kameran';
  @override
  String get pickPhotoButton => 'Välj foto';
  @override
  String get overlayGuideOn => 'Guide på';
  @override
  String get overlayGuideOff => 'Guida av';
  @override
  String get modeSheetTitle => 'Skanningslägen';
  @override
  String get modeSheetSubtitle =>
      'Välj före fångst; det ändrar AI-receptreglerna.';
  @override
  String get scanModeQuickLabel => 'Snabbskanning';
  @override
  String get scanModeQuickSubtitle => 'Recept under 15 min';
  @override
  String get scanModeQuickDesc =>
      'Praktiska vardagsmat. Alla recept totalt 15 minuter eller mindre; enkla tekniker (en panna, sallad, snabb stek).';
  @override
  String get scanModeSurvivalLabel => 'Rädda';
  @override
  String get scanModeSurvivalSubtitle => 'Använd artiklar som löper ut först';
  @override
  String get scanModeSurvivalDesc =>
      'Minskar avfall. Prioriterar föremål som ser nära att bli förstörda. Valfria tipsfältsobjekt prioriteras.';
  @override
  String get scanModeChefLabel => 'Kockläge';
  @override
  String get scanModeChefSubtitle => 'Gourmet & detaljerad';
  @override
  String get scanModeChefDesc =>
      'Mer raffinerade recept. Teknik i lager, längre tillagningstider; minst två recept markerade hårt.';
  @override
  String get scanModeQuickBestFor =>
      'Veckans måltider med minimala ingredienser och tid';
  @override
  String get scanModeQuickExamples =>
      '• 10-minuters omelett\\n• Pasta i en pan\\n• Wrap eller skål utan tillagning';
  @override
  String get scanModeSurvivalBestFor =>
      'Att använda föremål innan de går ut och skära avfall';
  @override
  String get scanModeSurvivalExamples =>
      '• Rensa ut grönsakssoppa\\n• Ugnsfrittata\\n• Överbliven stekt ris';
  @override
  String get scanModeChefBestFor =>
      'Specialmiddagar, gäster eller lära sig en teknik';
  @override
  String get scanModeChefExamples =>
      '• Pansåsprotein\\n• Krispig + krämig tallrik\\n• Karamelliserad grönsaksgarnering';
  @override
  String get scanModeIdealForLabel => 'Bäst för';
  @override
  String get scanModeExamplesLabel => 'Exempel på rätter';
  @override
  String get survivalHintAddFromPantry => 'Tillsätt av fräschör';
  @override
  String get filterAll => 'Alla';
  @override
  String get filterCritical => 'Kritisk';
  @override
  String get filterWarning => 'Varning';
  @override
  String get filterSafe => 'Säker';
  @override
  String get recipesScreenTitle => 'Recept';
  @override
  String get copyRecipe => 'Kopiera';
  @override
  String get shareRecipe => 'Dela';
  @override
  String get recipeCopiedSnack => 'Receptet har kopierats till urklipp';
  @override
  String get survivalHintTitle => 'Går snart ut';
  @override
  String get survivalHintOptional => 'Valfritt — t.ex. mjölk, tomat, yoghurt';
  @override
  String get survivalHintPlaceholder => 'Separera med kommatecken';
  @override
  String get scanConfirmReceiptLabel => 'Kvittoskanning';
  @override
  String get scanSavedHistory => 'Skanningen har sparats i skafferiets historik';
  @override
  String get scanSaveFailedPrefix => 'Det gick inte att spara skanningen';
  @override
  String get daysUnit => 'dagar';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Upptäckta ingredienser';
  @override
  String recipesAiCount(int count) => 'AI-recept ·$count';
  @override
  String get galleryPickMessage => 'Välj foto från galleriet';
  @override
  String get favoritesEmpty =>
      'Inga favoritrecept än.\\nKnacka på hjärtat på receptresultat.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Recept ${index + 1}' : 'Recept';

  @override
  String get timeAgoJustNow => 'Just nu';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m sedan';
  @override
  String timeAgoHours(int hours) => '${hours}h sedan';
  @override
  String timeAgoDays(int days) => '${days}d sedan';
  @override
  String get daysExpired => 'Utgått';
  @override
  String get daysToday => 'I dag';
  @override
  String get daysTomorrow => 'I morgon';
  @override
  String daysCount(int days) => '$days dagar';
  @override
  String unifiedDaysRemaining(int days) => '$days dagar kvar';
  @override
  String productCount(int count) => '$count föremål';
  @override
  String get unifiedSourceReceipt => 'Mottagande';
  @override
  String get unifiedSourceScan => 'Avsöka';
  @override
  String unifiedLastScan(String date) => 'Senaste skanningen ·$date';
  @override
  String get receiptFieldProductName => 'Produktnamn';
  @override
  String get receiptFieldQuantity => 'Kvantitet';
  @override
  String get receiptFieldCategory => 'Kategori';
  @override
  String expiryApprox(int days) => 'Bäst före ~$days dagar';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Saknade ingredienser har lagts till på inköpslistan';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingredienser ·$recipes recept';
  @override
  String get favoriteAddTooltip => 'Lägg till i favoriter';
  @override
  String get favoriteRemoveTooltip => 'Ta bort från favoriter';
  @override
  String get favoriteAddedSnack => 'Tillagd till favoriter';
  @override
  String get favoriteRemovedSnack => 'Borttagen från favoriter';
  @override
  String get onboardingScanTitle => 'Skanna ditt skafferi';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Inköpslista';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favoriter och senaste skanningar';
  @override
  String get onboardingFavoritesBody =>
      'Spara recept du gillar. De senaste skanningarna öppnas snabbt från startskärmen.';
  @override
  String get onboardingCloudTitle => 'Molnhistorik';
  @override
  String get onboardingCloudBody =>
      'Logga in för att spara skanningshistorik på ditt konto och återvända när som helst.';
  @override
  String get onboardingPermissionsTitle => 'Kamera och aviseringar';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef behöver kamera för att skanna kylskåp, kvitton och streckkoder. Valfria aviseringar påminner när mat håller på att gå ut.';
  @override
  String get emptyStateScanReceipt => 'Skanna kvitto';
  @override
  String get emptyStateStartScan => 'Börja skanna';
  @override
  String get manageSubscriptions => 'Hantera prenumeration';
  @override
  String get notificationCriticalChannelName => 'Färskhetsvarningar';
  @override
  String get notificationCriticalChannelDesc => 'Varor går snart ut';
  @override
  String get notificationDailyChannelName => 'Daglig sammanfattning';
  @override
  String get notificationDailyChannelDesc => 'Daglig färskhet påminnelse';
  @override
  String get notificationCriticalTitle => 'Varor går snart ut';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Kontrollera panelen Freshness.';
  @override
  String get notificationDailyTitle => 'Färskhetskontroll';
  @override
  String get notificationDailyBody =>
      'Granska föremål du bör använda idag.';
  @override
  String get widgetFreshnessGood => 'Färskheten ser bra ut';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count objekt kan förfalla idag';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritisk ·$warning varning';
  @override
  String get categoryDairy => 'Mejeri';
  @override
  String get categoryMeat => 'Kött/fisk';
  @override
  String get categoryFruit => 'Frukt';
  @override
  String get categoryVegetable => 'Vegetabilisk';
  @override
  String get categoryBeverage => 'Dryck';
  @override
  String get categoryBakery => 'Bageri';
  @override
  String get categoryPantry => 'Skafferi';
  @override
  String calendarMonthName(int month) => const [
        'januari',
        'februari',
        'mars',
        'april',
        'maj',
        'juni',
        'juli',
        'augusti',
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
  String get recipesPlaceholderTitle => 'Recept';
  @override
  String get recipesPlaceholderBody =>
      'Receptresultat kommer att visas här efter en lyckad skanning.';
  @override
  String get recipeSamplePlating => 'Provplätering';
  @override
  String get recipeShareInstructionsHeader => 'Instruktioner:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Färgpalett och bakgrund';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Standard mörkgrön';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Coola blå toner';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Varma bärnstensfärgade accenter';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Lila accent mörk';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Ljus bakgrund';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Varm kräm med orange accent';
}
