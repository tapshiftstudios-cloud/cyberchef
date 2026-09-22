import 'strings_base.dart';

class StringsMs implements StringsBase {
  const StringsMs();

  @override
  String get analysisTitle => 'Menganalisis pantri';
  @override
  String get stepPrepareImage => 'Menyediakan foto…';
  @override
  String get stepAnalyzeAi => 'Mengesan bahan…';
  @override
  String get stepBuildRecipes => 'Membina resipi…';
  @override
  String get receiptAnalysisTitle => 'Resit bacaan';
  @override
  String get stepReceiptPrepare => 'Menyediakan imej resit…';
  @override
  String get stepReceiptOcr => 'Mengecam item…';
  @override
  String get stepReceiptInfer => 'Anggarkan jangka hayat…';
  @override
  String get receiptNotRecognized =>
      'Tidak dapat membaca resit. Cuba foto yang lebih jelas dan rata.';
  @override
  String get receiptNotDetected =>
      'Tiada resit dikesan. Selaraskan resit dalam bingkai.';
  @override
  String get receiptConfirmTitle => 'Sahkan item resit';
  @override
  String get receiptConfirmSubtitle =>
      'Pilih item untuk ditambah. Tekan lama untuk mengedit.';
  @override
  String get receiptConfirmSave => 'Tambah ke pantri';
  @override
  String get receiptSelectOne => 'Pilih sekurang-kurangnya satu item.';
  @override
  String get receiptSaved => 'Item ditambahkan pada inventori kesegaran';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Hantar foto resit ini? Analisis OCR bermula selepas anda mengesahkan.';
  @override
  String get navFreshness => 'Kesegaran';
  @override
  String get freshnessPanelTitle => 'Panel kesegaran';
  @override
  String get freshnessCritical => 'Kritikal (0–2 hari)';
  @override
  String get freshnessWarning => 'Amaran (3–5 hari)';
  @override
  String get freshnessSafe => 'Selamat (6+ hari)';
  @override
  String get freshnessEmpty =>
      'Belum ada item yang dijejaki. Imbas resit untuk membina inventori.';
  @override
  String get freshnessListTitle => 'Inventori kesegaran';
  @override
  String get freshnessListEmpty => 'Tiada item dalam penapis ini.';
  @override
  String get freshnessSuggestRecipes => 'Cadangkan resipi dengan ini';
  @override
  String get savingsPanelTitle => 'Panel simpanan';
  @override
  String get savingsPanelEmptyHint =>
      'Tandai item yang hampir tamat tempoh sebagai "Makanan dibuat" untuk mengesan sisa yang dihalang di sini.';
  @override
  String get savingsStatItems => 'diselamatkan';
  @override
  String get savingsStatWaste => 'Pembaziran dihalang';
  @override
  String get savingsStatMoney => 'Anggaran simpanan';
  @override
  String get savingsDashboardTitle => 'Analisis penjimatan';
  @override
  String get savingsDashboardSubtitle =>
      'Ringkasan makanan yang anda simpan dari tong sampah — bulan ini.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 bahan disimpan daripada sisa bulan ini'
          : '$count bahan-bahan yang disimpan daripada sisa bulan ini';
  @override
  String savingsKgPrevented(String kg) => 'Pembaziran makanan dicegah:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Anggaran keuntungan kewangan:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => '4 minggu lepas';
  @override
  String get savingsRecentTitle => 'Penyelamatan baru-baru ini';
  @override
  String get savingsEmptySubtitle =>
      'Tiada rekod lagi. Apabila anda menggunakan item kritikal atau amaran, ia muncul di sini.';
  @override
  String get savingsHowItWorks =>
      'Item yang digunakan dalam tempoh 5 hari dari tarikh luput dikira sebagai diselamatkan. Berat dan nilai dianggarkan daripada purata kategori.';
  @override
  String get pantryNamesLocaleNote =>
      'Nama produk dan kedai kelihatan seperti yang disimpan pada resit anda; istilah biasa ditunjukkan dalam bahasa Inggeris.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Digunakan pada hari terakhir' : 'Digunakan dengan$days hari lagi';
  @override
  String get savingsMealMade => 'Hidangan dibuat';
  @override
  String savingsMealMadeConfirm(String name) => 'Mark$name seperti yang dimakan?';
  @override
  String savingsRescuedSnack(String money) => 'Simpanan direkodkan ·$money';
  @override
  String get freshnessRecipeTitle => 'Menyediakan resipi';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Sekurang-kurangnya satu item diperlukan untuk resipi.';
  @override
  String get freshnessCriticalBanner => 'Akan tamat tempoh tidak lama lagi';
  @override
  String get freshnessViewAll => 'Lihat semua';
  @override
  String get receiptCaptureHints =>
      'Tahan resit rata, pencahayaan yang baik. Semua baris kelihatan dalam bingkai menegak.';
  @override
  String get receiptPurchaseDate => 'Tarikh pembelian';
  @override
  String get receiptTapToEdit => 'Sunting';
  @override
  String get receiptEditItem => 'Edit item';
  @override
  String get receiptEditSave => 'Jimat';
  @override
  String get receiptExpiryDaysLabel => 'Anggaran jangka hayat (hari)';
  @override
  String get receiptMergedSnack => 'Beberapa item digabungkan dengan rekod sedia ada';
  @override
  String get receiptCloudSyncFailed => 'Tidak dapat menyimpan ke awan';
  @override
  String get receiptCloudSynced => 'Item disegerakkan ke awan';
  @override
  String get pantrySyncAction => 'Segerakkan data kesegaran';
  @override
  String get pantrySyncDone => 'Data kesegaran dikemas kini';
  @override
  String get pantrySyncFailed => 'Penyegerakan gagal';
  @override
  String get freshnessNotificationsTitle => 'Pemberitahuan kesegaran';
  @override
  String get freshnessNotificationsSubtitle =>
      'Perkara kritikal dan peringatan harian';
  @override
  String get freshnessNotificationTimeLabel => 'Masa peringatan harian';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Setiap hari di$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Minggu ini:$critical kritikal,$warning barang amaran. Gunakan ini dahulu.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Ralat rangkaian. Semak sambungan anda dan cuba lagi.';
  @override
  String get geminiQuotaExceeded =>
      'Kuota AI melebihi. Tunggu beberapa minit dan cuba lagi.';
  @override
  String get geminiBillingDepleted =>
      'Kredit prabayar Google AI Studio telah habis. Tambahkan pengebilan di ai.google.dev untuk memulihkan ciri AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Cuba semula automatik mungkin tersedia dalam$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Had terjemahan AI harian dicapai (3/3). Resipi menggunakan terjemahan asas sehingga esok.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'awak ada$remaining Terjemahan AI ditinggalkan hari ini.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Had imbasan pantri harian dicapai (3). Sila cuba lagi esok.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Had imbasan resit harian dicapai (2). Sila cuba lagi esok.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Had penjanaan resipi harian dicapai (3). Sila cuba lagi esok.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Sila tunggu$seconds saat (s) sebelum mencuba lagi.';
  @override
  String get adRewardTitlePantry => 'Had imbasan pantri dicapai';
  @override
  String get adRewardTitleReceipt => 'Had imbasan resit dicapai';
  @override
  String get adRewardTitleRecipe => 'Had penjanaan resipi dicapai';
  @override
  String get adRewardSubtitle =>
      'Tonton iklan pendek untuk memperoleh +1 penggunaan tambahan hari ini (sehingga 3 sehari).';
  @override
  String get adRewardWatchButton => 'Tonton iklan (penggunaan +1)';
  @override
  String get adRewardGranted => 'Penggunaan tambahan diberikan. Cuba lagi.';
  @override
  String get adRewardNotCompleted =>
      'Iklan tidak selesai. Tiada penggunaan tambahan diberikan.';
  @override
  String get adRewardDailyCapReached =>
      'Anda mencapai had ganjaran iklan hari ini.';
  @override
  String get geminiTimeout =>
      'Permintaan tamat masa. Semak sambungan anda dan cuba lagi.';
  @override
  String get geminiServerError =>
      'Perkhidmatan AI tidak tersedia buat sementara waktu. Sila cuba lagi kemudian.';
  @override
  String get imageNotRecognized =>
      'Imej tidak dikenali. Tingkatkan pencahayaan atau cuba sudut lain.';
  @override
  String get imageNotPantry =>
      'Peti ais atau pantri tidak kelihatan. Sila ambil gambar secara langsung.';
  @override
  String get parseError =>
      'Tidak dapat menghuraikan respons AI. Sila imbas semula.';
  @override
  String get modelUnavailable =>
      'Model AI tidak tersedia. Semak akses API anda.';
  @override
  String get genericError => 'Sesuatu telah berlaku. Sila cuba lagi.';
  @override
  String get imageDecodeError => 'Tidak dapat membaca foto. Cuba imej lain.';
  @override
  String get authSubtitle => 'Akses pantri pintar';
  @override
  String get authInitializing => 'Menyediakan sesi…';
  @override
  String get emailLabel => 'E-mel';
  @override
  String get passwordLabel => 'Kata laluan';
  @override
  String get emailRequired => 'E-mel diperlukan';
  @override
  String get emailInvalid => 'E-mel tidak sah';
  @override
  String get passwordMin => 'Sekurang-kurangnya 6 aksara';
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
  String get signIn => 'Log masuk';
  @override
  String get signUp => 'Buat akaun';
  @override
  String get toggleToSignIn => 'Sudah mempunyai akaun? Log masuk';
  @override
  String get toggleToSignUp => 'Baru di sini? Buat akaun';
  @override
  String get guestContinue => 'Teruskan sebagai tetamu';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Akaun dibuat. Buka pautan pengesahan dalam peti masuk anda; apl akan memberitahu anda apabila disahkan.';
  @override
  String get emailConfirmedSuccess =>
      'E-mel anda disahkan. Akaun anda sudah sedia.';
  @override
  String get emailVerifiedLabel => 'E-mel disahkan';
  @override
  String get proEmailRequiredTitle => 'Akaun e-mel diperlukan untuk Pro';
  @override
  String get proEmailRequiredBody =>
      'Akaun tetamu tidak boleh membeli Pro. Buat akaun e-mel untuk menyimpan data anda dan membuka kunci pengebilan.';
  @override
  String get proLinkAccountAction => 'Buat akaun dan teruskan';
  @override
  String get proAccountLinked =>
      'Akaun dipautkan. Anda boleh terus ke daftar keluar Pro sekarang.';
  @override
  String get supabaseNotConfigured =>
      'Perkhidmatan akaun tidak tersedia. Sila cuba lagi kemudian.';
  @override
  String get privacyTitle => 'Data & privasi';
  @override
  String get privacySubtitle => 'Foto dan data akaun';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Imej resit tidak disimpan pada pelayan; hanya senarai produk yang diekstrak.\\n\\n'
      'Apabila dilog masuk, data imbasan dan kesegaran boleh disimpan ke akaun anda.'
      'Pelan percuma memaparkan iklan Google AdMob; Pro tidak mempunyai iklan.\\n\\n'
      'Buka dasar privasi dalam talian untuk teks penuh.';
  @override
  String get privacyViewOnline => 'Buka dasar privasi';
  @override
  String get pantryHistoryTitle => 'Sejarah pantri';
  @override
  String get pantryHistoryEmpty =>
      'Tiada imbasan disimpan lagi.\\nImbas peti sejuk anda untuk membina sejarah.';
  @override
  String get pantryHistorySubtitle => 'Imbasan disimpan awan';
  @override
  String get splashTagline => 'Menghasilkan & pantri — satu aplikasi';
  @override
  String get splashLoading => 'Memuatkan…';
  @override
  String get onboardingSkip => 'Langkau';
  @override
  String get onboardingNext => 'Seterusnya';
  @override
  String get onboardingStart => 'Mulakan';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Imbasan terkini';
  @override
  String get cameraTapToOpen => 'Ketik ikon untuk membuka kamera';
  @override
  String get cameraOrGalleryHint => 'Buka kamera atau pilih daripada galeri';
  @override
  String get captureOrGalleryHint => 'Tangkap atau pilih daripada galeri';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Tutup kamera';
  @override
  String get noIngredients => 'Tiada bahan dikesan.';
  @override
  String get recipeInstructions => 'Arahan';
  @override
  String get untitledRecipe => 'Resipi tanpa tajuk';
  @override
  String get genericLoadError => 'Sesuatu telah berlaku. Sila cuba lagi.';
  @override
  String get scanConfirmTitle => 'Sahkan foto';
  @override
  String get scanConfirmSubtitle =>
      'Hantar foto ini? Analisis resipi bermula selepas anda mengesahkan.';
  @override
  String get scanConfirmAnalyze => 'Menganalisis';
  @override
  String get scanConfirmCancel => 'Batal';
  @override
  String get scanConfirmRetake => 'Ambil semula';
  @override
  String get scanConfirmPickOther => 'Pilih yang lain';
  @override
  String get clearRecentScans => 'Kosongkan imbasan terbaharu';
  @override
  String get clearRecentScansSubtitle => 'Memadamkan sejarah setempat pada peranti';
  @override
  String get clearRecentScansConfirmTitle => 'Kosongkan imbasan terbaharu?';
  @override
  String get clearRecentScansConfirmBody =>
      'Tidak boleh dibuat asal. Kegemaran tidak terjejas.';
  @override
  String get clearRecentScansDone => 'Imbasan terbaharu dibersihkan';
  @override
  String get deleteAction => 'Padam';
  @override
  String get imageQualityTitle => 'Kualiti foto rendah';
  @override
  String get imageQualityDark => 'Imej terlalu gelap. Tambah cahaya dan cuba semula.';
  @override
  String get imageQualityBlurry =>
      'Imej mungkin kabur. Pegang teguh dan ambil semula.';
  @override
  String get imageQualityContinue => 'Teruskan juga';
  @override
  String get imageQualityRetake => 'Ambil semula';
  @override
  String receiptQueueTitle(int count) => '$count resit menunggu di luar talian';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'resit ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proses';
  @override
  String get receiptQueuedOffline =>
      'Luar talian. Resit beratur; proses apabila disambungkan.';
  @override
  String get receiptLowConfidenceBlock =>
      'Edit item berkeyakinan rendah sebelum menyimpan (ikon pensel).';
  @override
  String get unifiedPantryTitle => 'Inventori bersatu';
  @override
  String get unifiedPantryEmpty => 'Tiada item atau imbasan lagi.';
  @override
  String get searchHint => 'Cari produk…';
  @override
  String get navShopping => 'Membeli-belah';
  @override
  String get shoppingAddHint => 'Tambah item yang hilang';
  @override
  String get shoppingEmpty => 'Senarai beli-belah anda kosong.';
  @override
  String get shoppingClearDone => 'Kosongkan selesai';
  @override
  String get shoppingDoneSection => 'Selesai';
  @override
  String get shoppingAddFromRecipe => 'Tambah item yang tiada dalam inventori resit';
  @override
  String get freshnessViewCalendar => 'Kalendar';
  @override
  String get freshnessViewList => 'Senaraikan';
  @override
  String get cookToday => 'Apa yang hendak dimasak hari ini?';
  @override
  String get cookTodayNoUrgent =>
      'Tiada barang urgent. Imbas resit untuk mengesan kesegaran.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Dilihat dalam imbasan tetapi tidak dalam inventori resit: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Eksport data tempatan';
  @override
  String get exportLocalDataSubtitle => 'Menyalin JSON ke papan keratan';
  @override
  String get exportLocalDataDone => 'Data disalin ke papan keratan';
  @override
  String get clearLocalData => 'Padamkan data setempat';
  @override
  String get clearLocalDataSubtitle =>
      'Kesegaran, membeli-belah, keutamaan (tidak dapat dipulihkan)';
  @override
  String get clearLocalDataConfirmTitle => 'Padamkan data setempat?';
  @override
  String get clearLocalDataConfirmBody =>
      'Inventori kesegaran dan senarai beli-belah dialih keluar daripada peranti.';
  @override
  String get clearLocalDataDone => 'Data tempatan dikosongkan';
  @override
  String get settingsTitle => 'tetapan';
  @override
  String get languageTitle => 'Bahasa';
  @override
  String get languageSubtitle => 'Bahasa apl · 27 bahasa';
  @override
  String get localePreparingTitle => 'Mengemas kini bahasa';
  @override
  String get localePreparingSubtitle =>
      'Menterjemah resipi dan hasil imbasan…';
  @override
  String get dietTitle => 'Keutamaan diet';
  @override
  String get dietSubtitle => 'Digunakan pada cadangan resipi';
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
  String get aiUsageLimitsLoading => 'Memuatkan…';
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
  String get aiUsageLabelPantry => 'Pantry';
  @override
  String get aiUsageLabelReceipt => 'resit';
  @override
  String get aiUsageLabelRecipe => 'resepi';
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
  String get storeUnavailable => 'Kedai tidak tersedia. Cuba lagi nanti.';
  @override
  String get proProductIdsNotConfigured => 'ID produk Pro belum dikonfigurasi.';
  @override
  String get noProProductsFound => 'Tiada produk Pro untuk dibeli.';
  @override
  String get purchaseFlowFailed => 'Tidak dapat memulakan pembelian.';
  @override
  String get purchaseCompletedProActivated => 'Pembelian selesai. Pelan Pro diaktifkan.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Pembelian selesai. Pengesahan gagal; cuba lagi sebentar lagi.';
  @override
  String get purchaseFailed => 'Pembelian gagal.';
  @override
  String get restorePurchases => 'Pulihkan pembelian';
  @override
  String get restorePurchasesStarted => 'Menyemak pembelian terdahulu di Play Store…';
  @override
  String get nutritionTitle => 'Pemakanan (anggaran)';
  @override
  String get nutritionPerServing => 'setiap hidangan';
  @override
  String get nutritionCalories => 'Kalori';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Karbohidrat';
  @override
  String get nutritionFat => 'gemuk';
  @override
  String get nutritionEstimateNote =>
      'anggaran AI sahaja; bukan nasihat perubatan atau diet.';
  @override
  String get barcodeScanTitle => 'Imbas kod bar';
  @override
  String get barcodeScanHint =>
      'Jajarkan kod bar dalam bingkai. Carian produk melalui Fakta Makanan Terbuka.';
  @override
  String get barcodeNotFound =>
      'Produk tidak ditemui. Cuba imbasan resit atau peti ais.';
  @override
  String get barcodeConfirmTitle => 'Sahkan produk';
  @override
  String get barcodeAddToPantry => 'Tambahkan pada inventori kesegaran';
  @override
  String get navScan => 'Imbas';
  @override
  String get captureTypeFridge => 'Peti ais';
  @override
  String get captureTypeReceipt => 'resit';
  @override
  String get captureTypeBarcode => 'Kod bar';
  @override
  String get sectionAccount => 'Akaun';
  @override
  String get sectionPreferences => 'Keutamaan';
  @override
  String get sectionApp => 'Apl';
  @override
  String get sectionPrivacy => 'Privasi';
  @override
  String get sessionTitle => 'Sesi';
  @override
  String get guestUser => 'Pengguna tetamu';
  @override
  String get favoritesTitle => 'Kegemaran';
  @override
  String get favoritesSubtitle => 'Resipi yang anda simpan';
  @override
  String get freshnessInventorySubtitle =>
      'Produk daripada resit dan tarikh luput';
  @override
  String get pantrySyncSubtitle => 'Tarik inventori kesegaran daripada awan';
  @override
  String get showOnboardingAgain => 'Tunjukkan lawatan onboarding sekali lagi';
  @override
  String get signOut => 'Log keluar';
  @override
  String get scanSubtitleSmart => 'Imbasan pantri pintar';
  @override
  String get scanSubtitleReceipt => 'Imbasan resit & pengesanan kesegaran';
  @override
  String get tooltipSettings => 'tetapan';
  @override
  String get tooltipToggleGuide => 'Togol panduan bingkai';
  @override
  String get tooltipModesAbout => 'Mengenai mod imbasan';
  @override
  String get galleryLabel => 'Galeri';
  @override
  String get cameraLoading => 'Menyediakan kamera…';
  @override
  String get cameraUnavailable =>
      'Kamera tidak tersedia.\\nSemak kebenaran dan cuba lagi.';
  @override
  String get captureFailed =>
      'Tangkapan gagal. Semak kebenaran kamera dan cuba lagi.';
  @override
  String get receiptCaptureAlign =>
      'Jajarkan resit dalam bingkai menegak dan tangkapan';
  @override
  String get receiptCameraHint =>
      'Buka kamera atau pilih foto resit daripada galeri';
  @override
  String get pickPhotoHint => 'Ketik butang untuk memilih foto';
  @override
  String get desktopGalleryHint =>
      'Mod desktop — pilih foto peti sejuk daripada galeri.';
  @override
  String get noCameraOnDevice => 'Tiada kamera ditemui pada peranti ini.';
  @override
  String get openCameraButton => 'Buka kamera';
  @override
  String get pickPhotoButton => 'Pilih foto';
  @override
  String get overlayGuideOn => 'Panduan mengenai';
  @override
  String get overlayGuideOff => 'Panduan pergi';
  @override
  String get modeSheetTitle => 'Mod imbasan';
  @override
  String get modeSheetSubtitle =>
      'Pilih sebelum ditangkap; ia mengubah peraturan resipi AI.';
  @override
  String get scanModeQuickLabel => 'Imbasan pantas';
  @override
  String get scanModeQuickSubtitle => 'Resipi di bawah 15 min';
  @override
  String get scanModeQuickDesc =>
      'Hidangan harian yang praktikal. Semua resipi berjumlah 15 minit atau kurang; teknik mudah (satu kuali, salad, goreng cepat).';
  @override
  String get scanModeSurvivalLabel => 'menyelamat';
  @override
  String get scanModeSurvivalSubtitle => 'Gunakan item yang tamat tempoh dahulu';
  @override
  String get scanModeSurvivalDesc =>
      'Mengurangkan pembaziran. Utamakan barang yang nampak hampir rosak. Item medan pembayang pilihan diutamakan.';
  @override
  String get scanModeChefLabel => 'Mod tukang masak';
  @override
  String get scanModeChefSubtitle => 'Gourmet & terperinci';
  @override
  String get scanModeChefDesc =>
      'Resipi yang lebih halus. Teknik berlapis, masa memasak yang lebih lama; sekurang-kurangnya dua resipi ditanda keras.';
  @override
  String get scanModeQuickBestFor =>
      'Hidangan malam minggu dengan bahan dan masa yang minimum';
  @override
  String get scanModeQuickExamples =>
      '• Telur dadar 10 minit\\n• Pasta satu kuali\\n• Bungkus atau mangkuk tanpa masak';
  @override
  String get scanModeSurvivalBestFor =>
      'Menggunakan barang sebelum luput dan memotong bahan buangan';
  @override
  String get scanModeSurvivalExamples =>
      '• Bersihkan sup sayur\\n• Frittata dalam ketuhar\\n• Nasi goreng yang tersisa';
  @override
  String get scanModeChefBestFor =>
      'Makan malam istimewa, tetamu, atau mempelajari teknik';
  @override
  String get scanModeChefExamples =>
      '• Protein sos kuali\\n• Pinggan rangup + berkrim\\n• Hiasan sayuran karamel';
  @override
  String get scanModeIdealForLabel => 'Terbaik untuk';
  @override
  String get scanModeExamplesLabel => 'Contoh hidangan';
  @override
  String get survivalHintAddFromPantry => 'Tambah dari kesegaran';
  @override
  String get filterAll => 'Semua';
  @override
  String get filterCritical => 'kritikal';
  @override
  String get filterWarning => 'Amaran';
  @override
  String get filterSafe => 'selamat';
  @override
  String get recipesScreenTitle => 'resepi';
  @override
  String get copyRecipe => 'salin';
  @override
  String get shareRecipe => 'Kongsi';
  @override
  String get recipeCopiedSnack => 'Resipi disalin ke papan keratan';
  @override
  String get survivalHintTitle => 'Akan tamat tempoh tidak lama lagi';
  @override
  String get survivalHintOptional => 'Pilihan — cth. susu, tomato, yogurt';
  @override
  String get survivalHintPlaceholder => 'Pisahkan dengan koma';
  @override
  String get scanConfirmReceiptLabel => 'Imbasan resit';
  @override
  String get scanSavedHistory => 'Imbasan disimpan ke sejarah pantri';
  @override
  String get scanSaveFailedPrefix => 'Tidak dapat menyimpan imbasan';
  @override
  String get daysUnit => 'hari';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Bahan-bahan yang dikesan';
  @override
  String recipesAiCount(int count) => 'Resipi AI ·$count';
  @override
  String get galleryPickMessage => 'Pilih foto daripada galeri';
  @override
  String get favoritesEmpty =>
      'Tiada resipi kegemaran lagi.\\nKetik hati pada hasil resipi.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Resipi ${index + 1}' : 'resepi';

  @override
  String get timeAgoJustNow => 'tadi';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m lalu';
  @override
  String timeAgoHours(int hours) => '${hours}h lalu';
  @override
  String timeAgoDays(int days) => '${days}d lalu';
  @override
  String get daysExpired => 'Tamat tempoh';
  @override
  String get daysToday => 'Hari ini';
  @override
  String get daysTomorrow => 'Esok';
  @override
  String daysCount(int days) => '$days hari';
  @override
  String unifiedDaysRemaining(int days) => '$days hari lagi';
  @override
  String productCount(int count) => '$count barang';
  @override
  String get unifiedSourceReceipt => 'resit';
  @override
  String get unifiedSourceScan => 'Imbas';
  @override
  String unifiedLastScan(String date) => 'Imbasan terakhir ·$date';
  @override
  String get receiptFieldProductName => 'Nama produk';
  @override
  String get receiptFieldQuantity => 'Kuantiti';
  @override
  String get receiptFieldCategory => 'kategori';
  @override
  String expiryApprox(int days) => 'Terbaik sebelum ini ~$days hari';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Bahan-bahan yang tiada ditambahkan pada senarai beli-belah';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients bahan-bahan ·$recipes resepi';
  @override
  String get favoriteAddTooltip => 'Tambahkan pada kegemaran';
  @override
  String get favoriteRemoveTooltip => 'Alih keluar daripada kegemaran';
  @override
  String get favoriteAddedSnack => 'Ditambah pada kegemaran';
  @override
  String get favoriteRemovedSnack => 'Dialih keluar daripada kegemaran';
  @override
  String get onboardingScanTitle => 'Imbas pantri anda';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Senarai beli-belah';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Kegemaran & imbasan terbaru';
  @override
  String get onboardingFavoritesBody =>
      'Simpan resipi yang anda suka. Imbasan terbaharu dibuka dengan cepat dari skrin utama.';
  @override
  String get onboardingCloudTitle => 'Sejarah awan';
  @override
  String get onboardingCloudBody =>
      'Log masuk untuk menyimpan sejarah imbasan ke akaun anda dan kembali pada bila-bila masa.';
  @override
  String get onboardingPermissionsTitle => 'Kamera & pemberitahuan';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef memerlukan kamera untuk imbas peti sejuk, resit dan kod bar. Pemberitahuan pilihan mengingatkan makanan hampir luput.';
  @override
  String get emptyStateScanReceipt => 'Imbas resit';
  @override
  String get emptyStateStartScan => 'Mula imbas';
  @override
  String get manageSubscriptions => 'Urus langganan';
  @override
  String get notificationCriticalChannelName => 'Makluman kesegaran';
  @override
  String get notificationCriticalChannelDesc => 'Item akan tamat tempoh tidak lama lagi';
  @override
  String get notificationDailyChannelName => 'Ringkasan harian';
  @override
  String get notificationDailyChannelDesc => 'Peringatan kesegaran harian';
  @override
  String get notificationCriticalTitle => 'Item akan tamat tempoh tidak lama lagi';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Semak panel Kesegaran.';
  @override
  String get notificationDailyTitle => 'Semakan kesegaran';
  @override
  String get notificationDailyBody =>
      'Semak item yang anda patut gunakan hari ini.';
  @override
  String get widgetFreshnessGood => 'Kesegaran kelihatan baik';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count barang mungkin luput hari ini';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritikal ·$warning amaran';
  @override
  String get categoryDairy => 'tenusu';
  @override
  String get categoryMeat => 'Daging / ikan';
  @override
  String get categoryFruit => 'buah-buahan';
  @override
  String get categoryVegetable => 'sayur';
  @override
  String get categoryBeverage => 'Minuman';
  @override
  String get categoryBakery => 'Bakeri';
  @override
  String get categoryPantry => 'Pantry';
  @override
  String calendarMonthName(int month) => const [
        'Januari',
        'Februari',
        'Mac',
        'April',
        'Mei',
        'Jun',
        'Julai',
        'Ogos',
        'September',
        'Oktober',
        'November',
        'Disember',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'resepi';
  @override
  String get recipesPlaceholderBody =>
      'Keputusan resipi akan muncul di sini selepas imbasan berjaya.';
  @override
  String get recipeSamplePlating => 'Penyaduran sampel';
  @override
  String get recipeShareInstructionsHeader => 'Arahan:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Palet warna dan latar belakang';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Hijau gelap lalai';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Nada biru yang sejuk';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Aksen ambar hangat';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Aksen ungu gelap';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Latar belakang terang';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Krim hangat dengan aksen oren';
}
