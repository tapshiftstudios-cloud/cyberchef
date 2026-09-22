import 'strings_base.dart';

class StringsHu implements StringsBase {
  const StringsHu();

  @override
  String get analysisTitle => 'Spájz elemzése';
  @override
  String get stepPrepareImage => 'Fotó előkészítése…';
  @override
  String get stepAnalyzeAi => 'Összetevők észlelése…';
  @override
  String get stepBuildRecipes => 'Receptek készítése…';
  @override
  String get receiptAnalysisTitle => 'Olvasási nyugta';
  @override
  String get stepReceiptPrepare => 'Nyugtakép előkészítése…';
  @override
  String get stepReceiptOcr => 'Elemek felismerése…';
  @override
  String get stepReceiptInfer => 'Eltarthatósági idő becslése…';
  @override
  String get receiptNotRecognized =>
      'Nem sikerült elolvasni a nyugtát. Próbáljon tisztább, laposabb képet készíteni.';
  @override
  String get receiptNotDetected =>
      'Nem észlelhető nyugta. Igazítsa a nyugtát a keretbe.';
  @override
  String get receiptConfirmTitle => 'Erősítse meg az átvételi tételeket';
  @override
  String get receiptConfirmSubtitle =>
      'Válassza ki a hozzáadni kívánt elemeket. Nyomja meg hosszan a szerkesztéshez.';
  @override
  String get receiptConfirmSave => 'Hozzáadjuk a kamrához';
  @override
  String get receiptSelectOne => 'Válasszon ki legalább egy elemet.';
  @override
  String get receiptSaved => 'Tételek hozzáadva a frissességi készlethez';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Elküldi ezt a nyugtafotót? Az OCR elemzés a megerősítést követően indul el.';
  @override
  String get navFreshness => 'Frissesség';
  @override
  String get freshnessPanelTitle => 'Frissesség panel';
  @override
  String get freshnessCritical => 'Kritikus (0-2 nap)';
  @override
  String get freshnessWarning => 'Figyelmeztetés (3-5 nap)';
  @override
  String get freshnessSafe => 'Biztonságos (6+ nap)';
  @override
  String get freshnessEmpty =>
      'Még nincsenek nyomon követett elemek. Szkennelje be a nyugtát a leltár létrehozásához.';
  @override
  String get freshnessListTitle => 'Frissesség leltár';
  @override
  String get freshnessListEmpty => 'Nincsenek elemek ebben a szűrőben.';
  @override
  String get freshnessSuggestRecipes => 'Javasoljon recepteket ezekkel';
  @override
  String get savingsPanelTitle => 'Megtakarítási panel';
  @override
  String get savingsPanelEmptyHint =>
      'Jelölje meg a közeli lejárati termékeket „Étel készült”-ként, hogy nyomon követhesse az itt elkerülhető pazarlást.';
  @override
  String get savingsStatItems => 'Megmentve';
  @override
  String get savingsStatWaste => 'Megakadályozva a pazarlást';
  @override
  String get savingsStatMoney => 'Becs. megtakarítás';
  @override
  String get savingsDashboardTitle => 'Megtakarítási elemzés';
  @override
  String get savingsDashboardSubtitle =>
      'Összefoglaló a kukából mentett élelmiszerekről – ebben a hónapban.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? 'Ebben a hónapban 1 összetevőt mentettek ki a hulladékból'
          : '$count a hulladéktól megmentett összetevőket ebben a hónapban';
  @override
  String savingsKgPrevented(String kg) => 'Megakadályozva az élelmiszer-pazarlást:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Becsült anyagi haszon:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Az elmúlt 4 hét';
  @override
  String get savingsRecentTitle => 'Legutóbbi mentések';
  @override
  String get savingsEmptySubtitle =>
      'Még nincsenek rekordok. Ha kritikus vagy figyelmeztető elemet használ, az itt jelenik meg.';
  @override
  String get savingsHowItWorks =>
      'A lejárattól számított 5 napon belül felhasznált termékek megmentettnek számítanak. A súly és az érték becslése a kategóriák átlagából történik.';
  @override
  String get pantryNamesLocaleNote =>
      'A termékek és üzletek nevei úgy jelennek meg, ahogy a nyugtán mentve vannak; a gyakori kifejezések angol nyelven jelennek meg.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Az utolsó napon volt használva' : 'Használt$days napok vannak hátra';
  @override
  String get savingsMealMade => 'Étel készült';
  @override
  String savingsMealMadeConfirm(String name) => 'Mark$name ahogy fogyasztják?';
  @override
  String savingsRescuedSnack(String money) => 'Megtakarítás rögzített ·$money';
  @override
  String get freshnessRecipeTitle => 'Receptek készítése';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'A receptekhez legalább egy elem szükséges.';
  @override
  String get freshnessCriticalBanner => 'Hamarosan lejár';
  @override
  String get freshnessViewAll => 'Az összes megtekintése';
  @override
  String get receiptCaptureHints =>
      'Tartsa lapos nyugtát, jó világítás. A függőleges keretben minden vonal látható.';
  @override
  String get receiptPurchaseDate => 'Vásárlás dátuma';
  @override
  String get receiptTapToEdit => 'Szerkesztés';
  @override
  String get receiptEditItem => 'Elem szerkesztése';
  @override
  String get receiptEditSave => 'Megtakarítás';
  @override
  String get receiptExpiryDaysLabel => 'Becsült eltarthatósági idő (nap)';
  @override
  String get receiptMergedSnack => 'Néhány elem egyesült a meglévő rekordokkal';
  @override
  String get receiptCloudSyncFailed => 'Nem sikerült felhőbe menteni';
  @override
  String get receiptCloudSynced => 'Elemek szinkronizálva a felhőbe';
  @override
  String get pantrySyncAction => 'Frissségi adatok szinkronizálása';
  @override
  String get pantrySyncDone => 'Frissségi adatok frissítve';
  @override
  String get pantrySyncFailed => 'A szinkronizálás nem sikerült';
  @override
  String get freshnessNotificationsTitle => 'Frissségértesítések';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritikus elemek és napi emlékeztető';
  @override
  String get freshnessNotificationTimeLabel => 'Napi emlékeztető idő';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Minden nap at$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Ezen a héten:$critical kritikai,$warning figyelmeztető elemek. Először ezeket használja.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Hálózati hiba. Ellenőrizze a kapcsolatot, és próbálja újra.';
  @override
  String get geminiQuotaExceeded =>
      'Az AI-kvóta túllépve. Várjon néhány percet, és próbálja újra.';
  @override
  String get geminiBillingDepleted =>
      'A Google AI Studio előfizetési jóváírásai kimerültek. Adja hozzá a számlázást az ai.google.dev oldalon az AI-funkciók visszaállításához.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Az automatikus újrapróbálkozás itt érhető el$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Elérte a napi mesterséges intelligencia fordítási korlátot (3/3). A receptek alapfordítást használnak holnapig.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Megvan$remaining A mesterséges intelligencia fordítása(i) ma elmentek.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Elérte a kamra napi szkennelési korlátját (3). Próbáld újra holnap.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Elérte a napi nyugtaszkennelési korlátot (2). Próbáld újra holnap.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Elérte a napi receptgenerálási korlátot (3). Próbáld újra holnap.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Kérjük, várjon$seconds másodperc(ek), mielőtt újra megpróbálná.';
  @override
  String get adRewardTitlePantry => 'Elérte a kamra szkennelési korlátját';
  @override
  String get adRewardTitleReceipt => 'Elérte a nyugta szkennelési korlátját';
  @override
  String get adRewardTitleRecipe => 'Elérte a receptgenerálási korlátot';
  @override
  String get adRewardSubtitle =>
      'Nézzen meg egy rövid hirdetést, és szerezzen +1 extra felhasználást még ma (akár napi 3-at).';
  @override
  String get adRewardWatchButton => 'Hirdetés megtekintése (+1 használat)';
  @override
  String get adRewardGranted => 'Extra használat biztosított. Próbáld újra.';
  @override
  String get adRewardNotCompleted =>
      'A hirdetés nem készült el. Extra felhasználást nem engedélyeztek.';
  @override
  String get adRewardDailyCapReached =>
      'Elérte a mai hirdetési jutalomkorlátot.';
  @override
  String get geminiTimeout =>
      'A kérelem lejárt. Ellenőrizze a kapcsolatot, és próbálja újra.';
  @override
  String get geminiServerError =>
      'Az AI szolgáltatás átmenetileg nem érhető el. Kérjük, próbálja újra később.';
  @override
  String get imageNotRecognized =>
      'A kép nem ismerhető fel. Javítsa a világítást, vagy próbáljon ki más szöget.';
  @override
  String get imageNotPantry =>
      'A hűtőszekrény vagy a kamra nem látható. Kérjük, fényképezzen közvetlenül.';
  @override
  String get parseError =>
      'Nem sikerült elemezni az AI választ. Kérjük, olvassa be újra.';
  @override
  String get modelUnavailable =>
      'Az AI modell nem elérhető. Ellenőrizze az API-hozzáférését.';
  @override
  String get genericError => 'Valami elromlott. Kérjük, próbálja újra.';
  @override
  String get imageDecodeError => 'Nem sikerült elolvasni a fényképet. Próbálkozzon másik képpel.';
  @override
  String get authSubtitle => 'Intelligens kamra hozzáférés';
  @override
  String get authInitializing => 'Munkamenet előkészítése…';
  @override
  String get emailLabel => 'Email';
  @override
  String get passwordLabel => 'Jelszó';
  @override
  String get emailRequired => 'E-mail szükséges';
  @override
  String get emailInvalid => 'Érvénytelen e-mail-cím';
  @override
  String get passwordMin => 'Legalább 6 karakter';
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
  String get signIn => 'Jelentkezzen be';
  @override
  String get signUp => 'Hozzon létre fiókot';
  @override
  String get toggleToSignIn => 'Már van fiókja? Jelentkezzen be';
  @override
  String get toggleToSignUp => 'Új itt? Hozzon létre fiókot';
  @override
  String get guestContinue => 'Továbbra is vendégként';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Fiók létrehozva. Nyissa meg a megerősítő hivatkozást a postaládájában; az alkalmazás értesíti Önt az ellenőrzésről.';
  @override
  String get emailConfirmedSuccess =>
      'E-mail-címét megerősítették. Fiókja készen áll.';
  @override
  String get emailVerifiedLabel => 'E-mail igazolva';
  @override
  String get proEmailRequiredTitle => 'E-mail fiók szükséges a Pro-hoz';
  @override
  String get proEmailRequiredBody =>
      'Vendégfiókok nem vásárolhatnak Pro-t. Hozzon létre egy e-mail fiókot az adatok megőrzéséhez és a számlázás feloldásához.';
  @override
  String get proLinkAccountAction => 'Hozzon létre fiókot, és folytassa';
  @override
  String get proAccountLinked =>
      'Fiók összekapcsolva. Most folytathatja a Pro fizetést.';
  @override
  String get supabaseNotConfigured =>
      'A fiókszolgáltatás nem érhető el. Kérjük, próbálja újra később.';
  @override
  String get privacyTitle => 'Adatok és adatvédelem';
  @override
  String get privacySubtitle => 'Fényképek és fiókadatok';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'A nyugtaképek nem tárolódnak a szerveren; csak a terméklista kerül kibontásra.\\n\\n'
      'Ha bejelentkezik, a szkennelt adatok és a frissességi adatok elmenthetők a fiókjába.'
      'Az ingyenes csomag Google AdMob hirdetéseket jelenít meg; A Pronak nincsenek hirdetései.\\n\\n'
      'Nyissa meg az online adatvédelmi szabályzatot a teljes szövegért.';
  @override
  String get privacyViewOnline => 'Nyissa meg az adatvédelmi szabályzatot';
  @override
  String get pantryHistoryTitle => 'Spájz története';
  @override
  String get pantryHistoryEmpty =>
      'Még nincsenek mentett szkennelések.\\nAz előzmények felépítéséhez olvassa be a hűtőszekrényt.';
  @override
  String get pantryHistorySubtitle => 'Felhőben mentett szkennelések';
  @override
  String get splashTagline => 'Termelés és kamra – egy alkalmazás';
  @override
  String get splashLoading => 'Terhelés…';
  @override
  String get onboardingSkip => 'Kihagyás';
  @override
  String get onboardingNext => 'Következő';
  @override
  String get onboardingStart => 'Indul';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Legutóbbi szkennelések';
  @override
  String get cameraTapToOpen => 'Érintse meg az ikont a kamera megnyitásához';
  @override
  String get cameraOrGalleryHint => 'Nyissa meg a kamerát, vagy válasszon a galériából';
  @override
  String get captureOrGalleryHint => 'Rögzítse vagy válasszon a galériából';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Zárja be a kamerát';
  @override
  String get noIngredients => 'Nem észleltek összetevőket.';
  @override
  String get recipeInstructions => 'Utasítás';
  @override
  String get untitledRecipe => 'Cím nélküli recept';
  @override
  String get genericLoadError => 'Valami elromlott. Kérjük, próbálja újra.';
  @override
  String get scanConfirmTitle => 'Erősítse meg a fényképet';
  @override
  String get scanConfirmSubtitle =>
      'Elküldöd ezt a fényképet? A recept elemzése a megerősítés után kezdődik.';
  @override
  String get scanConfirmAnalyze => 'Elemezze';
  @override
  String get scanConfirmCancel => 'Mégsem';
  @override
  String get scanConfirmRetake => 'Vegye újra';
  @override
  String get scanConfirmPickOther => 'Válassz másikat';
  @override
  String get clearRecentScans => 'Törölje a legutóbbi szkenneléseket';
  @override
  String get clearRecentScansSubtitle => 'Törli a helyi előzményeket az eszközről';
  @override
  String get clearRecentScansConfirmTitle => 'Törli a legutóbbi szkenneléseket?';
  @override
  String get clearRecentScansConfirmBody =>
      'Nem vonható vissza. A kedvenceket ez nem érinti.';
  @override
  String get clearRecentScansDone => 'A legutóbbi szkennelések törölve';
  @override
  String get deleteAction => 'Töröl';
  @override
  String get imageQualityTitle => 'Alacsony fényképminőség';
  @override
  String get imageQualityDark => 'A kép túl sötét. Adjon hozzá fényt, és próbálkozzon újra.';
  @override
  String get imageQualityBlurry =>
      'A kép homályos lehet. Tartsa stabilan, és vegye újra.';
  @override
  String get imageQualityContinue => 'Mindenképpen folytasd';
  @override
  String get imageQualityRetake => 'Vegye újra';
  @override
  String receiptQueueTitle(int count) => '$count nyugta(k) offline állapotban várakoznak';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'nyugta ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Folyamat';
  @override
  String get receiptQueuedOffline =>
      'Offline. A nyugta sorban áll; folyamat csatlakoztatásakor.';
  @override
  String get receiptLowConfidenceBlock =>
      'Mentés előtt szerkessze az alacsony megbízhatóságú elemeket (ceruza ikon).';
  @override
  String get unifiedPantryTitle => 'Egységes leltár';
  @override
  String get unifiedPantryEmpty => 'Még nincsenek elemek vagy beolvasások.';
  @override
  String get searchHint => 'Termékek keresése…';
  @override
  String get navShopping => 'Bevásárlás';
  @override
  String get shoppingAddHint => 'Hiányzó elem hozzáadása';
  @override
  String get shoppingEmpty => 'A bevásárló listája üres.';
  @override
  String get shoppingClearDone => 'Törlés kész';
  @override
  String get shoppingDoneSection => 'Kész';
  @override
  String get shoppingAddFromRecipe => 'Adjon hozzá olyan tételeket, amelyek nem szerepelnek a nyugtakészletben';
  @override
  String get freshnessViewCalendar => 'Naptár';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => 'mit főzzek ma?';
  @override
  String get cookTodayNoUrgent =>
      'Nincsenek sürgős tételek. Olvassa be a nyugtát a frissesség nyomon követéséhez.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Látható a szkennelésben, de nem a nyugtakészletben: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Helyi adatok exportálása';
  @override
  String get exportLocalDataSubtitle => 'A JSON-t a vágólapra másolja';
  @override
  String get exportLocalDataDone => 'Az adatok a vágólapra másolva';
  @override
  String get clearLocalData => 'Törölje a helyi adatokat';
  @override
  String get clearLocalDataSubtitle =>
      'Frissesség, vásárlás, preferenciák (visszafordíthatatlan)';
  @override
  String get clearLocalDataConfirmTitle => 'Törli a helyi adatokat?';
  @override
  String get clearLocalDataConfirmBody =>
      'A frissességi készlet és a bevásárlólista eltávolítva az eszközről.';
  @override
  String get clearLocalDataDone => 'Helyi adatok törölve';
  @override
  String get settingsTitle => 'Beállítások elemre';
  @override
  String get languageTitle => 'Nyelv';
  @override
  String get languageSubtitle => 'Alkalmazás nyelve · 27 nyelv';
  @override
  String get localePreparingTitle => 'Nyelv frissítése';
  @override
  String get localePreparingSubtitle =>
      'Receptek és szkennelési eredmények fordítása…';
  @override
  String get dietTitle => 'Diéta preferencia';
  @override
  String get dietSubtitle => 'Receptjavaslatokra alkalmazva';
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
  String get aiUsageLimitsLoading => 'Terhelés…';
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
  String get aiUsageLabelPantry => 'Éléskamra';
  @override
  String get aiUsageLabelReceipt => 'Nyugta';
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
  String get storeUnavailable => 'Az áruház nem elérhető. Próbálja újra később.';
  @override
  String get proProductIdsNotConfigured => 'A Pro termékazonosítók nincsenek beállítva.';
  @override
  String get noProProductsFound => 'Nem található megvásárolható Pro termék.';
  @override
  String get purchaseFlowFailed => 'A vásárlás nem indítható el.';
  @override
  String get purchaseCompletedProActivated => 'Vásárlás kész. Pro csomag aktiválva.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Vásárlás kész. Az ellenőrzés sikertelen; próbálja újra hamarosan.';
  @override
  String get purchaseFailed => 'A vásárlás sikertelen.';
  @override
  String get restorePurchases => 'Vásárlások visszaállítása';
  @override
  String get restorePurchasesStarted => 'Korábbi vásárlások ellenőrzése a Play Store-ban…';
  @override
  String get nutritionTitle => 'Táplálkozás (becslés)';
  @override
  String get nutritionPerServing => 'adagonként';
  @override
  String get nutritionCalories => 'Kalória';
  @override
  String get nutritionProtein => 'Fehérje';
  @override
  String get nutritionCarbs => 'szénhidrát';
  @override
  String get nutritionFat => 'Zsír';
  @override
  String get nutritionEstimateNote =>
      'Csak mesterséges intelligencia becslése; nem orvosi vagy diétás tanácsot.';
  @override
  String get barcodeScanTitle => 'Vonalkód beolvasása';
  @override
  String get barcodeScanHint =>
      'A vonalkód igazítása a keretbe. Termékkeresés az Open Food Facts segítségével.';
  @override
  String get barcodeNotFound =>
      'A termék nem található. Inkább próbálja meg a nyugtát vagy a hűtőszekrény szkennelését.';
  @override
  String get barcodeConfirmTitle => 'Erősítse meg a terméket';
  @override
  String get barcodeAddToPantry => 'Hozzáadás a frissességi készlethez';
  @override
  String get navScan => 'Letapogatás';
  @override
  String get captureTypeFridge => 'Hűtőszekrény';
  @override
  String get captureTypeReceipt => 'Nyugta';
  @override
  String get captureTypeBarcode => 'Vonalkód';
  @override
  String get sectionAccount => 'fiók';
  @override
  String get sectionPreferences => 'Preferences';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Magánélet';
  @override
  String get sessionTitle => 'Ülés';
  @override
  String get guestUser => 'Vendég felhasználó';
  @override
  String get favoritesTitle => 'Kedvencek';
  @override
  String get favoritesSubtitle => 'Elmentett receptek';
  @override
  String get freshnessInventorySubtitle =>
      'Termékek nyugtákról és lejárati dátumokról';
  @override
  String get pantrySyncSubtitle => 'Húzza ki a frissességi leltárt a felhőből';
  @override
  String get showOnboardingAgain => 'Mutasd újra a bevezető körutat';
  @override
  String get signOut => 'Jelentkezzen ki';
  @override
  String get scanSubtitleSmart => 'Intelligens kamraszkennelés';
  @override
  String get scanSubtitleReceipt => 'Nyugta szkennelés és frissességkövetés';
  @override
  String get tooltipSettings => 'Beállítások elemre';
  @override
  String get tooltipToggleGuide => 'Keretvezető váltása';
  @override
  String get tooltipModesAbout => 'A szkennelési módokról';
  @override
  String get galleryLabel => 'Galéria';
  @override
  String get cameraLoading => 'Kamera előkészítése…';
  @override
  String get cameraUnavailable =>
      'A kamera nem érhető el.\\nEllenőrizze az engedélyeket, és próbálja újra.';
  @override
  String get captureFailed =>
      'A rögzítés nem sikerült. Ellenőrizze a kamera engedélyét, és próbálja újra.';
  @override
  String get receiptCaptureAlign =>
      'Igazítsa a nyugtát függőleges keretbe, és rögzítse';
  @override
  String get receiptCameraHint =>
      'Nyissa meg a kamerát, vagy válasszon nyugtafotót a galériából';
  @override
  String get pickPhotoHint => 'Érintse meg a gombot egy fénykép kiválasztásához';
  @override
  String get desktopGalleryHint =>
      'Asztali mód — válasszon egy hűtőszekrény fotót a galériából.';
  @override
  String get noCameraOnDevice => 'Nem található kamera ezen az eszközön.';
  @override
  String get openCameraButton => 'Nyissa meg a kamerát';
  @override
  String get pickPhotoButton => 'Válassz fotót';
  @override
  String get overlayGuideOn => 'Útmutató tovább';
  @override
  String get overlayGuideOff => 'Útmutató ki';
  @override
  String get modeSheetTitle => 'Szkennelési módok';
  @override
  String get modeSheetSubtitle =>
      'Válasszon a rögzítés előtt; megváltoztatja az AI receptszabályait.';
  @override
  String get scanModeQuickLabel => 'Gyors szkennelés';
  @override
  String get scanModeQuickSubtitle => 'Receptek 15 perc alatt';
  @override
  String get scanModeQuickDesc =>
      'Praktikus mindennapi étkezések. Az összes recept összesen 15 percet vagy kevesebbet tartalmaz; egyszerű technikák (egy serpenyő, saláta, gyorssütés).';
  @override
  String get scanModeSurvivalLabel => 'Mentés';
  @override
  String get scanModeSurvivalSubtitle => 'Először használjon lejáró elemeket';
  @override
  String get scanModeSurvivalDesc =>
      'Csökkenti a hulladékot. Előnyben részesíti azokat a tárgyakat, amelyek romlásnak tűnnek. Az opcionális tippmező elemek prioritást élveznek.';
  @override
  String get scanModeChefLabel => 'Szakács mód';
  @override
  String get scanModeChefSubtitle => 'Ínyenc és részletes';
  @override
  String get scanModeChefDesc =>
      'Kifinomultabb receptek. Réteges technikák, hosszabb főzési idők; legalább két recept kemény megjelöléssel.';
  @override
  String get scanModeQuickBestFor =>
      'Hétköznapi étkezés minimális hozzávalókkal és idővel';
  @override
  String get scanModeQuickExamples =>
      '• 10 perces omlett\\n• Egy serpenyős tészta\\n• Főzés nélküli csomagolás vagy tál';
  @override
  String get scanModeSurvivalBestFor =>
      'A tárgyak lejárata előtti felhasználása és a hulladék kivágása';
  @override
  String get scanModeSurvivalExamples =>
      '• Tiszta zöldségleves\\n• Sütőfrittata\\n• Maradék sült rizs';
  @override
  String get scanModeChefBestFor =>
      'Különleges vacsorák, vendégek, vagy egy technika tanulása';
  @override
  String get scanModeChefExamples =>
      '• Serpenyős szósz fehérje\\n• Ropogós + krémes tányér\\n• Karamellizált zöldség köret';
  @override
  String get scanModeIdealForLabel => 'A legjobb';
  @override
  String get scanModeExamplesLabel => 'Példaételek';
  @override
  String get survivalHintAddFromPantry => 'A frissességből adjuk hozzá';
  @override
  String get filterAll => 'Minden';
  @override
  String get filterCritical => 'Kritikai';
  @override
  String get filterWarning => 'Figyelmeztetés';
  @override
  String get filterSafe => 'Biztonságos';
  @override
  String get recipesScreenTitle => 'Receptek';
  @override
  String get copyRecipe => 'Másolat';
  @override
  String get shareRecipe => 'Részesedés';
  @override
  String get recipeCopiedSnack => 'A recept a vágólapra másolva';
  @override
  String get survivalHintTitle => 'Hamarosan lejár';
  @override
  String get survivalHintOptional => 'Választható – pl. tej, paradicsom, joghurt';
  @override
  String get survivalHintPlaceholder => 'Vesszővel válassza el';
  @override
  String get scanConfirmReceiptLabel => 'Nyugta szkennelés';
  @override
  String get scanSavedHistory => 'A beolvasás elmentve a kamra előzményei közé';
  @override
  String get scanSaveFailedPrefix => 'Nem sikerült menteni a beolvasást';
  @override
  String get daysUnit => 'napokon';
  @override
  String get okButton => 'RENDBEN';
  @override
  String get recipesDetectedIngredients => 'Felismert összetevők';
  @override
  String recipesAiCount(int count) => 'AI receptek ·$count';
  @override
  String get galleryPickMessage => 'Válassz egy fotót a galériából';
  @override
  String get favoritesEmpty =>
      'Még nincsenek kedvenc receptjei.\\nÉrintsd meg a szívecskét a recepteredményeken.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Recept ${index + 1}' : 'Recept';

  @override
  String get timeAgoJustNow => 'Éppen most';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m ezelőtt';
  @override
  String timeAgoHours(int hours) => '${hours}h ezelőtt';
  @override
  String timeAgoDays(int days) => '${days}d ezelőtt';
  @override
  String get daysExpired => 'Lejárt';
  @override
  String get daysToday => 'Ma';
  @override
  String get daysTomorrow => 'Holnap';
  @override
  String daysCount(int days) => '$days napokon';
  @override
  String unifiedDaysRemaining(int days) => '$days napok vannak hátra';
  @override
  String productCount(int count) => '$count tételeket';
  @override
  String get unifiedSourceReceipt => 'Nyugta';
  @override
  String get unifiedSourceScan => 'Letapogatás';
  @override
  String unifiedLastScan(String date) => 'Utolsó beolvasás ·$date';
  @override
  String get receiptFieldProductName => 'Termék neve';
  @override
  String get receiptFieldQuantity => 'Mennyiség';
  @override
  String get receiptFieldCategory => 'Kategória';
  @override
  String expiryApprox(int days) => 'Legjobb előtt ~$days napokon';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'A hiányzó összetevők hozzáadva a bevásárlólistához';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients összetevők ·$recipes receptek';
  @override
  String get favoriteAddTooltip => 'Hozzáadás a kedvencekhez';
  @override
  String get favoriteRemoveTooltip => 'Eltávolítás a kedvencek közül';
  @override
  String get favoriteAddedSnack => 'Hozzáadva a kedvencekhez';
  @override
  String get favoriteRemovedSnack => 'Eltávolítva a kedvencek közül';
  @override
  String get onboardingScanTitle => 'Szkennelje át a kamráját';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Bevásárló lista';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Kedvencek és legutóbbi szkennelések';
  @override
  String get onboardingFavoritesBody =>
      'Mentse el kedvenc receptjeit. A legutóbbi beolvasások gyorsan megnyílnak a kezdőképernyőről.';
  @override
  String get onboardingCloudTitle => 'Felhőtörténet';
  @override
  String get onboardingCloudBody =>
      'Jelentkezzen be a szkennelési előzmények fiókjába mentéséhez, és bármikor visszatérhet.';
  @override
  String get onboardingPermissionsTitle => 'Kamera és értesítések';
  @override
  String get onboardingPermissionsBody =>
      'A CyberChef kamerát igényel a hűtő, nyugták és vonalkódok szkenneléséhez. Az opcionális értesítések emlékeztetnek a lejáró élelmiszerekre.';
  @override
  String get emptyStateScanReceipt => 'Nyugta szkennelése';
  @override
  String get emptyStateStartScan => 'Szkennelés indítása';
  @override
  String get manageSubscriptions => 'Előfizetés kezelése';
  @override
  String get notificationCriticalChannelName => 'Frissségi figyelmeztetések';
  @override
  String get notificationCriticalChannelDesc => 'A termékek hamarosan lejárnak';
  @override
  String get notificationDailyChannelName => 'Napi összefoglaló';
  @override
  String get notificationDailyChannelDesc => 'Napi frissesség emlékeztető';
  @override
  String get notificationCriticalTitle => 'A termékek hamarosan lejárnak';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Ellenőrizze a Frissesség panelt.';
  @override
  String get notificationDailyTitle => 'Frissségi ellenőrzés';
  @override
  String get notificationDailyBody =>
      'Tekintse át azokat a tárgyakat, amelyeket ma érdemes használnia.';
  @override
  String get widgetFreshnessGood => 'A frissesség jól néz ki';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count a tételek még ma lejárhatnak';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritikus ·$warning figyelmeztetés';
  @override
  String get categoryDairy => 'Tejtermékek';
  @override
  String get categoryMeat => 'Hús/hal';
  @override
  String get categoryFruit => 'Gyümölcs';
  @override
  String get categoryVegetable => 'Növényi';
  @override
  String get categoryBeverage => 'Ital';
  @override
  String get categoryBakery => 'Pékség';
  @override
  String get categoryPantry => 'Éléskamra';
  @override
  String calendarMonthName(int month) => const [
        'január',
        'február',
        'március',
        'április',
        'május',
        'június',
        'július',
        'augusztus',
        'szeptember',
        'október',
        'november',
        'december',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Receptek';
  @override
  String get recipesPlaceholderBody =>
      'A sikeres szkennelés után itt jelennek meg a recept eredményei.';
  @override
  String get recipeSamplePlating => 'Mintalemezezés';
  @override
  String get recipeShareInstructionsHeader => 'Utasítás:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Téma';
  @override
  String get themeSubtitle => 'Színpaletta és háttér';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Alapértelmezett sötétzöld';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Hideg kék tónusok';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Meleg borostyán ékezetek';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Sötét lila akcentussal';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'világos háttér';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Meleg krém narancssárga akcentussal';
}
