import 'strings_base.dart';

class StringsIt implements StringsBase {
  const StringsIt();

  @override
  String get analysisTitle => 'Analizzando la dispensa';
  @override
  String get stepPrepareImage => 'Preparazione foto...';
  @override
  String get stepAnalyzeAi => 'Rilevamento degli ingredienti…';
  @override
  String get stepBuildRecipes => 'Creazione di ricette...';
  @override
  String get receiptAnalysisTitle => 'Ricevuta di lettura';
  @override
  String get stepReceiptPrepare => 'Preparazione dell\'immagine della ricevuta…';
  @override
  String get stepReceiptOcr => 'Riconoscimento degli elementi...';
  @override
  String get stepReceiptInfer => 'Stima della durata di conservazione...';
  @override
  String get receiptNotRecognized =>
      'Impossibile leggere la ricevuta. Prova una foto più chiara e piatta.';
  @override
  String get receiptNotDetected =>
      'Nessuna ricevuta rilevata. Allinea la ricevuta nella cornice.';
  @override
  String get receiptConfirmTitle => 'Conferma gli articoli ricevuti';
  @override
  String get receiptConfirmSubtitle =>
      'Seleziona gli elementi da aggiungere. Premere a lungo per modificare.';
  @override
  String get receiptConfirmSave => 'Aggiungi alla dispensa';
  @override
  String get receiptSelectOne => 'Seleziona almeno un elemento.';
  @override
  String get receiptSaved => 'Articoli aggiunti all\'inventario della freschezza';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Inviare questa foto della ricevuta? L\'analisi OCR inizia dopo la conferma.';
  @override
  String get navFreshness => 'Freschezza';
  @override
  String get freshnessPanelTitle => 'Pannello Freschezza';
  @override
  String get freshnessCritical => 'Critico (0-2 giorni)';
  @override
  String get freshnessWarning => 'Avviso (3–5 giorni)';
  @override
  String get freshnessSafe => 'Sicuro (6+ giorni)';
  @override
  String get freshnessEmpty =>
      'Nessun elemento tracciato ancora. Scansiona una ricevuta per creare un inventario.';
  @override
  String get freshnessListTitle => 'Inventario della freschezza';
  @override
  String get freshnessListEmpty => 'Nessun elemento in questo filtro.';
  @override
  String get freshnessSuggestRecipes => 'Suggerisci ricette con questi';
  @override
  String get savingsPanelTitle => 'Pannello di risparmio';
  @override
  String get savingsPanelEmptyHint =>
      'Contrassegna gli articoli prossimi alla scadenza come "Pasto preparato" per tenere traccia degli sprechi evitati qui.';
  @override
  String get savingsStatItems => 'Salvato';
  @override
  String get savingsStatWaste => 'Rifiuti evitati';
  @override
  String get savingsStatMoney => 'Est. risparmio';
  @override
  String get savingsDashboardTitle => 'Analisi del risparmio';
  @override
  String get savingsDashboardSubtitle =>
      'Riepilogo del cibo che hai salvato dalla spazzatura questo mese.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingrediente salvato dai rifiuti questo mese'
          : '$count ingredienti risparmiati dai rifiuti questo mese';
  @override
  String savingsKgPrevented(String kg) => 'Prevenzione dello spreco alimentare:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Guadagno finanziario stimato:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Ultime 4 settimane';
  @override
  String get savingsRecentTitle => 'Salvataggi recenti';
  @override
  String get savingsEmptySubtitle =>
      'Nessun record ancora. Quando utilizzi un elemento critico o di avviso, viene visualizzato qui.';
  @override
  String get savingsHowItWorks =>
      'Gli articoli utilizzati entro 5 giorni dalla scadenza vengono considerati salvati. Peso e valore sono stimati dalle medie di categoria.';
  @override
  String get pantryNamesLocaleNote =>
      'I nomi dei prodotti e dei negozi appaiono come salvati sulla ricevuta; i termini comuni sono mostrati in inglese.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Usato l\'ultimo giorno' : 'Usato con$days giorni rimasti';
  @override
  String get savingsMealMade => 'Pasto preparato';
  @override
  String savingsMealMadeConfirm(String name) => 'Segno$name quanto consumato?';
  @override
  String savingsRescuedSnack(String money) => 'Risparmi registrati ·$money';
  @override
  String get freshnessRecipeTitle => 'Preparazione di ricette';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Per le ricette è richiesto almeno un elemento.';
  @override
  String get freshnessCriticalBanner => 'In scadenza a breve';
  @override
  String get freshnessViewAll => 'Visualizza tutto';
  @override
  String get receiptCaptureHints =>
      'Tenere la ricevuta in posizione piatta e con una buona illuminazione. Tutte le linee visibili nel riquadro verticale.';
  @override
  String get receiptPurchaseDate => 'Data di acquisto';
  @override
  String get receiptTapToEdit => 'Modificare';
  @override
  String get receiptEditItem => 'Modifica elemento';
  @override
  String get receiptEditSave => 'Salva';
  @override
  String get receiptExpiryDaysLabel => 'Durata di conservazione stimata (giorni)';
  @override
  String get receiptMergedSnack => 'Alcuni elementi sono stati uniti con record esistenti';
  @override
  String get receiptCloudSyncFailed => 'Impossibile salvare nel cloud';
  @override
  String get receiptCloudSynced => 'Elementi sincronizzati sul cloud';
  @override
  String get pantrySyncAction => 'Sincronizza i dati sull\'aggiornamento';
  @override
  String get pantrySyncDone => 'Dati sulla freschezza aggiornati';
  @override
  String get pantrySyncFailed => 'Sincronizzazione non riuscita';
  @override
  String get freshnessNotificationsTitle => 'Notifiche di freschezza';
  @override
  String get freshnessNotificationsSubtitle =>
      'Elementi critici e promemoria quotidiano';
  @override
  String get freshnessNotificationTimeLabel => 'Orario del promemoria giornaliero';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Tutti i giorni alle$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Questa settimana:$critical critico,$warning elementi di avvertimento. Usa questi per primi.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Errore di rete. Controlla la connessione e riprova.';
  @override
  String get geminiQuotaExceeded =>
      'Quota AI superata. Attendi qualche minuto e riprova.';
  @override
  String get geminiBillingDepleted =>
      'I crediti per il pagamento anticipato di Google AI Studio sono esauriti. Aggiungi la fatturazione su ai.google.dev per ripristinare le funzionalità AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Il nuovo tentativo automatico potrebbe essere disponibile in$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Limite giornaliero di traduzione AI raggiunto (3/3). Le ricette utilizzano la traduzione di base fino a domani.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Hai$remaining Le traduzioni AI sono partite oggi.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Limite di scansione giornaliera della dispensa raggiunto (3). Per favore riprova domani.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Limite di scansione giornaliera delle ricevute raggiunto (2). Per favore riprova domani.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Limite di generazione giornaliera delle ricette raggiunto (3). Per favore riprova domani.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'attendere prego$seconds secondo/i prima di riprovare.';
  @override
  String get adRewardTitlePantry => 'Limite di scansione della dispensa raggiunto';
  @override
  String get adRewardTitleReceipt => 'È stato raggiunto il limite di scansione delle ricevute';
  @override
  String get adRewardTitleRecipe => 'Limite di generazione della ricetta raggiunto';
  @override
  String get adRewardSubtitle =>
      'Guarda un breve annuncio per guadagnare +1 utilizzo extra oggi (fino a 3 al giorno).';
  @override
  String get adRewardWatchButton => 'Guarda l\'annuncio (+1 utilizzo)';
  @override
  String get adRewardGranted => 'Uso extra concesso. Riprova.';
  @override
  String get adRewardNotCompleted =>
      'L\'annuncio non è stato completato. Non è stato concesso alcun utilizzo aggiuntivo.';
  @override
  String get adRewardDailyCapReached =>
      'Hai raggiunto il limite di premi pubblicitari di oggi.';
  @override
  String get geminiTimeout =>
      'Richiesta scaduta. Controlla la connessione e riprova.';
  @override
  String get geminiServerError =>
      'Il servizio AI è temporaneamente non disponibile. Per favore riprova più tardi.';
  @override
  String get imageNotRecognized =>
      'Immagine non riconosciuta. Migliora l\'illuminazione o prova un\'altra angolazione.';
  @override
  String get imageNotPantry =>
      'Frigo o dispensa non visibili. Si prega di fotografare direttamente.';
  @override
  String get parseError =>
      'Impossibile analizzare la risposta dell\'IA. Effettuare nuovamente la scansione.';
  @override
  String get modelUnavailable =>
      'Modello AI non disponibile. Controlla il tuo accesso API.';
  @override
  String get genericError => 'Qualcosa è andato storto. Per favore riprova.';
  @override
  String get imageDecodeError => 'Impossibile leggere la foto. Prova un\'altra immagine.';
  @override
  String get authSubtitle => 'Accesso intelligente alla dispensa';
  @override
  String get authInitializing => 'Preparazione della sessione...';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Password';
  @override
  String get emailRequired => 'E-mail richiesta';
  @override
  String get emailInvalid => 'E-mail non valida';
  @override
  String get passwordMin => 'Almeno 6 caratteri';
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
  String get signIn => 'Registrazione';
  @override
  String get signUp => 'Creare un account';
  @override
  String get toggleToSignIn => 'Hai già un account? Registrazione';
  @override
  String get toggleToSignUp => 'Nuovo qui? Creare un account';
  @override
  String get guestContinue => 'Continua come ospite';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Conto creato. Apri il link di conferma nella tua casella di posta; l\'app ti avviserà una volta verificata.';
  @override
  String get emailConfirmedSuccess =>
      'La tua email è confermata. Il tuo account è pronto.';
  @override
  String get emailVerifiedLabel => 'E-mail verificata';
  @override
  String get proEmailRequiredTitle => 'Account e-mail richiesto per Pro';
  @override
  String get proEmailRequiredBody =>
      'Gli account ospite non possono acquistare Pro. Crea un account email per conservare i tuoi dati e sbloccare la fatturazione.';
  @override
  String get proLinkAccountAction => 'Crea un account e continua';
  @override
  String get proAccountLinked =>
      'Conto collegato. Puoi continuare con il pagamento Pro adesso.';
  @override
  String get supabaseNotConfigured =>
      'Servizio account non disponibile. Per favore riprova più tardi.';
  @override
  String get privacyTitle => 'Dati e privacy';
  @override
  String get privacySubtitle => 'Foto e dati dell\'account';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Le immagini delle ricevute non vengono archiviate sul server; viene estratta solo la lista dei prodotti.\\n\\n'
      'Una volta effettuato l\'accesso, le scansioni e i dati sull\'aggiornamento potrebbero essere salvati nel tuo account.'
      'Il piano gratuito mostra gli annunci di Google AdMob; Pro non ha pubblicità.\\n\\n'
      'Apri l\'informativa sulla privacy online per il testo completo.';
  @override
  String get privacyViewOnline => 'Apri l\'informativa sulla privacy';
  @override
  String get pantryHistoryTitle => 'Storia della dispensa';
  @override
  String get pantryHistoryEmpty =>
      'Nessuna scansione ancora salvata.\\nScansiona il tuo frigorifero per creare cronologia.';
  @override
  String get pantryHistorySubtitle => 'Scansioni salvate nel cloud';
  @override
  String get splashTagline => 'Prodotti e dispensa: un\'unica app';
  @override
  String get splashLoading => 'Caricamento…';
  @override
  String get onboardingSkip => 'Saltare';
  @override
  String get onboardingNext => 'Prossimo';
  @override
  String get onboardingStart => 'Inizio';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Scansioni recenti';
  @override
  String get cameraTapToOpen => 'Tocca l\'icona per aprire la fotocamera';
  @override
  String get cameraOrGalleryHint => 'Apri la fotocamera o scegli dalla galleria';
  @override
  String get captureOrGalleryHint => 'Cattura o scegli dalla galleria';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Chiudi la fotocamera';
  @override
  String get noIngredients => 'Nessun ingrediente rilevato.';
  @override
  String get recipeInstructions => 'Istruzioni';
  @override
  String get untitledRecipe => 'Ricetta senza titolo';
  @override
  String get genericLoadError => 'Qualcosa è andato storto. Per favore riprova.';
  @override
  String get scanConfirmTitle => 'Conferma foto';
  @override
  String get scanConfirmSubtitle =>
      'Inviare questa foto? L\'analisi della ricetta inizia dopo la conferma.';
  @override
  String get scanConfirmAnalyze => 'Analizzare';
  @override
  String get scanConfirmCancel => 'Cancellare';
  @override
  String get scanConfirmRetake => 'Riprendere';
  @override
  String get scanConfirmPickOther => 'Scegline un altro';
  @override
  String get clearRecentScans => 'Cancella scansioni recenti';
  @override
  String get clearRecentScansSubtitle => 'Elimina la cronologia locale sul dispositivo';
  @override
  String get clearRecentScansConfirmTitle => 'Cancellare le scansioni recenti?';
  @override
  String get clearRecentScansConfirmBody =>
      'L\'operazione non può essere annullata. I preferiti non sono interessati.';
  @override
  String get clearRecentScansDone => 'Scansioni recenti cancellate';
  @override
  String get deleteAction => 'Eliminare';
  @override
  String get imageQualityTitle => 'Bassa qualità fotografica';
  @override
  String get imageQualityDark => 'L\'immagine è troppo scura. Aggiungi luce e riprova.';
  @override
  String get imageQualityBlurry =>
      'L\'immagine potrebbe essere sfocata. Tieni duro e riprendi.';
  @override
  String get imageQualityContinue => 'Continua comunque';
  @override
  String get imageQualityRetake => 'Riprendere';
  @override
  String receiptQueueTitle(int count) => '$count ricevute in attesa offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Ricevuta ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Processo';
  @override
  String get receiptQueuedOffline =>
      'Non in linea. Ricevuta in coda; processo quando connesso.';
  @override
  String get receiptLowConfidenceBlock =>
      'Modifica gli elementi poco sicuri prima di salvare (icona della matita).';
  @override
  String get unifiedPantryTitle => 'Inventario unificato';
  @override
  String get unifiedPantryEmpty => 'Nessun elemento o scansione ancora.';
  @override
  String get searchHint => 'Cerca prodotti...';
  @override
  String get navShopping => 'Shopping';
  @override
  String get shoppingAddHint => 'Aggiungi l\'elemento mancante';
  @override
  String get shoppingEmpty => 'La tua lista della spesa è vuota.';
  @override
  String get shoppingClearDone => 'Cancella completato';
  @override
  String get shoppingDoneSection => 'Fatto';
  @override
  String get shoppingAddFromRecipe => 'Aggiungi articoli non presenti nell\'inventario delle ricevute';
  @override
  String get freshnessViewCalendar => 'Calendario';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => 'Cosa cucinare oggi?';
  @override
  String get cookTodayNoUrgent =>
      'Nessun articolo urgente. Scansiona una ricevuta per monitorarne la freschezza.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Visualizzato nella scansione ma non nell\'inventario delle ricevute: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Esporta dati locali';
  @override
  String get exportLocalDataSubtitle => 'Copia JSON negli appunti';
  @override
  String get exportLocalDataDone => 'Dati copiati negli appunti';
  @override
  String get clearLocalData => 'Elimina i dati locali';
  @override
  String get clearLocalDataSubtitle =>
      'Freschezza, spesa, preferenze (irreversibili)';
  @override
  String get clearLocalDataConfirmTitle => 'Eliminare i dati locali?';
  @override
  String get clearLocalDataConfirmBody =>
      'Inventario dei prodotti freschi e lista della spesa rimossi dal dispositivo.';
  @override
  String get clearLocalDataDone => 'Dati locali cancellati';
  @override
  String get settingsTitle => 'Impostazioni';
  @override
  String get languageTitle => 'Lingua';
  @override
  String get languageSubtitle => 'Lingua dell\'app · 27 lingue';
  @override
  String get localePreparingTitle => 'Aggiornamento della lingua';
  @override
  String get localePreparingSubtitle =>
      'Traduzione di ricette e risultati della scansione…';
  @override
  String get dietTitle => 'Preferenza dietetica';
  @override
  String get dietSubtitle => 'Applicato ai suggerimenti di ricette';
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
  String get aiUsageLimitsLoading => 'Caricamento…';
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
  String get aiUsageLabelPantry => 'Dispensa';
  @override
  String get aiUsageLabelReceipt => 'Ricevuta';
  @override
  String get aiUsageLabelRecipe => 'Ricetta';
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
  String get storeUnavailable => 'Lo store non è disponibile. Riprova più tardi.';
  @override
  String get proProductIdsNotConfigured => 'Gli ID prodotto Pro non sono configurati.';
  @override
  String get noProProductsFound => 'Nessun prodotto Pro acquistabile trovato.';
  @override
  String get purchaseFlowFailed => 'Impossibile avviare l\'acquisto.';
  @override
  String get purchaseCompletedProActivated => 'Acquisto completato. Piano Pro attivato.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Acquisto completato. Verifica non riuscita; riprova tra poco.';
  @override
  String get purchaseFailed => 'Acquisto non riuscito.';
  @override
  String get restorePurchases => 'Ripristina acquisti';
  @override
  String get restorePurchasesStarted => 'Verifica acquisti precedenti su Play Store…';
  @override
  String get nutritionTitle => 'Nutrizione (stima)';
  @override
  String get nutritionPerServing => 'per porzione';
  @override
  String get nutritionCalories => 'Calorie';
  @override
  String get nutritionProtein => 'Proteina';
  @override
  String get nutritionCarbs => 'Carboidrati';
  @override
  String get nutritionFat => 'Grasso';
  @override
  String get nutritionEstimateNote =>
      'Solo stima AI; non consigli medici o dietetici.';
  @override
  String get barcodeScanTitle => 'Scansiona il codice a barre';
  @override
  String get barcodeScanHint =>
      'Allinea il codice a barre nel riquadro. Ricerca del prodotto tramite Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Prodotto non trovato. Prova invece la scansione della ricevuta o del frigorifero.';
  @override
  String get barcodeConfirmTitle => 'Conferma prodotto';
  @override
  String get barcodeAddToPantry => 'Aggiungi all\'inventario della freschezza';
  @override
  String get navScan => 'Scansione';
  @override
  String get captureTypeFridge => 'Frigo';
  @override
  String get captureTypeReceipt => 'Ricevuta';
  @override
  String get captureTypeBarcode => 'Codice a barre';
  @override
  String get sectionAccount => 'Account';
  @override
  String get sectionPreferences => 'Preferenze';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Privacy';
  @override
  String get sessionTitle => 'Sessione';
  @override
  String get guestUser => 'Utente ospite';
  @override
  String get favoritesTitle => 'Preferiti';
  @override
  String get favoritesSubtitle => 'Ricette che hai salvato';
  @override
  String get freshnessInventorySubtitle =>
      'Prodotti da scontrini e date di scadenza';
  @override
  String get pantrySyncSubtitle => 'Estrai l\'inventario della freschezza dal cloud';
  @override
  String get showOnboardingAgain => 'Mostra di nuovo il tour di onboarding';
  @override
  String get signOut => 'disconnessione';
  @override
  String get scanSubtitleSmart => 'Scansione intelligente della dispensa';
  @override
  String get scanSubtitleReceipt => 'Scansione delle ricevute e monitoraggio dell\'aggiornamento';
  @override
  String get tooltipSettings => 'Impostazioni';
  @override
  String get tooltipToggleGuide => 'Attiva/disattiva la guida del fotogramma';
  @override
  String get tooltipModesAbout => 'Informazioni sulle modalità di scansione';
  @override
  String get galleryLabel => 'Galleria';
  @override
  String get cameraLoading => 'Preparazione della fotocamera…';
  @override
  String get cameraUnavailable =>
      'Fotocamera non disponibile.\\nVerifica le autorizzazioni e riprova.';
  @override
  String get captureFailed =>
      'Cattura fallita. Controlla l\'autorizzazione della fotocamera e riprova.';
  @override
  String get receiptCaptureAlign =>
      'Allinea la ricevuta nel riquadro verticale e acquisisci';
  @override
  String get receiptCameraHint =>
      'Apri la fotocamera o scegli una foto della ricevuta dalla galleria';
  @override
  String get pickPhotoHint => 'Tocca il pulsante per scegliere una foto';
  @override
  String get desktopGalleryHint =>
      'Modalità desktop: scegli una foto del frigorifero dalla galleria.';
  @override
  String get noCameraOnDevice => 'Nessuna fotocamera trovata su questo dispositivo.';
  @override
  String get openCameraButton => 'Apri la fotocamera';
  @override
  String get pickPhotoButton => 'Scegli la foto';
  @override
  String get overlayGuideOn => 'Guida su';
  @override
  String get overlayGuideOff => 'Guida spenta';
  @override
  String get modeSheetTitle => 'Modalità di scansione';
  @override
  String get modeSheetSubtitle =>
      'Scegli prima della cattura; cambia le regole della ricetta AI.';
  @override
  String get scanModeQuickLabel => 'Scansione rapida';
  @override
  String get scanModeQuickSubtitle => 'Ricette in meno di 15 minuti';
  @override
  String get scanModeQuickDesc =>
      'Pasti pratici di tutti i giorni. Tutte le ricette durano 15 minuti o meno; tecniche semplici (una padella, insalata, frittura veloce).';
  @override
  String get scanModeSurvivalLabel => 'Salvare';
  @override
  String get scanModeSurvivalSubtitle => 'Utilizza prima gli articoli in scadenza';
  @override
  String get scanModeSurvivalDesc =>
      'Riduce gli sprechi. Dà la priorità agli articoli che sembrano prossimi al deterioramento. Gli elementi del campo suggerimento facoltativo hanno la priorità.';
  @override
  String get scanModeChefLabel => 'Modalità cuoco';
  @override
  String get scanModeChefSubtitle => 'Gourmet e dettagliato';
  @override
  String get scanModeChefDesc =>
      'Ricette più raffinate. Tecniche a strati, tempi di cottura più lunghi; almeno due ricette contrassegnate come difficili.';
  @override
  String get scanModeQuickBestFor =>
      'Pasti settimanali con ingredienti e tempo minimi';
  @override
  String get scanModeQuickExamples =>
      '• Frittata di 10 minuti\\n• Pasta in una padella\\n• Involucro o ciotola senza cottura';
  @override
  String get scanModeSurvivalBestFor =>
      'Utilizzare gli articoli prima che scadano e ridurre gli sprechi';
  @override
  String get scanModeSurvivalExamples =>
      '• Zuppa vegetariana pulita\\n• Frittata al forno\\n• Riso fritto avanzato';
  @override
  String get scanModeChefBestFor =>
      'Cene speciali, ospiti o imparare una tecnica';
  @override
  String get scanModeChefExamples =>
      '• Salsa proteica in padella\\n• Piatto croccante e cremoso\\n• Guarnizione di verdure caramellate';
  @override
  String get scanModeIdealForLabel => 'Meglio per';
  @override
  String get scanModeExamplesLabel => 'Piatti di esempio';
  @override
  String get survivalHintAddFromPantry => 'Aggiungi dalla freschezza';
  @override
  String get filterAll => 'Tutto';
  @override
  String get filterCritical => 'Critico';
  @override
  String get filterWarning => 'Avvertimento';
  @override
  String get filterSafe => 'Sicuro';
  @override
  String get recipesScreenTitle => 'Ricette';
  @override
  String get copyRecipe => 'Copia';
  @override
  String get shareRecipe => 'Condividere';
  @override
  String get recipeCopiedSnack => 'Ricetta copiata negli appunti';
  @override
  String get survivalHintTitle => 'In scadenza a breve';
  @override
  String get survivalHintOptional => 'Facoltativo – ad es. latte, pomodoro, yogurt';
  @override
  String get survivalHintPlaceholder => 'Separare con virgole';
  @override
  String get scanConfirmReceiptLabel => 'Scansione della ricevuta';
  @override
  String get scanSavedHistory => 'Scansione salvata nella cronologia della dispensa';
  @override
  String get scanSaveFailedPrefix => 'Impossibile salvare la scansione';
  @override
  String get daysUnit => 'giorni';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Ingredienti rilevati';
  @override
  String recipesAiCount(int count) => 'Ricette IA ·$count';
  @override
  String get galleryPickMessage => 'Scegli la foto dalla galleria';
  @override
  String get favoritesEmpty =>
      'Nessuna ricetta preferita ancora.\\nTocca il cuore sui risultati delle ricette.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Ricetta${index + 1}' : 'Ricetta';

  @override
  String get timeAgoJustNow => 'Proprio adesso';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m fa';
  @override
  String timeAgoHours(int hours) => '${hours}h fa';
  @override
  String timeAgoDays(int days) => '${days}d fa';
  @override
  String get daysExpired => 'Scaduto';
  @override
  String get daysToday => 'Oggi';
  @override
  String get daysTomorrow => 'Domani';
  @override
  String daysCount(int days) => '$days giorni';
  @override
  String unifiedDaysRemaining(int days) => '$days giorni rimasti';
  @override
  String productCount(int count) => '$count elementi';
  @override
  String get unifiedSourceReceipt => 'Ricevuta';
  @override
  String get unifiedSourceScan => 'Scansione';
  @override
  String unifiedLastScan(String date) => 'Ultima scansione ·$date';
  @override
  String get receiptFieldProductName => 'Nome del prodotto';
  @override
  String get receiptFieldQuantity => 'Quantità';
  @override
  String get receiptFieldCategory => 'Categoria';
  @override
  String expiryApprox(int days) => 'Da consumarsi preferibilmente entro ~$days giorni';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Ingredienti mancanti aggiunti alla lista della spesa';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingredienti ·$recipes ricette';
  @override
  String get favoriteAddTooltip => 'Aggiungi ai preferiti';
  @override
  String get favoriteRemoveTooltip => 'Rimuovi dai preferiti';
  @override
  String get favoriteAddedSnack => 'Aggiunto ai preferiti';
  @override
  String get favoriteRemovedSnack => 'Rimosso dai preferiti';
  @override
  String get onboardingScanTitle => 'Scansiona la tua dispensa';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Lista della spesa';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Preferiti e scansioni recenti';
  @override
  String get onboardingFavoritesBody =>
      'Salva le ricette che ti piacciono. Le scansioni recenti si aprono rapidamente dalla schermata principale.';
  @override
  String get onboardingCloudTitle => 'Storia della nuvola';
  @override
  String get onboardingCloudBody =>
      'Accedi per salvare la cronologia delle scansioni sul tuo account e tornare in qualsiasi momento.';
  @override
  String get onboardingPermissionsTitle => 'Fotocamera e notifiche';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef usa la fotocamera per scansionare frigo, scontrini e codici a barre. Le notifiche opzionali ti avvisano quando il cibo sta per scadere.';
  @override
  String get emptyStateScanReceipt => 'Scansiona scontrino';
  @override
  String get emptyStateStartScan => 'Inizia scansione';
  @override
  String get manageSubscriptions => 'Gestisci abbonamento';
  @override
  String get notificationCriticalChannelName => 'Avvisi di freschezza';
  @override
  String get notificationCriticalChannelDesc => 'Articoli in scadenza a breve';
  @override
  String get notificationDailyChannelName => 'Riepilogo quotidiano';
  @override
  String get notificationDailyChannelDesc => 'Promemoria quotidiano sulla freschezza';
  @override
  String get notificationCriticalTitle => 'Articoli in scadenza a breve';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Controlla il pannello Freschezza.';
  @override
  String get notificationDailyTitle => 'Controllo della freschezza';
  @override
  String get notificationDailyBody =>
      'Rivedi gli articoli che dovresti utilizzare oggi.';
  @override
  String get widgetFreshnessGood => 'La freschezza sembra buona';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count gli articoli potrebbero scadere oggi';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical critico ·$warning avvertimento';
  @override
  String get categoryDairy => 'Latticini';
  @override
  String get categoryMeat => 'Carne/pesce';
  @override
  String get categoryFruit => 'Frutta';
  @override
  String get categoryVegetable => 'Verdura';
  @override
  String get categoryBeverage => 'Bevanda';
  @override
  String get categoryBakery => 'Forno';
  @override
  String get categoryPantry => 'Dispensa';
  @override
  String calendarMonthName(int month) => const [
        'Gennaio',
        'Febbraio',
        'Marzo',
        'aprile',
        'Maggio',
        'Giugno',
        'Luglio',
        'agosto',
        'settembre',
        'ottobre',
        'novembre',
        'Dicembre',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Ricette';
  @override
  String get recipesPlaceholderBody =>
      'I risultati della ricetta verranno visualizzati qui dopo una scansione riuscita.';
  @override
  String get recipeSamplePlating => 'Placcatura del campione';
  @override
  String get recipeShareInstructionsHeader => 'Istruzioni:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Esp.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Tavolozza dei colori e dello sfondo';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Verde scuro predefinito';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Tonalità blu fredde';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Caldi accenti ambrati';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Accento viola scuro';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Sfondo chiaro';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Crema calda con accento aranciato';
}
