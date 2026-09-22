import 'strings_base.dart';

class StringsFi implements StringsBase {
  const StringsFi();

  @override
  String get analysisTitle => 'Analysoi ruokakomeroa';
  @override
  String get stepPrepareImage => 'Valmistellaan valokuvaa…';
  @override
  String get stepAnalyzeAi => 'Havaitaan ainesosia…';
  @override
  String get stepBuildRecipes => 'Rakenna reseptejä…';
  @override
  String get receiptAnalysisTitle => 'Lukukuitti';
  @override
  String get stepReceiptPrepare => 'Valmistellaan kuittikuvaa…';
  @override
  String get stepReceiptOcr => 'Tunnistetaan kohteita…';
  @override
  String get stepReceiptInfer => 'Arvioidaan säilyvyyttä…';
  @override
  String get receiptNotRecognized =>
      'Kuittia ei voitu lukea. Kokeile selkeämpää, litteämpää kuvaa.';
  @override
  String get receiptNotDetected =>
      'Kuittia ei havaittu. Kohdista kuitti kehykseen.';
  @override
  String get receiptConfirmTitle => 'Vahvista vastaanottamat tuotteet';
  @override
  String get receiptConfirmSubtitle =>
      'Valitse lisättävät kohteet. Paina pitkään muokataksesi.';
  @override
  String get receiptConfirmSave => 'Lisää ruokakomeroon';
  @override
  String get receiptSelectOne => 'Valitse vähintään yksi kohde.';
  @override
  String get receiptSaved => 'Tuoreusvarastoon lisätyt tuotteet';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Lähetetäänkö tämä kuittikuva? OCR-analyysi alkaa vahvistuksen jälkeen.';
  @override
  String get navFreshness => 'Tuoreus';
  @override
  String get freshnessPanelTitle => 'Tuoreuspaneeli';
  @override
  String get freshnessCritical => 'Kriittinen (0–2 päivää)';
  @override
  String get freshnessWarning => 'Varoitus (3–5 päivää)';
  @override
  String get freshnessSafe => 'Turvallinen (6+ päivää)';
  @override
  String get freshnessEmpty =>
      'Ei vielä seurattuja kohteita. Skannaa kuitti varaston luomiseksi.';
  @override
  String get freshnessListTitle => 'Tuoreus inventaario';
  @override
  String get freshnessListEmpty => 'Ei kohteita tässä suodattimessa.';
  @override
  String get freshnessSuggestRecipes => 'Ehdota reseptejä näiden kanssa';
  @override
  String get savingsPanelTitle => 'Säästöpaneeli';
  @override
  String get savingsPanelEmptyHint =>
      'Merkitse lähellä vanhenevat tuotteet merkintään "Ateria tehty", jotta voit seurata jätteen syntymistä tässä.';
  @override
  String get savingsStatItems => 'Pelastettu';
  @override
  String get savingsStatWaste => 'Hävikki vältetty';
  @override
  String get savingsStatMoney => 'Arvioitu säästöjä';
  @override
  String get savingsDashboardTitle => 'Säästöjen analytiikka';
  @override
  String get savingsDashboardSubtitle =>
      'Yhteenveto roskakorista säästämistäsi ruuista – tässä kuussa.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ainesosa säästyi jätteestä tässä kuussa'
          : '$count jätteistä säästyneitä ainesosia tässä kuussa';
  @override
  String savingsKgPrevented(String kg) => 'Ruokahävikki estetty:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Arvioitu taloudellinen hyöty:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Viimeiset 4 viikkoa';
  @override
  String get savingsRecentTitle => 'Viimeaikaiset pelastukset';
  @override
  String get savingsEmptySubtitle =>
      'Ei tietueita vielä. Kun käytät kriittistä tai varoituskohdetta, se näkyy tässä.';
  @override
  String get savingsHowItWorks =>
      'Tuotteet, jotka on käytetty 5 päivän kuluessa vanhenemisesta, lasketaan pelastetuiksi. Paino ja arvo on arvioitu luokkien keskiarvoista.';
  @override
  String get pantryNamesLocaleNote =>
      'Tuotteiden ja myymälöiden nimet näkyvät kuitissasi tallennettuina. yleiset termit näytetään englanniksi.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Käytetty viimeisenä päivänä' : 'Käytetty kanssa$days päivää jäljellä';
  @override
  String get savingsMealMade => 'Ateria tehty';
  @override
  String savingsMealMadeConfirm(String name) => 'Mark$name kuin kulutetaan?';
  @override
  String savingsRescuedSnack(String money) => 'Säästöt kirjattu ·$money';
  @override
  String get freshnessRecipeTitle => 'Reseptien valmistaminen';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Resepteihin vaaditaan vähintään yksi tuote.';
  @override
  String get freshnessCriticalBanner => 'Vanhenee pian';
  @override
  String get freshnessViewAll => 'Näytä kaikki';
  @override
  String get receiptCaptureHints =>
      'Pidä kuitti tasaisena, hyvä valaistus. Kaikki viivat näkyvät pystykehyksessä.';
  @override
  String get receiptPurchaseDate => 'Ostopäivä';
  @override
  String get receiptTapToEdit => 'Muokata';
  @override
  String get receiptEditItem => 'Muokkaa kohdetta';
  @override
  String get receiptEditSave => 'Tallentaa';
  @override
  String get receiptExpiryDaysLabel => 'Arvioitu säilyvyys (päivää)';
  @override
  String get receiptMergedSnack => 'Jotkut kohteet yhdistettiin olemassa oleviin tietueisiin';
  @override
  String get receiptCloudSyncFailed => 'Ei voitu tallentaa pilveen';
  @override
  String get receiptCloudSynced => 'Kohteet synkronoitu pilveen';
  @override
  String get pantrySyncAction => 'Synkronoi tuoreustiedot';
  @override
  String get pantrySyncDone => 'Tuoreustiedot päivitetty';
  @override
  String get pantrySyncFailed => 'Synkronointi epäonnistui';
  @override
  String get freshnessNotificationsTitle => 'Tuoreusilmoitukset';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kriittiset kohteet ja päivittäinen muistutus';
  @override
  String get freshnessNotificationTimeLabel => 'Päivittäinen muistutusaika';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Joka päivä klo$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Tällä viikolla:$critical kriittinen,$warning varoituskohteita. Käytä näitä ensin.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Verkkovirhe. Tarkista yhteys ja yritä uudelleen.';
  @override
  String get geminiQuotaExceeded =>
      'AI-kiintiö ylitetty. Odota muutama minuutti ja yritä uudelleen.';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studion ennakkomaksuhyvitykset ovat lopussa. Lisää laskutus osoitteessa ai.google.dev palauttaaksesi tekoälyominaisuudet.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automaattinen uudelleenyritys saattaa olla käytettävissä$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Päivittäinen tekoälyn käännösraja saavutettu (3/3). Reseptit käyttävät peruskäännöstä huomiseen asti.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'You have $remaining Tekoälykäännös(t) jätetty tänään.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Päivittäinen ruokakomero skannausraja saavutettu (3). Yritä huomenna uudelleen.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Päivittäinen kuitin skannausraja saavutettu (2). Yritä huomenna uudelleen.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Päivittäinen reseptien luomisraja saavutettu (3). Yritä huomenna uudelleen.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Odota$seconds sekuntia ennen kuin yrität uudelleen.';
  @override
  String get adRewardTitlePantry => 'Ruokakomero skannausraja saavutettu';
  @override
  String get adRewardTitleReceipt => 'Kuitin skannausraja saavutettu';
  @override
  String get adRewardTitleRecipe => 'Reseptin luontiraja saavutettu';
  @override
  String get adRewardSubtitle =>
      'Katso lyhyt mainos ja ansaitse +1 lisäkäyttöä tänään (jopa 3 per päivä).';
  @override
  String get adRewardWatchButton => 'Katso mainos (+1 käyttö)';
  @override
  String get adRewardGranted => 'Lisäkäyttö myönnetty. Yritä uudelleen.';
  @override
  String get adRewardNotCompleted =>
      'Mainosta ei saatu valmiiksi. Lisäkäyttöä ei myönnetty.';
  @override
  String get adRewardDailyCapReached =>
      'Olet saavuttanut tämän päivän mainospalkkion rajan.';
  @override
  String get geminiTimeout =>
      'Pyyntö aikakatkaistiin. Tarkista yhteys ja yritä uudelleen.';
  @override
  String get geminiServerError =>
      'AI-palvelu on tilapäisesti poissa käytöstä. Yritä myöhemmin uudelleen.';
  @override
  String get imageNotRecognized =>
      'Kuvaa ei tunnistettu. Paranna valaistusta tai kokeile toista kuvakulmaa.';
  @override
  String get imageNotPantry =>
      'Jääkaappi tai ruokakomero ei näy. Ota valokuva suoraan.';
  @override
  String get parseError =>
      'AI-vastausta ei voitu jäsentää. Skannaa uudelleen.';
  @override
  String get modelUnavailable =>
      'AI-malli ei ole saatavilla. Tarkista API-käyttösi.';
  @override
  String get genericError => 'Jotain meni pieleen. Yritä uudelleen.';
  @override
  String get imageDecodeError => 'Valokuvaa ei voitu lukea. Kokeile toista kuvaa.';
  @override
  String get authSubtitle => 'Älykäs ruokakomero pääsy';
  @override
  String get authInitializing => 'Valmistellaan istuntoa…';
  @override
  String get emailLabel => 'Sähköposti';
  @override
  String get passwordLabel => 'Salasana';
  @override
  String get emailRequired => 'Sähköposti vaaditaan';
  @override
  String get emailInvalid => 'Virheellinen sähköpostiosoite';
  @override
  String get passwordMin => 'Vähintään 6 merkkiä';
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
  String get signIn => 'Kirjaudu sisään';
  @override
  String get signUp => 'Luo tili';
  @override
  String get toggleToSignIn => 'Onko sinulla jo tili? Kirjaudu sisään';
  @override
  String get toggleToSignUp => 'Uusi täällä? Luo tili';
  @override
  String get guestContinue => 'Jatka vieraana';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Tili luotu. Avaa vahvistuslinkki postilaatikossasi; sovellus ilmoittaa sinulle, kun se on vahvistettu.';
  @override
  String get emailConfirmedSuccess =>
      'Sähköpostisi on vahvistettu. Tilisi on valmis.';
  @override
  String get emailVerifiedLabel => 'Sähköposti vahvistettu';
  @override
  String get proEmailRequiredTitle => 'Prolle vaaditaan sähköpostitili';
  @override
  String get proEmailRequiredBody =>
      'Vierastilit eivät voi ostaa Prota. Luo sähköpostitili säilyttääksesi tietosi ja vapauttaaksesi laskutuksen.';
  @override
  String get proLinkAccountAction => 'Luo tili ja jatka';
  @override
  String get proAccountLinked =>
      'Tili linkitetty. Voit jatkaa Pro-maksuun nyt.';
  @override
  String get supabaseNotConfigured =>
      'Tilipalvelu ei ole käytettävissä. Yritä myöhemmin uudelleen.';
  @override
  String get privacyTitle => 'Data ja yksityisyys';
  @override
  String get privacySubtitle => 'Valokuvat ja tilitiedot';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Kuittikuvia ei tallenneta palvelimelle; vain tuoteluettelo puretaan.\\n\\n'
      'Kun olet kirjautunut sisään, skannaukset ja tuoreustiedot voidaan tallentaa tilillesi.'
      'Ilmainen suunnitelma näyttää Google AdMob -mainokset; Prolla ei ole mainoksia.\\n\\n'
      'Avaa online-tietosuojakäytäntö nähdäksesi koko tekstin.';
  @override
  String get privacyViewOnline => 'Avaa tietosuojakäytäntö';
  @override
  String get pantryHistoryTitle => 'Ruokakomero historiaa';
  @override
  String get pantryHistoryEmpty =>
      'Ei vielä tallennettuja skannauksia.\\nSkannaa jääkaappisi historian luomiseksi.';
  @override
  String get pantryHistorySubtitle => 'Pilveen tallennetut skannaukset';
  @override
  String get splashTagline => 'Tuota ja ruokakomero – yksi sovellus';
  @override
  String get splashLoading => 'Ladataan…';
  @override
  String get onboardingSkip => 'Ohita';
  @override
  String get onboardingNext => 'Seuraavaksi';
  @override
  String get onboardingStart => 'Aloita';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Viimeaikaiset skannaukset';
  @override
  String get cameraTapToOpen => 'Avaa kamera napauttamalla kuvaketta';
  @override
  String get cameraOrGalleryHint => 'Avaa kamera tai valitse galleriasta';
  @override
  String get captureOrGalleryHint => 'Ota talteen tai valitse galleriasta';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Sulje kamera';
  @override
  String get noIngredients => 'Ei havaittu ainesosia.';
  @override
  String get recipeInstructions => 'Ohjeet';
  @override
  String get untitledRecipe => 'Nimetön resepti';
  @override
  String get genericLoadError => 'Jotain meni pieleen. Yritä uudelleen.';
  @override
  String get scanConfirmTitle => 'Vahvista valokuva';
  @override
  String get scanConfirmSubtitle =>
      'Lähetetäänkö tämä kuva? Reseptianalyysi alkaa vahvistuksen jälkeen.';
  @override
  String get scanConfirmAnalyze => 'Analysoida';
  @override
  String get scanConfirmCancel => 'Peruuttaa';
  @override
  String get scanConfirmRetake => 'Ota uudelleen';
  @override
  String get scanConfirmPickOther => 'Valitse toinen';
  @override
  String get clearRecentScans => 'Tyhjennä viimeisimmät skannaukset';
  @override
  String get clearRecentScansSubtitle => 'Poistaa paikallishistorian laitteelta';
  @override
  String get clearRecentScansConfirmTitle => 'Poistetaanko viimeisimmät skannaukset?';
  @override
  String get clearRecentScansConfirmBody =>
      'Ei voi kumota. Suosikit eivät vaikuta.';
  @override
  String get clearRecentScansDone => 'Viimeisimmät skannaukset tyhjennettiin';
  @override
  String get deleteAction => 'Poistaa';
  @override
  String get imageQualityTitle => 'Huono kuvanlaatu';
  @override
  String get imageQualityDark => 'Kuva on liian tumma. Lisää valo ja yritä uudelleen.';
  @override
  String get imageQualityBlurry =>
      'Kuva voi olla epäselvä. Pidä paikallaan ja ota uudelleen.';
  @override
  String get imageQualityContinue => 'Jatka joka tapauksessa';
  @override
  String get imageQualityRetake => 'Ota uudelleen';
  @override
  String receiptQueueTitle(int count) => '$count kuitit odottavat offline-tilassa';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Kuitti ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Käsitellä';
  @override
  String get receiptQueuedOffline =>
      'Offline-tilassa. Kuitti jonossa; prosessi, kun se on kytketty.';
  @override
  String get receiptLowConfidenceBlock =>
      'Muokkaa heikosti luotettavia kohteita ennen tallentamista (kynäkuvake).';
  @override
  String get unifiedPantryTitle => 'Yhtenäinen varasto';
  @override
  String get unifiedPantryEmpty => 'Ei kohteita tai skannauksia vielä.';
  @override
  String get searchHint => 'Hae tuotteita…';
  @override
  String get navShopping => 'Ostokset';
  @override
  String get shoppingAddHint => 'Lisää puuttuva kohde';
  @override
  String get shoppingEmpty => 'Ostoslistasi on tyhjä.';
  @override
  String get shoppingClearDone => 'Tyhjennys valmis';
  @override
  String get shoppingDoneSection => 'Tehty';
  @override
  String get shoppingAddFromRecipe => 'Lisää tuotteita, jotka eivät ole kuittivarastossa';
  @override
  String get freshnessViewCalendar => 'Kalenteri';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => 'Mitä tehdä tänään?';
  @override
  String get cookTodayNoUrgent =>
      'Ei kiireellisiä kohteita. Skannaa kuitti seurataksesi tuoreutta.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Nähty skannauksessa, mutta ei kuittivarastossa: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Vie paikalliset tiedot';
  @override
  String get exportLocalDataSubtitle => 'Kopioi JSON leikepöydälle';
  @override
  String get exportLocalDataDone => 'Tiedot kopioitu leikepöydälle';
  @override
  String get clearLocalData => 'Poista paikalliset tiedot';
  @override
  String get clearLocalDataSubtitle =>
      'Tuoreus, ostokset, mieltymykset (peruuttamaton)';
  @override
  String get clearLocalDataConfirmTitle => 'Poistetaanko paikalliset tiedot?';
  @override
  String get clearLocalDataConfirmBody =>
      'Tuoreusvarasto ja ostoslista poistettu laitteesta.';
  @override
  String get clearLocalDataDone => 'Paikalliset tiedot tyhjennettiin';
  @override
  String get settingsTitle => 'Asetukset';
  @override
  String get languageTitle => 'Kieli';
  @override
  String get languageSubtitle => 'Sovelluksen kieli · 27 kieltä';
  @override
  String get localePreparingTitle => 'Päivitetään kieltä';
  @override
  String get localePreparingSubtitle =>
      'Käännetään reseptejä ja skannaustuloksia…';
  @override
  String get dietTitle => 'Ruokavalion mieltymys';
  @override
  String get dietSubtitle => 'Sovelletaan reseptiehdotuksiin';
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
  String get aiUsageLimitsLoading => 'Ladataan…';
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
  String get aiUsageLabelPantry => 'Ruokakomero';
  @override
  String get aiUsageLabelReceipt => 'Kuitti';
  @override
  String get aiUsageLabelRecipe => 'Resepti';
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
  String get storeUnavailable => 'Kauppa ei ole käytettävissä. Yritä myöhemmin uudelleen.';
  @override
  String get proProductIdsNotConfigured => 'Pro-tuotetunnuksia ei ole määritetty.';
  @override
  String get noProProductsFound => 'Ostettavia Pro-tuotteita ei löytynyt.';
  @override
  String get purchaseFlowFailed => 'Ostoa ei voitu aloittaa.';
  @override
  String get purchaseCompletedProActivated => 'Osto valmis. Pro-suunnitelma aktivoitu.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Osto valmis. Vahvistus epäonnistui; yritä pian uudelleen.';
  @override
  String get purchaseFailed => 'Osto epäonnistui.';
  @override
  String get restorePurchases => 'Palauta ostot';
  @override
  String get restorePurchasesStarted => 'Tarkistetaan aiempia ostoja Play Storessa…';
  @override
  String get nutritionTitle => 'Ravinto (arvio)';
  @override
  String get nutritionPerServing => 'annosta kohti';
  @override
  String get nutritionCalories => 'Kalorit';
  @override
  String get nutritionProtein => 'Proteiini';
  @override
  String get nutritionCarbs => 'Hiilihydraatteja';
  @override
  String get nutritionFat => 'Lihava';
  @override
  String get nutritionEstimateNote =>
      'Vain tekoälyarvio; ei lääketieteellisiä tai ravitsemusneuvoja.';
  @override
  String get barcodeScanTitle => 'Skannaa viivakoodi';
  @override
  String get barcodeScanHint =>
      'Kohdista viivakoodi kehyksessä. Tuotehaku Open Food Factsin kautta.';
  @override
  String get barcodeNotFound =>
      'Tuotetta ei löydy. Kokeile sen sijaan kuittia tai jääkaappiskannausta.';
  @override
  String get barcodeConfirmTitle => 'Vahvista tuote';
  @override
  String get barcodeAddToPantry => 'Lisää tuoreusvarastoon';
  @override
  String get navScan => 'Skannata';
  @override
  String get captureTypeFridge => 'Jääkaappi';
  @override
  String get captureTypeReceipt => 'Kuitti';
  @override
  String get captureTypeBarcode => 'Viivakoodi';
  @override
  String get sectionAccount => 'Tili';
  @override
  String get sectionPreferences => 'Asetukset';
  @override
  String get sectionApp => 'Sovellus';
  @override
  String get sectionPrivacy => 'Yksityisyys';
  @override
  String get sessionTitle => 'Istunto';
  @override
  String get guestUser => 'Vieras käyttäjä';
  @override
  String get favoritesTitle => 'Suosikit';
  @override
  String get favoritesSubtitle => 'Tallentamasi reseptit';
  @override
  String get freshnessInventorySubtitle =>
      'Tuotteet kuiteista ja viimeisistä käyttöpäivistä';
  @override
  String get pantrySyncSubtitle => 'Vedä tuoreusluettelo pilvestä';
  @override
  String get showOnboardingAgain => 'Näytä aloituskierros uudelleen';
  @override
  String get signOut => 'Kirjaudu ulos';
  @override
  String get scanSubtitleSmart => 'Älykäs ruokakomero skannaus';
  @override
  String get scanSubtitleReceipt => 'Kuitin skannaus ja tuoreuden seuranta';
  @override
  String get tooltipSettings => 'Asetukset';
  @override
  String get tooltipToggleGuide => 'Vaihtele kehysohjainta';
  @override
  String get tooltipModesAbout => 'Tietoja skannaustiloista';
  @override
  String get galleryLabel => 'Galleria';
  @override
  String get cameraLoading => 'Valmistellaan kameraa…';
  @override
  String get cameraUnavailable =>
      'Kamera ei ole käytettävissä.\\nTarkista käyttöoikeudet ja yritä uudelleen.';
  @override
  String get captureFailed =>
      'Sieppaus epäonnistui. Tarkista kameran käyttöoikeudet ja yritä uudelleen.';
  @override
  String get receiptCaptureAlign =>
      'Kohdista kuitti pystysuoraan kehykseen ja tallenna';
  @override
  String get receiptCameraHint =>
      'Avaa kamera tai valitse kuittikuva galleriasta';
  @override
  String get pickPhotoHint => 'Napauta painiketta valitaksesi valokuvan';
  @override
  String get desktopGalleryHint =>
      'Työpöytätila — valitse jääkaapin kuva galleriasta.';
  @override
  String get noCameraOnDevice => 'Tästä laitteesta ei löytynyt kameraa.';
  @override
  String get openCameraButton => 'Avaa kamera';
  @override
  String get pickPhotoButton => 'Valitse valokuva';
  @override
  String get overlayGuideOn => 'Ohje päällä';
  @override
  String get overlayGuideOff => 'Ohje pois';
  @override
  String get modeSheetTitle => 'Skannaustilat';
  @override
  String get modeSheetSubtitle =>
      'Valitse ennen sieppausta; se muuttaa tekoälyn reseptisääntöjä.';
  @override
  String get scanModeQuickLabel => 'Pikaskannaus';
  @override
  String get scanModeQuickSubtitle => 'Reseptit alle 15 min';
  @override
  String get scanModeQuickDesc =>
      'Käytännölliset arjen ateriat. Kaikki reseptit yhteensä 15 minuuttia tai vähemmän; yksinkertaisia ​​tekniikoita (yksi pannu, salaatti, pikapaista).';
  @override
  String get scanModeSurvivalLabel => 'Pelastaa';
  @override
  String get scanModeSurvivalSubtitle => 'Käytä ensin vanhentuneita tuotteita';
  @override
  String get scanModeSurvivalDesc =>
      'Vähentää jätettä. Priorisoi tuotteet, jotka näyttävät pilaantumiselta. Valinnaiset vihjekentän kohteet priorisoidaan.';
  @override
  String get scanModeChefLabel => 'Kokin tila';
  @override
  String get scanModeChefSubtitle => 'Gourmet ja yksityiskohtainen';
  @override
  String get scanModeChefDesc =>
      'Tarkempia reseptejä. Kerroksellinen tekniikka, pidemmät kypsennysajat; vähintään kaksi reseptiä merkitty kovaksi.';
  @override
  String get scanModeQuickBestFor =>
      'Arki-ilta-aterioita minimaalisella ainesosalla ja ajankäytöllä';
  @override
  String get scanModeQuickExamples =>
      '• 10 minuutin munakas\\n• Yksipannupasta\\n• Kypsentämätön kääre tai kulho';
  @override
  String get scanModeSurvivalBestFor =>
      'Käytä tavaroita ennen niiden vanhenemista ja leikkaa jätteitä';
  @override
  String get scanModeSurvivalExamples =>
      '• Puhdistettu kasviskeitto\\n• Uunin frittata\\n• Jäljelle jäänyt paistettu riisi';
  @override
  String get scanModeChefBestFor =>
      'Erikoisillallisia, vieraita tai tekniikan oppimista';
  @override
  String get scanModeChefExamples =>
      '• Pannukastikeproteiini\\n• Rapea + kermainen lautanen\\n• Karamellisoitu kasviskoriste';
  @override
  String get scanModeIdealForLabel => 'Parasta varten';
  @override
  String get scanModeExamplesLabel => 'Esimerkkiruokia';
  @override
  String get survivalHintAddFromPantry => 'Lisää tuoreudesta';
  @override
  String get filterAll => 'Kaikki';
  @override
  String get filterCritical => 'Kriittinen';
  @override
  String get filterWarning => 'Varoitus';
  @override
  String get filterSafe => 'Turvallinen';
  @override
  String get recipesScreenTitle => 'Reseptit';
  @override
  String get copyRecipe => 'Kopioida';
  @override
  String get shareRecipe => 'Jakaa';
  @override
  String get recipeCopiedSnack => 'Resepti kopioitu leikepöydälle';
  @override
  String get survivalHintTitle => 'Vanhenee pian';
  @override
  String get survivalHintOptional => 'Valinnainen - esim. maito, tomaatti, jogurtti';
  @override
  String get survivalHintPlaceholder => 'Erottele pilkuilla';
  @override
  String get scanConfirmReceiptLabel => 'Kuitin skannaus';
  @override
  String get scanSavedHistory => 'Skannaus tallennettu ruokakomerohistoriaan';
  @override
  String get scanSaveFailedPrefix => 'Skannausta ei voitu tallentaa';
  @override
  String get daysUnit => 'päivää';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Havaitut ainesosat';
  @override
  String recipesAiCount(int count) => 'AI-reseptit ·$count';
  @override
  String get galleryPickMessage => 'Valitse kuva galleriasta';
  @override
  String get favoritesEmpty =>
      'Ei vielä suosikkireseptejä.\\nNapauta sydäntä reseptituloksissa.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Resepti ${index + 1}' : 'Resepti';

  @override
  String get timeAgoJustNow => 'Juuri nyt';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m sitten';
  @override
  String timeAgoHours(int hours) => '${hours}h sitten';
  @override
  String timeAgoDays(int days) => '${days}d sitten';
  @override
  String get daysExpired => 'Vanhentunut';
  @override
  String get daysToday => 'Tänään';
  @override
  String get daysTomorrow => 'Huomenna';
  @override
  String daysCount(int days) => '$days päivää';
  @override
  String unifiedDaysRemaining(int days) => '$days päivää jäljellä';
  @override
  String productCount(int count) => '$count kohteita';
  @override
  String get unifiedSourceReceipt => 'Kuitti';
  @override
  String get unifiedSourceScan => 'Skannata';
  @override
  String unifiedLastScan(String date) => 'Viimeisin skannaus ·$date';
  @override
  String get receiptFieldProductName => 'Tuotteen nimi';
  @override
  String get receiptFieldQuantity => 'Määrä';
  @override
  String get receiptFieldCategory => 'Luokka';
  @override
  String expiryApprox(int days) => 'Parasta ennen ~$days päivää';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Puuttuvat ainesosat lisätty ostoslistalle';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ainesosat ·$recipes reseptejä';
  @override
  String get favoriteAddTooltip => 'Lisää suosikkeihin';
  @override
  String get favoriteRemoveTooltip => 'Poista suosikeista';
  @override
  String get favoriteAddedSnack => 'Lisätty suosikkeihin';
  @override
  String get favoriteRemovedSnack => 'Poistettu suosikeista';
  @override
  String get onboardingScanTitle => 'Skannaa ruokakomerosi';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Ostoslista';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Suosikit ja viimeisimmät skannaukset';
  @override
  String get onboardingFavoritesBody =>
      'Tallenna haluamasi reseptit. Viimeisimmät skannaukset avautuvat nopeasti aloitusnäytöltä.';
  @override
  String get onboardingCloudTitle => 'Pilvihistoria';
  @override
  String get onboardingCloudBody =>
      'Kirjaudu sisään tallentaaksesi skannaushistorian tilillesi ja palataksesi milloin tahansa.';
  @override
  String get onboardingPermissionsTitle => 'Kamera ja ilmoitukset';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef tarvitsee kameran jääkaapin, kuittien ja viivakoodien skannaukseen. Valinnaiset ilmoitukset muistuttavat vanhenevista elintarvikkeista.';
  @override
  String get emptyStateScanReceipt => 'Skannaa kuitti';
  @override
  String get emptyStateStartScan => 'Aloita skannaus';
  @override
  String get manageSubscriptions => 'Hallitse tilausta';
  @override
  String get notificationCriticalChannelName => 'Tuoreusvaroitukset';
  @override
  String get notificationCriticalChannelDesc => 'Tuotteet vanhenevat pian';
  @override
  String get notificationDailyChannelName => 'Päivittäinen yhteenveto';
  @override
  String get notificationDailyChannelDesc => 'Päivittäinen tuoreuden muistutus';
  @override
  String get notificationCriticalTitle => 'Tuotteet vanhenevat pian';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Tarkista Freshness-paneeli.';
  @override
  String get notificationDailyTitle => 'Tuoreuden tarkistus';
  @override
  String get notificationDailyBody =>
      'Tarkista kohteet, joita sinun pitäisi käyttää tänään.';
  @override
  String get widgetFreshnessGood => 'Tuoreus näyttää hyvältä';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count tuotteet saattavat vanhentua tänään';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kriittinen ·$warning Varoitus';
  @override
  String get categoryDairy => 'Meijeri';
  @override
  String get categoryMeat => 'Liha/kala';
  @override
  String get categoryFruit => 'Hedelmä';
  @override
  String get categoryVegetable => 'Kasvis';
  @override
  String get categoryBeverage => 'Juoma';
  @override
  String get categoryBakery => 'Leipomo';
  @override
  String get categoryPantry => 'Ruokakomero';
  @override
  String calendarMonthName(int month) => const [
        'tammikuu',
        'helmikuu',
        'maaliskuuta',
        'huhtikuu',
        'toukokuuta',
        'kesäkuuta',
        'heinäkuu',
        'elokuu',
        'syyskuu',
        'lokakuu',
        'marraskuu',
        'joulukuu',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Reseptit';
  @override
  String get recipesPlaceholderBody =>
      'Reseptitulokset näkyvät täällä onnistuneen skannauksen jälkeen.';
  @override
  String get recipeSamplePlating => 'Näytteen pinnoitus';
  @override
  String get recipeShareInstructionsHeader => 'Ohjeet:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Teema';
  @override
  String get themeSubtitle => 'Väripaletti ja tausta';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Oletuksena tummanvihreä';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Kylmiä sinisen sävyjä';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Lämpimiä meripihkan aksentteja';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Violetti aksentti tumma';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'vaalea tausta';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Lämmin kerma oranssilla aksentilla';
}
