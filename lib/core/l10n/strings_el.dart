import 'strings_base.dart';

class StringsEl implements StringsBase {
  const StringsEl();

  @override
  String get analysisTitle => 'Αναλύοντας το ντουλάπι';
  @override
  String get stepPrepareImage => 'Προετοιμασία φωτογραφίας…';
  @override
  String get stepAnalyzeAi => 'Ανίχνευση συστατικών…';
  @override
  String get stepBuildRecipes => 'Οικοδομικές συνταγές…';
  @override
  String get receiptAnalysisTitle => 'Απόδειξη ανάγνωσης';
  @override
  String get stepReceiptPrepare => 'Προετοιμασία εικόνας απόδειξης…';
  @override
  String get stepReceiptOcr => 'Αναγνώριση αντικειμένων…';
  @override
  String get stepReceiptInfer => 'Εκτίμηση της διάρκειας ζωής…';
  @override
  String get receiptNotRecognized =>
      'Δεν ήταν δυνατή η ανάγνωση της απόδειξης. Δοκιμάστε μια πιο καθαρή, πιο επίπεδη φωτογραφία.';
  @override
  String get receiptNotDetected =>
      'Δεν εντοπίστηκε απόδειξη. Ευθυγραμμίστε την απόδειξη στο πλαίσιο.';
  @override
  String get receiptConfirmTitle => 'Επιβεβαιώστε τα είδη παραλαβής';
  @override
  String get receiptConfirmSubtitle =>
      'Επιλέξτε στοιχεία για προσθήκη. Πατήστε παρατεταμένα για επεξεργασία.';
  @override
  String get receiptConfirmSave => 'Προσθέστε στο ντουλάπι';
  @override
  String get receiptSelectOne => 'Επιλέξτε τουλάχιστον ένα στοιχείο.';
  @override
  String get receiptSaved => 'Αντικείμενα που προστέθηκαν στο απόθεμα φρεσκάδας';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Να σταλεί αυτή η φωτογραφία απόδειξης; Η ανάλυση OCR ξεκινά αφού επιβεβαιώσετε.';
  @override
  String get navFreshness => 'Φρεσκάδα';
  @override
  String get freshnessPanelTitle => 'Πάνελ φρεσκάδας';
  @override
  String get freshnessCritical => 'Κρίσιμη (0–2 ημέρες)';
  @override
  String get freshnessWarning => 'Προειδοποίηση (3–5 ημέρες)';
  @override
  String get freshnessSafe => 'Ασφαλές (6+ ημέρες)';
  @override
  String get freshnessEmpty =>
      'Δεν υπάρχουν ακόμη στοιχεία παρακολούθησης. Σαρώστε μια απόδειξη για τη δημιουργία αποθέματος.';
  @override
  String get freshnessListTitle => 'Απογραφή φρεσκάδας';
  @override
  String get freshnessListEmpty => 'Δεν υπάρχουν στοιχεία σε αυτό το φίλτρο.';
  @override
  String get freshnessSuggestRecipes => 'Προτείνετε συνταγές με αυτά';
  @override
  String get savingsPanelTitle => 'Πίνακας αποταμίευσης';
  @override
  String get savingsPanelEmptyHint =>
      'Επισημάνετε τα προϊόντα που σχεδόν λήγουν ως "Γεύμα παρασκευασμένο" για να παρακολουθείτε τα απόβλητα που αποτρέπονται εδώ.';
  @override
  String get savingsStatItems => 'Διασώθηκε';
  @override
  String get savingsStatWaste => 'Αποτράπηκε η σπατάλη';
  @override
  String get savingsStatMoney => 'Εκτιμ. οικονομίες';
  @override
  String get savingsDashboardTitle => 'Αναλυτικά στοιχεία αποταμίευσης';
  @override
  String get savingsDashboardSubtitle =>
      'Σύνοψη του φαγητού που αποθηκεύσατε από τον κάδο — αυτόν τον μήνα.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 συστατικό σώθηκε από τα απόβλητα αυτόν τον μήνα'
          : '$count συστατικά που σώθηκαν από τα απόβλητα αυτόν τον μήνα';
  @override
  String savingsKgPrevented(String kg) => 'Αποτροπή σπατάλης τροφίμων:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Εκτιμώμενο οικονομικό κέρδος:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Τελευταίες 4 εβδομάδες';
  @override
  String get savingsRecentTitle => 'Πρόσφατες διασώσεις';
  @override
  String get savingsEmptySubtitle =>
      'Δεν υπάρχουν ακόμα εγγραφές. Όταν χρησιμοποιείτε ένα κρίσιμο ή προειδοποιητικό στοιχείο, εμφανίζεται εδώ.';
  @override
  String get savingsHowItWorks =>
      'Τα αντικείμενα που χρησιμοποιούνται εντός 5 ημερών από τη λήξη υπολογίζονται ως διασωθέντα. Το βάρος και η αξία υπολογίζονται από τους μέσους όρους της κατηγορίας.';
  @override
  String get pantryNamesLocaleNote =>
      'Τα ονόματα προϊόντων και καταστημάτων εμφανίζονται ως αποθηκευμένα στην απόδειξή σας. Οι κοινοί όροι εμφανίζονται στα αγγλικά.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Χρησιμοποιήθηκε την τελευταία μέρα' : 'Χρησιμοποιείται με$days απομένουν μέρες';
  @override
  String get savingsMealMade => 'Φτιαγμένο γεύμα';
  @override
  String savingsMealMadeConfirm(String name) => 'Σημάδι$name όπως καταναλώνεται;';
  @override
  String savingsRescuedSnack(String money) => 'Καταγράφηκαν οικονομίες ·$money';
  @override
  String get freshnessRecipeTitle => 'Προετοιμασία συνταγών';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Απαιτείται τουλάχιστον ένα είδος για συνταγές.';
  @override
  String get freshnessCriticalBanner => 'Λήγει σύντομα';
  @override
  String get freshnessViewAll => 'Προβολή όλων';
  @override
  String get receiptCaptureHints =>
      'Κρατήστε την απόδειξη επίπεδη, καλός φωτισμός. Όλες οι γραμμές ορατές σε κάθετο πλαίσιο.';
  @override
  String get receiptPurchaseDate => 'Ημερομηνία αγοράς';
  @override
  String get receiptTapToEdit => 'Εκδίδω';
  @override
  String get receiptEditItem => 'Επεξεργασία στοιχείου';
  @override
  String get receiptEditSave => 'Εκτός';
  @override
  String get receiptExpiryDaysLabel => 'Εκτιμώμενη διάρκεια ζωής (ημέρες)';
  @override
  String get receiptMergedSnack => 'Ορισμένα στοιχεία συγχωνεύτηκαν με υπάρχουσες εγγραφές';
  @override
  String get receiptCloudSyncFailed => 'Δεν ήταν δυνατή η αποθήκευση στο cloud';
  @override
  String get receiptCloudSynced => 'Τα στοιχεία συγχρονίστηκαν με το cloud';
  @override
  String get pantrySyncAction => 'Συγχρονισμός δεδομένων φρεσκάδας';
  @override
  String get pantrySyncDone => 'Τα δεδομένα φρεσκάδας ενημερώθηκαν';
  @override
  String get pantrySyncFailed => 'Ο συγχρονισμός απέτυχε';
  @override
  String get freshnessNotificationsTitle => 'Ειδοποιήσεις φρεσκάδας';
  @override
  String get freshnessNotificationsSubtitle =>
      'Κρίσιμα στοιχεία και καθημερινή υπενθύμιση';
  @override
  String get freshnessNotificationTimeLabel => 'Καθημερινή ώρα υπενθύμισης';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Κάθε μέρα στις$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Αυτή την εβδομάδα:$critical κρίσιμος,$warning προειδοποιητικά στοιχεία. Χρησιμοποιήστε αυτά πρώτα.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Σφάλμα δικτύου. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';
  @override
  String get geminiQuotaExceeded =>
      'Υπέρβαση του ορίου AI. Περιμένετε λίγα λεπτά και δοκιμάστε ξανά.';
  @override
  String get geminiBillingDepleted =>
      'Οι πιστώσεις προπληρωμής του Google AI Studio έχουν εξαντληθεί. Προσθέστε χρέωση στο ai.google.dev για να επαναφέρετε τις λειτουργίες AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Η αυτόματη επανάληψη μπορεί να είναι διαθέσιμη στο$minutes ελάχ.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Συμπληρώθηκε το ημερήσιο όριο μετάφρασης AI (3/3). Οι συνταγές χρησιμοποιούν βασική μετάφραση μέχρι αύριο.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Έχετε$remaining Οι μεταφράσεις AI αποχώρησαν σήμερα.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Συμπληρώθηκε το ημερήσιο όριο σάρωσης αποθήκης (3). Δοκιμάστε ξανά αύριο.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Συμπληρώθηκε το ημερήσιο όριο σάρωσης αποδείξεων (2). Δοκιμάστε ξανά αύριο.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Συμπληρώθηκε το ημερήσιο όριο παραγωγής συνταγών (3). Δοκιμάστε ξανά αύριο.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Παρακαλώ περιμένετε$seconds δευτερόλεπτο(α) πριν προσπαθήσετε ξανά.';
  @override
  String get adRewardTitlePantry => 'Συμπληρώθηκε το όριο σάρωσης ντουλαπιού';
  @override
  String get adRewardTitleReceipt => 'Συμπληρώθηκε το όριο σάρωσης αποδείξεων';
  @override
  String get adRewardTitleRecipe => 'Συμπληρώθηκε το όριο παραγωγής συνταγής';
  @override
  String get adRewardSubtitle =>
      'Παρακολουθήστε μια σύντομη διαφήμιση για να κερδίσετε +1 επιπλέον χρήση σήμερα (έως 3 ανά ημέρα).';
  @override
  String get adRewardWatchButton => 'Παρακολούθηση διαφήμισης (+1 χρήση)';
  @override
  String get adRewardGranted => 'Παρέχεται επιπλέον χρήση. Προσπαθήστε ξανά.';
  @override
  String get adRewardNotCompleted =>
      'Η αγγελία δεν ολοκληρώθηκε. Δεν χορηγήθηκε επιπλέον χρήση.';
  @override
  String get adRewardDailyCapReached =>
      'Φτάσατε το σημερινό όριο ανταμοιβής διαφημίσεων.';
  @override
  String get geminiTimeout =>
      'Το χρονικό όριο του αιτήματος έληξε. Ελέγξτε τη σύνδεσή σας και δοκιμάστε ξανά.';
  @override
  String get geminiServerError =>
      'Η υπηρεσία AI δεν είναι διαθέσιμη προσωρινά. Δοκιμάστε ξανά αργότερα.';
  @override
  String get imageNotRecognized =>
      'Η εικόνα δεν αναγνωρίζεται. Βελτιώστε τον φωτισμό ή δοκιμάστε άλλη γωνία.';
  @override
  String get imageNotPantry =>
      'Το ψυγείο ή το ντουλάπι δεν είναι ορατό. Παρακαλώ φωτογραφίστε απευθείας.';
  @override
  String get parseError =>
      'Δεν ήταν δυνατή η ανάλυση της απόκρισης AI. Παρακαλώ σαρώστε ξανά.';
  @override
  String get modelUnavailable =>
      'Το μοντέλο AI δεν είναι διαθέσιμο. Ελέγξτε την πρόσβασή σας στο API.';
  @override
  String get genericError => 'Κάτι πήγε στραβά. Δοκιμάστε ξανά.';
  @override
  String get imageDecodeError => 'Δεν ήταν δυνατή η ανάγνωση της φωτογραφίας. Δοκιμάστε άλλη εικόνα.';
  @override
  String get authSubtitle => 'Έξυπνη πρόσβαση στο ντουλάπι';
  @override
  String get authInitializing => 'Προετοιμασία συνεδρίας…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Σύνθημα';
  @override
  String get emailRequired => 'Απαιτείται email';
  @override
  String get emailInvalid => 'Μη έγκυρο email';
  @override
  String get passwordMin => 'Τουλάχιστον 6 χαρακτήρες';
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
  String get signIn => 'Συνδεθείτε';
  @override
  String get signUp => 'Δημιουργία λογαριασμού';
  @override
  String get toggleToSignIn => 'Έχετε ήδη λογαριασμό; Συνδεθείτε';
  @override
  String get toggleToSignUp => 'Νέος εδώ; Δημιουργία λογαριασμού';
  @override
  String get guestContinue => 'Συνεχίστε ως επισκέπτης';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Ο λογαριασμός δημιουργήθηκε. Ανοίξτε τον σύνδεσμο επιβεβαίωσης στα εισερχόμενά σας. η εφαρμογή θα σας ειδοποιήσει όταν επαληθευτεί.';
  @override
  String get emailConfirmedSuccess =>
      'Το email σας επιβεβαιώθηκε. Ο λογαριασμός σας είναι έτοιμος.';
  @override
  String get emailVerifiedLabel => 'Το email επαληθεύτηκε';
  @override
  String get proEmailRequiredTitle => 'Απαιτείται λογαριασμός email για το Pro';
  @override
  String get proEmailRequiredBody =>
      'Οι λογαριασμοί επισκεπτών δεν μπορούν να αγοράσουν Pro. Δημιουργήστε έναν λογαριασμό email για να διατηρήσετε τα δεδομένα σας και να ξεκλειδώσετε τη χρέωση.';
  @override
  String get proLinkAccountAction => 'Δημιουργήστε λογαριασμό και συνεχίστε';
  @override
  String get proAccountLinked =>
      'Ο λογαριασμός συνδέθηκε. Μπορείτε να συνεχίσετε στο ταμείο Pro τώρα.';
  @override
  String get supabaseNotConfigured =>
      'Η υπηρεσία λογαριασμού δεν είναι διαθέσιμη. Δοκιμάστε ξανά αργότερα.';
  @override
  String get privacyTitle => 'Δεδομένα και απόρρητο';
  @override
  String get privacySubtitle => 'Φωτογραφίες και δεδομένα λογαριασμού';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Οι εικόνες απόδειξης δεν αποθηκεύονται στον διακομιστή. εξάγεται μόνο η λίστα προϊόντων.\\n\\n'
      'Όταν είστε συνδεδεμένοι, οι σαρώσεις και τα δεδομένα ανανέωσης ενδέχεται να αποθηκευτούν στον λογαριασμό σας.'
      'Το δωρεάν πρόγραμμα εμφανίζει διαφημίσεις Google AdMob. Το Pro δεν έχει διαφημίσεις.\\n\\n'
      'Ανοίξτε την ηλεκτρονική πολιτική απορρήτου για το πλήρες κείμενο.';
  @override
  String get privacyViewOnline => 'Ανοίξτε την πολιτική απορρήτου';
  @override
  String get pantryHistoryTitle => 'Ιστορία αποθήκης';
  @override
  String get pantryHistoryEmpty =>
      'Δεν υπάρχουν ακόμη αποθηκευμένες σαρώσεις.\\nΣαρώστε το ψυγείο σας για να δημιουργήσετε ιστορικό.';
  @override
  String get pantryHistorySubtitle => 'Σαρώσεις αποθηκευμένες στο σύννεφο';
  @override
  String get splashTagline => 'Παραγωγή & ντουλάπι — μία εφαρμογή';
  @override
  String get splashLoading => 'Φόρτωση…';
  @override
  String get onboardingSkip => 'Παραλείπω';
  @override
  String get onboardingNext => 'Επόμενος';
  @override
  String get onboardingStart => 'Αρχή';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Πρόσφατες σαρώσεις';
  @override
  String get cameraTapToOpen => 'Πατήστε το εικονίδιο για να ανοίξετε την κάμερα';
  @override
  String get cameraOrGalleryHint => 'Ανοίξτε την κάμερα ή επιλέξτε από τη συλλογή';
  @override
  String get captureOrGalleryHint => 'Λήψη ή επιλογή από τη συλλογή';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Κλείστε την κάμερα';
  @override
  String get noIngredients => 'Δεν εντοπίστηκαν συστατικά.';
  @override
  String get recipeInstructions => 'Οδηγίες';
  @override
  String get untitledRecipe => 'Συνταγή χωρίς τίτλο';
  @override
  String get genericLoadError => 'Κάτι πήγε στραβά. Δοκιμάστε ξανά.';
  @override
  String get scanConfirmTitle => 'Επιβεβαίωση φωτογραφίας';
  @override
  String get scanConfirmSubtitle =>
      'Να σταλεί αυτή η φωτογραφία; Η ανάλυση της συνταγής ξεκινά αφού επιβεβαιώσετε.';
  @override
  String get scanConfirmAnalyze => 'Αναλύω';
  @override
  String get scanConfirmCancel => 'Ματαίωση';
  @override
  String get scanConfirmRetake => 'Ξαναπαίρνω';
  @override
  String get scanConfirmPickOther => 'Διαλέξτε άλλο';
  @override
  String get clearRecentScans => 'Διαγραφή πρόσφατων σαρώσεων';
  @override
  String get clearRecentScansSubtitle => 'Διαγράφει το τοπικό ιστορικό στη συσκευή';
  @override
  String get clearRecentScansConfirmTitle => 'Διαγραφή πρόσφατων σαρώσεων;';
  @override
  String get clearRecentScansConfirmBody =>
      'Δεν είναι δυνατή η αναίρεση. Τα αγαπημένα δεν επηρεάζονται.';
  @override
  String get clearRecentScansDone => 'Οι πρόσφατες σαρώσεις διαγράφηκαν';
  @override
  String get deleteAction => 'Διαγράφω';
  @override
  String get imageQualityTitle => 'Χαμηλή ποιότητα φωτογραφίας';
  @override
  String get imageQualityDark => 'Η εικόνα είναι πολύ σκοτεινή. Προσθέστε φως και δοκιμάστε ξανά.';
  @override
  String get imageQualityBlurry =>
      'Η εικόνα μπορεί να είναι θολή. Μείνετε σταθεροί και ξαναπάρτε.';
  @override
  String get imageQualityContinue => 'Συνέχισε πάντως';
  @override
  String get imageQualityRetake => 'Ξαναπαίρνω';
  @override
  String receiptQueueTitle(int count) => '$count αποδείξεις σε αναμονή εκτός σύνδεσης';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Απόδειξη ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Διαδικασία';
  @override
  String get receiptQueuedOffline =>
      'Εκτός σύνδεσης. Η απόδειξη βρίσκεται στην ουρά. διαδικασία κατά τη σύνδεση.';
  @override
  String get receiptLowConfidenceBlock =>
      'Επεξεργαστείτε στοιχεία χαμηλής αξιοπιστίας πριν την αποθήκευση (εικονίδιο με μολύβι).';
  @override
  String get unifiedPantryTitle => 'Ενιαίο απόθεμα';
  @override
  String get unifiedPantryEmpty => 'Δεν υπάρχουν ακόμη στοιχεία ή σαρώσεις.';
  @override
  String get searchHint => 'Αναζήτηση προϊόντων…';
  @override
  String get navShopping => 'Ψώνια';
  @override
  String get shoppingAddHint => 'Προσθήκη στοιχείου που λείπει';
  @override
  String get shoppingEmpty => 'Η λίστα αγορών σας είναι άδεια.';
  @override
  String get shoppingClearDone => 'Η εκκαθάριση ολοκληρώθηκε';
  @override
  String get shoppingDoneSection => 'Γινώμενος';
  @override
  String get shoppingAddFromRecipe => 'Προσθέστε στοιχεία που δεν βρίσκονται στο απόθεμα παραλαβής';
  @override
  String get freshnessViewCalendar => 'Ημερολόγιο';
  @override
  String get freshnessViewList => 'Λίστα';
  @override
  String get cookToday => 'Τι να μαγειρέψετε σήμερα;';
  @override
  String get cookTodayNoUrgent =>
      'Χωρίς επείγοντα αντικείμενα. Σαρώστε μια απόδειξη για να παρακολουθήσετε τη φρεσκάδα.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Εμφανίζεται στη σάρωση αλλά όχι στο απόθεμα αποδείξεων: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Εξαγωγή τοπικών δεδομένων';
  @override
  String get exportLocalDataSubtitle => 'Αντιγράφει το JSON στο πρόχειρο';
  @override
  String get exportLocalDataDone => 'Τα δεδομένα αντιγράφηκαν στο πρόχειρο';
  @override
  String get clearLocalData => 'Διαγραφή τοπικών δεδομένων';
  @override
  String get clearLocalDataSubtitle =>
      'Φρεσκάδα, ψώνια, προτιμήσεις (μη αναστρέψιμη)';
  @override
  String get clearLocalDataConfirmTitle => 'Διαγραφή τοπικών δεδομένων;';
  @override
  String get clearLocalDataConfirmBody =>
      'Το απόθεμα φρεσκάδας και η λίστα αγορών καταργήθηκαν από τη συσκευή.';
  @override
  String get clearLocalDataDone => 'Τα τοπικά δεδομένα διαγράφηκαν';
  @override
  String get settingsTitle => 'Ρυθμίσεις';
  @override
  String get languageTitle => 'Γλώσσα';
  @override
  String get languageSubtitle => 'Γλώσσα εφαρμογής · 27 γλώσσες';
  @override
  String get localePreparingTitle => 'Ενημέρωση γλώσσας';
  @override
  String get localePreparingSubtitle =>
      'Μετάφραση συνταγών και αποτελεσμάτων σάρωσης…';
  @override
  String get dietTitle => 'Προτίμηση διατροφής';
  @override
  String get dietSubtitle => 'Εφαρμόζεται στις προτάσεις συνταγών';
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
  String get aiUsageLimitsLoading => 'Φόρτωση…';
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
  String get aiUsageLabelPantry => 'Ντουλάπι';
  @override
  String get aiUsageLabelReceipt => 'Παραλαβή';
  @override
  String get aiUsageLabelRecipe => 'Συνταγή';
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
  String get storeUnavailable => 'Το κατάστημα δεν είναι διαθέσιμο. Δοκιμάστε αργότερα.';
  @override
  String get proProductIdsNotConfigured => 'Τα αναγνωριστικά προϊόντων Pro δεν έχουν ρυθμιστεί.';
  @override
  String get noProProductsFound => 'Δεν βρέθηκαν προϊόντα Pro προς αγορά.';
  @override
  String get purchaseFlowFailed => 'Δεν ήταν δυνατή η έναρξη αγοράς.';
  @override
  String get purchaseCompletedProActivated => 'Η αγορά ολοκληρώθηκε. Το πλάνο Pro ενεργοποιήθηκε.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Η αγορά ολοκληρώθηκε. Η επαλήθευση απέτυχε· δοκιμάστε ξανά σύντομα.';
  @override
  String get purchaseFailed => 'Η αγορά απέτυχε.';
  @override
  String get restorePurchases => 'Επαναφορά αγορών';
  @override
  String get restorePurchasesStarted => 'Έλεγχος προηγούμενων αγορών στο Play Store…';
  @override
  String get nutritionTitle => 'Διατροφή (εκτίμηση)';
  @override
  String get nutritionPerServing => 'ανά μερίδα';
  @override
  String get nutritionCalories => 'Θερμίδες';
  @override
  String get nutritionProtein => 'Πρωτεΐνη';
  @override
  String get nutritionCarbs => 'Υδατάνθρακες';
  @override
  String get nutritionFat => 'Λίπος';
  @override
  String get nutritionEstimateNote =>
      'Μόνο εκτίμηση AI. όχι ιατρικές ή διατροφικές συμβουλές.';
  @override
  String get barcodeScanTitle => 'Σάρωση γραμμικού κώδικα';
  @override
  String get barcodeScanHint =>
      'Ευθυγραμμίστε τον γραμμωτό κώδικα στο πλαίσιο. Αναζήτηση προϊόντων μέσω Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Το προϊόν δεν βρέθηκε. Δοκιμάστε απόδειξη ή σάρωση ψυγείου.';
  @override
  String get barcodeConfirmTitle => 'Επιβεβαιώστε το προϊόν';
  @override
  String get barcodeAddToPantry => 'Προσθήκη στο απόθεμα φρεσκάδας';
  @override
  String get navScan => 'Σάρωση';
  @override
  String get captureTypeFridge => 'Ψυγείο';
  @override
  String get captureTypeReceipt => 'Παραλαβή';
  @override
  String get captureTypeBarcode => 'Barcode';
  @override
  String get sectionAccount => 'Λογαριασμός';
  @override
  String get sectionPreferences => 'Προτιμήσεις';
  @override
  String get sectionApp => 'App';
  @override
  String get sectionPrivacy => 'Μυστικότητα';
  @override
  String get sessionTitle => 'Συνεδρίαση';
  @override
  String get guestUser => 'Επισκέπτης χρήστης';
  @override
  String get favoritesTitle => 'Αγαπημένα';
  @override
  String get favoritesSubtitle => 'Συνταγές που αποθηκεύσατε';
  @override
  String get freshnessInventorySubtitle =>
      'Προϊόντα από αποδείξεις και ημερομηνίες λήξης';
  @override
  String get pantrySyncSubtitle => 'Τραβήξτε το απόθεμα φρεσκάδας από το cloud';
  @override
  String get showOnboardingAgain => 'Εμφάνιση περιήγησης επιβίβασης ξανά';
  @override
  String get signOut => 'Αποσυνδεθείτε';
  @override
  String get scanSubtitleSmart => 'Έξυπνη σάρωση αποθήκης';
  @override
  String get scanSubtitleReceipt => 'Σάρωση παραλαβής & παρακολούθηση φρεσκάδας';
  @override
  String get tooltipSettings => 'Ρυθμίσεις';
  @override
  String get tooltipToggleGuide => 'Εναλλαγή οδηγού πλαισίου';
  @override
  String get tooltipModesAbout => 'Σχετικά με τις λειτουργίες σάρωσης';
  @override
  String get galleryLabel => 'Στοά';
  @override
  String get cameraLoading => 'Προετοιμασία κάμερας…';
  @override
  String get cameraUnavailable =>
      'Η κάμερα δεν είναι διαθέσιμη.\\nΕλέγξτε τα δικαιώματα και δοκιμάστε ξανά.';
  @override
  String get captureFailed =>
      'Η λήψη απέτυχε. Ελέγξτε την άδεια της κάμερας και δοκιμάστε ξανά.';
  @override
  String get receiptCaptureAlign =>
      'Ευθυγραμμίστε την απόδειξη σε κάθετο πλαίσιο και αποτυπώστε';
  @override
  String get receiptCameraHint =>
      'Ανοίξτε την κάμερα ή επιλέξτε μια φωτογραφία απόδειξης από τη συλλογή';
  @override
  String get pickPhotoHint => 'Πατήστε το κουμπί για να επιλέξετε μια φωτογραφία';
  @override
  String get desktopGalleryHint =>
      'Λειτουργία επιφάνειας εργασίας — επιλέξτε μια φωτογραφία ψυγείου από τη συλλογή.';
  @override
  String get noCameraOnDevice => 'Δεν βρέθηκε κάμερα σε αυτήν τη συσκευή.';
  @override
  String get openCameraButton => 'Ανοίξτε την κάμερα';
  @override
  String get pickPhotoButton => 'Διάλεξε φωτογραφία';
  @override
  String get overlayGuideOn => 'Οδηγός για';
  @override
  String get overlayGuideOff => 'Οδηγήστε μακριά';
  @override
  String get modeSheetTitle => 'Λειτουργίες σάρωσης';
  @override
  String get modeSheetSubtitle =>
      'Επιλέξτε πριν από τη λήψη. αλλάζει τους κανόνες συνταγής AI.';
  @override
  String get scanModeQuickLabel => 'Γρήγορη σάρωση';
  @override
  String get scanModeQuickSubtitle => 'Συνταγές κάτω των 15 λεπτών';
  @override
  String get scanModeQuickDesc =>
      'Πρακτικά καθημερινά γεύματα. Όλες οι συνταγές συνολικά 15 λεπτά ή λιγότερο. απλές τεχνικές (ένα τηγάνι, σαλάτα, γρήγορο τηγάνισμα).';
  @override
  String get scanModeSurvivalLabel => 'Διάσωση';
  @override
  String get scanModeSurvivalSubtitle => 'Χρησιμοποιήστε πρώτα στοιχεία που λήγουν';
  @override
  String get scanModeSurvivalDesc =>
      'Μειώνει τα απόβλητα. Δίνει προτεραιότητα σε αντικείμενα που φαίνονται σχεδόν να χαλάσουν. Τα προαιρετικά στοιχεία του πεδίου υπόδειξης έχουν προτεραιότητα.';
  @override
  String get scanModeChefLabel => 'Λειτουργία σεφ';
  @override
  String get scanModeChefSubtitle => 'Γκουρμέ & αναλυτικό';
  @override
  String get scanModeChefDesc =>
      'Πιο εκλεπτυσμένες συνταγές. Πολυεπίπεδες τεχνικές, μεγαλύτεροι χρόνοι μαγειρέματος. τουλάχιστον δύο συνταγές χαρακτηρισμένες σκληρές.';
  @override
  String get scanModeQuickBestFor =>
      'Εβδομαδιαία γεύματα με ελάχιστα υλικά και χρόνο';
  @override
  String get scanModeQuickExamples =>
      '• ομελέτα 10 λεπτών\\n• Ζυμαρικά με ένα τηγάνι\\n• Τύλι ή μπολ χωρίς μαγείρεμα';
  @override
  String get scanModeSurvivalBestFor =>
      'Χρήση αντικειμένων πριν λήξουν και κοπή απορριμμάτων';
  @override
  String get scanModeSurvivalExamples =>
      '• Σούπα λαχανικών καθαρισμού\\n• Φριτάτα φούρνου\\n• Τηγανητό ρύζι που περίσσεψε';
  @override
  String get scanModeChefBestFor =>
      'Ειδικά δείπνα, καλεσμένοι ή εκμάθηση τεχνικής';
  @override
  String get scanModeChefExamples =>
      '• Πρωτεΐνη σάλτσας τηγανιού\\n• Τραγανό + κρεμώδες πιάτο\\n• Καραμελωμένη γαρνιτούρα λαχανικών';
  @override
  String get scanModeIdealForLabel => 'Το καλύτερο για';
  @override
  String get scanModeExamplesLabel => 'Παραδείγματα πιάτων';
  @override
  String get survivalHintAddFromPantry => 'Προσθέστε από φρεσκάδα';
  @override
  String get filterAll => 'Ολοι';
  @override
  String get filterCritical => 'Κρίσιμος';
  @override
  String get filterWarning => 'Προειδοποίηση';
  @override
  String get filterSafe => 'Ασφαλής';
  @override
  String get recipesScreenTitle => 'Συνταγές';
  @override
  String get copyRecipe => 'Αντίγραφο';
  @override
  String get shareRecipe => 'Μερίδιο';
  @override
  String get recipeCopiedSnack => 'Η συνταγή αντιγράφηκε στο πρόχειρο';
  @override
  String get survivalHintTitle => 'Λήγει σύντομα';
  @override
  String get survivalHintOptional => 'Προαιρετικό — π.χ. γάλα, ντομάτα, γιαούρτι';
  @override
  String get survivalHintPlaceholder => 'Διαχωρίστε με κόμματα';
  @override
  String get scanConfirmReceiptLabel => 'Σάρωση απόδειξης';
  @override
  String get scanSavedHistory => 'Η σάρωση αποθηκεύτηκε στο ιστορικό ντουλαπιών';
  @override
  String get scanSaveFailedPrefix => 'Δεν ήταν δυνατή η αποθήκευση της σάρωσης';
  @override
  String get daysUnit => 'ημέρες';
  @override
  String get okButton => 'ΕΝΤΑΞΕΙ';
  @override
  String get recipesDetectedIngredients => 'Ανιχνευμένα συστατικά';
  @override
  String recipesAiCount(int count) => 'Συνταγές AI ·$count';
  @override
  String get galleryPickMessage => 'Επιλέξτε φωτογραφία από τη συλλογή';
  @override
  String get favoritesEmpty =>
      'Δεν υπάρχουν ακόμα αγαπημένες συνταγές.\\nΠατήστε την καρδιά στα αποτελέσματα της συνταγής.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Συνταγή ${index + 1}' : 'Συνταγή';

  @override
  String get timeAgoJustNow => 'Μόλις τώρα';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}μ πριν';
  @override
  String timeAgoHours(int hours) => '${hours}πριν h';
  @override
  String timeAgoDays(int days) => '${days}d πριν';
  @override
  String get daysExpired => 'Λήξη';
  @override
  String get daysToday => 'Σήμερα';
  @override
  String get daysTomorrow => 'Αύριο';
  @override
  String daysCount(int days) => '$days ημέρες';
  @override
  String unifiedDaysRemaining(int days) => '$days απομένουν μέρες';
  @override
  String productCount(int count) => '$count είδη';
  @override
  String get unifiedSourceReceipt => 'Παραλαβή';
  @override
  String get unifiedSourceScan => 'Σάρωση';
  @override
  String unifiedLastScan(String date) => 'Τελευταία σάρωση ·$date';
  @override
  String get receiptFieldProductName => 'Όνομα προϊόντος';
  @override
  String get receiptFieldQuantity => 'Ποσότητα';
  @override
  String get receiptFieldCategory => 'Κατηγορία';
  @override
  String expiryApprox(int days) => 'Καλύτερο πριν από ~$days ημέρες';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Τα συστατικά που λείπουν προστέθηκαν στη λίστα αγορών';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients συστατικά ·$recipes συνταγές';
  @override
  String get favoriteAddTooltip => 'Προσθήκη στα αγαπημένα';
  @override
  String get favoriteRemoveTooltip => 'Αφαίρεση από τα αγαπημένα';
  @override
  String get favoriteAddedSnack => 'Προστέθηκε στα αγαπημένα';
  @override
  String get favoriteRemovedSnack => 'Καταργήθηκε από τα αγαπημένα';
  @override
  String get onboardingScanTitle => 'Σαρώστε το ντουλάπι σας';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Λίστα αγορών';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Αγαπημένα & πρόσφατες σαρώσεις';
  @override
  String get onboardingFavoritesBody =>
      'Αποθηκεύστε τις συνταγές που σας αρέσουν. Οι πρόσφατες σαρώσεις ανοίγουν γρήγορα από την αρχική οθόνη.';
  @override
  String get onboardingCloudTitle => 'Ιστορία σύννεφων';
  @override
  String get onboardingCloudBody =>
      'Συνδεθείτε για να αποθηκεύσετε το ιστορικό σάρωσης στο λογαριασμό σας και να επιστρέψετε ανά πάσα στιγμή.';
  @override
  String get onboardingPermissionsTitle => 'Κάμερα και ειδοποιήσεις';
  @override
  String get onboardingPermissionsBody =>
      'Το CyberChef χρειάζεται κάμερα για σάρωση ψυγείου, αποδείξεων και barcode. Προαιρετικές ειδοποιήσεις υπενθυμίζουν λήξη τροφίμων.';
  @override
  String get emptyStateScanReceipt => 'Σάρωση απόδειξης';
  @override
  String get emptyStateStartScan => 'Έναρξη σάρωσης';
  @override
  String get manageSubscriptions => 'Διαχείριση συνδρομής';
  @override
  String get notificationCriticalChannelName => 'Ειδοποιήσεις φρεσκάδας';
  @override
  String get notificationCriticalChannelDesc => 'Τα στοιχεία λήγουν σύντομα';
  @override
  String get notificationDailyChannelName => 'Ημερήσια περίληψη';
  @override
  String get notificationDailyChannelDesc => 'Καθημερινή υπενθύμιση φρεσκάδας';
  @override
  String get notificationCriticalTitle => 'Τα στοιχεία λήγουν σύντομα';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Ελέγξτε τον πίνακα Freshness.';
  @override
  String get notificationDailyTitle => 'Έλεγχος φρεσκάδας';
  @override
  String get notificationDailyBody =>
      'Ελέγξτε τα στοιχεία που πρέπει να χρησιμοποιήσετε σήμερα.';
  @override
  String get widgetFreshnessGood => 'Η φρεσκάδα φαίνεται καλή';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count τα στοιχεία ενδέχεται να λήξουν σήμερα';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical κριτική ·$warning προειδοποίηση';
  @override
  String get categoryDairy => 'Γαλακτοκομείο';
  @override
  String get categoryMeat => 'Κρέας / ψάρι';
  @override
  String get categoryFruit => 'Καρπός';
  @override
  String get categoryVegetable => 'Λαχανικό';
  @override
  String get categoryBeverage => 'Ποτό';
  @override
  String get categoryBakery => 'Αρτοποιείο';
  @override
  String get categoryPantry => 'Ντουλάπι';
  @override
  String calendarMonthName(int month) => const [
        'Ιανουάριος',
        'Φεβρουάριος',
        'Πορεία',
        'Απρίλιος',
        'Μάιος',
        'Ιούνιος',
        'Ιούλιος',
        'Αύγουστος',
        'Σεπτέμβριος',
        'Οκτώβριος',
        'Νοέμβριος',
        'Δεκέμβριος',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Συνταγές';
  @override
  String get recipesPlaceholderBody =>
      'Τα αποτελέσματα της συνταγής θα εμφανιστούν εδώ μετά από μια επιτυχημένη σάρωση.';
  @override
  String get recipeSamplePlating => 'Δείγμα επιμετάλλωσης';
  @override
  String get recipeShareInstructionsHeader => 'Οδηγίες:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Θέμα';
  @override
  String get themeSubtitle => 'Παλέτα χρωμάτων και φόντο';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Προεπιλεγμένο σκούρο πράσινο';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Ψυχρούς μπλε τόνους';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Ζεστές κεχριμπαρένιες προφορές';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Μωβ προφορά σκούρο';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Ανοιχτό φόντο';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Ζεστή κρέμα με πορτοκαλί τόνο';
}
