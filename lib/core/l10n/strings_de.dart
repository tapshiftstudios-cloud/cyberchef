import 'strings_base.dart';

class StringsDe implements StringsBase {
  const StringsDe();

  @override
  String get analysisTitle => 'Speisekammer analysieren';
  @override
  String get stepPrepareImage => 'Foto wird vorbereitet…';
  @override
  String get stepAnalyzeAi => 'Inhaltsstoffe erkennen…';
  @override
  String get stepBuildRecipes => 'Baurezepte…';
  @override
  String get receiptAnalysisTitle => 'Lesebestätigung';
  @override
  String get stepReceiptPrepare => 'Belegbild wird vorbereitet…';
  @override
  String get stepReceiptOcr => 'Gegenstände erkennen…';
  @override
  String get stepReceiptInfer => 'Haltbarkeit abschätzen…';
  @override
  String get receiptNotRecognized =>
      'Der Beleg konnte nicht gelesen werden. Versuchen Sie es mit einem klareren, flacheren Foto.';
  @override
  String get receiptNotDetected =>
      'Keine Quittung erkannt. Richten Sie den Bon im Rahmen aus.';
  @override
  String get receiptConfirmTitle => 'Belegpositionen bestätigen';
  @override
  String get receiptConfirmSubtitle =>
      'Wählen Sie die hinzuzufügenden Elemente aus. Zum Bearbeiten lange drücken.';
  @override
  String get receiptConfirmSave => 'Zur Speisekammer hinzufügen';
  @override
  String get receiptSelectOne => 'Wählen Sie mindestens ein Element aus.';
  @override
  String get receiptSaved => 'Artikel zum Frischeinventar hinzugefügt';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Dieses Quittungsfoto senden? Die OCR-Analyse beginnt nach Ihrer Bestätigung.';
  @override
  String get navFreshness => 'Frische';
  @override
  String get freshnessPanelTitle => 'Frische-Panel';
  @override
  String get freshnessCritical => 'Kritisch (0–2 Tage)';
  @override
  String get freshnessWarning => 'Warnung (3–5 Tage)';
  @override
  String get freshnessSafe => 'Sicher (6+ Tage)';
  @override
  String get freshnessEmpty =>
      'Noch keine verfolgten Artikel. Scannen Sie eine Quittung, um den Bestand aufzubauen.';
  @override
  String get freshnessListTitle => 'Frischebestand';
  @override
  String get freshnessListEmpty => 'Keine Elemente in diesem Filter.';
  @override
  String get freshnessSuggestRecipes => 'Schlagen Sie Rezepte mit diesen vor';
  @override
  String get savingsPanelTitle => 'Sparpanel';
  @override
  String get savingsPanelEmptyHint =>
      'Markieren Sie Artikel, die kurz vor dem Verfallsdatum stehen, als „Mahlzeit zubereitet“, um den hier vermiedenen Abfall nachzuverfolgen.';
  @override
  String get savingsStatItems => 'Gerettet';
  @override
  String get savingsStatWaste => 'Verschwendung verhindert';
  @override
  String get savingsStatMoney => 'Schätzung: Ersparnisse';
  @override
  String get savingsDashboardTitle => 'Sparanalyse';
  @override
  String get savingsDashboardSubtitle =>
      'Zusammenfassung der Lebensmittel, die Sie diesen Monat aus der Tonne gerettet haben.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 Zutat wurde diesen Monat vor dem Abfall gerettet'
          : '$count Zutaten, die diesen Monat vor dem Abfall gerettet wurden';
  @override
  String savingsKgPrevented(String kg) => 'Lebensmittelverschwendung verhindert:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Geschätzter finanzieller Gewinn:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Letzte 4 Wochen';
  @override
  String get savingsRecentTitle => 'Aktuelle Rettungsaktionen';
  @override
  String get savingsEmptySubtitle =>
      'Noch keine Aufzeichnungen. Wenn Sie ein kritisches oder warnendes Element verwenden, wird es hier angezeigt.';
  @override
  String get savingsHowItWorks =>
      'Gegenstände, die innerhalb von 5 Tagen nach Ablauf verwendet werden, gelten als gerettet. Gewicht und Wert werden anhand der Kategoriedurchschnitte geschätzt.';
  @override
  String get pantryNamesLocaleNote =>
      'Produkt- und Geschäftsnamen werden auf Ihrer Quittung so angezeigt, wie sie gespeichert sind. Allgemeine Begriffe werden auf Englisch angezeigt.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Am letzten Tag verwendet' : 'Verwendet mit$days Tage übrig';
  @override
  String get savingsMealMade => 'Mahlzeit gemacht';
  @override
  String savingsMealMadeConfirm(String name) => 'Markieren$name wie verbraucht?';
  @override
  String savingsRescuedSnack(String money) => 'Erfasste Einsparungen ·$money';
  @override
  String get freshnessRecipeTitle => 'Rezepte vorbereiten';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Für Rezepte ist mindestens ein Artikel erforderlich.';
  @override
  String get freshnessCriticalBanner => 'Läuft bald ab';
  @override
  String get freshnessViewAll => 'Alle anzeigen';
  @override
  String get receiptCaptureHints =>
      'Beleg flach halten, gute Beleuchtung. Alle Linien im vertikalen Rahmen sichtbar.';
  @override
  String get receiptPurchaseDate => 'Kaufdatum';
  @override
  String get receiptTapToEdit => 'Bearbeiten';
  @override
  String get receiptEditItem => 'Artikel bearbeiten';
  @override
  String get receiptEditSave => 'Speichern';
  @override
  String get receiptExpiryDaysLabel => 'Geschätzte Haltbarkeit (Tage)';
  @override
  String get receiptMergedSnack => 'Einige Elemente wurden mit vorhandenen Datensätzen zusammengeführt';
  @override
  String get receiptCloudSyncFailed => 'Konnte nicht in der Cloud gespeichert werden';
  @override
  String get receiptCloudSynced => 'Mit der Cloud synchronisierte Elemente';
  @override
  String get pantrySyncAction => 'Frischedaten synchronisieren';
  @override
  String get pantrySyncDone => 'Frischedaten aktualisiert';
  @override
  String get pantrySyncFailed => 'Die Synchronisierung ist fehlgeschlagen';
  @override
  String get freshnessNotificationsTitle => 'Frischebenachrichtigungen';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritische Elemente und tägliche Erinnerung';
  @override
  String get freshnessNotificationTimeLabel => 'Tägliche Erinnerungszeit';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Jeden Tag um$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Diese Woche:$critical kritisch,$warning Warnelemente. Verwenden Sie diese zuerst.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Netzwerkfehler. Überprüfen Sie Ihre Verbindung und versuchen Sie es erneut.';
  @override
  String get geminiQuotaExceeded =>
      'KI-Kontingent überschritten. Warten Sie ein paar Minuten und versuchen Sie es erneut.';
  @override
  String get geminiBillingDepleted =>
      'Das Vorauszahlungsguthaben für Google AI Studio ist aufgebraucht. Fügen Sie die Abrechnung unter ai.google.dev hinzu, um KI-Funktionen wiederherzustellen.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Eine automatische Wiederholung ist möglicherweise in verfügbar$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Das tägliche KI-Übersetzungslimit wurde erreicht (3/3). Für Rezepte wird bis morgen die Grundübersetzung verwendet.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Du hast$remaining Heute sind noch AI-Übersetzungen verfügbar.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Das tägliche Scan-Limit für die Vorratskammer wurde erreicht (3). Bitte versuchen Sie es morgen noch einmal.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Das tägliche Scan-Limit für Quittungen wurde erreicht (2). Bitte versuchen Sie es morgen noch einmal.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Das Limit für die tägliche Rezeptgenerierung wurde erreicht (3). Bitte versuchen Sie es morgen noch einmal.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Bitte warten$seconds Sekunde(n), bevor Sie es erneut versuchen.';
  @override
  String get adRewardTitlePantry => 'Scanlimit für Speisekammer erreicht';
  @override
  String get adRewardTitleReceipt => 'Das Scan-Limit für Belege wurde erreicht';
  @override
  String get adRewardTitleRecipe => 'Das Limit für die Rezeptgenerierung wurde erreicht';
  @override
  String get adRewardSubtitle =>
      'Sehen Sie sich eine kurze Anzeige an, um noch heute +1 zusätzliche Nutzung zu erhalten (bis zu 3 pro Tag).';
  @override
  String get adRewardWatchButton => 'Anzeige ansehen (+1 Nutzung)';
  @override
  String get adRewardGranted => 'Zusätzliche Nutzung gewährt. Versuchen Sie es erneut.';
  @override
  String get adRewardNotCompleted =>
      'Die Anzeige wurde nicht fertiggestellt. Eine Mehrnutzung wurde nicht gewährt.';
  @override
  String get adRewardDailyCapReached =>
      'Sie haben das heutige Werbeprämienlimit erreicht.';
  @override
  String get geminiTimeout =>
      'Zeitüberschreitung bei der Anfrage. Überprüfen Sie Ihre Verbindung und versuchen Sie es erneut.';
  @override
  String get geminiServerError =>
      'Der AI-Dienst ist vorübergehend nicht verfügbar. Bitte versuchen Sie es später noch einmal.';
  @override
  String get imageNotRecognized =>
      'Bild nicht erkannt. Verbessern Sie die Beleuchtung oder versuchen Sie es mit einem anderen Blickwinkel.';
  @override
  String get imageNotPantry =>
      'Kühlschrank oder Speisekammer nicht sichtbar. Bitte direkt fotografieren.';
  @override
  String get parseError =>
      'Die KI-Antwort konnte nicht analysiert werden. Bitte scannen Sie erneut.';
  @override
  String get modelUnavailable =>
      'KI-Modell nicht verfügbar. Überprüfen Sie Ihren API-Zugriff.';
  @override
  String get genericError => 'Etwas ist schief gelaufen. Bitte versuchen Sie es erneut.';
  @override
  String get imageDecodeError => 'Foto konnte nicht gelesen werden. Versuchen Sie es mit einem anderen Bild.';
  @override
  String get authSubtitle => 'Intelligenter Zugang zur Speisekammer';
  @override
  String get authInitializing => 'Sitzung wird vorbereitet…';
  @override
  String get emailLabel => 'E-Mail';
  @override
  String get passwordLabel => 'Passwort';
  @override
  String get emailRequired => 'E-Mail erforderlich';
  @override
  String get emailInvalid => 'Ungültige E-Mail';
  @override
  String get passwordMin => 'Mindestens 6 Zeichen';
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
  String get signIn => 'anmelden';
  @override
  String get signUp => 'Benutzerkonto erstellen';
  @override
  String get toggleToSignIn => 'Sie haben bereits ein Konto? anmelden';
  @override
  String get toggleToSignUp => 'Neu hier? Benutzerkonto erstellen';
  @override
  String get guestContinue => 'Als Gast fortfahren';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Konto erstellt. Öffnen Sie den Bestätigungslink in Ihrem Posteingang. Die App benachrichtigt Sie, wenn die Bestätigung erfolgt ist.';
  @override
  String get emailConfirmedSuccess =>
      'Ihre E-Mail wurde bestätigt. Ihr Konto ist fertig.';
  @override
  String get emailVerifiedLabel => 'E-Mail bestätigt';
  @override
  String get proEmailRequiredTitle => 'E-Mail-Konto für Pro erforderlich';
  @override
  String get proEmailRequiredBody =>
      'Gastkonten können Pro nicht erwerben. Erstellen Sie ein E-Mail-Konto, um Ihre Daten zu behalten und die Abrechnung freizuschalten.';
  @override
  String get proLinkAccountAction => 'Konto erstellen und fortfahren';
  @override
  String get proAccountLinked =>
      'Konto verknüpft. Sie können jetzt mit der Pro-Kaufabwicklung fortfahren.';
  @override
  String get supabaseNotConfigured =>
      'Kontodienst nicht verfügbar. Bitte versuchen Sie es später noch einmal.';
  @override
  String get privacyTitle => 'Daten & Privatsphäre';
  @override
  String get privacySubtitle => 'Fotos und Kontodaten';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Belegbilder werden nicht auf dem Server gespeichert; Es wird nur die Produktliste extrahiert.\\n\\n'
      'Wenn Sie angemeldet sind, können Scans und Aktualitätsdaten in Ihrem Konto gespeichert werden.'
      'Der kostenlose Plan zeigt Google AdMob-Anzeigen; Pro hat keine Werbung.\\n\\n'
      'Öffnen Sie die Online-Datenschutzerklärung für den vollständigen Text.';
  @override
  String get privacyViewOnline => 'Datenschutzerklärung öffnen';
  @override
  String get pantryHistoryTitle => 'Geschichte der Speisekammer';
  @override
  String get pantryHistoryEmpty =>
      'Noch keine gespeicherten Scans.\\nScannen Sie Ihren Kühlschrank, um den Bauverlauf anzuzeigen.';
  @override
  String get pantryHistorySubtitle => 'In der Cloud gespeicherte Scans';
  @override
  String get splashTagline => 'Obst und Gemüse – eine App';
  @override
  String get splashLoading => 'Laden…';
  @override
  String get onboardingSkip => 'Überspringen';
  @override
  String get onboardingNext => 'Nächste';
  @override
  String get onboardingStart => 'Start';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Aktuelle Scans';
  @override
  String get cameraTapToOpen => 'Tippen Sie auf das Symbol, um die Kamera zu öffnen';
  @override
  String get cameraOrGalleryHint => 'Öffnen Sie die Kamera oder wählen Sie aus der Galerie aus';
  @override
  String get captureOrGalleryHint => 'Erfassen oder aus der Galerie auswählen';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Kamera schließen';
  @override
  String get noIngredients => 'Keine Inhaltsstoffe erkannt.';
  @override
  String get recipeInstructions => 'Anweisungen';
  @override
  String get untitledRecipe => 'Rezept ohne Titel';
  @override
  String get genericLoadError => 'Etwas ist schief gelaufen. Bitte versuchen Sie es erneut.';
  @override
  String get scanConfirmTitle => 'Foto bestätigen';
  @override
  String get scanConfirmSubtitle =>
      'Dieses Foto senden? Die Rezeptanalyse beginnt nach Ihrer Bestätigung.';
  @override
  String get scanConfirmAnalyze => 'Analysieren';
  @override
  String get scanConfirmCancel => 'Stornieren';
  @override
  String get scanConfirmRetake => 'Wiederholung';
  @override
  String get scanConfirmPickOther => 'Wählen Sie ein anderes';
  @override
  String get clearRecentScans => 'Letzte Scans löschen';
  @override
  String get clearRecentScansSubtitle => 'Löscht den lokalen Verlauf auf dem Gerät';
  @override
  String get clearRecentScansConfirmTitle => 'Letzte Scans löschen?';
  @override
  String get clearRecentScansConfirmBody =>
      'Kann nicht rückgängig gemacht werden. Favoriten sind nicht betroffen.';
  @override
  String get clearRecentScansDone => 'Letzte Scans gelöscht';
  @override
  String get deleteAction => 'Löschen';
  @override
  String get imageQualityTitle => 'Geringe Fotoqualität';
  @override
  String get imageQualityDark => 'Das Bild ist zu dunkel. Fügen Sie Licht hinzu und versuchen Sie es erneut.';
  @override
  String get imageQualityBlurry =>
      'Das Bild ist möglicherweise verschwommen. Bleiben Sie ruhig und wiederholen Sie den Vorgang.';
  @override
  String get imageQualityContinue => 'Machen Sie trotzdem weiter';
  @override
  String get imageQualityRetake => 'Wiederholung';
  @override
  String receiptQueueTitle(int count) => '$count Beleg(e) warten offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Quittung ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Verfahren';
  @override
  String get receiptQueuedOffline =>
      'Offline. Empfang in der Warteschlange; Prozess, wenn verbunden.';
  @override
  String get receiptLowConfidenceBlock =>
      'Bearbeiten Sie Elemente mit geringer Vertrauenswürdigkeit vor dem Speichern (Bleistiftsymbol).';
  @override
  String get unifiedPantryTitle => 'Einheitliches Inventar';
  @override
  String get unifiedPantryEmpty => 'Noch keine Artikel oder Scans.';
  @override
  String get searchHint => 'Produkte suchen…';
  @override
  String get navShopping => 'Einkaufen';
  @override
  String get shoppingAddHint => 'Fehlendes Element hinzufügen';
  @override
  String get shoppingEmpty => 'Ihre Einkaufsliste ist leer.';
  @override
  String get shoppingClearDone => 'Klar abgeschlossen';
  @override
  String get shoppingDoneSection => 'Erledigt';
  @override
  String get shoppingAddFromRecipe => 'Fügen Sie Artikel hinzu, die nicht im Wareneingangsbestand enthalten sind';
  @override
  String get freshnessViewCalendar => 'Kalender';
  @override
  String get freshnessViewList => 'Liste';
  @override
  String get cookToday => 'Was soll man heute kochen?';
  @override
  String get cookTodayNoUrgent =>
      'Keine dringenden Artikel. Scannen Sie eine Quittung, um die Frische zu verfolgen.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Im Scan, aber nicht im Wareneingangsbestand gesehen: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Lokale Daten exportieren';
  @override
  String get exportLocalDataSubtitle => 'Kopiert JSON in die Zwischenablage';
  @override
  String get exportLocalDataDone => 'Daten in die Zwischenablage kopiert';
  @override
  String get clearLocalData => 'Lokale Daten löschen';
  @override
  String get clearLocalDataSubtitle =>
      'Frische, Einkaufen, Vorlieben (irreversibel)';
  @override
  String get clearLocalDataConfirmTitle => 'Lokale Daten löschen?';
  @override
  String get clearLocalDataConfirmBody =>
      'Frischebestand und Einkaufsliste vom Gerät entfernt.';
  @override
  String get clearLocalDataDone => 'Lokale Daten gelöscht';
  @override
  String get settingsTitle => 'Einstellungen';
  @override
  String get languageTitle => 'Sprache';
  @override
  String get languageSubtitle => 'App-Sprache · 27 Sprachen';
  @override
  String get localePreparingTitle => 'Sprache aktualisieren';
  @override
  String get localePreparingSubtitle =>
      'Rezepte und Scanergebnisse übersetzen…';
  @override
  String get dietTitle => 'Diätpräferenz';
  @override
  String get dietSubtitle => 'Wird auf Rezeptvorschläge angewendet';
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
  String get aiUsageLabelPantry => 'Speisekammer';
  @override
  String get aiUsageLabelReceipt => 'Quittung';
  @override
  String get aiUsageLabelRecipe => 'Rezept';
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
  String get storeUnavailable =>
      'Der Store ist derzeit nicht verfügbar. Bitte versuchen Sie es später erneut.';
  @override
  String get proProductIdsNotConfigured => 'Pro-Produkt-IDs sind noch nicht konfiguriert.';
  @override
  String get noProProductsFound => 'Keine kaufbaren Pro-Produkte gefunden.';
  @override
  String get purchaseFlowFailed => 'Kauf konnte nicht gestartet werden.';
  @override
  String get purchaseCompletedProActivated => 'Kauf abgeschlossen. Pro-Plan aktiviert.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Kauf abgeschlossen. Verifizierung derzeit nicht möglich, bitte später erneut versuchen.';
  @override
  String get purchaseFailed => 'Kauf fehlgeschlagen.';
  @override
  String get restorePurchases => 'Käufe wiederherstellen';
  @override
  String get restorePurchasesStarted => 'Frühere Käufe im Play Store werden überprüft…';
  @override
  String get nutritionTitle => 'Ernährung (Schätzung)';
  @override
  String get nutritionPerServing => 'pro Portion';
  @override
  String get nutritionCalories => 'Kalorien';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Kohlenhydrate';
  @override
  String get nutritionFat => 'Fett';
  @override
  String get nutritionEstimateNote =>
      'Nur KI-Schätzung; keine medizinische oder Ernährungsberatung.';
  @override
  String get barcodeScanTitle => 'Barcode scannen';
  @override
  String get barcodeScanHint =>
      'Barcode im Rahmen ausrichten. Produktsuche über Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produkt nicht gefunden. Versuchen Sie es stattdessen mit dem Beleg- oder Kühlschrank-Scan.';
  @override
  String get barcodeConfirmTitle => 'Produkt bestätigen';
  @override
  String get barcodeAddToPantry => 'Zum Frischebestand hinzufügen';
  @override
  String get navScan => 'Scan';
  @override
  String get captureTypeFridge => 'Kühlschrank';
  @override
  String get captureTypeReceipt => 'Quittung';
  @override
  String get captureTypeBarcode => 'Barcode';
  @override
  String get sectionAccount => 'Konto';
  @override
  String get sectionPreferences => 'Präferenzen';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Privatsphäre';
  @override
  String get sessionTitle => 'Sitzung';
  @override
  String get guestUser => 'Gastbenutzer';
  @override
  String get favoritesTitle => 'Favoriten';
  @override
  String get favoritesSubtitle => 'Rezepte, die Sie gespeichert haben';
  @override
  String get freshnessInventorySubtitle =>
      'Produkte aus Quittungen und Verfallsdaten';
  @override
  String get pantrySyncSubtitle => 'Ziehen Sie den Frischebestand aus der Cloud ab';
  @override
  String get showOnboardingAgain => 'Onboarding-Tour erneut anzeigen';
  @override
  String get signOut => 'Abmelden';
  @override
  String get scanSubtitleSmart => 'Intelligenter Vorratsscan';
  @override
  String get scanSubtitleReceipt => 'Belegscan und Frischeverfolgung';
  @override
  String get tooltipSettings => 'Einstellungen';
  @override
  String get tooltipToggleGuide => 'Rahmenführung umschalten';
  @override
  String get tooltipModesAbout => 'Informationen zu Scanmodi';
  @override
  String get galleryLabel => 'Galerie';
  @override
  String get cameraLoading => 'Kamera vorbereiten…';
  @override
  String get cameraUnavailable =>
      'Kamera nicht verfügbar.\\nÜberprüfen Sie die Berechtigungen und versuchen Sie es erneut.';
  @override
  String get captureFailed =>
      'Die Aufnahme ist fehlgeschlagen. Überprüfen Sie die Kameraberechtigung und versuchen Sie es erneut.';
  @override
  String get receiptCaptureAlign =>
      'Beleg im vertikalen Rahmen ausrichten und erfassen';
  @override
  String get receiptCameraHint =>
      'Öffnen Sie die Kamera oder wählen Sie ein Belegfoto aus der Galerie aus';
  @override
  String get pickPhotoHint => 'Tippen Sie auf die Schaltfläche, um ein Foto auszuwählen';
  @override
  String get desktopGalleryHint =>
      'Desktop-Modus – wählen Sie ein Kühlschrankfoto aus der Galerie aus.';
  @override
  String get noCameraOnDevice => 'Auf diesem Gerät wurde keine Kamera gefunden.';
  @override
  String get openCameraButton => 'Kamera öffnen';
  @override
  String get pickPhotoButton => 'Foto auswählen';
  @override
  String get overlayGuideOn => 'Anleitung zum Thema';
  @override
  String get overlayGuideOff => 'Führung ab';
  @override
  String get modeSheetTitle => 'Scanmodi';
  @override
  String get modeSheetSubtitle =>
      'Vor der Aufnahme auswählen; Es ändert die Regeln für KI-Rezepte.';
  @override
  String get scanModeQuickLabel => 'Schneller Scan';
  @override
  String get scanModeQuickSubtitle => 'Rezepte unter 15 Min';
  @override
  String get scanModeQuickDesc =>
      'Praktische Mahlzeiten für jeden Tag. Alle Rezepte dauern insgesamt 15 Minuten oder weniger; einfache Techniken (eine Pfanne, Salat, Schnellbraten).';
  @override
  String get scanModeSurvivalLabel => 'Rettung';
  @override
  String get scanModeSurvivalSubtitle => 'Verwenden Sie zuerst abgelaufene Artikel';
  @override
  String get scanModeSurvivalDesc =>
      'Reduziert Abfall. Priorisiert Artikel, die kurz vor dem Verderben stehen. Optionale Hinweisfeldelemente werden priorisiert.';
  @override
  String get scanModeChefLabel => 'Chef-Modus';
  @override
  String get scanModeChefSubtitle => 'Gourmet & detailliert';
  @override
  String get scanModeChefDesc =>
      'Raffiniertere Rezepte. Schichttechniken, längere Garzeiten; mindestens zwei Rezepte mit der Markierung „schwer“.';
  @override
  String get scanModeQuickBestFor =>
      'Mahlzeiten unter der Woche mit minimalem Zutaten- und Zeitaufwand';
  @override
  String get scanModeQuickExamples =>
      '• 10-minütiges Omelett\\n• Nudeln aus einer Pfanne\\n• Wrap oder Schüssel ohne Kochen';
  @override
  String get scanModeSurvivalBestFor =>
      'Artikel nutzen, bevor sie ablaufen, und Abfall vermeiden';
  @override
  String get scanModeSurvivalExamples =>
      '• Saubere Gemüsesuppe\\n• Ofen-Frittata\\n• Übrig gebliebener gebratener Reis';
  @override
  String get scanModeChefBestFor =>
      'Besondere Abendessen, Gäste oder das Erlernen einer Technik';
  @override
  String get scanModeChefExamples =>
      '• Pansauce-Protein\\n• Knuspriger und cremiger Teller\\n• Karamellisierte Gemüsegarnitur';
  @override
  String get scanModeIdealForLabel => 'Am besten für';
  @override
  String get scanModeExamplesLabel => 'Beispielgerichte';
  @override
  String get survivalHintAddFromPantry => 'Aus Frische hinzufügen';
  @override
  String get filterAll => 'Alle';
  @override
  String get filterCritical => 'Kritisch';
  @override
  String get filterWarning => 'Warnung';
  @override
  String get filterSafe => 'Sicher';
  @override
  String get recipesScreenTitle => 'Rezepte';
  @override
  String get copyRecipe => 'Kopie';
  @override
  String get shareRecipe => 'Aktie';
  @override
  String get recipeCopiedSnack => 'Rezept in die Zwischenablage kopiert';
  @override
  String get survivalHintTitle => 'Läuft bald ab';
  @override
  String get survivalHintOptional => 'Optional – z.B. Milch, Tomate, Joghurt';
  @override
  String get survivalHintPlaceholder => 'Mit Kommas trennen';
  @override
  String get scanConfirmReceiptLabel => 'Quittungsscan';
  @override
  String get scanSavedHistory => 'Scan im Speisekammerverlauf gespeichert';
  @override
  String get scanSaveFailedPrefix => 'Der Scan konnte nicht gespeichert werden';
  @override
  String get daysUnit => 'Tage';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Erkannte Inhaltsstoffe';
  @override
  String recipesAiCount(int count) => 'KI-Rezepte ·$count';
  @override
  String get galleryPickMessage => 'Wählen Sie ein Foto aus der Galerie aus';
  @override
  String get favoritesEmpty =>
      'Noch keine Lieblingsrezepte.\\nTippen Sie auf das Herz bei den Rezeptergebnissen.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Rezept ${index + 1}' : 'Rezept';

  @override
  String get timeAgoJustNow => 'Soeben';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}vor m';
  @override
  String timeAgoHours(int hours) => '${hours}vor h';
  @override
  String timeAgoDays(int days) => '${days}vor d';
  @override
  String get daysExpired => 'Abgelaufen';
  @override
  String get daysToday => 'Heute';
  @override
  String get daysTomorrow => 'Morgen';
  @override
  String daysCount(int days) => '$days Tage';
  @override
  String unifiedDaysRemaining(int days) => '$days Tage übrig';
  @override
  String productCount(int count) => '$count Artikel';
  @override
  String get unifiedSourceReceipt => 'Quittung';
  @override
  String get unifiedSourceScan => 'Scan';
  @override
  String unifiedLastScan(String date) => 'Letzter Scan ·$date';
  @override
  String get receiptFieldProductName => 'Produktname';
  @override
  String get receiptFieldQuantity => 'Menge';
  @override
  String get receiptFieldCategory => 'Kategorie';
  @override
  String expiryApprox(int days) => 'Mindestens haltbar bis ~$days Tage';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Fehlende Zutaten zur Einkaufsliste hinzugefügt';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients Zutaten ·$recipes Rezepte';
  @override
  String get favoriteAddTooltip => 'Zu Favoriten hinzufügen';
  @override
  String get favoriteRemoveTooltip => 'Aus Favoriten entfernen';
  @override
  String get favoriteAddedSnack => 'Zu den Favoriten hinzugefügt';
  @override
  String get favoriteRemovedSnack => 'Aus den Favoriten entfernt';
  @override
  String get onboardingScanTitle => 'Scannen Sie Ihre Speisekammer';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Einkaufsliste';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favoriten und aktuelle Scans';
  @override
  String get onboardingFavoritesBody =>
      'Speichern Sie Rezepte, die Ihnen gefallen. Aktuelle Scans werden schnell über den Startbildschirm geöffnet.';
  @override
  String get onboardingCloudTitle => 'Cloud-Geschichte';
  @override
  String get onboardingCloudBody =>
      'Melden Sie sich an, um den Scanverlauf in Ihrem Konto zu speichern und jederzeit zurückzukehren.';
  @override
  String get onboardingPermissionsTitle => 'Kamera & Benachrichtigungen';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef benötigt Kamerazugriff zum Scannen von Kühlschrank, Belegen und Barcodes. Optionale Benachrichtigungen erinnern Sie, wenn Lebensmittel ablaufen.';
  @override
  String get emptyStateScanReceipt => 'Beleg scannen';
  @override
  String get emptyStateStartScan => 'Scan starten';
  @override
  String get manageSubscriptions => 'Abo verwalten';
  @override
  String get notificationCriticalChannelName => 'Frischewarnungen';
  @override
  String get notificationCriticalChannelDesc => 'Artikel laufen bald ab';
  @override
  String get notificationDailyChannelName => 'Tägliche Zusammenfassung';
  @override
  String get notificationDailyChannelDesc => 'Tägliche Frische-Erinnerung';
  @override
  String get notificationCriticalTitle => 'Artikel laufen bald ab';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Überprüfen Sie das Fenster „Frische“.';
  @override
  String get notificationDailyTitle => 'Frischekontrolle';
  @override
  String get notificationDailyBody =>
      'Überprüfen Sie die Elemente, die Sie heute verwenden sollten.';
  @override
  String get widgetFreshnessGood => 'Frische sieht gut aus';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count Artikel können heute ablaufen';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritisch ·$warning Warnung';
  @override
  String get categoryDairy => 'Molkerei';
  @override
  String get categoryMeat => 'Fleisch / Fisch';
  @override
  String get categoryFruit => 'Obst';
  @override
  String get categoryVegetable => 'Gemüse';
  @override
  String get categoryBeverage => 'Getränk';
  @override
  String get categoryBakery => 'Bäckerei';
  @override
  String get categoryPantry => 'Speisekammer';
  @override
  String calendarMonthName(int month) => const [
        'Januar',
        'Februar',
        'Marsch',
        'April',
        'Mai',
        'Juni',
        'Juli',
        'August',
        'September',
        'Oktober',
        'November',
        'Dezember',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Rezepte';
  @override
  String get recipesPlaceholderBody =>
      'Nach einem erfolgreichen Scan werden hier Rezeptergebnisse angezeigt.';
  @override
  String get recipeSamplePlating => 'Probenbeschichtung';
  @override
  String get recipeShareInstructionsHeader => 'Anweisungen:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Thema';
  @override
  String get themeSubtitle => 'Farbpalette und Hintergrund';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Standardmäßig dunkelgrün';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Kühle Blautöne';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Warme Bernsteinakzente';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Lila Akzent dunkel';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Heller Hintergrund';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Warme Creme mit orangefarbenem Akzent';
}
