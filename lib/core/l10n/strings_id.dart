import 'strings_base.dart';

class StringsId implements StringsBase {
  const StringsId();

  @override
  String get analysisTitle => 'Menganalisis dapur';
  @override
  String get stepPrepareImage => 'Mempersiapkan foto…';
  @override
  String get stepAnalyzeAi => 'Mendeteksi bahan…';
  @override
  String get stepBuildRecipes => 'Membangun resep…';
  @override
  String get receiptAnalysisTitle => 'Tanda terima bacaan';
  @override
  String get stepReceiptPrepare => 'Mempersiapkan gambar tanda terima…';
  @override
  String get stepReceiptOcr => 'Mengenali item…';
  @override
  String get stepReceiptInfer => 'Memperkirakan umur simpan…';
  @override
  String get receiptNotRecognized =>
      'Tidak dapat membaca tanda terima. Cobalah foto yang lebih jelas dan datar.';
  @override
  String get receiptNotDetected =>
      'Tidak ada tanda terima yang terdeteksi. Sejajarkan tanda terima dalam bingkai.';
  @override
  String get receiptConfirmTitle => 'Konfirmasikan penerimaan barang';
  @override
  String get receiptConfirmSubtitle =>
      'Pilih item untuk ditambahkan. Tekan lama untuk mengedit.';
  @override
  String get receiptConfirmSave => 'Tambahkan ke dapur';
  @override
  String get receiptSelectOne => 'Pilih setidaknya satu item.';
  @override
  String get receiptSaved => 'Item ditambahkan ke inventaris kesegaran';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Kirim foto tanda terima ini? Analisis OCR dimulai setelah Anda mengonfirmasi.';
  @override
  String get navFreshness => 'Kesegaran';
  @override
  String get freshnessPanelTitle => 'Panel kesegaran';
  @override
  String get freshnessCritical => 'Kritis (0–2 hari)';
  @override
  String get freshnessWarning => 'Peringatan (3–5 hari)';
  @override
  String get freshnessSafe => 'Aman (6+ hari)';
  @override
  String get freshnessEmpty =>
      'Belum ada item yang dilacak. Pindai tanda terima untuk membuat inventaris.';
  @override
  String get freshnessListTitle => 'Persediaan kesegaran';
  @override
  String get freshnessListEmpty => 'Tidak ada item dalam filter ini.';
  @override
  String get freshnessSuggestRecipes => 'Sarankan resep dengan ini';
  @override
  String get savingsPanelTitle => 'Panel tabungan';
  @override
  String get savingsPanelEmptyHint =>
      'Tandai item yang hampir kadaluwarsa sebagai “Makanan dibuat” untuk melacak limbah yang dicegah di sini.';
  @override
  String get savingsStatItems => 'Diselamatkan';
  @override
  String get savingsStatWaste => 'Limbah dicegah';
  @override
  String get savingsStatMoney => 'Perkiraan. tabungan';
  @override
  String get savingsDashboardTitle => 'Analisis penghematan';
  @override
  String get savingsDashboardSubtitle =>
      'Ringkasan makanan yang Anda simpan dari tempat sampah — bulan ini.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 bahan dihemat dari sampah bulan ini'
          : '$count bahan-bahan yang dihemat dari sampah bulan ini';
  @override
  String savingsKgPrevented(String kg) => 'Limbah makanan dicegah:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Perkiraan keuntungan finansial:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => '4 minggu terakhir';
  @override
  String get savingsRecentTitle => 'Penyelamatan baru-baru ini';
  @override
  String get savingsEmptySubtitle =>
      'Belum ada catatan. Saat Anda menggunakan item kritis atau peringatan, item tersebut muncul di sini.';
  @override
  String get savingsHowItWorks =>
      'Barang yang digunakan dalam waktu 5 hari setelah kadaluwarsa dihitung sebagai barang yang diselamatkan. Bobot dan nilai diperkirakan dari rata-rata kategori.';
  @override
  String get pantryNamesLocaleNote =>
      'Nama produk dan toko tampak seperti yang tersimpan di tanda terima Anda; istilah umum ditampilkan dalam bahasa Inggris.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Digunakan pada hari terakhir' : 'Digunakan dengan$days hari tersisa';
  @override
  String get savingsMealMade => 'Makanan dibuat';
  @override
  String savingsMealMadeConfirm(String name) => 'Tanda$name seperti yang dikonsumsi?';
  @override
  String savingsRescuedSnack(String money) => 'Penghematan tercatat ·$money';
  @override
  String get freshnessRecipeTitle => 'Mempersiapkan resep';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Setidaknya satu item diperlukan untuk resep.';
  @override
  String get freshnessCriticalBanner => 'Segera habis masa berlakunya';
  @override
  String get freshnessViewAll => 'Lihat semuanya';
  @override
  String get receiptCaptureHints =>
      'Pegang resi dengan rata, pencahayaan bagus. Semua garis terlihat dalam bingkai vertikal.';
  @override
  String get receiptPurchaseDate => 'Tanggal pembelian';
  @override
  String get receiptTapToEdit => 'Sunting';
  @override
  String get receiptEditItem => 'Sunting barang';
  @override
  String get receiptEditSave => 'Menyimpan';
  @override
  String get receiptExpiryDaysLabel => 'Perkiraan umur simpan (hari)';
  @override
  String get receiptMergedSnack => 'Beberapa item digabungkan dengan catatan yang ada';
  @override
  String get receiptCloudSyncFailed => 'Tidak dapat menyimpan ke cloud';
  @override
  String get receiptCloudSynced => 'Item disinkronkan ke cloud';
  @override
  String get pantrySyncAction => 'Sinkronkan data kesegaran';
  @override
  String get pantrySyncDone => 'Data kesegaran diperbarui';
  @override
  String get pantrySyncFailed => 'Sinkronisasi gagal';
  @override
  String get freshnessNotificationsTitle => 'Pemberitahuan kesegaran';
  @override
  String get freshnessNotificationsSubtitle =>
      'Item penting dan pengingat harian';
  @override
  String get freshnessNotificationTimeLabel => 'Waktu pengingat harian';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Setiap hari pukul$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Minggu ini:$critical kritis,$warning item peringatan. Gunakan ini dulu.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Kesalahan jaringan. Periksa koneksi Anda dan coba lagi.';
  @override
  String get geminiQuotaExceeded =>
      'Kuota AI terlampaui. Tunggu beberapa menit dan coba lagi.';
  @override
  String get geminiBillingDepleted =>
      'Kredit prabayar Google AI Studio telah habis. Tambahkan penagihan di ai.google.dev untuk memulihkan fitur AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Percobaan ulang otomatis mungkin tersedia di$minutes menit.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Batas terjemahan AI harian tercapai (3/3). Resep pakai terjemahan dasar sampai besok.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Anda punya$remaining Terjemahan AI tersisa hari ini.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Batas pemindaian pantry harian tercapai (3). Silakan coba lagi besok.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Batas pemindaian resi harian tercapai (2). Silakan coba lagi besok.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Batas pembuatan resep harian tercapai (3). Silakan coba lagi besok.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Harap tunggu$seconds detik sebelum mencoba lagi.';
  @override
  String get adRewardTitlePantry => 'Batas pemindaian pantry telah tercapai';
  @override
  String get adRewardTitleReceipt => 'Batas pemindaian tanda terima telah tercapai';
  @override
  String get adRewardTitleRecipe => 'Batas pembuatan resep tercapai';
  @override
  String get adRewardSubtitle =>
      'Tonton iklan singkat untuk mendapatkan +1 penggunaan ekstra hari ini (hingga 3 per hari).';
  @override
  String get adRewardWatchButton => 'Tonton iklan (+1 penggunaan)';
  @override
  String get adRewardGranted => 'Penggunaan ekstra diberikan. Coba lagi.';
  @override
  String get adRewardNotCompleted =>
      'Iklan belum selesai. Tidak ada penggunaan tambahan yang diberikan.';
  @override
  String get adRewardDailyCapReached =>
      'Anda mencapai batas imbalan iklan hari ini.';
  @override
  String get geminiTimeout =>
      'Waktu permintaan habis. Periksa koneksi Anda dan coba lagi.';
  @override
  String get geminiServerError =>
      'Layanan AI untuk sementara tidak tersedia. Silakan coba lagi nanti.';
  @override
  String get imageNotRecognized =>
      'Gambar tidak dikenali. Tingkatkan pencahayaan atau coba sudut lain.';
  @override
  String get imageNotPantry =>
      'Kulkas atau dapur tidak terlihat. Silakan difoto langsung.';
  @override
  String get parseError =>
      'Tidak dapat menguraikan respons AI. Silakan pindai lagi.';
  @override
  String get modelUnavailable =>
      'Model AI tidak tersedia. Periksa akses API Anda.';
  @override
  String get genericError => 'Ada yang tidak beres. Silakan coba lagi.';
  @override
  String get imageDecodeError => 'Tidak dapat membaca foto. Coba gambar lain.';
  @override
  String get authSubtitle => 'Akses dapur pintar';
  @override
  String get authInitializing => 'Sesi persiapan…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Kata sandi';
  @override
  String get emailRequired => 'Email diperlukan';
  @override
  String get emailInvalid => 'Email tidak valid';
  @override
  String get passwordMin => 'Setidaknya 6 karakter';
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
  String get signIn => 'Masuk';
  @override
  String get signUp => 'Buat akun';
  @override
  String get toggleToSignIn => 'Sudah punya akun? Masuk';
  @override
  String get toggleToSignUp => 'Baru di sini? Buat akun';
  @override
  String get guestContinue => 'Lanjutkan sebagai tamu';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Akun dibuat. Buka tautan konfirmasi di kotak masuk Anda; aplikasi akan memberi tahu Anda saat diverifikasi.';
  @override
  String get emailConfirmedSuccess =>
      'Email Anda telah dikonfirmasi. Akun Anda sudah siap.';
  @override
  String get emailVerifiedLabel => 'Email terverifikasi';
  @override
  String get proEmailRequiredTitle => 'Akun email diperlukan untuk Pro';
  @override
  String get proEmailRequiredBody =>
      'Akun tamu tidak dapat membeli Pro. Buat akun email untuk menyimpan data Anda dan membuka kunci penagihan.';
  @override
  String get proLinkAccountAction => 'Buat akun dan lanjutkan';
  @override
  String get proAccountLinked =>
      'Akun tertaut. Anda dapat melanjutkan ke pembayaran Pro sekarang.';
  @override
  String get supabaseNotConfigured =>
      'Layanan akun tidak tersedia. Silakan coba lagi nanti.';
  @override
  String get privacyTitle => 'Data & privasi';
  @override
  String get privacySubtitle => 'Foto dan data akun';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Gambar tanda terima tidak disimpan di server; hanya daftar produk yang diekstraksi.\\n\\n'
      'Saat masuk, data pindaian dan kesegaran dapat disimpan ke akun Anda.'
      'Paket gratis menampilkan iklan Google AdMob; Pro tidak memiliki iklan.\\n\\n'
      'Buka kebijakan privasi online untuk teks lengkapnya.';
  @override
  String get privacyViewOnline => 'Buka kebijakan privasi';
  @override
  String get pantryHistoryTitle => 'Sejarah dapur';
  @override
  String get pantryHistoryEmpty =>
      'Belum ada pindaian yang disimpan.\\nPindai lemari es Anda untuk membuat riwayat.';
  @override
  String get pantryHistorySubtitle => 'Pemindaian yang disimpan di cloud';
  @override
  String get splashTagline => 'Produksi & dapur — satu aplikasi';
  @override
  String get splashLoading => 'Memuat…';
  @override
  String get onboardingSkip => 'Melewati';
  @override
  String get onboardingNext => 'Berikutnya';
  @override
  String get onboardingStart => 'Awal';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Pemindaian terbaru';
  @override
  String get cameraTapToOpen => 'Ketuk ikon untuk membuka kamera';
  @override
  String get cameraOrGalleryHint => 'Buka kamera atau pilih dari galeri';
  @override
  String get captureOrGalleryHint => 'Tangkap atau pilih dari galeri';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Tutup kamera';
  @override
  String get noIngredients => 'Tidak ada bahan yang terdeteksi.';
  @override
  String get recipeInstructions => 'instruksi';
  @override
  String get untitledRecipe => 'Resep tanpa judul';
  @override
  String get genericLoadError => 'Ada yang tidak beres. Silakan coba lagi.';
  @override
  String get scanConfirmTitle => 'Konfirmasikan foto';
  @override
  String get scanConfirmSubtitle =>
      'Kirim foto ini? Analisis resep dimulai setelah Anda mengonfirmasi.';
  @override
  String get scanConfirmAnalyze => 'Menganalisa';
  @override
  String get scanConfirmCancel => 'Membatalkan';
  @override
  String get scanConfirmRetake => 'Merebut kembali';
  @override
  String get scanConfirmPickOther => 'Pilih yang lain';
  @override
  String get clearRecentScans => 'Hapus pindaian terkini';
  @override
  String get clearRecentScansSubtitle => 'Menghapus riwayat lokal di perangkat';
  @override
  String get clearRecentScansConfirmTitle => 'Hapus pindaian terkini?';
  @override
  String get clearRecentScansConfirmBody =>
      'Tidak dapat dibatalkan. Favorit tidak terpengaruh.';
  @override
  String get clearRecentScansDone => 'Pemindaian terbaru dihapus';
  @override
  String get deleteAction => 'Menghapus';
  @override
  String get imageQualityTitle => 'Kualitas foto rendah';
  @override
  String get imageQualityDark => 'Gambar terlalu gelap. Tambahkan cahaya dan coba lagi.';
  @override
  String get imageQualityBlurry =>
      'Gambar mungkin buram. Pegang dengan stabil dan ambil kembali.';
  @override
  String get imageQualityContinue => 'Lanjutkan saja';
  @override
  String get imageQualityRetake => 'Merebut kembali';
  @override
  String receiptQueueTitle(int count) => '$count tanda terima menunggu offline';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Kuitansi ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proses';
  @override
  String get receiptQueuedOffline =>
      'Luring. Tanda terima antri; proses saat terhubung.';
  @override
  String get receiptLowConfidenceBlock =>
      'Edit item berkeyakinan rendah sebelum disimpan (ikon pensil).';
  @override
  String get unifiedPantryTitle => 'Inventaris terpadu';
  @override
  String get unifiedPantryEmpty => 'Belum ada item atau pindaian.';
  @override
  String get searchHint => 'Cari produk…';
  @override
  String get navShopping => 'Belanja';
  @override
  String get shoppingAddHint => 'Tambahkan item yang hilang';
  @override
  String get shoppingEmpty => 'Daftar belanjaan Anda kosong.';
  @override
  String get shoppingClearDone => 'Jelas selesai';
  @override
  String get shoppingDoneSection => 'Selesai';
  @override
  String get shoppingAddFromRecipe => 'Tambahkan item yang tidak ada dalam inventaris tanda terima';
  @override
  String get freshnessViewCalendar => 'Kalender';
  @override
  String get freshnessViewList => 'Daftar';
  @override
  String get cookToday => 'Apa yang harus dimasak hari ini?';
  @override
  String get cookTodayNoUrgent =>
      'Tidak ada barang yang mendesak. Pindai tanda terima untuk melacak kesegaran.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Terlihat dalam pemindaian tetapi tidak dalam inventaris tanda terima: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Ekspor data lokal';
  @override
  String get exportLocalDataSubtitle => 'Menyalin JSON ke papan klip';
  @override
  String get exportLocalDataDone => 'Data disalin ke papan klip';
  @override
  String get clearLocalData => 'Hapus data lokal';
  @override
  String get clearLocalDataSubtitle =>
      'Kesegaran, belanja, preferensi (tidak dapat diubah)';
  @override
  String get clearLocalDataConfirmTitle => 'Hapus data lokal?';
  @override
  String get clearLocalDataConfirmBody =>
      'Inventaris kesegaran dan daftar belanja dihapus dari perangkat.';
  @override
  String get clearLocalDataDone => 'Data lokal dihapus';
  @override
  String get settingsTitle => 'Pengaturan';
  @override
  String get languageTitle => 'Bahasa';
  @override
  String get languageSubtitle => 'Bahasa aplikasi · 27 bahasa';
  @override
  String get localePreparingTitle => 'Memperbarui bahasa';
  @override
  String get localePreparingSubtitle =>
      'Menerjemahkan resep dan hasil pemindaian…';
  @override
  String get dietTitle => 'Preferensi pola makan';
  @override
  String get dietSubtitle => 'Diterapkan pada saran resep';
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
  String get aiUsageLimitsLoading => 'Memuat…';
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
  String get aiUsageLabelPantry => 'Sepen';
  @override
  String get aiUsageLabelReceipt => 'Kuitansi';
  @override
  String get aiUsageLabelRecipe => 'Resep';
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
  String get storeUnavailable => 'Toko tidak tersedia. Coba lagi nanti.';
  @override
  String get proProductIdsNotConfigured => 'ID produk Pro belum dikonfigurasi.';
  @override
  String get noProProductsFound => 'Tidak ada produk Pro yang dapat dibeli.';
  @override
  String get purchaseFlowFailed => 'Tidak dapat memulai pembelian.';
  @override
  String get purchaseCompletedProActivated => 'Pembelian selesai. Paket Pro diaktifkan.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Pembelian selesai. Verifikasi gagal; coba lagi sebentar lagi.';
  @override
  String get purchaseFailed => 'Pembelian gagal.';
  @override
  String get restorePurchases => 'Pulihkan pembelian';
  @override
  String get restorePurchasesStarted => 'Memeriksa pembelian sebelumnya di Play Store…';
  @override
  String get nutritionTitle => 'Nutrisi (perkiraan)';
  @override
  String get nutritionPerServing => 'per porsi';
  @override
  String get nutritionCalories => 'Kalori';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Karbohidrat';
  @override
  String get nutritionFat => 'Gemuk';
  @override
  String get nutritionEstimateNote =>
      'Hanya perkiraan AI; bukan nasihat medis atau diet.';
  @override
  String get barcodeScanTitle => 'Pindai kode batang';
  @override
  String get barcodeScanHint =>
      'Sejajarkan kode batang dalam bingkai. Pencarian produk melalui Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produk tidak ditemukan. Coba pindai tanda terima atau lemari es sebagai gantinya.';
  @override
  String get barcodeConfirmTitle => 'Konfirmasikan produk';
  @override
  String get barcodeAddToPantry => 'Tambahkan ke inventaris kesegaran';
  @override
  String get navScan => 'Pindai';
  @override
  String get captureTypeFridge => 'Kulkas';
  @override
  String get captureTypeReceipt => 'Kuitansi';
  @override
  String get captureTypeBarcode => 'kode batang';
  @override
  String get sectionAccount => 'Akun';
  @override
  String get sectionPreferences => 'Preferensi';
  @override
  String get sectionApp => 'Aplikasi';
  @override
  String get sectionPrivacy => 'Pribadi';
  @override
  String get sessionTitle => 'Sidang';
  @override
  String get guestUser => 'Pengguna tamu';
  @override
  String get favoritesTitle => 'Favorit';
  @override
  String get favoritesSubtitle => 'Resep yang Anda simpan';
  @override
  String get freshnessInventorySubtitle =>
      'Produk dari kuitansi dan tanggal kadaluarsa';
  @override
  String get pantrySyncSubtitle => 'Tarik inventaris kesegaran dari cloud';
  @override
  String get showOnboardingAgain => 'Tampilkan tur orientasi lagi';
  @override
  String get signOut => 'Keluar';
  @override
  String get scanSubtitleSmart => 'Pemindaian dapur cerdas';
  @override
  String get scanSubtitleReceipt => 'Pemindaian tanda terima & pelacakan kesegaran';
  @override
  String get tooltipSettings => 'Pengaturan';
  @override
  String get tooltipToggleGuide => 'Alihkan panduan bingkai';
  @override
  String get tooltipModesAbout => 'Tentang mode pemindaian';
  @override
  String get galleryLabel => 'Galeri';
  @override
  String get cameraLoading => 'Mempersiapkan kamera…';
  @override
  String get cameraUnavailable =>
      'Kamera tidak tersedia.\\nPeriksa izin dan coba lagi.';
  @override
  String get captureFailed =>
      'Pengambilan gagal. Periksa izin kamera dan coba lagi.';
  @override
  String get receiptCaptureAlign =>
      'Sejajarkan tanda terima dalam bingkai vertikal dan ambil';
  @override
  String get receiptCameraHint =>
      'Buka kamera atau pilih foto tanda terima dari galeri';
  @override
  String get pickPhotoHint => 'Ketuk tombol untuk memilih foto';
  @override
  String get desktopGalleryHint =>
      'Mode desktop — pilih foto lemari es dari galeri.';
  @override
  String get noCameraOnDevice => 'Tidak ada kamera yang ditemukan di perangkat ini.';
  @override
  String get openCameraButton => 'Buka kamera';
  @override
  String get pickPhotoButton => 'Pilih foto';
  @override
  String get overlayGuideOn => 'Panduan tentang';
  @override
  String get overlayGuideOff => 'Panduan mati';
  @override
  String get modeSheetTitle => 'Mode pemindaian';
  @override
  String get modeSheetSubtitle =>
      'Pilih sebelum menangkap; itu mengubah aturan resep AI.';
  @override
  String get scanModeQuickLabel => 'Pemindaian cepat';
  @override
  String get scanModeQuickSubtitle => 'Resep di bawah 15 menit';
  @override
  String get scanModeQuickDesc =>
      'Makanan praktis sehari-hari. Semua resep berdurasi total 15 menit atau kurang; teknik sederhana (satu wajan, salad, quick fry).';
  @override
  String get scanModeSurvivalLabel => 'Menyelamatkan';
  @override
  String get scanModeSurvivalSubtitle => 'Gunakan item yang kedaluwarsa terlebih dahulu';
  @override
  String get scanModeSurvivalDesc =>
      'Mengurangi limbah. Memprioritaskan barang-barang yang terlihat hampir rusak. Item bidang petunjuk opsional diprioritaskan.';
  @override
  String get scanModeChefLabel => 'Modus koki';
  @override
  String get scanModeChefSubtitle => 'Masakan & detail';
  @override
  String get scanModeChefDesc =>
      'Resep yang lebih halus. Teknik berlapis, waktu memasak lebih lama; setidaknya dua resep ditandai sulit.';
  @override
  String get scanModeQuickBestFor =>
      'Makan malam hari kerja dengan bahan dan waktu minimal';
  @override
  String get scanModeQuickExamples =>
      '• Telur dadar 10 menit\\n• Pasta satu loyang\\n• Bungkus atau mangkuk tanpa perlu dimasak';
  @override
  String get scanModeSurvivalBestFor =>
      'Menggunakan barang sebelum kadaluarsa dan memotong sampah';
  @override
  String get scanModeSurvivalExamples =>
      '• Sup sayuran bersih\\n• Frittata oven\\n• Sisa nasi goreng';
  @override
  String get scanModeChefBestFor =>
      'Makan malam khusus, tamu, atau mempelajari suatu teknik';
  @override
  String get scanModeChefExamples =>
      '• Protein saus dalam wajan\\n• Piring renyah + lembut\\n• Hiasan sayuran karamel';
  @override
  String get scanModeIdealForLabel => 'Terbaik untuk';
  @override
  String get scanModeExamplesLabel => 'Contoh masakan';
  @override
  String get survivalHintAddFromPantry => 'Tambahkan dari kesegaran';
  @override
  String get filterAll => 'Semua';
  @override
  String get filterCritical => 'Kritis';
  @override
  String get filterWarning => 'Peringatan';
  @override
  String get filterSafe => 'Aman';
  @override
  String get recipesScreenTitle => 'Resep';
  @override
  String get copyRecipe => 'Menyalin';
  @override
  String get shareRecipe => 'Membagikan';
  @override
  String get recipeCopiedSnack => 'Resep disalin ke clipboard';
  @override
  String get survivalHintTitle => 'Segera habis masa berlakunya';
  @override
  String get survivalHintOptional => 'Opsional — mis. susu, tomat, yogurt';
  @override
  String get survivalHintPlaceholder => 'Pisahkan dengan koma';
  @override
  String get scanConfirmReceiptLabel => 'Pemindaian tanda terima';
  @override
  String get scanSavedHistory => 'Pindaian disimpan ke riwayat dapur';
  @override
  String get scanSaveFailedPrefix => 'Tidak dapat menyimpan pindaian';
  @override
  String get daysUnit => 'hari';
  @override
  String get okButton => 'OKE';
  @override
  String get recipesDetectedIngredients => 'Bahan-bahan yang terdeteksi';
  @override
  String recipesAiCount(int count) => 'resep AI ·$count';
  @override
  String get galleryPickMessage => 'Pilih foto dari galeri';
  @override
  String get favoritesEmpty =>
      'Belum ada resep favorit.\\nKetuk hati pada hasil resep.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Resep ${index + 1}' : 'Resep';

  @override
  String get timeAgoJustNow => 'Baru saja';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}m yang lalu';
  @override
  String timeAgoHours(int hours) => '${hours}jam yang lalu';
  @override
  String timeAgoDays(int days) => '${days}hari yang lalu';
  @override
  String get daysExpired => 'Kedaluwarsa';
  @override
  String get daysToday => 'Hari ini';
  @override
  String get daysTomorrow => 'Besok';
  @override
  String daysCount(int days) => '$days hari';
  @override
  String unifiedDaysRemaining(int days) => '$days hari tersisa';
  @override
  String productCount(int count) => '$count item';
  @override
  String get unifiedSourceReceipt => 'Kuitansi';
  @override
  String get unifiedSourceScan => 'Pindai';
  @override
  String unifiedLastScan(String date) => 'Pemindaian terakhir ·$date';
  @override
  String get receiptFieldProductName => 'Nama Produk';
  @override
  String get receiptFieldQuantity => 'Kuantitas';
  @override
  String get receiptFieldCategory => 'Kategori';
  @override
  String expiryApprox(int days) => 'Terbaik sebelumnya ~$days hari';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Bahan-bahan yang hilang ditambahkan ke daftar belanjaan';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients bahan-bahan ·$recipes resep';
  @override
  String get favoriteAddTooltip => 'Tambahkan ke favorit';
  @override
  String get favoriteRemoveTooltip => 'Hapus dari favorit';
  @override
  String get favoriteAddedSnack => 'Ditambahkan ke favorit';
  @override
  String get favoriteRemovedSnack => 'Dihapus dari favorit';
  @override
  String get onboardingScanTitle => 'Pindai dapur Anda';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Daftar belanja';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favorit & pindaian terkini';
  @override
  String get onboardingFavoritesBody =>
      'Simpan resep yang Anda suka. Pemindaian terkini terbuka dengan cepat dari layar beranda.';
  @override
  String get onboardingCloudTitle => 'Sejarah awan';
  @override
  String get onboardingCloudBody =>
      'Masuk untuk menyimpan riwayat pemindaian ke akun Anda dan kembali kapan saja.';
  @override
  String get onboardingPermissionsTitle => 'Kamera & notifikasi';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef membutuhkan kamera untuk memindai kulkas, struk, dan barcode. Notifikasi opsional mengingatkan saat makanan hampir kedaluwarsa.';
  @override
  String get emptyStateScanReceipt => 'Pindai struk';
  @override
  String get emptyStateStartScan => 'Mulai pemindaian';
  @override
  String get manageSubscriptions => 'Kelola langganan';
  @override
  String get notificationCriticalChannelName => 'Peringatan kesegaran';
  @override
  String get notificationCriticalChannelDesc => 'Barang akan segera habis masa berlakunya';
  @override
  String get notificationDailyChannelName => 'Ringkasan harian';
  @override
  String get notificationDailyChannelDesc => 'Pengingat kesegaran harian';
  @override
  String get notificationCriticalTitle => 'Barang akan segera habis masa berlakunya';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Periksa panel Kesegaran.';
  @override
  String get notificationDailyTitle => 'Pemeriksaan kesegaran';
  @override
  String get notificationDailyBody =>
      'Tinjau item yang harus Anda gunakan hari ini.';
  @override
  String get widgetFreshnessGood => 'Kesegarannya terlihat bagus';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count item mungkin kedaluwarsa hari ini';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritis ·$warning peringatan';
  @override
  String get categoryDairy => 'Produk susu';
  @override
  String get categoryMeat => 'Daging/ikan';
  @override
  String get categoryFruit => 'Buah';
  @override
  String get categoryVegetable => 'Sayuran';
  @override
  String get categoryBeverage => 'Minuman';
  @override
  String get categoryBakery => 'Toko roti';
  @override
  String get categoryPantry => 'Sepen';
  @override
  String calendarMonthName(int month) => const [
        'Januari',
        'Februari',
        'Berbaris',
        'April',
        'Mungkin',
        'Juni',
        'Juli',
        'Agustus',
        'September',
        'Oktober',
        'November',
        'Desember',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Resep';
  @override
  String get recipesPlaceholderBody =>
      'Hasil resep akan muncul di sini setelah pemindaian berhasil.';
  @override
  String get recipeSamplePlating => 'Pelapisan sampel';
  @override
  String get recipeShareInstructionsHeader => 'Petunjuk:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Contoh.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Palet warna dan latar belakang';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Hijau tua bawaan';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Nada biru yang sejuk';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Aksen kuning yang hangat';
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
  String get themeCreamSubtitle => 'Krim hangat dengan aksen oranye';
}
