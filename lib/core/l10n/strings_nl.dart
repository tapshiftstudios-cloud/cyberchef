import 'strings_base.dart';

class StringsNl implements StringsBase {
  const StringsNl();

  @override
  String get analysisTitle => 'Het analyseren van de voorraadkast';
  @override
  String get stepPrepareImage => 'Foto voorbereiden…';
  @override
  String get stepAnalyzeAi => 'Ingrediënten detecteren…';
  @override
  String get stepBuildRecipes => 'Recepten bouwen…';
  @override
  String get receiptAnalysisTitle => 'Ontvangst lezen';
  @override
  String get stepReceiptPrepare => 'Bonafbeelding voorbereiden…';
  @override
  String get stepReceiptOcr => 'Artikelen herkennen...';
  @override
  String get stepReceiptInfer => 'Houdbaarheid schatten...';
  @override
  String get receiptNotRecognized =>
      'Kan ontvangstbewijs niet lezen. Probeer een duidelijkere, vlakkere foto.';
  @override
  String get receiptNotDetected =>
      'Geen ontvangstbewijs gedetecteerd. Lijn de bon uit in het frame.';
  @override
  String get receiptConfirmTitle => 'Bevestig ontvangstitems';
  @override
  String get receiptConfirmSubtitle =>
      'Selecteer items om toe te voegen. Lang indrukken om te bewerken.';
  @override
  String get receiptConfirmSave => 'Toevoegen aan voorraadkast';
  @override
  String get receiptSelectOne => 'Selecteer minimaal één item.';
  @override
  String get receiptSaved => 'Artikelen toegevoegd aan de versheidsinventaris';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Deze ontvangstfoto versturen? De OCR-analyse start nadat u bevestigt.';
  @override
  String get navFreshness => 'Versheid';
  @override
  String get freshnessPanelTitle => 'Versheidspaneel';
  @override
  String get freshnessCritical => 'Kritiek (0–2 dagen)';
  @override
  String get freshnessWarning => 'Waarschuwing (3-5 dagen)';
  @override
  String get freshnessSafe => 'Veilig (6+ dagen)';
  @override
  String get freshnessEmpty =>
      'Nog geen gevolgde items. Scan een bon om inventaris op te bouwen.';
  @override
  String get freshnessListTitle => 'Versheid inventaris';
  @override
  String get freshnessListEmpty => 'Geen items in dit filter.';
  @override
  String get freshnessSuggestRecipes => 'Stel recepten hiermee voor';
  @override
  String get savingsPanelTitle => 'Spaarpaneel';
  @override
  String get savingsPanelEmptyHint =>
      'Markeer artikelen die bijna verlopen zijn als \'Maaltijd gemaakt\' om hier de voorkomen verspilling bij te houden.';
  @override
  String get savingsStatItems => 'Gered';
  @override
  String get savingsStatWaste => 'Afval voorkomen';
  @override
  String get savingsStatMoney => 'Geschat. besparingen';
  @override
  String get savingsDashboardTitle => 'Besparingenanalyse';
  @override
  String get savingsDashboardSubtitle =>
      'Samenvatting van het voedsel dat u deze maand uit de prullenbak heeft gered.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingrediënt gered van verspilling deze maand'
          : '$count ingrediënten die deze maand van afval zijn gered';
  @override
  String savingsKgPrevented(String kg) => 'Voedselverspilling voorkomen:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Geschat financieel voordeel:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Laatste 4 weken';
  @override
  String get savingsRecentTitle => 'Recente reddingsacties';
  @override
  String get savingsEmptySubtitle =>
      'Nog geen gegevens. Wanneer u een kritiek of waarschuwingsitem gebruikt, wordt dit hier weergegeven.';
  @override
  String get savingsHowItWorks =>
      'Artikelen die binnen 5 dagen na de vervaldatum worden gebruikt, tellen als gered. Gewicht en waarde worden geschat op basis van categoriegemiddelden.';
  @override
  String get pantryNamesLocaleNote =>
      'Product- en winkelnamen verschijnen zoals opgeslagen op uw kassabon; veelgebruikte termen worden in het Engels weergegeven.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Laatste dag gebruikt' : 'Gebruikt met$days dagen over';
  @override
  String get savingsMealMade => 'Maaltijd gemaakt';
  @override
  String savingsMealMadeConfirm(String name) => 'Markering$name zoals geconsumeerd?';
  @override
  String savingsRescuedSnack(String money) => 'Geboekte besparingen ·$money';
  @override
  String get freshnessRecipeTitle => 'Recepten voorbereiden';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Voor recepten is minimaal één item vereist.';
  @override
  String get freshnessCriticalBanner => 'Verloopt binnenkort';
  @override
  String get freshnessViewAll => 'Bekijk alles';
  @override
  String get receiptCaptureHints =>
      'Bon plat houden, goede verlichting. Alle lijnen zichtbaar in verticaal frame.';
  @override
  String get receiptPurchaseDate => 'Aankoopdatum';
  @override
  String get receiptTapToEdit => 'Bewerking';
  @override
  String get receiptEditItem => 'Artikel bewerken';
  @override
  String get receiptEditSave => 'Redden';
  @override
  String get receiptExpiryDaysLabel => 'Geschatte houdbaarheid (dagen)';
  @override
  String get receiptMergedSnack => 'Sommige items zijn samengevoegd met bestaande records';
  @override
  String get receiptCloudSyncFailed => 'Kan niet opslaan in de cloud';
  @override
  String get receiptCloudSynced => 'Items gesynchroniseerd met de cloud';
  @override
  String get pantrySyncAction => 'Synchroniseer versheidsgegevens';
  @override
  String get pantrySyncDone => 'Versheidsgegevens bijgewerkt';
  @override
  String get pantrySyncFailed => 'Synchronisatie mislukt';
  @override
  String get freshnessNotificationsTitle => 'Versheidsmeldingen';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritieke items en dagelijkse herinnering';
  @override
  String get freshnessNotificationTimeLabel => 'Dagelijkse herinneringstijd';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Elke dag om$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Deze week:$critical kritisch,$warning waarschuwingsartikelen. Gebruik deze eerst.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Netwerkfout. Controleer uw verbinding en probeer het opnieuw.';
  @override
  String get geminiQuotaExceeded =>
      'AI-quotum overschreden. Wacht een paar minuten en probeer het opnieuw.';
  @override
  String get geminiBillingDepleted =>
      'Het voorafbetalingskrediet van Google AI Studio is op. Voeg facturering toe op ai.google.dev om AI-functies te herstellen.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automatisch opnieuw proberen is mogelijk beschikbaar in$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Dagelijkse AI-vertaallimiet bereikt (3/3). Recepten gebruiken basisvertaling tot morgen.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Je hebt$remaining AI-vertaling(en) zijn vandaag vertrokken.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Dagelijkse voorraadscanlimiet bereikt (3). Probeer het morgen opnieuw.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Dagelijkse ontvangstscanlimiet bereikt (2). Probeer het morgen opnieuw.';
  @override
  String get aiRecipeDailyLimitReached =>
      'De limiet voor het genereren van dagelijkse recepten is bereikt (3). Probeer het morgen opnieuw.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Wacht alstublieft$seconds seconde(n) voordat u het opnieuw probeert.';
  @override
  String get adRewardTitlePantry => 'Pantryscanlimiet bereikt';
  @override
  String get adRewardTitleReceipt => 'Scanlimiet voor ontvangstbewijs bereikt';
  @override
  String get adRewardTitleRecipe => 'De limiet voor het genereren van recepten is bereikt';
  @override
  String get adRewardSubtitle =>
      'Bekijk een korte advertentie om vandaag +1 extra gebruik te verdienen (tot 3 per dag).';
  @override
  String get adRewardWatchButton => 'Advertentie bekijken (+1 gebruik)';
  @override
  String get adRewardGranted => 'Extra gebruik toegestaan. Probeer het opnieuw.';
  @override
  String get adRewardNotCompleted =>
      'Advertentie is niet voltooid. Er werd geen extra gebruik toegestaan.';
  @override
  String get adRewardDailyCapReached =>
      'U heeft de limiet voor advertentiebeloningen van vandaag bereikt.';
  @override
  String get geminiTimeout =>
      'Verzoek is verlopen. Controleer uw verbinding en probeer het opnieuw.';
  @override
  String get geminiServerError =>
      'De AI-service is tijdelijk niet beschikbaar. Probeer het later opnieuw.';
  @override
  String get imageNotRecognized =>
      'Afbeelding niet herkend. Verbeter de verlichting of probeer een andere hoek.';
  @override
  String get imageNotPantry =>
      'Koelkast of voorraadkast niet zichtbaar. Graag direct fotograferen.';
  @override
  String get parseError =>
      'Kan AI-antwoord niet parseren. Scan opnieuw.';
  @override
  String get modelUnavailable =>
      'AI-model niet beschikbaar. Controleer uw API-toegang.';
  @override
  String get genericError => 'Er is iets misgegaan. Probeer het opnieuw.';
  @override
  String get imageDecodeError => 'Kan foto niet lezen. Probeer een andere afbeelding.';
  @override
  String get authSubtitle => 'Slimme toegang tot de voorraadkast';
  @override
  String get authInitializing => 'Sessie voorbereiden…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Wachtwoord';
  @override
  String get emailRequired => 'E-mailadres vereist';
  @override
  String get emailInvalid => 'Ongeldig e-mailadres';
  @override
  String get passwordMin => 'Minimaal 6 tekens';
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
  String get signIn => 'Log in';
  @override
  String get signUp => 'Account aanmaken';
  @override
  String get toggleToSignIn => 'Heeft u al een account? Log in';
  @override
  String get toggleToSignUp => 'Nieuw hier? Account aanmaken';
  @override
  String get guestContinue => 'Ga verder als gast';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Account aangemaakt. Open de bevestigingslink in uw inbox; de app zal u op de hoogte stellen wanneer deze is geverifieerd.';
  @override
  String get emailConfirmedSuccess =>
      'Uw e-mailadres is bevestigd. Uw account is klaar.';
  @override
  String get emailVerifiedLabel => 'E-mail geverifieerd';
  @override
  String get proEmailRequiredTitle => 'E-mailaccount vereist voor Pro';
  @override
  String get proEmailRequiredBody =>
      'Gastaccounts kunnen Pro niet kopen. Maak een e-mailaccount aan om uw gegevens te behouden en facturering te ontgrendelen.';
  @override
  String get proLinkAccountAction => 'Account aanmaken en doorgaan';
  @override
  String get proAccountLinked =>
      'Account gekoppeld. U kunt nu doorgaan naar Pro-afrekenen.';
  @override
  String get supabaseNotConfigured =>
      'Accountservice niet beschikbaar. Probeer het later opnieuw.';
  @override
  String get privacyTitle => 'Gegevens en privacy';
  @override
  String get privacySubtitle => 'Foto\'s en accountgegevens';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Ontvangstafbeeldingen worden niet op de server opgeslagen; alleen de productlijst wordt uitgepakt.\\n\\n'
      'Wanneer u bent aangemeld, kunnen scans en versheidsgegevens in uw account worden opgeslagen.'
      'Het gratis abonnement toont Google AdMob-advertenties; Pro heeft geen advertenties.\\n\\n'
      'Open het online privacybeleid voor de volledige tekst.';
  @override
  String get privacyViewOnline => 'Privacybeleid openen';
  @override
  String get pantryHistoryTitle => 'Geschiedenis van de voorraadkast';
  @override
  String get pantryHistoryEmpty =>
      'Nog geen opgeslagen scans.\\nScan je koelkast om geschiedenis op te bouwen.';
  @override
  String get pantryHistorySubtitle => 'In de cloud opgeslagen scans';
  @override
  String get splashTagline => 'Producten en voorraadkast - één app';
  @override
  String get splashLoading => 'Laden…';
  @override
  String get onboardingSkip => 'Overslaan';
  @override
  String get onboardingNext => 'Volgende';
  @override
  String get onboardingStart => 'Begin';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Recente scans';
  @override
  String get cameraTapToOpen => 'Tik op het pictogram om de camera te openen';
  @override
  String get cameraOrGalleryHint => 'Open de camera of kies uit de galerij';
  @override
  String get captureOrGalleryHint => 'Leg vast of kies uit de galerij';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Camera sluiten';
  @override
  String get noIngredients => 'Geen ingrediënten gedetecteerd.';
  @override
  String get recipeInstructions => 'Instructies';
  @override
  String get untitledRecipe => 'Naamloos recept';
  @override
  String get genericLoadError => 'Er is iets misgegaan. Probeer het opnieuw.';
  @override
  String get scanConfirmTitle => 'Bevestig foto';
  @override
  String get scanConfirmSubtitle =>
      'Deze foto versturen? Receptanalyse begint nadat u bevestigt.';
  @override
  String get scanConfirmAnalyze => 'Analyseren';
  @override
  String get scanConfirmCancel => 'Annuleren';
  @override
  String get scanConfirmRetake => 'Opnieuw nemen';
  @override
  String get scanConfirmPickOther => 'Kies een andere';
  @override
  String get clearRecentScans => 'Wis recente scans';
  @override
  String get clearRecentScansSubtitle => 'Verwijdert de lokale geschiedenis op het apparaat';
  @override
  String get clearRecentScansConfirmTitle => 'Recente scans wissen?';
  @override
  String get clearRecentScansConfirmBody =>
      'Kan niet ongedaan worden gemaakt. Favorieten worden niet beïnvloed.';
  @override
  String get clearRecentScansDone => 'Recente scans gewist';
  @override
  String get deleteAction => 'Verwijderen';
  @override
  String get imageQualityTitle => 'Lage fotokwaliteit';
  @override
  String get imageQualityDark => 'Het beeld is te donker. Voeg licht toe en probeer het opnieuw.';
  @override
  String get imageQualityBlurry =>
      'Het beeld kan wazig zijn. Houd stand en herhaal.';
  @override
  String get imageQualityContinue => 'Ga toch door';
  @override
  String get imageQualityRetake => 'Opnieuw nemen';
  @override
  String receiptQueueTitle(int count) => '$count ontvangst(en) die offline wachten';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Ontvangst ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proces';
  @override
  String get receiptQueuedOffline =>
      'Offline. Ontvangst in wachtrij; proces wanneer aangesloten.';
  @override
  String get receiptLowConfidenceBlock =>
      'Bewerk items met weinig vertrouwen voordat u ze opslaat (potloodpictogram).';
  @override
  String get unifiedPantryTitle => 'Uniforme inventaris';
  @override
  String get unifiedPantryEmpty => 'Nog geen items of scans.';
  @override
  String get searchHint => 'Producten zoeken…';
  @override
  String get navShopping => 'Winkelen';
  @override
  String get shoppingAddHint => 'Voeg ontbrekend item toe';
  @override
  String get shoppingEmpty => 'Je boodschappenlijstje is leeg.';
  @override
  String get shoppingClearDone => 'Duidelijk voltooid';
  @override
  String get shoppingDoneSection => 'Klaar';
  @override
  String get shoppingAddFromRecipe => 'Voeg artikelen toe die niet in de ontvangstinventaris staan';
  @override
  String get freshnessViewCalendar => 'Kalender';
  @override
  String get freshnessViewList => 'Lijst';
  @override
  String get cookToday => 'Wat moet je vandaag koken?';
  @override
  String get cookTodayNoUrgent =>
      'Geen dringende zaken. Scan een bon om de versheid te volgen.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Gezien in scan maar niet in ontvangstinventaris: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Lokale gegevens exporteren';
  @override
  String get exportLocalDataSubtitle => 'Kopieert JSON naar klembord';
  @override
  String get exportLocalDataDone => 'Gegevens gekopieerd naar klembord';
  @override
  String get clearLocalData => 'Verwijder lokale gegevens';
  @override
  String get clearLocalDataSubtitle =>
      'Versheid, winkelen, voorkeuren (onomkeerbaar)';
  @override
  String get clearLocalDataConfirmTitle => 'Lokale gegevens verwijderen?';
  @override
  String get clearLocalDataConfirmBody =>
      'Versheidsinventaris en boodschappenlijstje verwijderd van apparaat.';
  @override
  String get clearLocalDataDone => 'Lokale gegevens gewist';
  @override
  String get settingsTitle => 'Instellingen';
  @override
  String get languageTitle => 'Taal';
  @override
  String get languageSubtitle => 'App-taal · 27 talen';
  @override
  String get localePreparingTitle => 'Taal bijwerken';
  @override
  String get localePreparingSubtitle =>
      'Recepten en scanresultaten vertalen…';
  @override
  String get dietTitle => 'Dieetvoorkeur';
  @override
  String get dietSubtitle => 'Toegepast op receptsuggesties';
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
  String get aiUsageLimitsLoading => 'Laden…';
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
  String get aiUsageLabelPantry => 'Voorraadkast';
  @override
  String get aiUsageLabelReceipt => 'Ontvangst';
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
  String get storeUnavailable => 'De store is niet beschikbaar. Probeer het later opnieuw.';
  @override
  String get proProductIdsNotConfigured => 'Pro-product-ID\'s zijn niet geconfigureerd.';
  @override
  String get noProProductsFound => 'Geen Pro-producten gevonden om te kopen.';
  @override
  String get purchaseFlowFailed => 'Aankoop kon niet worden gestart.';
  @override
  String get purchaseCompletedProActivated => 'Aankoop voltooid. Pro-abonnement geactiveerd.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Aankoop voltooid. Verificatie mislukt; probeer het binnenkort opnieuw.';
  @override
  String get purchaseFailed => 'Aankoop mislukt.';
  @override
  String get restorePurchases => 'Aankopen herstellen';
  @override
  String get restorePurchasesStarted => 'Eerdere aankopen in Play Store controleren…';
  @override
  String get nutritionTitle => 'Voeding (schatting)';
  @override
  String get nutritionPerServing => 'per portie';
  @override
  String get nutritionCalories => 'Calorieën';
  @override
  String get nutritionProtein => 'Eiwit';
  @override
  String get nutritionCarbs => 'Koolhydraten';
  @override
  String get nutritionFat => 'Vet';
  @override
  String get nutritionEstimateNote =>
      'Alleen AI-schatting; geen medisch of dieetadvies.';
  @override
  String get barcodeScanTitle => 'Streepjescode scannen';
  @override
  String get barcodeScanHint =>
      'Lijn de streepjescode uit in het frame. Product opzoeken via Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Product niet gevonden. Probeer in plaats daarvan een kassabon of een koelkastscan.';
  @override
  String get barcodeConfirmTitle => 'Bevestig product';
  @override
  String get barcodeAddToPantry => 'Voeg toe aan de versheidsinventaris';
  @override
  String get navScan => 'Scannen';
  @override
  String get captureTypeFridge => 'Koelkast';
  @override
  String get captureTypeReceipt => 'Ontvangst';
  @override
  String get captureTypeBarcode => 'Streepjescode';
  @override
  String get sectionAccount => 'Rekening';
  @override
  String get sectionPreferences => 'Voorkeuren';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Privacy';
  @override
  String get sessionTitle => 'Sessie';
  @override
  String get guestUser => 'Gastgebruiker';
  @override
  String get favoritesTitle => 'Favorieten';
  @override
  String get favoritesSubtitle => 'Recepten die je hebt opgeslagen';
  @override
  String get freshnessInventorySubtitle =>
      'Producten uit bonnen en vervaldata';
  @override
  String get pantrySyncSubtitle => 'Haal de versheidsinventaris uit de cloud';
  @override
  String get showOnboardingAgain => 'Onboardingtour opnieuw weergeven';
  @override
  String get signOut => 'Meld u af';
  @override
  String get scanSubtitleSmart => 'Slimme voorraadscan';
  @override
  String get scanSubtitleReceipt => 'Ontvangstscan en versheid volgen';
  @override
  String get tooltipSettings => 'Instellingen';
  @override
  String get tooltipToggleGuide => 'Framegeleider schakelen';
  @override
  String get tooltipModesAbout => 'Over scanmodi';
  @override
  String get galleryLabel => 'Galerij';
  @override
  String get cameraLoading => 'Camera voorbereiden…';
  @override
  String get cameraUnavailable =>
      'Camera niet beschikbaar.\\nControleer de rechten en probeer het opnieuw.';
  @override
  String get captureFailed =>
      'Vastleggen mislukt. Controleer de camerarechten en probeer het opnieuw.';
  @override
  String get receiptCaptureAlign =>
      'Lijn de bon uit in het verticale frame en leg vast';
  @override
  String get receiptCameraHint =>
      'Open de camera of kies een bonfoto uit de galerij';
  @override
  String get pickPhotoHint => 'Tik op de knop om een ​​foto te kiezen';
  @override
  String get desktopGalleryHint =>
      'Desktopmodus: kies een koelkastfoto uit de galerij.';
  @override
  String get noCameraOnDevice => 'Er is geen camera gevonden op dit apparaat.';
  @override
  String get openCameraButton => 'Camera openen';
  @override
  String get pickPhotoButton => 'Kies foto';
  @override
  String get overlayGuideOn => 'Gids aan';
  @override
  String get overlayGuideOff => 'Begeleid af';
  @override
  String get modeSheetTitle => 'Scanmodi';
  @override
  String get modeSheetSubtitle =>
      'Kies vóór vastleggen; het verandert de AI-receptregels.';
  @override
  String get scanModeQuickLabel => 'Snelle scan';
  @override
  String get scanModeQuickSubtitle => 'Recepten korter dan 15 minuten';
  @override
  String get scanModeQuickDesc =>
      'Praktische dagelijkse maaltijden. Alle recepten duren in totaal 15 minuten of minder; eenvoudige technieken (één pan, salade, snel bakken).';
  @override
  String get scanModeSurvivalLabel => 'Redden';
  @override
  String get scanModeSurvivalSubtitle => 'Gebruik eerst verlopende artikelen';
  @override
  String get scanModeSurvivalDesc =>
      'Vermindert afval. Geeft prioriteit aan items die bijna bederven. Optionele hintvelditems krijgen prioriteit.';
  @override
  String get scanModeChefLabel => 'Chef-modus';
  @override
  String get scanModeChefSubtitle => 'Gastronomisch en gedetailleerd';
  @override
  String get scanModeChefDesc =>
      'Meer verfijnde recepten. Gelaagde technieken, langere kooktijden; ten minste twee recepten die moeilijk zijn gemarkeerd.';
  @override
  String get scanModeQuickBestFor =>
      'Doordeweekse maaltijden met minimale ingrediënten en tijd';
  @override
  String get scanModeQuickExamples =>
      '• Omelet van 10 minuten\\n• Eenpanspasta\\n• No-cook wrap of kom';
  @override
  String get scanModeSurvivalBestFor =>
      'Artikelen gebruiken voordat ze verlopen en verspilling tegengaan';
  @override
  String get scanModeSurvivalExamples =>
      '• Opruimende groentesoep\\n• Ovenfrittata\\n• Overgebleven gebakken rijst';
  @override
  String get scanModeChefBestFor =>
      'Speciale diners, gasten, of een techniek leren';
  @override
  String get scanModeChefExamples =>
      '• Pansauseiwit\\n• Krokant + romig bord\\n• Gekarameliseerde groentegarnituur';
  @override
  String get scanModeIdealForLabel => 'Beste voor';
  @override
  String get scanModeExamplesLabel => 'Voorbeeld gerechten';
  @override
  String get survivalHintAddFromPantry => 'Voeg toe vanuit versheid';
  @override
  String get filterAll => 'Alle';
  @override
  String get filterCritical => 'Kritisch';
  @override
  String get filterWarning => 'Waarschuwing';
  @override
  String get filterSafe => 'Veilig';
  @override
  String get recipesScreenTitle => 'Recepten';
  @override
  String get copyRecipe => 'Kopiëren';
  @override
  String get shareRecipe => 'Deel';
  @override
  String get recipeCopiedSnack => 'Recept gekopieerd naar klembord';
  @override
  String get survivalHintTitle => 'Verloopt binnenkort';
  @override
  String get survivalHintOptional => 'Optioneel — b.v. melk, tomaat, yoghurt';
  @override
  String get survivalHintPlaceholder => 'Scheid met komma\'s';
  @override
  String get scanConfirmReceiptLabel => 'Ontvangstscan';
  @override
  String get scanSavedHistory => 'Scan opgeslagen in voorraadgeschiedenis';
  @override
  String get scanSaveFailedPrefix => 'Kan scan niet opslaan';
  @override
  String get daysUnit => 'dagen';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Gedetecteerde ingrediënten';
  @override
  String recipesAiCount(int count) => 'AI-recepten ·$count';
  @override
  String get galleryPickMessage => 'Kies een foto uit de galerij';
  @override
  String get favoritesEmpty =>
      'Nog geen favoriete recepten.\\nTik op het hartje bij de receptresultaten.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Recept ${index + 1}' : 'Recept';

  @override
  String get timeAgoJustNow => 'Zojuist';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m geleden';
  @override
  String timeAgoHours(int hours) => '${hours}u geleden';
  @override
  String timeAgoDays(int days) => '${days}d geleden';
  @override
  String get daysExpired => 'Verlopen';
  @override
  String get daysToday => 'Vandaag';
  @override
  String get daysTomorrow => 'Morgen';
  @override
  String daysCount(int days) => '$days dagen';
  @override
  String unifiedDaysRemaining(int days) => '$days dagen over';
  @override
  String productCount(int count) => '$count artikelen';
  @override
  String get unifiedSourceReceipt => 'Ontvangst';
  @override
  String get unifiedSourceScan => 'Scannen';
  @override
  String unifiedLastScan(String date) => 'Laatste scan ·$date';
  @override
  String get receiptFieldProductName => 'Productnaam';
  @override
  String get receiptFieldQuantity => 'Hoeveelheid';
  @override
  String get receiptFieldCategory => 'Categorie';
  @override
  String expiryApprox(int days) => 'Ten minste houdbaar tot ~$days dagen';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Ontbrekende ingrediënten toegevoegd aan boodschappenlijstje';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingrediënten ·$recipes recepten';
  @override
  String get favoriteAddTooltip => 'Toevoegen aan favorieten';
  @override
  String get favoriteRemoveTooltip => 'Verwijderen uit favorieten';
  @override
  String get favoriteAddedSnack => 'Toegevoegd aan favorieten';
  @override
  String get favoriteRemovedSnack => 'Verwijderd uit favorieten';
  @override
  String get onboardingScanTitle => 'Scan uw voorraadkast';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Boodschappenlijstje';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favorieten en recente scans';
  @override
  String get onboardingFavoritesBody =>
      'Bewaar recepten die u leuk vindt. Recente scans worden snel geopend vanaf het startscherm.';
  @override
  String get onboardingCloudTitle => 'Cloud-geschiedenis';
  @override
  String get onboardingCloudBody =>
      'Meld u aan om de scangeschiedenis in uw account op te slaan en op elk gewenst moment terug te keren.';
  @override
  String get onboardingPermissionsTitle => 'Camera en meldingen';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef heeft cameratoegang nodig om koelkast, bonnen en barcodes te scannen. Optionele meldingen waarschuwen wanneer voedsel bijna verloopt.';
  @override
  String get emptyStateScanReceipt => 'Bon scannen';
  @override
  String get emptyStateStartScan => 'Begin met scannen';
  @override
  String get manageSubscriptions => 'Abonnement beheren';
  @override
  String get notificationCriticalChannelName => 'Versheidswaarschuwingen';
  @override
  String get notificationCriticalChannelDesc => 'Artikelen die binnenkort verlopen';
  @override
  String get notificationDailyChannelName => 'Dagelijkse samenvatting';
  @override
  String get notificationDailyChannelDesc => 'Dagelijkse frisheidsherinnering';
  @override
  String get notificationCriticalTitle => 'Artikelen die binnenkort verlopen';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Controleer het paneel Versheid.';
  @override
  String get notificationDailyTitle => 'Versheidscontrole';
  @override
  String get notificationDailyBody =>
      'Bekijk items die u vandaag zou moeten gebruiken.';
  @override
  String get widgetFreshnessGood => 'Versheid ziet er goed uit';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count artikelen kunnen vandaag verlopen';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritisch ·$warning waarschuwing';
  @override
  String get categoryDairy => 'Zuivel';
  @override
  String get categoryMeat => 'Vlees/vis';
  @override
  String get categoryFruit => 'Fruit';
  @override
  String get categoryVegetable => 'Groente';
  @override
  String get categoryBeverage => 'Drank';
  @override
  String get categoryBakery => 'Bakkerij';
  @override
  String get categoryPantry => 'Voorraadkast';
  @override
  String calendarMonthName(int month) => const [
        'Januari',
        'Februari',
        'Maart',
        'april',
        'Kunnen',
        'juni',
        'juli',
        'augustus',
        'september',
        'oktober',
        'November',
        'December',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Recepten';
  @override
  String get recipesPlaceholderBody =>
      'Receptresultaten verschijnen hier na een succesvolle scan.';
  @override
  String get recipeSamplePlating => 'Voorbeeld van beplating';
  @override
  String get recipeShareInstructionsHeader => 'Instructies:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Uitv.';
  @override
  String get themeTitle => 'Thema';
  @override
  String get themeSubtitle => 'Kleurenpalet en achtergrond';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Standaard donkergroen';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Koele blauwe tinten';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Warme amberaccenten';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Paars accent donker';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Lichte achtergrond';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Warme crème met oranje accent';
}
