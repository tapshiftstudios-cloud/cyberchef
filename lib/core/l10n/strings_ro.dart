import 'strings_base.dart';

class StringsRo implements StringsBase {
  const StringsRo();

  @override
  String get analysisTitle => 'Analizând cămară';
  @override
  String get stepPrepareImage => 'Se pregătește fotografia...';
  @override
  String get stepAnalyzeAi => 'Se detectează ingrediente...';
  @override
  String get stepBuildRecipes => 'Construirea rețetelor...';
  @override
  String get receiptAnalysisTitle => 'Bon de citire';
  @override
  String get stepReceiptPrepare => 'Se pregătește imaginea chitanței…';
  @override
  String get stepReceiptOcr => 'Se recunosc elementele...';
  @override
  String get stepReceiptInfer => 'Se estimează durata de valabilitate...';
  @override
  String get receiptNotRecognized =>
      'Nu s-a putut citi chitanța. Încercați o fotografie mai clară, mai plată.';
  @override
  String get receiptNotDetected =>
      'Nu a fost detectată nicio chitanță. Aliniați chitanța în cadru.';
  @override
  String get receiptConfirmTitle => 'Confirmați elementele de primire';
  @override
  String get receiptConfirmSubtitle =>
      'Selectați elementele de adăugat. Apăsați lung pentru a edita.';
  @override
  String get receiptConfirmSave => 'Adăugați în cămară';
  @override
  String get receiptSelectOne => 'Selectați cel puțin un articol.';
  @override
  String get receiptSaved => 'Articole adăugate la inventarul de prospețime';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Trimiți această fotografie a chitanței? Analiza OCR începe după ce confirmați.';
  @override
  String get navFreshness => 'Prospeţime';
  @override
  String get freshnessPanelTitle => 'Panou de prospețime';
  @override
  String get freshnessCritical => 'Critic (0–2 zile)';
  @override
  String get freshnessWarning => 'Avertisment (3-5 zile)';
  @override
  String get freshnessSafe => 'Sigur (6+ zile)';
  @override
  String get freshnessEmpty =>
      'Încă nu există articole urmărite. Scanați o chitanță pentru a construi inventarul.';
  @override
  String get freshnessListTitle => 'Inventarul de prospețime';
  @override
  String get freshnessListEmpty => 'Nu există articole în acest filtru.';
  @override
  String get freshnessSuggestRecipes => 'Sugerați rețete cu acestea';
  @override
  String get savingsPanelTitle => 'Panoul de economii';
  @override
  String get savingsPanelEmptyHint =>
      'Marcați articolele aproape de expirare ca „Mâncare făcută” pentru a urmări deșeurile prevenite aici.';
  @override
  String get savingsStatItems => 'Salvat';
  @override
  String get savingsStatWaste => 'Deșeurile prevenite';
  @override
  String get savingsStatMoney => 'EST. economii';
  @override
  String get savingsDashboardTitle => 'Analiza economiilor';
  @override
  String get savingsDashboardSubtitle =>
      'Rezumatul alimentelor pe care le-ați salvat din coș — luna aceasta.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingredient salvat de la deșeuri luna aceasta'
          : '$count ingrediente salvate de la deșeuri luna aceasta';
  @override
  String savingsKgPrevented(String kg) => 'Prevenirea risipei alimentare:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Câștig financiar estimat:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Ultimele 4 săptămâni';
  @override
  String get savingsRecentTitle => 'Salvări recente';
  @override
  String get savingsEmptySubtitle =>
      'Nu există încă înregistrări. Când utilizați un element critic sau de avertizare, acesta apare aici.';
  @override
  String get savingsHowItWorks =>
      'Articolele utilizate în termen de 5 zile de la expirare sunt considerate ca fiind salvate. Greutatea și valoarea sunt estimate din mediile categoriei.';
  @override
  String get pantryNamesLocaleNote =>
      'Numele produselor și ale magazinelor apar așa cum sunt salvate pe chitanța dvs.; termenii obișnuiți sunt afișați în engleză.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Folosit in ultima zi' : 'Folosit cu$days zile rămase';
  @override
  String get savingsMealMade => 'Masa facuta';
  @override
  String savingsMealMadeConfirm(String name) => 'Marca$name ca consumat?';
  @override
  String savingsRescuedSnack(String money) => 'Economii înregistrate ·$money';
  @override
  String get freshnessRecipeTitle => 'Pregatirea retetelor';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Cel puțin un articol este necesar pentru rețete.';
  @override
  String get freshnessCriticalBanner => 'Expiră în curând';
  @override
  String get freshnessViewAll => 'Vezi toate';
  @override
  String get receiptCaptureHints =>
      'Ține chitanța plat, iluminare bună. Toate liniile vizibile în cadru vertical.';
  @override
  String get receiptPurchaseDate => 'Data achiziției';
  @override
  String get receiptTapToEdit => 'Edita';
  @override
  String get receiptEditItem => 'Editați elementul';
  @override
  String get receiptEditSave => 'Salva';
  @override
  String get receiptExpiryDaysLabel => 'Perioada de valabilitate estimată (zile)';
  @override
  String get receiptMergedSnack => 'Unele articole au fuzionat cu înregistrările existente';
  @override
  String get receiptCloudSyncFailed => 'Nu s-a putut salva în cloud';
  @override
  String get receiptCloudSynced => 'Elemente sincronizate cu cloud';
  @override
  String get pantrySyncAction => 'Sincronizați datele de prospețime';
  @override
  String get pantrySyncDone => 'Datele de prospețime au fost actualizate';
  @override
  String get pantrySyncFailed => 'Sincronizarea a eșuat';
  @override
  String get freshnessNotificationsTitle => 'Notificări de prospețime';
  @override
  String get freshnessNotificationsSubtitle =>
      'Elemente critice și memento zilnic';
  @override
  String get freshnessNotificationTimeLabel => 'Ora de reamintire zilnică';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'În fiecare zi la$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'În această săptămână:$critical critic,$warning elemente de avertizare. Folosiți-le mai întâi.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Eroare de rețea. Verificați conexiunea și încercați din nou.';
  @override
  String get geminiQuotaExceeded =>
      'Cota AI a fost depășită. Așteptați câteva minute și încercați din nou.';
  @override
  String get geminiBillingDepleted =>
      'Creditele de plată anticipată Google AI Studio sunt epuizate. Adăugați facturarea la ai.google.dev pentru a restabili funcțiile AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Reîncercarea automată poate fi disponibilă în$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Limita zilnică de traducere AI a fost atinsă (3/3). Rețetele folosesc traducerea de bază până mâine.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Aveți$remaining Traducerile AI au rămas astăzi.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Limita zilnică de scanare a cămarei a fost atinsă (3). Vă rugăm să încercați din nou mâine.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Limita zilnică de scanare a chitanțelor a fost atinsă (2). Vă rugăm să încercați din nou mâine.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Limita zilnică de generare a rețetei a fost atinsă (3). Vă rugăm să încercați din nou mâine.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Va rugam asteptati$seconds secundă(e) înainte de a încerca din nou.';
  @override
  String get adRewardTitlePantry => 'Limita de scanare a cămarei a fost atinsă';
  @override
  String get adRewardTitleReceipt => 'Limita de scanare a chitanțelor a fost atinsă';
  @override
  String get adRewardTitleRecipe => 'Limita de generare a rețetei a fost atinsă';
  @override
  String get adRewardSubtitle =>
      'Urmăriți un scurt anunț pentru a câștiga +1 utilizare suplimentară astăzi (până la 3 pe zi).';
  @override
  String get adRewardWatchButton => 'Urmăriți anunțul (+1 utilizare)';
  @override
  String get adRewardGranted => 'Utilizare suplimentară acordată. Încearcă din nou.';
  @override
  String get adRewardNotCompleted =>
      'Anunțul nu a fost finalizat. Nu a fost acordată o utilizare suplimentară.';
  @override
  String get adRewardDailyCapReached =>
      'Ați atins limita de recompensă publicitară de astăzi.';
  @override
  String get geminiTimeout =>
      'Solicitarea a expirat. Verificați conexiunea și încercați din nou.';
  @override
  String get geminiServerError =>
      'Serviciul AI este temporar indisponibil. Vă rugăm să încercați din nou mai târziu.';
  @override
  String get imageNotRecognized =>
      'Imaginea nu este recunoscută. Îmbunătățiți iluminarea sau încercați un alt unghi.';
  @override
  String get imageNotPantry =>
      'Frigider sau cămară nu sunt vizibile. Vă rugăm să fotografiați direct.';
  @override
  String get parseError =>
      'Nu s-a putut analiza răspunsul AI. Vă rugăm să scanați din nou.';
  @override
  String get modelUnavailable =>
      'Modelul AI indisponibil. Verificați accesul la API.';
  @override
  String get genericError => 'Ceva a mers prost. Vă rugăm să încercați din nou.';
  @override
  String get imageDecodeError => 'Nu s-a putut citi fotografia. Încearcă o altă imagine.';
  @override
  String get authSubtitle => 'Acces inteligent la cămară';
  @override
  String get authInitializing => 'Se pregătește sesiune...';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Parolă';
  @override
  String get emailRequired => 'E-mail necesar';
  @override
  String get emailInvalid => 'E-mail nevalid';
  @override
  String get passwordMin => 'Cel puțin 6 caractere';
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
  String get signIn => 'Conectare';
  @override
  String get signUp => 'Creează cont';
  @override
  String get toggleToSignIn => 'Aveți deja un cont? Conectare';
  @override
  String get toggleToSignUp => 'Nou aici? Creează cont';
  @override
  String get guestContinue => 'Continuați ca invitat';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Cont creat. Deschideți linkul de confirmare în căsuța dvs. de e-mail; aplicația vă va anunța când este verificată.';
  @override
  String get emailConfirmedSuccess =>
      'E-mailul dvs. este confirmat. Contul dvs. este gata.';
  @override
  String get emailVerifiedLabel => 'E-mail verificat';
  @override
  String get proEmailRequiredTitle => 'Este necesar un cont de e-mail pentru Pro';
  @override
  String get proEmailRequiredBody =>
      'Conturile de oaspeți nu pot achiziționa Pro. Creați un cont de e-mail pentru a vă păstra datele și pentru a debloca facturarea.';
  @override
  String get proLinkAccountAction => 'Creează cont și continuă';
  @override
  String get proAccountLinked =>
      'Contul a fost conectat. Puteți continua acum să faceți checkout Pro.';
  @override
  String get supabaseNotConfigured =>
      'Serviciul de cont indisponibil. Vă rugăm să încercați din nou mai târziu.';
  @override
  String get privacyTitle => 'Date și confidențialitate';
  @override
  String get privacySubtitle => 'Fotografii și datele contului';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Imaginile de chitanță nu sunt stocate pe server; este extrasă doar lista de produse.\\n\\n'
      'Când sunteți conectat, scanările și datele de actualitate pot fi salvate în contul dvs.'
      'Planul gratuit afișează anunțuri Google AdMob; Pro nu are reclame.\\n\\n'
      'Deschideți politica de confidențialitate online pentru textul integral.';
  @override
  String get privacyViewOnline => 'Deschideți politica de confidențialitate';
  @override
  String get pantryHistoryTitle => 'Istoria cămară';
  @override
  String get pantryHistoryEmpty =>
      'Nicio scanare salvată încă.\\nScanați-vă frigiderul pentru a crea istoric.';
  @override
  String get pantryHistorySubtitle => 'Scanări salvate în cloud';
  @override
  String get splashTagline => 'Produse și cămară — o aplicație';
  @override
  String get splashLoading => 'Încărcare…';
  @override
  String get onboardingSkip => 'Sari peste';
  @override
  String get onboardingNext => 'Următorul';
  @override
  String get onboardingStart => 'Început';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Scanări recente';
  @override
  String get cameraTapToOpen => 'Atingeți pictograma pentru a deschide camera';
  @override
  String get cameraOrGalleryHint => 'Deschideți camera sau alegeți din galerie';
  @override
  String get captureOrGalleryHint => 'Capturați sau alegeți din galerie';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Închideți camera';
  @override
  String get noIngredients => 'Nu au fost detectate ingrediente.';
  @override
  String get recipeInstructions => 'Instrucţiuni';
  @override
  String get untitledRecipe => 'Rețetă fără titlu';
  @override
  String get genericLoadError => 'Ceva a mers prost. Vă rugăm să încercați din nou.';
  @override
  String get scanConfirmTitle => 'Confirmați fotografia';
  @override
  String get scanConfirmSubtitle =>
      'Trimiți această fotografie? Analiza rețetei începe după ce confirmați.';
  @override
  String get scanConfirmAnalyze => 'Analiza';
  @override
  String get scanConfirmCancel => 'Anula';
  @override
  String get scanConfirmRetake => 'Relua';
  @override
  String get scanConfirmPickOther => 'Alege altul';
  @override
  String get clearRecentScans => 'Ștergeți scanările recente';
  @override
  String get clearRecentScansSubtitle => 'Șterge istoricul local de pe dispozitiv';
  @override
  String get clearRecentScansConfirmTitle => 'Ștergeți scanările recente?';
  @override
  String get clearRecentScansConfirmBody =>
      'Nu poate fi anulat. Favoritele nu sunt afectate.';
  @override
  String get clearRecentScansDone => 'Scanările recente au fost eliminate';
  @override
  String get deleteAction => 'Şterge';
  @override
  String get imageQualityTitle => 'Calitate scăzută a fotografiilor';
  @override
  String get imageQualityDark => 'Imaginea este prea întunecată. Adăugați lumină și reîncercați.';
  @override
  String get imageQualityBlurry =>
      'Imaginea poate fi neclară. Țineți neclintit și luați din nou.';
  @override
  String get imageQualityContinue => 'Continuați oricum';
  @override
  String get imageQualityRetake => 'Relua';
  @override
  String receiptQueueTitle(int count) => '$count chitanță(e) în așteptare offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Chitanță ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proces';
  @override
  String get receiptQueuedOffline =>
      'Offline. Chitanța pusă la coadă; proces atunci când este conectat.';
  @override
  String get receiptLowConfidenceBlock =>
      'Editați elementele cu încredere scăzută înainte de a salva (pictograma creion).';
  @override
  String get unifiedPantryTitle => 'Inventar unificat';
  @override
  String get unifiedPantryEmpty => 'Încă nu există elemente sau scanări.';
  @override
  String get searchHint => 'Cauta produse...';
  @override
  String get navShopping => 'Cumpărături';
  @override
  String get shoppingAddHint => 'Adăugați elementul lipsă';
  @override
  String get shoppingEmpty => 'Lista dvs. de cumpărături este goală.';
  @override
  String get shoppingClearDone => 'Ștergere finalizată';
  @override
  String get shoppingDoneSection => 'Făcut';
  @override
  String get shoppingAddFromRecipe => 'Adăugați articole care nu se află în inventarul de chitanțe';
  @override
  String get freshnessViewCalendar => 'Calendaristic';
  @override
  String get freshnessViewList => 'Listă';
  @override
  String get cookToday => 'Ce să gătești astăzi?';
  @override
  String get cookTodayNoUrgent =>
      'Fără articole urgente. Scanați o chitanță pentru a urmări prospețimea.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Văzut în scanare, dar nu în inventarul de chitanțe: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Exportați date locale';
  @override
  String get exportLocalDataSubtitle => 'Copiază JSON în clipboard';
  @override
  String get exportLocalDataDone => 'Datele au fost copiate în clipboard';
  @override
  String get clearLocalData => 'Ștergeți datele locale';
  @override
  String get clearLocalDataSubtitle =>
      'Prospețime, cumpărături, preferințe (ireversibile)';
  @override
  String get clearLocalDataConfirmTitle => 'Ștergeți datele locale?';
  @override
  String get clearLocalDataConfirmBody =>
      'Inventarul de prospețime și lista de cumpărături au fost eliminate de pe dispozitiv.';
  @override
  String get clearLocalDataDone => 'Datele locale au fost șterse';
  @override
  String get settingsTitle => 'Setări';
  @override
  String get languageTitle => 'Limbă';
  @override
  String get languageSubtitle => 'Limba aplicației · 27 de limbi';
  @override
  String get localePreparingTitle => 'Actualizarea limbii';
  @override
  String get localePreparingSubtitle =>
      'Se traduc rețetele și rezultatele scanării...';
  @override
  String get dietTitle => 'Preferința dietei';
  @override
  String get dietSubtitle => 'Aplicat la sugestiile de rețete';
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
  String get aiUsageLimitsLoading => 'Încărcare…';
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
  String get aiUsageLabelPantry => 'Cămară';
  @override
  String get aiUsageLabelReceipt => 'chitanta';
  @override
  String get aiUsageLabelRecipe => 'Reţetă';
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
  String get storeUnavailable => 'Magazinul nu este disponibil. Încercați mai târziu.';
  @override
  String get proProductIdsNotConfigured => 'ID-urile produselor Pro nu sunt configurate.';
  @override
  String get noProProductsFound => 'Nu s-au găsit produse Pro de cumpărat.';
  @override
  String get purchaseFlowFailed => 'Nu s-a putut începe achiziția.';
  @override
  String get purchaseCompletedProActivated => 'Achiziție finalizată. Plan Pro activat.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Achiziție finalizată. Verificarea a eșuat; încercați din nou curând.';
  @override
  String get purchaseFailed => 'Achiziția a eșuat.';
  @override
  String get restorePurchases => 'Restaurează achizițiile';
  @override
  String get restorePurchasesStarted => 'Se verifică achizițiile anterioare în Play Store…';
  @override
  String get nutritionTitle => 'Nutriție (estimare)';
  @override
  String get nutritionPerServing => 'pe porție';
  @override
  String get nutritionCalories => 'Calorii';
  @override
  String get nutritionProtein => 'Proteină';
  @override
  String get nutritionCarbs => 'Carbohidrați';
  @override
  String get nutritionFat => 'Grăsime';
  @override
  String get nutritionEstimateNote =>
      'Doar estimare AI; nu sfaturi medicale sau dietetice.';
  @override
  String get barcodeScanTitle => 'Scanați codul de bare';
  @override
  String get barcodeScanHint =>
      'Aliniați codul de bare în cadru. Căutarea produsului prin Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produsul nu a fost găsit. Încercați în schimb scanarea chitanței sau a frigiderului.';
  @override
  String get barcodeConfirmTitle => 'Confirmați produsul';
  @override
  String get barcodeAddToPantry => 'Adăugați la inventarul de prospețime';
  @override
  String get navScan => 'Scanează';
  @override
  String get captureTypeFridge => 'Frigider';
  @override
  String get captureTypeReceipt => 'chitanta';
  @override
  String get captureTypeBarcode => 'Cod de bare';
  @override
  String get sectionAccount => 'Cont';
  @override
  String get sectionPreferences => 'Preferințe';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Confidențialitate';
  @override
  String get sessionTitle => 'Sesiune';
  @override
  String get guestUser => 'Utilizator invitat';
  @override
  String get favoritesTitle => 'Favorite';
  @override
  String get favoritesSubtitle => 'Rețete pe care le-ați salvat';
  @override
  String get freshnessInventorySubtitle =>
      'Produse din bonuri si date de expirare';
  @override
  String get pantrySyncSubtitle => 'Extrageți inventarul de prospețime din cloud';
  @override
  String get showOnboardingAgain => 'Afișați din nou turul de îmbarcare';
  @override
  String get signOut => 'Sign out';
  @override
  String get scanSubtitleSmart => 'Scanare inteligentă în cămară';
  @override
  String get scanSubtitleReceipt => 'Scanarea chitanțelor și urmărirea prospețimii';
  @override
  String get tooltipSettings => 'Setări';
  @override
  String get tooltipToggleGuide => 'Comutați ghidul de cadru';
  @override
  String get tooltipModesAbout => 'Despre modurile de scanare';
  @override
  String get galleryLabel => 'Galerie';
  @override
  String get cameraLoading => 'Se pregătește camera...';
  @override
  String get cameraUnavailable =>
      'Camera foto indisponibilă.\\nVerificați permisiunile și încercați din nou.';
  @override
  String get captureFailed =>
      'Captura nu a reușit. Verificați permisiunea camerei și încercați din nou.';
  @override
  String get receiptCaptureAlign =>
      'Aliniați chitanța în cadrul vertical și capturați';
  @override
  String get receiptCameraHint =>
      'Deschideți camera sau alegeți o fotografie a chitanței din galerie';
  @override
  String get pickPhotoHint => 'Atingeți butonul pentru a alege o fotografie';
  @override
  String get desktopGalleryHint =>
      'Modul desktop — alegeți o fotografie a frigiderului din galerie.';
  @override
  String get noCameraOnDevice => 'Nu a fost găsită nicio cameră pe acest dispozitiv.';
  @override
  String get openCameraButton => 'Deschideți camera';
  @override
  String get pickPhotoButton => 'Alege fotografia';
  @override
  String get overlayGuideOn => 'Ghid pe';
  @override
  String get overlayGuideOff => 'Ghidul oprit';
  @override
  String get modeSheetTitle => 'Moduri de scanare';
  @override
  String get modeSheetSubtitle =>
      'Alegeți înainte de capturare; schimbă regulile rețetei AI.';
  @override
  String get scanModeQuickLabel => 'Scanare rapidă';
  @override
  String get scanModeQuickSubtitle => 'Rețete sub 15 min';
  @override
  String get scanModeQuickDesc =>
      'Mese practice de zi cu zi. Toate rețetele însumează 15 minute sau mai puțin; tehnici simple (o tigaie, salată, prăjire rapidă).';
  @override
  String get scanModeSurvivalLabel => 'Salvare';
  @override
  String get scanModeSurvivalSubtitle => 'Folosiți mai întâi articolele care expiră';
  @override
  String get scanModeSurvivalDesc =>
      'Reduce deșeurile. Prioritizează articolele care par aproape de a se strica. Elementele opționale din câmpul indicii sunt prioritizate.';
  @override
  String get scanModeChefLabel => 'Modul bucătar';
  @override
  String get scanModeChefSubtitle => 'Gourmet & detaliat';
  @override
  String get scanModeChefDesc =>
      'Rețete mai rafinate. Tehnici stratificate, timpi de gătire mai lungi; cel putin doua retete marcate greu.';
  @override
  String get scanModeQuickBestFor =>
      'Mese de saptamana cu ingrediente si timp minim';
  @override
  String get scanModeQuickExamples =>
      '• Omletă de 10 minute\\n• Paste într-o singură tigaie\\n• Folie sau bol fără gătit';
  @override
  String get scanModeSurvivalBestFor =>
      'Folosirea articolelor înainte ca acestea să expire și tăierea deșeurilor';
  @override
  String get scanModeSurvivalExamples =>
      '• Curățați supa de legume\\n• Frittata la cuptor\\n• Restul de orez prăjit';
  @override
  String get scanModeChefBestFor =>
      'Cine speciale, invitați sau învățarea unei tehnici';
  @override
  String get scanModeChefExamples =>
      '• Proteine ​​cu sos de tigaie\\n• Farfurie crocantă + cremoasă\\n• Garnitură de legume caramelizate';
  @override
  String get scanModeIdealForLabel => 'Cel mai bun pentru';
  @override
  String get scanModeExamplesLabel => 'Exemple de feluri de mâncare';
  @override
  String get survivalHintAddFromPantry => 'Adăugați din prospețime';
  @override
  String get filterAll => 'Toate';
  @override
  String get filterCritical => 'Critic';
  @override
  String get filterWarning => 'Avertizare';
  @override
  String get filterSafe => 'Seif';
  @override
  String get recipesScreenTitle => 'Rețete';
  @override
  String get copyRecipe => 'Copie';
  @override
  String get shareRecipe => 'Distribuie';
  @override
  String get recipeCopiedSnack => 'Rețeta a fost copiată în clipboard';
  @override
  String get survivalHintTitle => 'Expiră în curând';
  @override
  String get survivalHintOptional => 'Opțional - de ex. lapte, roșii, iaurt';
  @override
  String get survivalHintPlaceholder => 'Separați prin virgule';
  @override
  String get scanConfirmReceiptLabel => 'Scanare chitanță';
  @override
  String get scanSavedHistory => 'Scanarea a fost salvată în istoricul cămară';
  @override
  String get scanSaveFailedPrefix => 'Scanarea nu a putut fi salvată';
  @override
  String get daysUnit => 'zile';
  @override
  String get okButton => 'Bine';
  @override
  String get recipesDetectedIngredients => 'Ingredientele detectate';
  @override
  String recipesAiCount(int count) => 'Rețete AI ·$count';
  @override
  String get galleryPickMessage => 'Alegeți o fotografie din galerie';
  @override
  String get favoritesEmpty =>
      'Nicio rețetă preferată încă.\\nAtingeți inima pe rezultatele rețetei.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Reteta ${index + 1}' : 'Reţetă';

  @override
  String get timeAgoJustNow => 'Chiar acum';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m în urmă';
  @override
  String timeAgoHours(int hours) => '${hours}h în urmă';
  @override
  String timeAgoDays(int days) => '${days}d acum d';
  @override
  String get daysExpired => 'Expirat';
  @override
  String get daysToday => 'Astăzi';
  @override
  String get daysTomorrow => 'Mâine';
  @override
  String daysCount(int days) => '$days zile';
  @override
  String unifiedDaysRemaining(int days) => '$days zile rămase';
  @override
  String productCount(int count) => '$count articole';
  @override
  String get unifiedSourceReceipt => 'chitanta';
  @override
  String get unifiedSourceScan => 'Scanează';
  @override
  String unifiedLastScan(String date) => 'Ultima scanare ·$date';
  @override
  String get receiptFieldProductName => 'Numele produsului';
  @override
  String get receiptFieldQuantity => 'Cantitate';
  @override
  String get receiptFieldCategory => 'Categorie';
  @override
  String expiryApprox(int days) => 'Cel mai bine înainte de ~$days zile';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Lipsesc ingrediente adăugate la lista de cumpărături';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingrediente ·$recipes retete';
  @override
  String get favoriteAddTooltip => 'Adăugați la favorite';
  @override
  String get favoriteRemoveTooltip => 'Eliminați din favorite';
  @override
  String get favoriteAddedSnack => 'Adăugat la favorite';
  @override
  String get favoriteRemovedSnack => 'Eliminat din favorite';
  @override
  String get onboardingScanTitle => 'Scanează-ți cămara';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Lista de cumpărături';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favorite și scanări recente';
  @override
  String get onboardingFavoritesBody =>
      'Salvați rețetele care vă plac. Scanările recente se deschid rapid din ecranul de start.';
  @override
  String get onboardingCloudTitle => 'Istoria cloud';
  @override
  String get onboardingCloudBody =>
      'Conectați-vă pentru a salva istoricul scanărilor în contul dvs. și reveniți oricând.';
  @override
  String get onboardingPermissionsTitle => 'Cameră și notificări';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef are nevoie de cameră pentru a scana frigiderul, bonurile și codurile de bare. Notificările opționale vă amintesc când alimentele expiră curând.';
  @override
  String get emptyStateScanReceipt => 'Scanează bonul';
  @override
  String get emptyStateStartScan => 'Începe scanarea';
  @override
  String get manageSubscriptions => 'Gestionează abonamentul';
  @override
  String get notificationCriticalChannelName => 'Alerte de prospețime';
  @override
  String get notificationCriticalChannelDesc => 'Articole care expiră în curând';
  @override
  String get notificationDailyChannelName => 'Rezumat zilnic';
  @override
  String get notificationDailyChannelDesc => 'Memento zilnic de prospețime';
  @override
  String get notificationCriticalTitle => 'Articole care expiră în curând';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Verificați panoul Prospețime.';
  @override
  String get notificationDailyTitle => 'Verificarea prospețimii';
  @override
  String get notificationDailyBody =>
      'Examinați articolele pe care ar trebui să le utilizați astăzi.';
  @override
  String get widgetFreshnessGood => 'Prospețimea arată bine';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count articolele pot expira astăzi';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical critic ·$warning avertizare';
  @override
  String get categoryDairy => 'Lactate';
  @override
  String get categoryMeat => 'Carne / peste';
  @override
  String get categoryFruit => 'Fructe';
  @override
  String get categoryVegetable => 'Vegetal';
  @override
  String get categoryBeverage => 'Băutură';
  @override
  String get categoryBakery => 'Brutărie';
  @override
  String get categoryPantry => 'Cămară';
  @override
  String calendarMonthName(int month) => const [
        'ianuarie',
        'februarie',
        'martie',
        'aprilie',
        'mai',
        'iunie',
        'iulie',
        'august',
        'septembrie',
        'octombrie',
        'noiembrie',
        'decembrie',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Rețete';
  @override
  String get recipesPlaceholderBody =>
      'Rezultatele rețetei vor apărea aici după o scanare reușită.';
  @override
  String get recipeSamplePlating => 'Placarea probei';
  @override
  String get recipeShareInstructionsHeader => 'Instrucţiuni:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Temă';
  @override
  String get themeSubtitle => 'Paleta de culori și fundal';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Implicit verde închis';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Tonuri reci de albastru';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Accente calde de chihlimbar';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Accent violet întunecat';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Fundal deschis';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Crema calda cu accent portocaliu';
}
