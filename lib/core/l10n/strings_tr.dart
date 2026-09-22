import 'strings_base.dart';

class StringsTr implements StringsBase {
  const StringsTr();

  @override
  String get analysisTitle => 'Pantry analiz ediliyor';
  @override
  String get stepPrepareImage => 'Fotoğraf hazırlanıyor…';
  @override
  String get stepAnalyzeAi => 'Malzemeler tanınıyor…';
  @override
  String get stepBuildRecipes => 'Tarifler oluşturuluyor…';
  @override
  String get receiptAnalysisTitle => 'Fiş okunuyor';
  @override
  String get stepReceiptPrepare => 'Fiş fotoğrafı hazırlanıyor…';
  @override
  String get stepReceiptOcr => 'Ürünler tanınıyor…';
  @override
  String get stepReceiptInfer => 'Raf ömrü tahmin ediliyor…';
  @override
  String get receiptNotRecognized =>
      'Fiş okunamadı. Daha net ve düz bir fotoğraf deneyin.';
  @override
  String get receiptNotDetected =>
      'Alışveriş fişi algılanamadı. Fişi çerçeveye hizalayın.';
  @override
  String get receiptConfirmTitle => 'Fiş ürünlerini onayla';
  @override
  String get receiptConfirmSubtitle =>
      'Eklemek istediğiniz ürünleri seçin. Uzun basarak düzenleyebilirsiniz.';
  @override
  String get receiptConfirmSave => 'Pantry\'e ekle';
  @override
  String get receiptSelectOne => 'En az bir ürün seçin.';
  @override
  String get receiptSaved => 'Ürünler tazelik paneline eklendi';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Bu fiş fotoğrafını göndermek istiyor musunuz? Onayladığınızda OCR analizi başlar.';
  @override
  String get navFreshness => 'Tazelik';
  @override
  String get freshnessPanelTitle => 'Tazelik Paneli';
  @override
  String get freshnessCritical => 'Kritik (0–2 gün)';
  @override
  String get freshnessWarning => 'Uyarı (3–5 gün)';
  @override
  String get freshnessSafe => 'Güvenli (6+ gün)';
  @override
  String get freshnessEmpty =>
      'Henüz takip edilen ürün yok. Fiş tarayarak envanter oluşturun.';
  @override
  String get freshnessListTitle => 'Tazelik envanteri';
  @override
  String get freshnessListEmpty => 'Bu filtrede ürün yok.';
  @override
  String get freshnessSuggestRecipes => 'Bu ürünlerle tarif öner';
  @override
  String get savingsPanelTitle => 'Tasarruf Paneli';
  @override
  String get savingsPanelEmptyHint =>
      'SKT\'si yaklaşan ürünü “Yemek yapıldı” ile işaretleyin; tasarruf burada görünür.';
  @override
  String get savingsStatItems => 'Kurtarılan';
  @override
  String get savingsStatWaste => 'Atık engellendi';
  @override
  String get savingsStatMoney => 'Tahmini kazanç';
  @override
  String get savingsDashboardTitle => 'Tasarruf analitiği';
  @override
  String get savingsDashboardSubtitle =>
      'Çöpe gitmekten kurtardığınız ürünlerin özeti — bu ay.';
  @override
  String savingsItemsThisMonth(int count) =>
      'Bu ay çöpe gitmekten kurtarılan: $count malzeme';
  @override
  String savingsKgPrevented(String kg) => 'Engellenen gıda atığı: $kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Tahmini finansal kazanç: $amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TL';
  @override
  String get savingsTrendTitle => 'Son 4 hafta';
  @override
  String get savingsRecentTitle => 'Son kurtarılanlar';
  @override
  String get savingsEmptySubtitle =>
      'Henüz kayıt yok. Kritik veya uyarı seviyesindeki bir ürünü tükettiğinizde burada listelenir.';
  @override
  String get savingsHowItWorks =>
      'Son 5 gün içinde tüketilen ürünler “kurtarma” sayılır. Ağırlık ve tutar kategori ortalamalarına göre tahmin edilir.';
  @override
  String get pantryNamesLocaleNote => '';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Son gün tüketildi' : '$days gün kala tüketildi';
  @override
  String get savingsMealMade => 'Yemek yapıldı';
  @override
  String savingsMealMadeConfirm(String name) =>
      '$name tüketildi olarak işaretlensin mi?';
  @override
  String savingsRescuedSnack(String money) =>
      'Tasarruf kaydedildi · $money';
  @override
  String get freshnessRecipeTitle => 'Tarifler hazırlanıyor';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Tarif için en az bir ürün gerekli.';
  @override
  String get freshnessCriticalBanner => 'Yakında bitecek';
  @override
  String get freshnessViewAll => 'Tümünü gör';
  @override
  String get receiptCaptureHints =>
      'Fişi düz tutun, iyi ışıkta çekin. Tüm satırlar dikey çerçevede görünsün.';
  @override
  String get receiptPurchaseDate => 'Alışveriş tarihi';
  @override
  String get receiptTapToEdit => 'Düzenle';
  @override
  String get receiptEditItem => 'Ürünü düzenle';
  @override
  String get receiptEditSave => 'Kaydet';
  @override
  String get receiptExpiryDaysLabel => 'Tahmini raf ömrü (gün)';
  @override
  String get receiptMergedSnack => 'Bazı ürünler mevcut kayıtla birleştirildi';
  @override
  String get receiptCloudSyncFailed => 'Buluta kaydedilemedi';
  @override
  String get receiptCloudSynced => 'Ürünler buluta senkronlandı';
  @override
  String get pantrySyncAction => 'Tazelik verisini senkronize et';
  @override
  String get pantrySyncDone => 'Tazelik verisi güncellendi';
  @override
  String get pantrySyncFailed => 'Senkron başarısız';
  @override
  String get freshnessNotificationsTitle => 'Tazelik bildirimleri';
  @override
  String get freshnessNotificationsSubtitle =>
      'Kritik ürünler ve günlük hatırlatma';
  @override
  String get freshnessNotificationTimeLabel => 'Günlük hatırlatma saati';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Her gün $time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Bu hafta $critical kritik, $warning uyarı seviyesinde ürününüz var. Önce bunları tüketmeyi düşünün.';
  @override
  String get geminiKeyMissing =>
      'Yapay zeka servisi şu an kullanılamıyor. Lütfen daha sonra tekrar deneyin.';
  @override
  String get networkError =>
      'Ağ hatası. İnternet bağlantınızı kontrol edip tekrar deneyin.';
  @override
  String get geminiQuotaExceeded =>
      'Yapay zeka kotası doldu. Birkaç dakika bekleyip tekrar deneyin.';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studio ön ödeme krediniz bitti. Tarama ve tarifler için aistudio.google.com adresinden projeye bakiye yüklemeniz gerekiyor.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      '$minutes dakika sonra otomatik yeniden denenebilir.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Günlük AI çeviri limitine ulaştınız (3/3). Tarifler basit çeviriyle gösterilir; yarın yenilenir.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Bugün $remaining AI çeviri hakkınız kaldı.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Bugünkü buzdolabı tarama limitine ulaştınız (3). Yarın tekrar deneyin.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Bugünkü fiş tarama limitine ulaştınız (2). Yarın tekrar deneyin.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Bugünkü tarif oluşturma limitine ulaştınız (3). Yarın tekrar deneyin.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Lütfen $seconds saniye bekleyip tekrar deneyin.';
  @override
  String get adRewardTitlePantry => 'Buzdolabı tarama limiti doldu';
  @override
  String get adRewardTitleReceipt => 'Fiş tarama limiti doldu';
  @override
  String get adRewardTitleRecipe => 'Tarif oluşturma limiti doldu';
  @override
  String get adRewardSubtitle =>
      'Kısa bir reklam izleyerek bugün +1 ek hak kazanabilirsiniz (günde en fazla 3).';
  @override
  String get adRewardWatchButton => 'Reklam izle (+1 hak)';
  @override
  String get adRewardGranted => 'Ek tarama hakkı tanımlandı. Tekrar deneyin.';
  @override
  String get adRewardNotCompleted =>
      'Reklam tamamlanmadı. Ek hak verilmedi.';
  @override
  String get adRewardDailyCapReached =>
      'Bugünkü reklam ödülü limitine ulaştınız.';
  @override
  String get geminiTimeout =>
      'İstek zaman aşımına uğradı. Bağlantınızı kontrol edip tekrar deneyin.';
  @override
  String get geminiServerError =>
      'Yapay zeka servisi geçici olarak yanıt vermiyor. Lütfen sonra tekrar deneyin.';
  @override
  String get imageNotRecognized =>
      'Görüntü tanınamadı. Işığı artırın veya daha net bir açı deneyin.';
  @override
  String get imageNotPantry =>
      'Buzdolabı veya pantry görünmüyor. Lütfen doğrudan çekin.';
  @override
  String get parseError =>
      'Yapay zeka yanıtı işlenemedi. Lütfen tekrar tarayın.';
  @override
  String get modelUnavailable =>
      'Yapay zeka modeli kullanılamıyor. API erişiminizi kontrol edin.';
  @override
  String get genericError => 'Bir şeyler ters gitti. Lütfen tekrar deneyin.';
  @override
  String get imageDecodeError =>
      'Fotoğraf okunamadı. Başka bir görsel deneyin.';
  @override
  String get authSubtitle => 'Akıllı pantry erişimi';
  @override
  String get authInitializing => 'Oturum hazırlanıyor…';
  @override
  String get emailLabel => 'E-posta';
  @override
  String get passwordLabel => 'Şifre';
  @override
  String get emailRequired => 'E-posta gerekli';
  @override
  String get emailInvalid => 'Geçersiz e-posta';
  @override
  String get passwordMin => 'En az 6 karakter';
  @override
  String get passwordVisibilityShow => 'Şifreyi göster';
  @override
  String get passwordVisibilityHide => 'Şifreyi gizle';
  @override
  String get authOrContinueWith => 'veya şununla devam et';
  @override
  String get signInWithGoogle => 'Google ile devam et';
  @override
  String get googleSignInFailed =>
      'Google ile giriş başarısız. Lütfen tekrar deneyin.';
  @override
  String get signIn => 'Giriş yap';
  @override
  String get signUp => 'Hesap oluştur';
  @override
  String get toggleToSignIn => 'Zaten hesabınız var mı? Giriş yapın';
  @override
  String get toggleToSignUp => 'Yeni misiniz? Hesap oluşturun';
  @override
  String get guestContinue => 'Misafir olarak devam et';
  @override
  String get authContinueOffline => 'Çevrimdışı devam et (bulut senkronu yok)';
  @override
  String get authSupabaseUnreachable =>
      'Bulut sunucusuna ulaşılamıyor. Supabase projeniz duraklatılmış, silinmiş olabilir veya ağınız engelliyor olabilir.';
  @override
  String get accountCreated =>
      'Hesap oluşturuldu. Gelen kutunuzdaki onay linkine dokunun; onay sonrası uygulama bilgi verecek.';
  @override
  String get emailConfirmedSuccess =>
      'E-posta adresiniz onaylandı. Hesabınız hazır.';
  @override
  String get emailVerifiedLabel => 'E-posta onaylandı';
  @override
  String get proEmailRequiredTitle => 'Pro için e-posta hesabı gerekli';
  @override
  String get proEmailRequiredBody =>
      'Misafir hesapla Pro satın alınamaz. E-posta ile hesap oluşturun; mevcut verileriniz korunur.';
  @override
  String get proLinkAccountAction => 'Hesap oluştur ve devam et';
  @override
  String get proAccountLinked =>
      'Hesap bağlandı. Şimdi Pro satın alma adımına geçebilirsiniz.';
  @override
  String get supabaseNotConfigured =>
      'Hesap hizmeti şu an kullanılamıyor. Lütfen daha sonra tekrar deneyin.';
  @override
  String get privacyTitle => 'Veri ve gizlilik';
  @override
  String get privacySubtitle => 'Fotoğraflar ve hesap verileri';
  @override
  String get privacyBody =>
      'CyberChef, tarif önermek için buzdolabı fotoğraflarınızı ve fiş taraması için fiş görsellerinizi yalnızca bu amaçlarla işler. '
      'Fiş görselleri sunucuda saklanmaz; yalnızca ürün listesi çıkarılır.\n\n'
      'Giriş yaptığınızda tarama ve tazelik verileriniz hesabınıza kaydedilebilir. '
      'Ücretsiz planda Google AdMob reklamları gösterilir; Pro planda reklam yoktur.\n\n'
      'Tam metin için çevrimiçi gizlilik politikasını açın.';
  @override
  String get privacyViewOnline => 'Gizlilik politikasını aç';
  @override
  String get pantryHistoryTitle => 'Pantry geçmişi';
  @override
  String get pantryHistoryEmpty =>
      'Henüz kayıtlı tarama yok.\nBuzdolabını tarayarak geçmiş oluşturun.';
  @override
  String get pantryHistorySubtitle => 'Bulutta kayıtlı taramalar';
  @override
  String get splashTagline => 'Meyve, sebze ve pantry — tek uygulamada';
  @override
  String get splashLoading => 'Hazırlanıyor…';
  @override
  String get onboardingSkip => 'Atla';
  @override
  String get onboardingNext => 'İleri';
  @override
  String get onboardingStart => 'Başla';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Geri bildirim gönder';
  @override
  String get sendFeedbackSubtitle => 'Öneri paylaşın veya sorun bildirin';
  @override
  String get recentScansTitle => 'Son taramalar';
  @override
  String get cameraTapToOpen => 'Kamerayı açmak için simgeye dokunun';
  @override
  String get cameraOrGalleryHint =>
      'Kamerayı açın veya galeriden fotoğraf seçin';
  @override
  String get captureOrGalleryHint => 'Çek veya galeriden seç';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Kamerayı kapat';
  @override
  String get noIngredients => 'Malzeme algılanamadı.';
  @override
  String get recipeInstructions => 'Yapılış';
  @override
  String get untitledRecipe => 'İsimsiz tarif';
  @override
  String get genericLoadError =>
      'Bir şeyler ters gitti. Lütfen tekrar deneyin.';
  @override
  String get scanConfirmTitle => 'Fotoğrafı onayla';
  @override
  String get scanConfirmSubtitle =>
      'Bu fotoğrafı göndermek istiyor musunuz? Onayladığınızda tarif analizi başlar.';
  @override
  String get scanConfirmAnalyze => 'Analiz et';
  @override
  String get scanConfirmCancel => 'İptal';
  @override
  String get scanConfirmRetake => 'Yeniden çek';
  @override
  String get scanConfirmPickOther => 'Başka fotoğraf seç';
  @override
  String get clearRecentScans => 'Son taramaları temizle';
  @override
  String get clearRecentScansSubtitle => 'Cihazdaki yerel geçmişi siler';
  @override
  String get clearRecentScansConfirmTitle => 'Son taramalar silinsin mi?';
  @override
  String get clearRecentScansConfirmBody =>
      'Bu işlem geri alınamaz. Favorileriniz etkilenmez.';
  @override
  String get clearRecentScansDone => 'Son taramalar temizlendi';
  @override
  String get deleteAction => 'Sil';
  @override
  String get imageQualityTitle => 'Fotoğraf kalitesi düşük';
  @override
  String get imageQualityDark =>
      'Görüntü çok karanlık. Işığı artırıp tekrar deneyin.';
  @override
  String get imageQualityBlurry =>
      'Görüntü bulanık olabilir. Telefonu sabit tutup yeniden çekin.';
  @override
  String get imageQualityContinue => 'Yine de devam et';
  @override
  String get imageQualityRetake => 'Yeniden çek';
  @override
  String receiptQueueTitle(int count) => '$count fiş çevrimdışı bekliyor';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Fiş · $d.$m · $h:${min.toString().padLeft(2, '0')}';
  @override
  String get receiptQueueProcess => 'İşle';
  @override
  String get receiptQueuedOffline =>
      'İnternet yok. Fiş kuyruğa alındı; bağlanınca işleyebilirsiniz.';
  @override
  String get receiptLowConfidenceBlock =>
      'Düşük güvenli ürünleri düzenleyip onaylayın (kalem simgesi).';
  @override
  String get unifiedPantryTitle => 'Birleşik envanter';
  @override
  String get unifiedPantryEmpty => 'Henüz ürün veya tarama yok.';
  @override
  String get searchHint => 'Ürün ara…';
  @override
  String get navShopping => 'Alışveriş';
  @override
  String get shoppingAddHint => 'Eksik malzeme ekle';
  @override
  String get shoppingEmpty => 'Alışveriş listeniz boş.';
  @override
  String get shoppingClearDone => 'Tamamlananları sil';
  @override
  String get shoppingDoneSection => 'Alındı';
  @override
  String get shoppingAddFromRecipe =>
      'Fiş envanterinde olmayanları listeye ekle';
  @override
  String get freshnessViewCalendar => 'Takvim';
  @override
  String get freshnessViewList => 'Liste';
  @override
  String get cookToday => 'Bugün ne pişirsem?';
  @override
  String get cookTodayNoUrgent =>
      'Yakında bitecek ürün yok. Fiş tarayarak envanter oluşturun.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Taramada görünen ancak fiş envanterinde olmayan: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Yerel veriyi dışa aktar';
  @override
  String get exportLocalDataSubtitle => 'JSON panoya kopyalanır';
  @override
  String get exportLocalDataDone => 'Veri panoya kopyalandı';
  @override
  String get clearLocalData => 'Yerel veriyi sil';
  @override
  String get clearLocalDataSubtitle =>
      'Tazelik, alışveriş ve tercihler (geri alınamaz)';
  @override
  String get clearLocalDataConfirmTitle => 'Yerel veri silinsin mi?';
  @override
  String get clearLocalDataConfirmBody =>
      'Tazelik envanteri ve alışveriş listesi cihazdan silinir.';
  @override
  String get clearLocalDataDone => 'Yerel veri temizlendi';
  @override
  String get settingsTitle => 'Ayarlar';
  @override
  String get languageTitle => 'Dil';
  @override
  String get languageSubtitle => 'Uygulama dili · 27 dil';
  @override
  String get localePreparingTitle => 'Dil güncelleniyor';
  @override
  String get localePreparingSubtitle =>
      'Tarifler ve tarama sonuçları çevriliyor…';
  @override
  String get dietTitle => 'Diyet tercihi';
  @override
  String get dietSubtitle => 'Tarif önerilerine uygulanır';
  @override
  String get dietNone => 'Kısıtlama yok';
  @override
  String get dietVegetarian => 'Vejetaryen';
  @override
  String get dietVegan => 'Vegan';
  @override
  String get dietGlutenFree => 'Glutensiz';
  @override
  String get dietLowCarb => 'Düşük karbonhidrat';
  @override
  String get dietHalal => 'Helal';
  @override
  String get cuisineTitle => 'Mutfak / bölge';
  @override
  String get cuisineSubtitle => 'AI tarif önerilerinde kullanılacak mutfak';
  @override
  String get cuisineAutomatic => 'Otomatik';
  @override
  String get aiUsageLimitsTitle => 'AI kullanım limitleri';
  @override
  String get aiUsageLimitsLoading => 'Yükleniyor…';
  @override
  String get aiUsageCanSendNow => 'Yeni istek gönderebilirsiniz.';
  @override
  String get aiUsageDailyReset => 'Günlük sıfırlama';
  @override
  String get aiUsageUpgrade => 'Yükselt';
  @override
  String get aiUsagePlanPro => 'Plan: Pro';
  @override
  String get aiUsagePlanFree => 'Plan: Ücretsiz';
  @override
  String get aiUsageLabelPantry => 'Buzdolabı';
  @override
  String get aiUsageLabelReceipt => 'Fiş';
  @override
  String get aiUsageLabelRecipe => 'Tarif';
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
  String get upgradeToProTitle => 'Pro plana geç';
  @override
  String get upgradeToProSubtitle =>
      'AI özelliklerinde daha yüksek günlük limitler.';
  @override
  String get upgradeToProLimitsDetail =>
      'Pro limitleri: Buzdolabı 30/gün · Fiş 15/gün · Tarif 30/gün · Çeviri 20/gün';
  @override
  String get upgradeToProContinue => 'Pro\'ya devam et';
  @override
  String get storeUnavailable =>
      'Mağaza şu an kullanılamıyor. Daha sonra tekrar deneyin.';
  @override
  String get proProductIdsNotConfigured =>
      'Pro ürün kimlikleri henüz ayarlanmadı.';
  @override
  String get noProProductsFound => 'Satın alınabilir Pro ürünü bulunamadı.';
  @override
  String get purchaseFlowFailed => 'Satın alma akışı başlatılamadı.';
  @override
  String get purchaseCompletedProActivated =>
      'Ödeme tamamlandı. Pro plan etkinleştirildi.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Ödeme tamamlandı. Doğrulama şu an yapılamadı, birazdan tekrar deneyin.';
  @override
  String get purchaseFailed => 'Satın alma başarısız oldu.';
  @override
  String get restorePurchases => 'Satın alımları geri yükle';
  @override
  String get restorePurchasesStarted =>
      'Play Store\'da önceki satın alımlar kontrol ediliyor…';
  @override
  String get nutritionTitle => 'Besin değeri (tahmini)';
  @override
  String get nutritionPerServing => 'porsiyon başına';
  @override
  String get nutritionCalories => 'Kalori';
  @override
  String get nutritionProtein => 'Protein';
  @override
  String get nutritionCarbs => 'Karbonhidrat';
  @override
  String get nutritionFat => 'Yağ';
  @override
  String get nutritionEstimateNote =>
      'Yapay zeka tahminidir; tıbbi veya diyet tavsiyesi değildir.';
  @override
  String get barcodeScanTitle => 'Barkod tara';
  @override
  String get barcodeScanHint =>
      'Barkodu çerçeveye hizalayın. Ürün Open Food Facts veritabanından aranır.';
  @override
  String get barcodeNotFound =>
      'Ürün bulunamadı. Manuel olarak fiş veya buzdolabı taraması deneyin.';
  @override
  String get barcodeConfirmTitle => 'Ürünü onayla';
  @override
  String get barcodeAddToPantry => 'Tazelik envanterine ekle';
  @override
  String get navScan => 'Tarama';
  @override
  String get captureTypeFridge => 'Buzdolabı';
  @override
  String get captureTypeReceipt => 'Fiş';
  @override
  String get captureTypeBarcode => 'Barkod';
  @override
  String get sectionAccount => 'Hesap';
  @override
  String get sectionPreferences => 'Tercihler';
  @override
  String get sectionApp => 'Uygulama';
  @override
  String get sectionPrivacy => 'Gizlilik';
  @override
  String get sessionTitle => 'Oturum';
  @override
  String get guestUser => 'Misafir kullanıcı';
  @override
  String get favoritesTitle => 'Favoriler';
  @override
  String get favoritesSubtitle => 'Kaydettiğiniz tarifler';
  @override
  String get freshnessInventorySubtitle =>
      'Fişten eklenen ürünler ve SKT';
  @override
  String get pantrySyncSubtitle => 'Tazelik envanterini buluttan al';
  @override
  String get showOnboardingAgain => 'Tanıtım turunu tekrar göster';
  @override
  String get signOut => 'Çıkış yap';
  @override
  String get scanSubtitleSmart => 'Akıllı pantry taraması';
  @override
  String get scanSubtitleReceipt => 'Fiş tarama ve tazelik takibi';
  @override
  String get tooltipSettings => 'Ayarlar';
  @override
  String get tooltipToggleGuide => 'Çerçeve rehberini aç/kapat';
  @override
  String get tooltipModesAbout => 'Modlar hakkında';
  @override
  String get galleryLabel => 'Galeri';
  @override
  String get cameraLoading => 'Kamera hazırlanıyor…';
  @override
  String get cameraUnavailable =>
      'Kamera kullanılamıyor.\nİzinleri kontrol edip tekrar deneyin.';
  @override
  String get captureFailed =>
      'Çekim başarısız. Kamera iznini kontrol edip tekrar deneyin.';
  @override
  String get receiptCaptureAlign => 'Fişi dikey çerçeveye hizalayın ve çekin';
  @override
  String get receiptCameraHint =>
      'Fiş fotoğrafı için kamerayı açın veya galeriden seçin';
  @override
  String get pickPhotoHint => 'Fotoğraf seçmek için düğmeye dokunun';
  @override
  String get desktopGalleryHint =>
      'Masaüstü modu — galeriden buzdolabı fotoğrafı seçin.';
  @override
  String get noCameraOnDevice => 'Bu cihazda kamera bulunamadı.';
  @override
  String get openCameraButton => 'Kamerayı aç';
  @override
  String get pickPhotoButton => 'Fotoğraf seç';
  @override
  String get overlayGuideOn => 'Rehber açık';
  @override
  String get overlayGuideOff => 'Rehber kapalı';
  @override
  String get modeSheetTitle => 'Tarama modları';
  @override
  String get modeSheetSubtitle =>
      'Mod, çekimden önce seçilir ve yapay zekanın tarif kurallarını değiştirir.';
  @override
  String get scanModeQuickLabel => 'Hızlı tarama';
  @override
  String get scanModeQuickSubtitle => '15 dk altı tarifler';
  @override
  String get scanModeQuickDesc =>
      'Pratik günlük yemekler. Tüm tarifler toplamda 15 dakikayı geçmez; basit teknikler (tek tava, salata, hızlı kızartma) önerilir.';
  @override
  String get scanModeSurvivalLabel => 'Kurtarma';
  @override
  String get scanModeSurvivalSubtitle => 'Önce bitecek ürünler';
  @override
  String get scanModeSurvivalDesc =>
      'İsrafı azaltır. Fotoğrafta bozulmaya yakın görünen ürünlere öncelik verir. İsteğe bağlı ipucu alanına yazdığınız ürünler önceliklendirilir.';
  @override
  String get scanModeChefLabel => 'Şef modu';
  @override
  String get scanModeChefSubtitle => 'Gurme ve detaylı';
  @override
  String get scanModeChefDesc =>
      'Daha özenli tarifler. Katmanlı teknikler, uzun süre ve yüksek zorluk seviyesi beklenir; en az iki tarif zor olarak işaretlenir.';
  @override
  String get scanModeQuickBestFor =>
      'Hafta içi akşam yemeği, az malzeme, hızlı sonuç';
  @override
  String get scanModeQuickExamples =>
      '• 10 dk omlet\n• Tek tavada makarna\n• Soğuk sandviç / kase';
  @override
  String get scanModeSurvivalBestFor =>
      'SKT yaklaşan ürünleri tüketmek, israfı azaltmak';
  @override
  String get scanModeSurvivalExamples =>
      '• Kalan sebze çorbası\n• Fırında frittata\n• Dünden pilavlı wok';
  @override
  String get scanModeChefBestFor =>
      'Özel gün, misafir veya mutfakta teknik denemek';
  @override
  String get scanModeChefExamples =>
      '• Sote soslu protein\n• Çıtır + krema tabak\n• Karamelize sebze garnitür';
  @override
  String get scanModeIdealForLabel => 'En uygun';
  @override
  String get scanModeExamplesLabel => 'Örnek tarifler';
  @override
  String get survivalHintAddFromPantry => 'Tazelikten ekle';
  @override
  String get filterAll => 'Tümü';
  @override
  String get filterCritical => 'Kritik';
  @override
  String get filterWarning => 'Uyarı';
  @override
  String get filterSafe => 'Güvenli';
  @override
  String get recipesScreenTitle => 'Tarifler';
  @override
  String get copyRecipe => 'Kopyala';
  @override
  String get shareRecipe => 'Paylaş';
  @override
  String get recipeCopiedSnack => 'Tarif panoya kopyalandı';
  @override
  String get survivalHintTitle => 'Yakında bitecek ürünler';
  @override
  String get survivalHintOptional => 'İsteğe bağlı — örn. süt, domates, yoğurt';
  @override
  String get survivalHintPlaceholder => 'Virgülle ayırarak yazın';
  @override
  String get scanConfirmReceiptLabel => 'Fiş tarama';
  @override
  String get scanSavedHistory => 'Tarama pantry geçmişine kaydedildi';
  @override
  String get scanSaveFailedPrefix => 'Tarama kaydedilemedi';
  @override
  String get daysUnit => 'gün';
  @override
  String get okButton => 'Tamam';
  @override
  String get recipesDetectedIngredients => 'Algılanan malzemeler';
  @override
  String recipesAiCount(int count) => 'Yapay zeka tarifleri · $count';
  @override
  String get galleryPickMessage => 'Galeriden fotoğraf seç';
  @override
  String get favoritesEmpty =>
      'Henüz favori tarif yok.\nTarif sonuçlarında kalp simgesine dokunun.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Tarif ${index + 1}' : 'Tarif';

  @override
  String get timeAgoJustNow => 'Az önce';
  @override
  String timeAgoMinutes(int minutes) => '$minutes dk önce';
  @override
  String timeAgoHours(int hours) => '$hours sa önce';
  @override
  String timeAgoDays(int days) => '$days gün önce';
  @override
  String get daysExpired => 'Süresi geçti';
  @override
  String get daysToday => 'Bugün';
  @override
  String get daysTomorrow => 'Yarın';
  @override
  String daysCount(int days) => '$days gün';
  @override
  String unifiedDaysRemaining(int days) => '$days gün kaldı';
  @override
  String productCount(int count) => '$count ürün';
  @override
  String get unifiedSourceReceipt => 'Fiş';
  @override
  String get unifiedSourceScan => 'Tarama';
  @override
  String unifiedLastScan(String date) => 'Son tarama · $date';
  @override
  String get receiptFieldProductName => 'Ürün adı';
  @override
  String get receiptFieldQuantity => 'Miktar';
  @override
  String get receiptFieldCategory => 'Kategori';
  @override
  String expiryApprox(int days) => 'SKT ~$days gün';
  @override
  String barcodeEan(String code) => 'EAN $code';
  @override
  String get shoppingListAddedSnack =>
      'Eksik malzemeler alışveriş listesine eklendi';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients malzeme · $recipes tarif';
  @override
  String get favoriteAddTooltip => 'Favorilere ekle';
  @override
  String get favoriteRemoveTooltip => 'Favorilerden çıkar';
  @override
  String get favoriteAddedSnack => 'Favorilere eklendi';
  @override
  String get favoriteRemovedSnack => 'Favorilerden kaldırıldı';
  @override
  String get onboardingScanTitle => 'Pantry\'nizi tarayın';
  @override
  String get onboardingScanBody =>
      'Tarama sekmesini açın, kamera veya Galeri\'yi seçin, AI çalışmadan önce onaylayın. İlk deneme için Hızlı modu kullanın.';
  @override
  String get onboardingReceiptTitle => 'Fiş → tazelik envanteri';
  @override
  String get onboardingReceiptBody =>
      'Fiş sekmesine geçin, alışveriş fişini tarayın, kaydetmeden önce ürünleri kontrol edin. Çevrimdışı fişler kuyruğa alınır.';
  @override
  String get onboardingShoppingTitle => 'Alışveriş listesi';
  @override
  String get onboardingShoppingBody =>
      'Alışveriş sekmesinden eksik ürünleri ekleyin. Tazelik ile birlikte önce tüketilecekleri görün.';
  @override
  String get onboardingRecipesTitle => 'Saniyeler içinde AI tarifler';
  @override
  String get onboardingRecipesBody =>
      'Buzdolabı veya tazelik taraması üç tarif üretir — Hızlı, Kurtarma veya Şef modu.';
  @override
  String get onboardingFavoritesTitle => 'Favoriler ve son taramalar';
  @override
  String get onboardingFavoritesBody =>
      'Beğendiğiniz tarifleri kaydedin. Son taramalar ana ekranda hızlıca açılır.';
  @override
  String get onboardingCloudTitle => 'Bulut geçmişi';
  @override
  String get onboardingCloudBody =>
      'Giriş yaparak tarama geçmişinizi hesabınızda saklayın ve istediğiniz zaman dönün.';
  @override
  String get onboardingPermissionsTitle => 'Kamera ve bildirimler';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef buzdolabı, fiş ve barkod taramak için kameraya ihtiyaç duyar. '
      'İsteğe bağlı bildirimler, yiyecekler son kullanma tarihine yaklaştığında hatırlatır.';
  @override
  String get emptyStateScanReceipt => 'Fiş tara';
  @override
  String get emptyStateStartScan => 'Taramaya başla';
  @override
  String get manageSubscriptions => 'Aboneliği yönet';
  @override
  String get notificationCriticalChannelName => 'Tazelik uyarıları';
  @override
  String get notificationCriticalChannelDesc => 'Yakında sona erecek ürünler';
  @override
  String get notificationDailyChannelName => 'Günlük özet';
  @override
  String get notificationDailyChannelDesc =>
      'Tazelik paneli günlük hatırlatma';
  @override
  String get notificationCriticalTitle => 'Yakında bitecek ürünler';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Tazelik Paneli\'ne bakın.';
  @override
  String get notificationDailyTitle => 'Tazelik kontrolü';
  @override
  String get notificationDailyBody =>
      'Bugün tüketmeniz gereken ürünleri kontrol edin.';
  @override
  String get widgetFreshnessGood => 'Tazelik iyi';
  @override
  String widgetFreshnessCritical(int count) => '$count ürün bugün bitebilir';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical kritik · $warning uyarı';
  @override
  String get categoryDairy => 'Süt ürünleri';
  @override
  String get categoryMeat => 'Et / balık';
  @override
  String get categoryFruit => 'Meyve';
  @override
  String get categoryVegetable => 'Sebze';
  @override
  String get categoryBeverage => 'İçecek';
  @override
  String get categoryBakery => 'Fırın';
  @override
  String get categoryPantry => 'Kiler';
  @override
  String calendarMonthName(int month) => const [
        'Ocak',
        'Şubat',
        'Mart',
        'Nisan',
        'Mayıs',
        'Haziran',
        'Temmuz',
        'Ağustos',
        'Eylül',
        'Ekim',
        'Kasım',
        'Aralık',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Tarifler';
  @override
  String get recipesPlaceholderBody =>
      'Başarılı bir taramadan sonra tarif sonuçları burada görünür.';
  @override
  String get recipeSamplePlating => 'Örnek sunum';
  @override
  String get recipeShareInstructionsHeader => 'Yapılış:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'SKT';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Renk paleti ve arka plan';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Varsayılan koyu yeşil';
  @override
  String get themeOceanLabel => 'Okyanus';
  @override
  String get themeOceanSubtitle => 'Soğuk mavi tonlar';
  @override
  String get themeEmberLabel => 'Amber';
  @override
  String get themeEmberSubtitle => 'Sıcak turuncu vurgular';
  @override
  String get themeLavenderLabel => 'Lavanta';
  @override
  String get themeLavenderSubtitle => 'Mor aksanlı koyu';
  @override
  String get themeDaylightLabel => 'Gündüz';
  @override
  String get themeDaylightSubtitle => 'Açık arka plan';
  @override
  String get themeCreamLabel => 'Krem';
  @override
  String get themeCreamSubtitle => 'Sıcak krem tonları, turuncu vurgu';
}
