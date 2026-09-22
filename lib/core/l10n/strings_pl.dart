import 'strings_base.dart';

class StringsPl implements StringsBase {
  const StringsPl();

  @override
  String get analysisTitle => 'Analiza spiżarni';
  @override
  String get stepPrepareImage => 'Przygotowuję zdjęcie…';
  @override
  String get stepAnalyzeAi => 'Wykrywanie składników…';
  @override
  String get stepBuildRecipes => 'Przepisy budowlane…';
  @override
  String get receiptAnalysisTitle => 'Czytanie rachunku';
  @override
  String get stepReceiptPrepare => 'Przygotowuję obraz paragonu…';
  @override
  String get stepReceiptOcr => 'Rozpoznawanie przedmiotów…';
  @override
  String get stepReceiptInfer => 'Szacowanie trwałości…';
  @override
  String get receiptNotRecognized =>
      'Nie udało się odczytać potwierdzenia. Spróbuj wyraźniejszego, bardziej płaskiego zdjęcia.';
  @override
  String get receiptNotDetected =>
      'Nie wykryto rachunku. Dopasuj paragon do ramki.';
  @override
  String get receiptConfirmTitle => 'Potwierdź pozycje odbioru';
  @override
  String get receiptConfirmSubtitle =>
      'Wybierz elementy do dodania. Naciśnij długo, aby edytować.';
  @override
  String get receiptConfirmSave => 'Dodaj do spiżarni';
  @override
  String get receiptSelectOne => 'Wybierz co najmniej jeden element.';
  @override
  String get receiptSaved => 'Artykuły dodane do zapasów świeżości';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Wysłać to zdjęcie rachunku? Analiza OCR rozpoczyna się po potwierdzeniu.';
  @override
  String get navFreshness => 'Świeżość';
  @override
  String get freshnessPanelTitle => 'Panel świeżości';
  @override
  String get freshnessCritical => 'Krytyczny (0–2 dni)';
  @override
  String get freshnessWarning => 'Ostrzeżenie (3–5 dni)';
  @override
  String get freshnessSafe => 'Bezpieczny (ponad 6 dni)';
  @override
  String get freshnessEmpty =>
      'Nie ma jeszcze śledzonych elementów. Zeskanuj paragon, aby utworzyć inwentarz.';
  @override
  String get freshnessListTitle => 'Inwentarz świeżości';
  @override
  String get freshnessListEmpty => 'Brak elementów w tym filtrze.';
  @override
  String get freshnessSuggestRecipes => 'Sugeruj przepisy z nimi';
  @override
  String get savingsPanelTitle => 'Panel oszczędności';
  @override
  String get savingsPanelEmptyHint =>
      'Oznacz produkty, których termin ważności dobiegł końca, jako „Wyprodukowany posiłek”, aby śledzić, jakim odpadom udało się zapobiec.';
  @override
  String get savingsStatItems => 'Uratowany';
  @override
  String get savingsStatWaste => 'Zapobieganie powstawaniu odpadów';
  @override
  String get savingsStatMoney => 'Szac. oszczędności';
  @override
  String get savingsDashboardTitle => 'Analityka oszczędności';
  @override
  String get savingsDashboardSubtitle =>
      'Podsumowanie żywności zaoszczędzonej w koszu — w tym miesiącu.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? 'W tym miesiącu udało się zaoszczędzić 1 składnik'
          : '$count składniki zaoszczędzone w tym miesiącu przed odpadami';
  @override
  String savingsKgPrevented(String kg) => 'Zapobiegnięto marnowaniu żywności:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Szacunkowy zysk finansowy:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Ostatnie 4 tygodnie';
  @override
  String get savingsRecentTitle => 'Ostatnie akcje ratunkowe';
  @override
  String get savingsEmptySubtitle =>
      'Nie ma jeszcze żadnych rekordów. Kiedy używasz elementu krytycznego lub ostrzegawczego, pojawia się on tutaj.';
  @override
  String get savingsHowItWorks =>
      'Przedmioty użyte w ciągu 5 dni od daty ważności liczą się jako uratowane. Waga i wartość są szacowane na podstawie średnich kategorii.';
  @override
  String get pantryNamesLocaleNote =>
      'Nazwy produktów i sklepów pojawiają się w postaci zapisanej na paragonie; popularne terminy są pokazane w języku angielskim.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Używany ostatniego dnia' : 'Używany z$days pozostało dni';
  @override
  String get savingsMealMade => 'Posiłek zrobiony';
  @override
  String savingsMealMadeConfirm(String name) => 'Ocena$name jako zużyty?';
  @override
  String savingsRescuedSnack(String money) => 'Zarejestrowane oszczędności ·$money';
  @override
  String get freshnessRecipeTitle => 'Przygotowywanie receptur';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Dla przepisów wymagany jest co najmniej jeden element.';
  @override
  String get freshnessCriticalBanner => 'Wkrótce wygaśnie';
  @override
  String get freshnessViewAll => 'Zobacz wszystkie';
  @override
  String get receiptCaptureHints =>
      'Trzymaj paragon płasko, dobre oświetlenie. Wszystkie linie widoczne w ramce pionowej.';
  @override
  String get receiptPurchaseDate => 'Data zakupu';
  @override
  String get receiptTapToEdit => 'Redagować';
  @override
  String get receiptEditItem => 'Edytuj element';
  @override
  String get receiptEditSave => 'Ratować';
  @override
  String get receiptExpiryDaysLabel => 'Szacowany okres trwałości (dni)';
  @override
  String get receiptMergedSnack => 'Niektóre elementy zostały połączone z istniejącymi rekordami';
  @override
  String get receiptCloudSyncFailed => 'Nie można zapisać w chmurze';
  @override
  String get receiptCloudSynced => 'Elementy zsynchronizowane z chmurą';
  @override
  String get pantrySyncAction => 'Synchronizuj dane dotyczące świeżości';
  @override
  String get pantrySyncDone => 'Zaktualizowano dane dotyczące świeżości';
  @override
  String get pantrySyncFailed => 'Synchronizacja nie powiodła się';
  @override
  String get freshnessNotificationsTitle => 'Powiadomienia o świeżości';
  @override
  String get freshnessNotificationsSubtitle =>
      'Elementy krytyczne i codzienne przypomnienia';
  @override
  String get freshnessNotificationTimeLabel => 'Codzienny czas przypomnienia';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Codziennie o godz$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'W tym tygodniu:$critical krytyczny,$warning elementy ostrzegawcze. Użyj ich najpierw.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Błąd sieci. Sprawdź połączenie i spróbuj ponownie.';
  @override
  String get geminiQuotaExceeded =>
      'Przekroczono limit AI. Poczekaj kilka minut i spróbuj ponownie.';
  @override
  String get geminiBillingDepleted =>
      'Skończyły się środki w przedpłacie Google AI Studio. Dodaj rozliczenia na ai.google.dev, aby przywrócić funkcje AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Automatyczne ponawianie prób może być dostępne w$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Osiągnięto dzienny limit tłumaczeń AI (3/3). Przepisy korzystają z podstawowego tłumaczenia do jutra.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Masz$remaining Tłumaczenie(-a) AI opuściło dzisiaj.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Osiągnięto dzienny limit skanowania spiżarni (3). Spróbuj ponownie jutro.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Osiągnięto dzienny limit skanowania paragonów (2). Spróbuj ponownie jutro.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Osiągnięto dzienny limit generowania receptur (3). Spróbuj ponownie jutro.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Proszę czekać$seconds sekundy przed ponowną próbą.';
  @override
  String get adRewardTitlePantry => 'Osiągnięto limit skanowania spiżarni';
  @override
  String get adRewardTitleReceipt => 'Osiągnięto limit skanowania paragonów';
  @override
  String get adRewardTitleRecipe => 'Osiągnięto limit generowania receptury';
  @override
  String get adRewardSubtitle =>
      'Obejrzyj krótką reklamę, aby zyskać +1 dodatkowe użycie dzisiaj (do 3 dziennie).';
  @override
  String get adRewardWatchButton => 'Obejrzyj reklamę (+1 użycie)';
  @override
  String get adRewardGranted => 'Dodatkowe wykorzystanie przyznane. Spróbuj ponownie.';
  @override
  String get adRewardNotCompleted =>
      'Ogłoszenie nie zostało ukończone. Nie przyznano żadnego dodatkowego użytkowania.';
  @override
  String get adRewardDailyCapReached =>
      'Osiągnąłeś dzisiejszy limit nagród za reklamy.';
  @override
  String get geminiTimeout =>
      'Upłynął limit czasu żądania. Sprawdź połączenie i spróbuj ponownie.';
  @override
  String get geminiServerError =>
      'Usługa AI jest chwilowo niedostępna. Spróbuj ponownie później.';
  @override
  String get imageNotRecognized =>
      'Obraz nie został rozpoznany. Popraw oświetlenie lub wypróbuj inny kąt.';
  @override
  String get imageNotPantry =>
      'Nie widać lodówki ani spiżarni. Proszę sfotografować bezpośrednio.';
  @override
  String get parseError =>
      'Nie można przeanalizować odpowiedzi AI. Proszę zeskanować ponownie.';
  @override
  String get modelUnavailable =>
      'Model AI niedostępny. Sprawdź swój dostęp do API.';
  @override
  String get genericError => 'Coś poszło nie tak. Spróbuj ponownie.';
  @override
  String get imageDecodeError => 'Nie udało się odczytać zdjęcia. Wypróbuj inny obraz.';
  @override
  String get authSubtitle => 'Inteligentny dostęp do spiżarni';
  @override
  String get authInitializing => 'Przygotowuję sesję…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Hasło';
  @override
  String get emailRequired => 'Wymagany e-mail';
  @override
  String get emailInvalid => 'Nieprawidłowy adres e-mail';
  @override
  String get passwordMin => 'Co najmniej 6 znaków';
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
  String get signIn => 'Zalogować się';
  @override
  String get signUp => 'Utwórz konto';
  @override
  String get toggleToSignIn => 'Masz już konto? Zalogować się';
  @override
  String get toggleToSignUp => 'Nowy tutaj? Utwórz konto';
  @override
  String get guestContinue => 'Kontynuuj jako gość';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Konto utworzone. Otwórz link potwierdzający w swojej skrzynce odbiorczej; aplikacja powiadomi Cię o weryfikacji.';
  @override
  String get emailConfirmedSuccess =>
      'Twój e-mail został potwierdzony. Twoje konto jest gotowe.';
  @override
  String get emailVerifiedLabel => 'Adres e-mail zweryfikowany';
  @override
  String get proEmailRequiredTitle => 'Konto e-mail wymagane dla wersji Pro';
  @override
  String get proEmailRequiredBody =>
      'Konta gości nie umożliwiają zakupu wersji Pro. Utwórz konto e-mail, aby zachować swoje dane i odblokować płatności.';
  @override
  String get proLinkAccountAction => 'Utwórz konto i kontynuuj';
  @override
  String get proAccountLinked =>
      'Konto połączone. Możesz teraz przejść do płatności Pro.';
  @override
  String get supabaseNotConfigured =>
      'Usługa konta niedostępna. Spróbuj ponownie później.';
  @override
  String get privacyTitle => 'Dane i prywatność';
  @override
  String get privacySubtitle => 'Zdjęcia i dane konta';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Obrazy paragonów nie są przechowywane na serwerze; wyodrębniana jest tylko lista produktów.\\n\\n'
      'Po zalogowaniu się na Twoim koncie mogą zostać zapisane skany i dane dotyczące świeżości.'
      'Bezpłatny plan wyświetla reklamy Google AdMob; Pro nie zawiera reklam.\\n\\n'
      'Otwórz politykę prywatności online, aby zobaczyć pełny tekst.';
  @override
  String get privacyViewOnline => 'Otwórz politykę prywatności';
  @override
  String get pantryHistoryTitle => 'Historia spiżarni';
  @override
  String get pantryHistoryEmpty =>
      'Nie zapisano jeszcze żadnych skanów.\\nPrzeskanuj lodówkę, aby utworzyć historię.';
  @override
  String get pantryHistorySubtitle => 'Skany zapisane w chmurze';
  @override
  String get splashTagline => 'Produkcja i spiżarnia — jedna aplikacja';
  @override
  String get splashLoading => 'Załadunek…';
  @override
  String get onboardingSkip => 'Pominąć';
  @override
  String get onboardingNext => 'Następny';
  @override
  String get onboardingStart => 'Start';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Ostatnie skany';
  @override
  String get cameraTapToOpen => 'Stuknij ikonę, aby otworzyć kamerę';
  @override
  String get cameraOrGalleryHint => 'Otwórz kamerę lub wybierz z galerii';
  @override
  String get captureOrGalleryHint => 'Przechwytuj lub wybierz z galerii';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Zamknij kamerę';
  @override
  String get noIngredients => 'Nie wykryto żadnych składników.';
  @override
  String get recipeInstructions => 'Instrukcje';
  @override
  String get untitledRecipe => 'Przepis bez tytułu';
  @override
  String get genericLoadError => 'Coś poszło nie tak. Spróbuj ponownie.';
  @override
  String get scanConfirmTitle => 'Potwierdź zdjęcie';
  @override
  String get scanConfirmSubtitle =>
      'Wysłać to zdjęcie? Analiza przepisu rozpoczyna się po potwierdzeniu.';
  @override
  String get scanConfirmAnalyze => 'Analizować';
  @override
  String get scanConfirmCancel => 'Anulować';
  @override
  String get scanConfirmRetake => 'Odzyskać';
  @override
  String get scanConfirmPickOther => 'Wybierz inny';
  @override
  String get clearRecentScans => 'Wyczyść ostatnie skany';
  @override
  String get clearRecentScansSubtitle => 'Usuwa historię lokalną na urządzeniu';
  @override
  String get clearRecentScansConfirmTitle => 'Wyczyścić ostatnie skany?';
  @override
  String get clearRecentScansConfirmBody =>
      'Nie można tego cofnąć. Nie ma to wpływu na ulubione.';
  @override
  String get clearRecentScansDone => 'Ostatnie skany zostały usunięte';
  @override
  String get deleteAction => 'Usuwać';
  @override
  String get imageQualityTitle => 'Niska jakość zdjęć';
  @override
  String get imageQualityDark => 'Obraz jest zbyt ciemny. Dodaj światło i spróbuj ponownie.';
  @override
  String get imageQualityBlurry =>
      'Obraz może być niewyraźny. Trzymaj się mocno i powtórz.';
  @override
  String get imageQualityContinue => 'Kontynuuj mimo to';
  @override
  String get imageQualityRetake => 'Odzyskać';
  @override
  String receiptQueueTitle(int count) => '$count rachunki oczekujące w trybie offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Paragon ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proces';
  @override
  String get receiptQueuedOffline =>
      'Nieaktywny. Odbiór w kolejce; proces po podłączeniu.';
  @override
  String get receiptLowConfidenceBlock =>
      'Przed zapisaniem edytuj elementy o niskim poziomie zaufania (ikona ołówka).';
  @override
  String get unifiedPantryTitle => 'Ujednolicony asortyment';
  @override
  String get unifiedPantryEmpty => 'Nie ma jeszcze żadnych elementów ani skanów.';
  @override
  String get searchHint => 'Wyszukaj produkty…';
  @override
  String get navShopping => 'Zakupy';
  @override
  String get shoppingAddHint => 'Dodaj brakujący element';
  @override
  String get shoppingEmpty => 'Twoja lista zakupów jest pusta.';
  @override
  String get shoppingClearDone => 'Wyczyść zakończone';
  @override
  String get shoppingDoneSection => 'Zrobione';
  @override
  String get shoppingAddFromRecipe => 'Dodaj pozycje, których nie ma w magazynie paragonu';
  @override
  String get freshnessViewCalendar => 'Kalendarz';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => 'Co dzisiaj ugotować?';
  @override
  String get cookTodayNoUrgent =>
      'Żadnych pilnych spraw. Zeskanuj paragon, aby śledzić świeżość.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Widoczne na skanie, ale nie na paragonie: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Eksportuj dane lokalne';
  @override
  String get exportLocalDataSubtitle => 'Kopiuje JSON do schowka';
  @override
  String get exportLocalDataDone => 'Dane skopiowane do schowka';
  @override
  String get clearLocalData => 'Usuń dane lokalne';
  @override
  String get clearLocalDataSubtitle =>
      'Świeżość, zakupy, preferencje (nieodwracalne)';
  @override
  String get clearLocalDataConfirmTitle => 'Usunąć dane lokalne?';
  @override
  String get clearLocalDataConfirmBody =>
      'Zapas świeżości i lista zakupów zostały usunięte z urządzenia.';
  @override
  String get clearLocalDataDone => 'Dane lokalne zostały usunięte';
  @override
  String get settingsTitle => 'Ustawienia';
  @override
  String get languageTitle => 'Język';
  @override
  String get languageSubtitle => 'Język aplikacji · 27 języków';
  @override
  String get localePreparingTitle => 'Aktualizacja języka';
  @override
  String get localePreparingSubtitle =>
      'Tłumaczenie przepisów i wyników skanowania…';
  @override
  String get dietTitle => 'Preferencje dietetyczne';
  @override
  String get dietSubtitle => 'Zastosowano do sugestii dotyczących przepisów';
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
  String get aiUsageLimitsLoading => 'Załadunek…';
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
  String get aiUsageLabelPantry => 'Spiżarnia';
  @override
  String get aiUsageLabelReceipt => 'Paragon';
  @override
  String get aiUsageLabelRecipe => 'Przepis';
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
  String get storeUnavailable => 'Sklep jest niedostępny. Spróbuj ponownie później.';
  @override
  String get proProductIdsNotConfigured => 'Identyfikatory produktów Pro nie są skonfigurowane.';
  @override
  String get noProProductsFound => 'Nie znaleziono produktów Pro do zakupu.';
  @override
  String get purchaseFlowFailed => 'Nie udało się rozpocząć zakupu.';
  @override
  String get purchaseCompletedProActivated => 'Zakup zakończony. Plan Pro aktywowany.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Zakup zakończony. Weryfikacja nie powiodła się; spróbuj ponownie wkrótce.';
  @override
  String get purchaseFailed => 'Zakup nie powiódł się.';
  @override
  String get restorePurchases => 'Przywróć zakupy';
  @override
  String get restorePurchasesStarted => 'Sprawdzanie poprzednich zakupów w Play Store…';
  @override
  String get nutritionTitle => 'Odżywianie (oszacowanie)';
  @override
  String get nutritionPerServing => 'na porcję';
  @override
  String get nutritionCalories => 'Kalorie';
  @override
  String get nutritionProtein => 'Białko';
  @override
  String get nutritionCarbs => 'Węglowodany';
  @override
  String get nutritionFat => 'Tłuszcz';
  @override
  String get nutritionEstimateNote =>
      'Tylko szacunki AI; a nie porady lekarskie lub dietetyczne.';
  @override
  String get barcodeScanTitle => 'Zeskanuj kod kreskowy';
  @override
  String get barcodeScanHint =>
      'Wyrównaj kod kreskowy w ramce. Wyszukiwanie produktów w Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Nie znaleziono produktu. Zamiast tego wypróbuj paragon lub skan lodówki.';
  @override
  String get barcodeConfirmTitle => 'Potwierdź produkt';
  @override
  String get barcodeAddToPantry => 'Dodaj do zapasów świeżości';
  @override
  String get navScan => 'Skandować';
  @override
  String get captureTypeFridge => 'Lodówka';
  @override
  String get captureTypeReceipt => 'Paragon';
  @override
  String get captureTypeBarcode => 'Kod kreskowy';
  @override
  String get sectionAccount => 'Konto';
  @override
  String get sectionPreferences => 'Preferencje';
  @override
  String get sectionApp => 'Aplikacja';
  @override
  String get sectionPrivacy => 'Prywatność';
  @override
  String get sessionTitle => 'Sesja';
  @override
  String get guestUser => 'Użytkownik-gość';
  @override
  String get favoritesTitle => 'Ulubione';
  @override
  String get favoritesSubtitle => 'Przepisy, które zapisałeś';
  @override
  String get freshnessInventorySubtitle =>
      'Produkty z paragonami i datami ważności';
  @override
  String get pantrySyncSubtitle => 'Wyciągnij zapasy świeżości z chmury';
  @override
  String get showOnboardingAgain => 'Pokaż ponownie wycieczkę wprowadzającą';
  @override
  String get signOut => 'Wyloguj się';
  @override
  String get scanSubtitleSmart => 'Inteligentne skanowanie spiżarni';
  @override
  String get scanSubtitleReceipt => 'Skanowanie paragonów i śledzenie świeżości';
  @override
  String get tooltipSettings => 'Ustawienia';
  @override
  String get tooltipToggleGuide => 'Przełącz prowadnicę ramki';
  @override
  String get tooltipModesAbout => 'Informacje o trybach skanowania';
  @override
  String get galleryLabel => 'Galeria';
  @override
  String get cameraLoading => 'Przygotowuję aparat…';
  @override
  String get cameraUnavailable =>
      'Kamera niedostępna.\\nSprawdź uprawnienia i spróbuj ponownie.';
  @override
  String get captureFailed =>
      'Przechwytywanie nie powiodło się. Sprawdź uprawnienia aparatu i spróbuj ponownie.';
  @override
  String get receiptCaptureAlign =>
      'Wyrównaj paragon w pionowej ramce i przechwyć';
  @override
  String get receiptCameraHint =>
      'Otwórz aparat lub wybierz zdjęcie paragonu z galerii';
  @override
  String get pickPhotoHint => 'Naciśnij przycisk, aby wybrać zdjęcie';
  @override
  String get desktopGalleryHint =>
      'Tryb pulpitu — wybierz zdjęcie lodówki z galerii.';
  @override
  String get noCameraOnDevice => 'Na tym urządzeniu nie znaleziono aparatu.';
  @override
  String get openCameraButton => 'Otwórz kamerę';
  @override
  String get pickPhotoButton => 'Wybierz zdjęcie';
  @override
  String get overlayGuideOn => 'Przewodnik po';
  @override
  String get overlayGuideOff => 'Przewodnik wyłączony';
  @override
  String get modeSheetTitle => 'Tryby skanowania';
  @override
  String get modeSheetSubtitle =>
      'Wybierz przed przechwyceniem; zmienia zasady receptur AI.';
  @override
  String get scanModeQuickLabel => 'Szybkie skanowanie';
  @override
  String get scanModeQuickSubtitle => 'Przepisy w mniej niż 15 minut';
  @override
  String get scanModeQuickDesc =>
      'Praktyczne posiłki na co dzień. Wszystkie przepisy trwają łącznie 15 minut lub mniej; proste techniki (jedna patelnia, sałatka, szybka frytka).';
  @override
  String get scanModeSurvivalLabel => 'Ratunek';
  @override
  String get scanModeSurvivalSubtitle => 'Najpierw użyj przeterminowanych produktów';
  @override
  String get scanModeSurvivalDesc =>
      'Zmniejsza ilość odpadów. Priorytetowo traktuje przedmioty, które wyglądają na bliskie zepsucia. Priorytet mają opcjonalne elementy pola podpowiedzi.';
  @override
  String get scanModeChefLabel => 'Tryb szefa kuchni';
  @override
  String get scanModeChefSubtitle => 'Wyśmienite i szczegółowe';
  @override
  String get scanModeChefDesc =>
      'Bardziej wyrafinowane przepisy. Techniki warstwowe, dłuższy czas gotowania; co najmniej dwa przepisy oznaczone jako trudne.';
  @override
  String get scanModeQuickBestFor =>
      'Posiłki w tygodniu z minimalną ilością składników i czasu';
  @override
  String get scanModeQuickExamples =>
      '• 10-minutowy omlet\\n • Makaron na jedną patelnię\\n • Opakowanie lub miska nie wymagają gotowania';
  @override
  String get scanModeSurvivalBestFor =>
      'Używanie przedmiotów przed ich upływem i ograniczenie marnotrawstwa';
  @override
  String get scanModeSurvivalExamples =>
      '• Zupa wegetariańska po oczyszczeniu\\n • Frittata z piekarnika\\n • Resztki smażonego ryżu';
  @override
  String get scanModeChefBestFor =>
      'Specjalne kolacje, goście, czyli nauka techniki';
  @override
  String get scanModeChefExamples =>
      '• Sos białkowy z patelni\\n • Chrupiący i kremowy talerz\\n • Karmelizowany dodatek warzywny';
  @override
  String get scanModeIdealForLabel => 'Najlepsze dla';
  @override
  String get scanModeExamplesLabel => 'Przykładowe dania';
  @override
  String get survivalHintAddFromPantry => 'Dodaj ze świeżości';
  @override
  String get filterAll => 'Wszystko';
  @override
  String get filterCritical => 'Krytyczny';
  @override
  String get filterWarning => 'Ostrzeżenie';
  @override
  String get filterSafe => 'Bezpieczna';
  @override
  String get recipesScreenTitle => 'Przepisy';
  @override
  String get copyRecipe => 'Kopia';
  @override
  String get shareRecipe => 'Udział';
  @override
  String get recipeCopiedSnack => 'Przepis skopiowany do schowka';
  @override
  String get survivalHintTitle => 'Wkrótce wygaśnie';
  @override
  String get survivalHintOptional => 'Opcjonalnie – np. mleko, pomidor, jogurt';
  @override
  String get survivalHintPlaceholder => 'Oddziel przecinkami';
  @override
  String get scanConfirmReceiptLabel => 'Skan paragonu';
  @override
  String get scanSavedHistory => 'Skan zapisany w historii spiżarni';
  @override
  String get scanSaveFailedPrefix => 'Nie udało się zapisać skanu';
  @override
  String get daysUnit => 'dni';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Wykryte składniki';
  @override
  String recipesAiCount(int count) => 'Przepisy AI ·$count';
  @override
  String get galleryPickMessage => 'Wybierz zdjęcie z galerii';
  @override
  String get favoritesEmpty =>
      'Nie ma jeszcze ulubionych przepisów.\\nKliknij serce na wynikach przepisu.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Przepis ${index + 1}' : 'Przepis';

  @override
  String get timeAgoJustNow => 'Właśnie';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}temu';
  @override
  String timeAgoHours(int hours) => '${hours}godz. temu';
  @override
  String timeAgoDays(int days) => '${days}d temu';
  @override
  String get daysExpired => 'Wygasły';
  @override
  String get daysToday => 'Dzisiaj';
  @override
  String get daysTomorrow => 'Jutro';
  @override
  String daysCount(int days) => '$days dni';
  @override
  String unifiedDaysRemaining(int days) => '$days pozostało dni';
  @override
  String productCount(int count) => '$count rzeczy';
  @override
  String get unifiedSourceReceipt => 'Paragon';
  @override
  String get unifiedSourceScan => 'Skandować';
  @override
  String unifiedLastScan(String date) => 'Ostatnie skanowanie ·$date';
  @override
  String get receiptFieldProductName => 'Nazwa produktu';
  @override
  String get receiptFieldQuantity => 'Ilość';
  @override
  String get receiptFieldCategory => 'Kategoria';
  @override
  String expiryApprox(int days) => 'Najlepiej przed ~$days dni';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Brakujące składniki dodane do listy zakupów';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients składniki ·$recipes przepisy';
  @override
  String get favoriteAddTooltip => 'Dodaj do ulubionych';
  @override
  String get favoriteRemoveTooltip => 'Usuń z ulubionych';
  @override
  String get favoriteAddedSnack => 'Dodano do ulubionych';
  @override
  String get favoriteRemovedSnack => 'Usunięto z ulubionych';
  @override
  String get onboardingScanTitle => 'Zeskanuj swoją spiżarnię';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Lista zakupów';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Ulubione i najnowsze skany';
  @override
  String get onboardingFavoritesBody =>
      'Zapisuj przepisy, które lubisz. Ostatnie skany otwierają się szybko na ekranie głównym.';
  @override
  String get onboardingCloudTitle => 'Historia chmury';
  @override
  String get onboardingCloudBody =>
      'Zaloguj się, aby zapisać historię skanowania na swoim koncie i wrócić w dowolnym momencie.';
  @override
  String get onboardingPermissionsTitle => 'Aparat i powiadomienia';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef potrzebuje aparatu do skanowania lodówki, paragonów i kodów kreskowych. Opcjonalne powiadomienia przypominają o zbliżającym się terminie ważności.';
  @override
  String get emptyStateScanReceipt => 'Skanuj paragon';
  @override
  String get emptyStateStartScan => 'Rozpocznij skanowanie';
  @override
  String get manageSubscriptions => 'Zarządzaj subskrypcją';
  @override
  String get notificationCriticalChannelName => 'Alerty świeżości';
  @override
  String get notificationCriticalChannelDesc => 'Przedmioty wkrótce wygasną';
  @override
  String get notificationDailyChannelName => 'Podsumowanie dnia';
  @override
  String get notificationDailyChannelDesc => 'Codzienne przypomnienie o świeżości';
  @override
  String get notificationCriticalTitle => 'Przedmioty wkrótce wygasną';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Sprawdź panel Świeżość.';
  @override
  String get notificationDailyTitle => 'Kontrola świeżości';
  @override
  String get notificationDailyBody =>
      'Przejrzyj przedmioty, których powinieneś dzisiaj użyć.';
  @override
  String get widgetFreshnessGood => 'Świeżość wygląda dobrze';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count przedmioty mogą utracić ważność dzisiaj';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical krytyczny ·$warning ostrzeżenie';
  @override
  String get categoryDairy => 'Mleczarnia';
  @override
  String get categoryMeat => 'Mięso / ryba';
  @override
  String get categoryFruit => 'Owoc';
  @override
  String get categoryVegetable => 'Warzywo';
  @override
  String get categoryBeverage => 'Napój';
  @override
  String get categoryBakery => 'Piekarnia';
  @override
  String get categoryPantry => 'Spiżarnia';
  @override
  String calendarMonthName(int month) => const [
        'Styczeń',
        'Luty',
        'marzec',
        'Kwiecień',
        'Móc',
        'Czerwiec',
        'Lipiec',
        'Sierpień',
        'Wrzesień',
        'Październik',
        'Listopad',
        'Grudzień',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Przepisy';
  @override
  String get recipesPlaceholderBody =>
      'Wyniki przepisu pojawią się tutaj po pomyślnym skanowaniu.';
  @override
  String get recipeSamplePlating => 'Próbne poszycie';
  @override
  String get recipeShareInstructionsHeader => 'Instrukcje:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Do potęgi.';
  @override
  String get themeTitle => 'Temat';
  @override
  String get themeSubtitle => 'Paleta kolorów i tło';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Domyślnie ciemnozielony';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Chłodne odcienie niebieskiego';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Ciepłe bursztynowe akcenty';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Fioletowy akcent ciemny';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Jasne tło';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Ciepły krem ​​z pomarańczowym akcentem';
}
