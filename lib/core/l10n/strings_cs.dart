import 'strings_base.dart';

class StringsCs implements StringsBase {
  const StringsCs();

  @override
  String get analysisTitle => 'Analýza spíže';
  @override
  String get stepPrepareImage => 'Příprava fotografie…';
  @override
  String get stepAnalyzeAi => 'Detekce přísad…';
  @override
  String get stepBuildRecipes => 'Stavební receptury…';
  @override
  String get receiptAnalysisTitle => 'Potvrzení o přečtení';
  @override
  String get stepReceiptPrepare => 'Příprava obrázku účtenky…';
  @override
  String get stepReceiptOcr => 'Rozpoznávání položek…';
  @override
  String get stepReceiptInfer => 'Odhad trvanlivosti…';
  @override
  String get receiptNotRecognized =>
      'Účtenku se nepodařilo přečíst. Zkuste jasnější a plošší fotografii.';
  @override
  String get receiptNotDetected =>
      'Nebyla zjištěna žádná účtenka. Zarovnejte účtenku v rámečku.';
  @override
  String get receiptConfirmTitle => 'Potvrďte položky příjmu';
  @override
  String get receiptConfirmSubtitle =>
      'Vyberte položky, které chcete přidat. Dlouhým stisknutím upravíte.';
  @override
  String get receiptConfirmSave => 'Přidat do spíže';
  @override
  String get receiptSelectOne => 'Vyberte alespoň jednu položku.';
  @override
  String get receiptSaved => 'Položky přidané do inventáře čerstvosti';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Odeslat tuto fotku účtenky? Po potvrzení se spustí analýza OCR.';
  @override
  String get navFreshness => 'Svěžest';
  @override
  String get freshnessPanelTitle => 'Panel čerstvosti';
  @override
  String get freshnessCritical => 'Kritické (0–2 dny)';
  @override
  String get freshnessWarning => 'Upozornění (3–5 dní)';
  @override
  String get freshnessSafe => 'Bezpečné (6+ dní)';
  @override
  String get freshnessEmpty =>
      'Zatím žádné sledované položky. Naskenujte účtenku a vytvořte inventář.';
  @override
  String get freshnessListTitle => 'Inventář čerstvosti';
  @override
  String get freshnessListEmpty => 'V tomto filtru nejsou žádné položky.';
  @override
  String get freshnessSuggestRecipes => 'Navrhněte recepty s těmito';
  @override
  String get savingsPanelTitle => 'Úsporný panel';
  @override
  String get savingsPanelEmptyHint =>
      'Označte položky s téměř expirační dobou jako „Vyrobené jídlo“, abyste zde mohli sledovat odpad, kterému bylo zabráněno.';
  @override
  String get savingsStatItems => 'Zachráněn';
  @override
  String get savingsStatWaste => 'Zabránění plýtvání';
  @override
  String get savingsStatMoney => 'Odhad. úspory';
  @override
  String get savingsDashboardTitle => 'Analytika úspor';
  @override
  String get savingsDashboardSubtitle =>
      'Shrnutí potravin, které jste ušetřili z koše – tento měsíc.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingredience zachráněná z odpadu tento měsíc'
          : '$count přísady zachráněné z odpadu tento měsíc';
  @override
  String savingsKgPrevented(String kg) => 'Zabránění plýtvání potravinami:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Odhadovaný finanční zisk:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Poslední 4 týdny';
  @override
  String get savingsRecentTitle => 'Nedávné záchrany';
  @override
  String get savingsEmptySubtitle =>
      'Zatím žádné záznamy. Když použijete kritickou nebo varovnou položku, zobrazí se zde.';
  @override
  String get savingsHowItWorks =>
      'Položky použité do 5 dnů po vypršení platnosti se počítají jako zachráněné. Hmotnost a hodnota jsou odhadnuty z průměrů kategorií.';
  @override
  String get pantryNamesLocaleNote =>
      'Názvy produktů a obchodů se zobrazí tak, jak byly uloženy na vaší účtence; běžné termíny jsou uvedeny v angličtině.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Použito poslední den' : 'Používá se s$days zbývající dny';
  @override
  String get savingsMealMade => 'Udělané jídlo';
  @override
  String savingsMealMadeConfirm(String name) => 'Označit$name jako konzumované?';
  @override
  String savingsRescuedSnack(String money) => 'Úspory zaznamenané ·$money';
  @override
  String get freshnessRecipeTitle => 'Příprava receptů';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Pro recepty je vyžadována alespoň jedna položka.';
  @override
  String get freshnessCriticalBanner => 'Brzy vyprší platnost';
  @override
  String get freshnessViewAll => 'Zobrazit vše';
  @override
  String get receiptCaptureHints =>
      'Držte účtenku rovně, dobré osvětlení. Všechny čáry viditelné ve svislém rámečku.';
  @override
  String get receiptPurchaseDate => 'Datum nákupu';
  @override
  String get receiptTapToEdit => 'Upravit';
  @override
  String get receiptEditItem => 'Upravit položku';
  @override
  String get receiptEditSave => 'Uložit';
  @override
  String get receiptExpiryDaysLabel => 'Odhadovaná trvanlivost (dny)';
  @override
  String get receiptMergedSnack => 'Některé položky byly sloučeny s existujícími záznamy';
  @override
  String get receiptCloudSyncFailed => 'Nelze uložit do cloudu';
  @override
  String get receiptCloudSynced => 'Položky synchronizované do cloudu';
  @override
  String get pantrySyncAction => 'Synchronizujte data o aktuálnosti';
  @override
  String get pantrySyncDone => 'Údaje o čerstvosti byly aktualizovány';
  @override
  String get pantrySyncFailed => 'Synchronizace se nezdařila';
  @override
  String get freshnessNotificationsTitle => 'Oznámení o aktuálnosti';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritické položky a denní připomenutí';
  @override
  String get freshnessNotificationTimeLabel => 'Denní čas připomenutí';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Každý den v$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Tento týden:$critical kritický,$warning varovné položky. Použijte tyto jako první.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Chyba sítě. Zkontrolujte připojení a zkuste to znovu.';
  @override
  String get geminiQuotaExceeded =>
      'Kvóta AI byla překročena. Počkejte několik minut a zkuste to znovu.';
  @override
  String get geminiBillingDepleted =>
      'Předplacené kredity Google AI Studio jsou vyčerpány. Chcete-li obnovit funkce umělé inteligence, přidejte fakturaci na ai.google.dev.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automatické opakování může být k dispozici v$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Bylo dosaženo denního limitu překladů AI (3/3). Recepty používají základní překlad do zítřka.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'máte$remaining Dnes zbývá překlad(y) AI.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Bylo dosaženo denního limitu skenování spíže (3). Zkuste to prosím znovu zítra.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Bylo dosaženo denního limitu skenování účtenek (2). Zkuste to prosím znovu zítra.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Bylo dosaženo denního limitu generování receptů (3). Zkuste to prosím znovu zítra.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Čekejte prosím$seconds sekundy, než to zkusíte znovu.';
  @override
  String get adRewardTitlePantry => 'Byl dosažen limit skenování spíže';
  @override
  String get adRewardTitleReceipt => 'Byl dosažen limit skenování účtenek';
  @override
  String get adRewardTitleRecipe => 'Byl dosažen limit generování receptu';
  @override
  String get adRewardSubtitle =>
      'Podívejte se na krátkou reklamu a získejte další využití +1 ještě dnes (až 3 za den).';
  @override
  String get adRewardWatchButton => 'Přehrát reklamu (použití +1)';
  @override
  String get adRewardGranted => 'Dodatečné použití povoleno. Zkuste to znovu.';
  @override
  String get adRewardNotCompleted =>
      'Reklama nebyla dokončena. Žádné další použití nebylo povoleno.';
  @override
  String get adRewardDailyCapReached =>
      'Dosáhli jste dnešního limitu odměn za reklamu.';
  @override
  String get geminiTimeout =>
      'Časový limit požadavku vypršel. Zkontrolujte připojení a zkuste to znovu.';
  @override
  String get geminiServerError =>
      'Služba AI je dočasně nedostupná. Zkuste to znovu později.';
  @override
  String get imageNotRecognized =>
      'Obrázek nebyl rozpoznán. Zlepšete osvětlení nebo zkuste jiný úhel.';
  @override
  String get imageNotPantry =>
      'Lednice nebo spíž není vidět. Fotografujte prosím přímo.';
  @override
  String get parseError =>
      'Odezvu AI nelze analyzovat. Skenujte prosím znovu.';
  @override
  String get modelUnavailable =>
      'Model AI není k dispozici. Zkontrolujte svůj přístup k rozhraní API.';
  @override
  String get genericError => 'Něco se pokazilo. Zkuste to prosím znovu.';
  @override
  String get imageDecodeError => 'Fotku nelze přečíst. Zkuste jiný obrázek.';
  @override
  String get authSubtitle => 'Chytrý přístup do spíže';
  @override
  String get authInitializing => 'Příprava zasedání…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Heslo';
  @override
  String get emailRequired => 'E-mail je vyžadován';
  @override
  String get emailInvalid => 'Neplatný email';
  @override
  String get passwordMin => 'Minimálně 6 znaků';
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
  String get signIn => 'Přihlaste se';
  @override
  String get signUp => 'Vytvořit účet';
  @override
  String get toggleToSignIn => 'Už máte účet? Přihlaste se';
  @override
  String get toggleToSignUp => 'Jste tu nový? Vytvořit účet';
  @override
  String get guestContinue => 'Pokračovat jako host';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Účet vytvořen. Otevřete potvrzovací odkaz v doručené poště; při ověření vás aplikace upozorní.';
  @override
  String get emailConfirmedSuccess =>
      'Váš email je potvrzen. Váš účet je připraven.';
  @override
  String get emailVerifiedLabel => 'E-mail ověřen';
  @override
  String get proEmailRequiredTitle => 'Pro Pro je vyžadován e-mailový účet';
  @override
  String get proEmailRequiredBody =>
      'Účty hostů nelze zakoupit Pro. Vytvořte si e-mailový účet, abyste si uchovali svá data a odemkli fakturaci.';
  @override
  String get proLinkAccountAction => 'Vytvořte si účet a pokračujte';
  @override
  String get proAccountLinked =>
      'Účet propojen. Nyní můžete pokračovat k pokladně Pro.';
  @override
  String get supabaseNotConfigured =>
      'Služba účtu není k dispozici. Zkuste to znovu později.';
  @override
  String get privacyTitle => 'Data a soukromí';
  @override
  String get privacySubtitle => 'Fotografie a údaje o účtu';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Obrázky účtenek nejsou uloženy na serveru; extrahuje se pouze seznam produktů.\\n\\n'
      'Když jste přihlášeni, skeny a data o aktuálnosti se mohou ukládat do vašeho účtu.'
      'Bezplatný tarif zobrazuje reklamy Google AdMob; Pro nemá žádné reklamy.\\n\\n'
      'Pro úplné znění otevřete online zásady ochrany osobních údajů.';
  @override
  String get privacyViewOnline => 'Otevřete zásady ochrany osobních údajů';
  @override
  String get pantryHistoryTitle => 'Historie spíže';
  @override
  String get pantryHistoryEmpty =>
      'Zatím žádné uložené skeny.\\nProhledejte svou lednici a vytvořte historii.';
  @override
  String get pantryHistorySubtitle => 'Skenování uložené v cloudu';
  @override
  String get splashTagline => 'Produkce a spíž — jedna aplikace';
  @override
  String get splashLoading => 'Načítání…';
  @override
  String get onboardingSkip => 'Přeskočit';
  @override
  String get onboardingNext => 'Další';
  @override
  String get onboardingStart => 'Start';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Nedávné skeny';
  @override
  String get cameraTapToOpen => 'Klepnutím na ikonu otevřete fotoaparát';
  @override
  String get cameraOrGalleryHint => 'Otevřete fotoaparát nebo vyberte z galerie';
  @override
  String get captureOrGalleryHint => 'Zachyťte nebo vyberte z galerie';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Zavřete fotoaparát';
  @override
  String get noIngredients => 'Nebyly zjištěny žádné přísady.';
  @override
  String get recipeInstructions => 'Instrukce';
  @override
  String get untitledRecipe => 'Recept bez názvu';
  @override
  String get genericLoadError => 'Něco se pokazilo. Zkuste to prosím znovu.';
  @override
  String get scanConfirmTitle => 'Potvrďte fotku';
  @override
  String get scanConfirmSubtitle =>
      'Poslat tuto fotku? Po potvrzení se spustí analýza receptu.';
  @override
  String get scanConfirmAnalyze => 'Analyzovat';
  @override
  String get scanConfirmCancel => 'Zrušit';
  @override
  String get scanConfirmRetake => 'Znovudobytí';
  @override
  String get scanConfirmPickOther => 'Vyberte jiný';
  @override
  String get clearRecentScans => 'Vymazat poslední skenování';
  @override
  String get clearRecentScansSubtitle => 'Smaže místní historii v zařízení';
  @override
  String get clearRecentScansConfirmTitle => 'Vymazat poslední skenování?';
  @override
  String get clearRecentScansConfirmBody =>
      'Nelze vrátit zpět. Oblíbené nejsou ovlivněny.';
  @override
  String get clearRecentScansDone => 'Nedávné skeny byly vymazány';
  @override
  String get deleteAction => 'Vymazat';
  @override
  String get imageQualityTitle => 'Nízká kvalita fotografií';
  @override
  String get imageQualityDark => 'Obraz je příliš tmavý. Přidejte světlo a zkuste to znovu.';
  @override
  String get imageQualityBlurry =>
      'Obrázek může být rozmazaný. Držte se a znovu.';
  @override
  String get imageQualityContinue => 'Přesto pokračujte';
  @override
  String get imageQualityRetake => 'Znovudobytí';
  @override
  String receiptQueueTitle(int count) => '$count účtenky čekající offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'účtenka ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proces';
  @override
  String get receiptQueuedOffline =>
      'Offline. Příjem ve frontě; proces při připojení.';
  @override
  String get receiptLowConfidenceBlock =>
      'Před uložením upravte položky s nízkou spolehlivostí (ikona tužky).';
  @override
  String get unifiedPantryTitle => 'Jednotný inventář';
  @override
  String get unifiedPantryEmpty => 'Zatím žádné položky ani skeny.';
  @override
  String get searchHint => 'Hledat produkty…';
  @override
  String get navShopping => 'Nakupování';
  @override
  String get shoppingAddHint => 'Přidejte chybějící položku';
  @override
  String get shoppingEmpty => 'Váš nákupní seznam je prázdný.';
  @override
  String get shoppingClearDone => 'Vymazání dokončeno';
  @override
  String get shoppingDoneSection => 'Hotovo';
  @override
  String get shoppingAddFromRecipe => 'Přidejte položky, které nejsou v inventáři účtenky';
  @override
  String get freshnessViewCalendar => 'Kalendář';
  @override
  String get freshnessViewList => 'Seznam';
  @override
  String get cookToday => 'Co dnes vařit?';
  @override
  String get cookTodayNoUrgent =>
      'Žádné urgentní položky. Naskenujte účtenku a sledujte čerstvost.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Zobrazeno na skenu, ale ne v inventáři účtenky: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Exportujte místní data';
  @override
  String get exportLocalDataSubtitle => 'Zkopíruje JSON do schránky';
  @override
  String get exportLocalDataDone => 'Data zkopírována do schránky';
  @override
  String get clearLocalData => 'Smazat místní data';
  @override
  String get clearLocalDataSubtitle =>
      'Čerstvost, nakupování, preference (nevratné)';
  @override
  String get clearLocalDataConfirmTitle => 'Smazat místní data?';
  @override
  String get clearLocalDataConfirmBody =>
      'Aktuální inventář a nákupní seznam byly ze zařízení odstraněny.';
  @override
  String get clearLocalDataDone => 'Místní data byla vymazána';
  @override
  String get settingsTitle => 'Nastavení';
  @override
  String get languageTitle => 'Jazyk';
  @override
  String get languageSubtitle => 'Jazyk aplikace · 27 jazyků';
  @override
  String get localePreparingTitle => 'Aktualizace jazyka';
  @override
  String get localePreparingSubtitle =>
      'Překládání receptů a výsledků skenování…';
  @override
  String get dietTitle => 'Dietní preference';
  @override
  String get dietSubtitle => 'Použito na návrhy receptů';
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
  String get aiUsageLimitsLoading => 'Načítání…';
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
  String get aiUsageLabelPantry => 'Spíž';
  @override
  String get aiUsageLabelReceipt => 'Příjem';
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
  String get storeUnavailable => 'Obchod není dostupný. Zkuste to později.';
  @override
  String get proProductIdsNotConfigured => 'ID produktů Pro nejsou nakonfigurována.';
  @override
  String get noProProductsFound => 'Nebyly nalezeny žádné produkty Pro k zakoupení.';
  @override
  String get purchaseFlowFailed => 'Nákup se nepodařilo spustit.';
  @override
  String get purchaseCompletedProActivated => 'Nákup dokončen. Plán Pro aktivován.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Nákup dokončen. Ověření se nezdařilo; zkuste to brzy znovu.';
  @override
  String get purchaseFailed => 'Nákup se nezdařil.';
  @override
  String get restorePurchases => 'Obnovit nákupy';
  @override
  String get restorePurchasesStarted => 'Kontrola předchozích nákupů v Play Store…';
  @override
  String get nutritionTitle => 'Výživa (odhad)';
  @override
  String get nutritionPerServing => 'na porci';
  @override
  String get nutritionCalories => 'Kalorie';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Sacharidy';
  @override
  String get nutritionFat => 'Tuk';
  @override
  String get nutritionEstimateNote =>
      'pouze odhad AI; ne lékařské nebo dietní rady.';
  @override
  String get barcodeScanTitle => 'Naskenujte čárový kód';
  @override
  String get barcodeScanHint =>
      'Zarovnejte čárový kód v rámečku. Vyhledávání produktů prostřednictvím Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produkt nenalezen. Zkuste místo toho sken účtenky nebo ledničky.';
  @override
  String get barcodeConfirmTitle => 'Potvrďte produkt';
  @override
  String get barcodeAddToPantry => 'Přidat do inventáře čerstvosti';
  @override
  String get navScan => 'Skenovat';
  @override
  String get captureTypeFridge => 'Lednička';
  @override
  String get captureTypeReceipt => 'Příjem';
  @override
  String get captureTypeBarcode => 'Čárový kód';
  @override
  String get sectionAccount => 'Účet';
  @override
  String get sectionPreferences => 'Předvolby';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Soukromí';
  @override
  String get sessionTitle => 'Zasedání';
  @override
  String get guestUser => 'Uživatel host';
  @override
  String get favoritesTitle => 'Oblíbené';
  @override
  String get favoritesSubtitle => 'Uložené recepty';
  @override
  String get freshnessInventorySubtitle =>
      'Produkty z účtenek a dat expirace';
  @override
  String get pantrySyncSubtitle => 'Vytáhněte inventář čerstvosti z cloudu';
  @override
  String get showOnboardingAgain => 'Znovu zobrazit úvodní prohlídku';
  @override
  String get signOut => 'Odhlaste se';
  @override
  String get scanSubtitleSmart => 'Inteligentní skenování spíže';
  @override
  String get scanSubtitleReceipt => 'Skenování účtenek a sledování čerstvosti';
  @override
  String get tooltipSettings => 'Nastavení';
  @override
  String get tooltipToggleGuide => 'Přepnout vodítko rámu';
  @override
  String get tooltipModesAbout => 'O režimech skenování';
  @override
  String get galleryLabel => 'Galerie';
  @override
  String get cameraLoading => 'Příprava fotoaparátu…';
  @override
  String get cameraUnavailable =>
      'Kamera není k dispozici.\\nZkontrolujte oprávnění a zkuste to znovu.';
  @override
  String get captureFailed =>
      'Zachycení se nezdařilo. Zkontrolujte oprávnění fotoaparátu a zkuste to znovu.';
  @override
  String get receiptCaptureAlign =>
      'Zarovnejte účtenku do svislého rámečku a zachyťte';
  @override
  String get receiptCameraHint =>
      'Otevřete fotoaparát nebo vyberte fotografii účtenky z galerie';
  @override
  String get pickPhotoHint => 'Klepnutím na tlačítko vyberte fotografii';
  @override
  String get desktopGalleryHint =>
      'Režim plochy — vyberte fotku ledničky z galerie.';
  @override
  String get noCameraOnDevice => 'Na tomto zařízení nebyla nalezena žádná kamera.';
  @override
  String get openCameraButton => 'Otevřete fotoaparát';
  @override
  String get pickPhotoButton => 'Vyberte fotografii';
  @override
  String get overlayGuideOn => 'Průvodce dál';
  @override
  String get overlayGuideOff => 'Průvodce pryč';
  @override
  String get modeSheetTitle => 'Režimy skenování';
  @override
  String get modeSheetSubtitle =>
      'Vyberte před zachycením; mění pravidla receptů AI.';
  @override
  String get scanModeQuickLabel => 'Rychlé skenování';
  @override
  String get scanModeQuickSubtitle => 'Recepty do 15 min';
  @override
  String get scanModeQuickDesc =>
      'Praktická každodenní jídla. Všechny recepty celkem 15 minut nebo méně; jednoduché techniky (jedna pánev, salát, rychlé smažení).';
  @override
  String get scanModeSurvivalLabel => 'Zachránit';
  @override
  String get scanModeSurvivalSubtitle => 'Nejprve použijte položky s vypršením platnosti';
  @override
  String get scanModeSurvivalDesc =>
      'Snižuje odpad. Upřednostňuje položky, které se zdají být téměř zkažené. Volitelné položky pole nápovědy mají prioritu.';
  @override
  String get scanModeChefLabel => 'Režim šéfkuchaře';
  @override
  String get scanModeChefSubtitle => 'Gurmánské a detailní';
  @override
  String get scanModeChefDesc =>
      'Více rafinovaných receptů. Vrstvené techniky, delší doba vaření; alespoň dva recepty označené jako tvrdé.';
  @override
  String get scanModeQuickBestFor =>
      'Týdenní jídla s minimem ingrediencí a času';
  @override
  String get scanModeQuickExamples =>
      '• 10minutová omeleta\\n• Těstoviny z jedné pánve\\n• Obal nebo miska bez vaření';
  @override
  String get scanModeSurvivalBestFor =>
      'Používání položek před uplynutím doby použitelnosti a snižování odpadu';
  @override
  String get scanModeSurvivalExamples =>
      '• Čistící zeleninová polévka\\n• Frittata v troubě\\n• Zbylá smažená rýže';
  @override
  String get scanModeChefBestFor =>
      'Speciální večeře, hosté nebo učení techniky';
  @override
  String get scanModeChefExamples =>
      '• Proteinová omáčka na pánvi\\n• Křupavý + krémový talíř\\n• Karamelizovaná zeleninová obloha';
  @override
  String get scanModeIdealForLabel => 'Nejlepší pro';
  @override
  String get scanModeExamplesLabel => 'Příklad nádobí';
  @override
  String get survivalHintAddFromPantry => 'Přidejte z čerstvosti';
  @override
  String get filterAll => 'Vše';
  @override
  String get filterCritical => 'Kritické';
  @override
  String get filterWarning => 'Varování';
  @override
  String get filterSafe => 'Trezor';
  @override
  String get recipesScreenTitle => 'Recepty';
  @override
  String get copyRecipe => 'Kopie';
  @override
  String get shareRecipe => 'Podíl';
  @override
  String get recipeCopiedSnack => 'Recept zkopírován do schránky';
  @override
  String get survivalHintTitle => 'Brzy vyprší platnost';
  @override
  String get survivalHintOptional => 'Volitelné — např. mléko, rajče, jogurt';
  @override
  String get survivalHintPlaceholder => 'Oddělte čárkami';
  @override
  String get scanConfirmReceiptLabel => 'Sken účtenky';
  @override
  String get scanSavedHistory => 'Skenování bylo uloženo do historie spíže';
  @override
  String get scanSaveFailedPrefix => 'Sken se nepodařilo uložit';
  @override
  String get daysUnit => 'dní';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Zjištěné přísady';
  @override
  String recipesAiCount(int count) => 'AI recepty ·$count';
  @override
  String get galleryPickMessage => 'Vyberte fotografii z galerie';
  @override
  String get favoritesEmpty =>
      'Zatím žádné oblíbené recepty.\\nKlepněte na srdíčko na výsledcích receptů.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Recept ${index + 1}' : 'Recept';

  @override
  String get timeAgoJustNow => 'Právě teď';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}před m';
  @override
  String timeAgoHours(int hours) => '${hours}před h';
  @override
  String timeAgoDays(int days) => '${days}před d';
  @override
  String get daysExpired => 'Platnost vypršela';
  @override
  String get daysToday => 'Dnes';
  @override
  String get daysTomorrow => 'Zítra';
  @override
  String daysCount(int days) => '$days dní';
  @override
  String unifiedDaysRemaining(int days) => '$days zbývající dny';
  @override
  String productCount(int count) => '$count položky';
  @override
  String get unifiedSourceReceipt => 'Příjem';
  @override
  String get unifiedSourceScan => 'Skenovat';
  @override
  String unifiedLastScan(String date) => 'Poslední skenování ·$date';
  @override
  String get receiptFieldProductName => 'Název produktu';
  @override
  String get receiptFieldQuantity => 'Množství';
  @override
  String get receiptFieldCategory => 'Kategorie';
  @override
  String expiryApprox(int days) => 'Minimální trvanlivost do ~$days dní';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Do nákupního seznamu přidány chybějící přísady';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients přísady ·$recipes recepty';
  @override
  String get favoriteAddTooltip => 'Přidat k oblíbeným';
  @override
  String get favoriteRemoveTooltip => 'Odebrat z oblíbených';
  @override
  String get favoriteAddedSnack => 'Přidáno k oblíbeným';
  @override
  String get favoriteRemovedSnack => 'Odebráno z oblíbených';
  @override
  String get onboardingScanTitle => 'Naskenujte svou spíž';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Nákupní seznam';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Oblíbené a poslední skeny';
  @override
  String get onboardingFavoritesBody =>
      'Uložte si recepty, které se vám líbí. Nedávné skeny se rychle otevírají z domovské obrazovky.';
  @override
  String get onboardingCloudTitle => 'Historie cloudu';
  @override
  String get onboardingCloudBody =>
      'Přihlaste se, abyste si uložili historii skenování do svého účtu a mohli se kdykoli vrátit.';
  @override
  String get onboardingPermissionsTitle => 'Fotoaparát a oznámení';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef potřebuje fotoaparát ke skenování lednice, účtenek a čárových kódů. Volitelná oznámení připomenou blížící se expiraci.';
  @override
  String get emptyStateScanReceipt => 'Skenovat účtenku';
  @override
  String get emptyStateStartScan => 'Začít skenovat';
  @override
  String get manageSubscriptions => 'Spravovat předplatné';
  @override
  String get notificationCriticalChannelName => 'Upozornění na čerstvost';
  @override
  String get notificationCriticalChannelDesc => 'Platnost položek brzy vyprší';
  @override
  String get notificationDailyChannelName => 'Denní shrnutí';
  @override
  String get notificationDailyChannelDesc => 'Denní připomínka čerstvosti';
  @override
  String get notificationCriticalTitle => 'Platnost položek brzy vyprší';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Zkontrolujte panel čerstvosti.';
  @override
  String get notificationDailyTitle => 'Kontrola čerstvosti';
  @override
  String get notificationDailyBody =>
      'Zkontrolujte položky, které byste dnes měli použít.';
  @override
  String get widgetFreshnessGood => 'Čerstvost vypadá dobře';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count zboží může dnes vypršet';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritický ·$warning varování';
  @override
  String get categoryDairy => 'Mléko';
  @override
  String get categoryMeat => 'Maso / ryby';
  @override
  String get categoryFruit => 'Ovoce';
  @override
  String get categoryVegetable => 'Zelenina';
  @override
  String get categoryBeverage => 'Nápoj';
  @override
  String get categoryBakery => 'Pekárna';
  @override
  String get categoryPantry => 'Spíž';
  @override
  String calendarMonthName(int month) => const [
        'leden',
        'únor',
        'Pochod',
        'duben',
        'květen',
        'červen',
        'červenec',
        'srpen',
        'září',
        'říjen',
        'listopad',
        'prosinec',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Recepty';
  @override
  String get recipesPlaceholderBody =>
      'Výsledky receptu se zde objeví po úspěšném skenování.';
  @override
  String get recipeSamplePlating => 'Vzorkové pokovování';
  @override
  String get recipeShareInstructionsHeader => 'Instrukce:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Téma';
  @override
  String get themeSubtitle => 'Barevná paleta a pozadí';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Výchozí tmavě zelená';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Chladné modré tóny';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Teplé jantarové akcenty';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Fialový akcent tmavý';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'světlé pozadí';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Teplý krém s oranžovým akcentem';
}
