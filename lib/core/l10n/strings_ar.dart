import 'strings_base.dart';

class StringsAr implements StringsBase {
  const StringsAr();

  @override
  String get analysisTitle => 'تحليل المخزن';
  @override
  String get stepPrepareImage => 'جارٍ تحضير الصورة…';
  @override
  String get stepAnalyzeAi => 'كشف المكونات…';
  @override
  String get stepBuildRecipes => 'وصفات البناء...';
  @override
  String get receiptAnalysisTitle => 'إيصال القراءة';
  @override
  String get stepReceiptPrepare => 'جارٍ تحضير صورة الإيصال…';
  @override
  String get stepReceiptOcr => 'جارٍ التعرف على العناصر...';
  @override
  String get stepReceiptInfer => 'تقدير مدة الصلاحية…';
  @override
  String get receiptNotRecognized =>
      'لا يمكن قراءة الإيصال. جرب صورة أكثر وضوحًا وتملقًا.';
  @override
  String get receiptNotDetected =>
      'لم يتم اكتشاف أي إيصال. قم بمحاذاة الإيصال في الإطار.';
  @override
  String get receiptConfirmTitle => 'تأكيد استلام العناصر';
  @override
  String get receiptConfirmSubtitle =>
      'حدد العناصر المراد إضافتها. اضغط لفترة طويلة للتحرير.';
  @override
  String get receiptConfirmSave => 'أضف إلى المخزن';
  @override
  String get receiptSelectOne => 'حدد عنصرًا واحدًا على الأقل.';
  @override
  String get receiptSaved => 'العناصر المضافة إلى مخزون الحداثة';
  @override
  String get scanConfirmSubtitleReceipt =>
      'هل تريد إرسال صورة الإيصال هذه؟ يبدأ تحليل التعرف الضوئي على الحروف (OCR) بعد التأكيد.';
  @override
  String get navFreshness => 'نضارة';
  @override
  String get freshnessPanelTitle => 'لوحة نضارة';
  @override
  String get freshnessCritical => 'حرجة (0-2 أيام)';
  @override
  String get freshnessWarning => 'تحذير (3-5 أيام)';
  @override
  String get freshnessSafe => 'آمن (أكثر من 6 أيام)';
  @override
  String get freshnessEmpty =>
      'لا توجد عناصر تتبعها حتى الآن. مسح إيصال لبناء المخزون.';
  @override
  String get freshnessListTitle => 'مخزون النضارة';
  @override
  String get freshnessListEmpty => 'لا توجد عناصر في هذا الفلتر.';
  @override
  String get freshnessSuggestRecipes => 'أقترح وصفات مع هذه';
  @override
  String get savingsPanelTitle => 'لوحة التوفير';
  @override
  String get savingsPanelEmptyHint =>
      'ضع علامة على العناصر التي شارفت على انتهاء الصلاحية على أنها "وجبة مصنوعة" لتتبع النفايات المحظورة هنا.';
  @override
  String get savingsStatItems => 'تم إنقاذه';
  @override
  String get savingsStatWaste => 'منع النفايات';
  @override
  String get savingsStatMoney => 'EST. المدخرات';
  @override
  String get savingsDashboardTitle => 'تحليلات الادخار';
  @override
  String get savingsDashboardSubtitle =>
      'ملخص الطعام الذي حفظته من سلة المهملات – هذا الشهر.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? 'تم إنقاذ مكون واحد من النفايات هذا الشهر'
          : '$count المكونات المحفوظة من النفايات هذا الشهر';
  @override
  String savingsKgPrevented(String kg) => 'منع هدر الطعام:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'المكاسب المالية المقدرة:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'آخر 4 أسابيع';
  @override
  String get savingsRecentTitle => 'عمليات الإنقاذ الأخيرة';
  @override
  String get savingsEmptySubtitle =>
      'لا توجد سجلات حتى الآن. عند استخدام عنصر حرج أو تحذيري، يظهر هنا.';
  @override
  String get savingsHowItWorks =>
      'العناصر المستخدمة خلال 5 أيام من تاريخ انتهاء الصلاحية تعتبر منقذة. يتم تقدير الوزن والقيمة من متوسطات الفئة.';
  @override
  String get pantryNamesLocaleNote =>
      'تظهر أسماء المنتجات والمتاجر كما هي محفوظة في إيصالك؛ وتظهر المصطلحات الشائعة باللغة الإنجليزية.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'تستخدم في اليوم الأخير' : 'تستخدم مع$days الأيام المتبقية';
  @override
  String get savingsMealMade => 'وجبة مصنوعة';
  @override
  String savingsMealMadeConfirm(String name) => 'علامة$name كما استهلكت؟';
  @override
  String savingsRescuedSnack(String money) => 'المدخرات المسجلة ·$money';
  @override
  String get freshnessRecipeTitle => 'تحضير الوصفات';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'مطلوب عنصر واحد على الأقل للوصفات.';
  @override
  String get freshnessCriticalBanner => 'تنتهي قريبا';
  @override
  String get freshnessViewAll => 'عرض الكل';
  @override
  String get receiptCaptureHints =>
      'أمسك الإيصال بشكل مسطح، وإضاءة جيدة. جميع الخطوط مرئية في الإطار العمودي.';
  @override
  String get receiptPurchaseDate => 'تاريخ الشراء';
  @override
  String get receiptTapToEdit => 'يحرر';
  @override
  String get receiptEditItem => 'تحرير العنصر';
  @override
  String get receiptEditSave => 'يحفظ';
  @override
  String get receiptExpiryDaysLabel => 'مدة الصلاحية المقدرة (بالأيام)';
  @override
  String get receiptMergedSnack => 'تم دمج بعض العناصر مع السجلات الموجودة';
  @override
  String get receiptCloudSyncFailed => 'تعذر الحفظ في السحابة';
  @override
  String get receiptCloudSynced => 'العناصر التي تمت مزامنتها مع السحابة';
  @override
  String get pantrySyncAction => 'مزامنة بيانات الحداثة';
  @override
  String get pantrySyncDone => 'تم تحديث بيانات الحداثة';
  @override
  String get pantrySyncFailed => 'فشلت المزامنة';
  @override
  String get freshnessNotificationsTitle => 'إشعارات النضارة';
  @override
  String get freshnessNotificationsSubtitle =>
      'العناصر الهامة والتذكير اليومي';
  @override
  String get freshnessNotificationTimeLabel => 'وقت التذكير اليومي';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'كل يوم عند$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'هذا الاسبوع:$critical شديد الأهمية،$warning عناصر التحذير. استخدم هذه أولا.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'خطأ في الشبكة. تحقق من اتصالك وحاول مرة أخرى.';
  @override
  String get geminiQuotaExceeded =>
      'تم تجاوز حصة الذكاء الاصطناعي. انتظر بضع دقائق وحاول مرة أخرى.';
  @override
  String get geminiBillingDepleted =>
      'تم استنفاد أرصدة الدفع المسبق لـ Google AI Studio. أضف الفوترة على ai.google.dev لاستعادة ميزات الذكاء الاصطناعي.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'قد تكون إعادة المحاولة التلقائية متاحة في$minutes دقيقة.';
  @override
  String get aiTranslationDailyLimitReached =>
      'تم الوصول إلى الحد اليومي لترجمة الذكاء الاصطناعي (3/3). تستخدم الوصفات الترجمة الأساسية حتى الغد.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'لديك$remaining ترجمة (ترجمات) الذكاء الاصطناعي غادرت اليوم.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'تم الوصول إلى الحد الأقصى لفحص المخزن اليومي (3). يرجى المحاولة مرة أخرى غدا.';
  @override
  String get aiReceiptDailyLimitReached =>
      'تم الوصول إلى حد مسح الإيصالات اليومي (2). يرجى المحاولة مرة أخرى غدا.';
  @override
  String get aiRecipeDailyLimitReached =>
      'تم الوصول إلى الحد اليومي لتوليد الوصفة (3). يرجى المحاولة مرة أخرى غدا.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'انتظر من فضلك$seconds ثانية (ثواني) قبل المحاولة مرة أخرى.';
  @override
  String get adRewardTitlePantry => 'تم الوصول إلى حد فحص المخزن';
  @override
  String get adRewardTitleReceipt => 'تم الوصول إلى الحد الأقصى لمسح الإيصالات';
  @override
  String get adRewardTitleRecipe => 'تم الوصول إلى حد إنشاء الوصفة';
  @override
  String get adRewardSubtitle =>
      'شاهد إعلانًا قصيرًا لتكسب استخدامًا إضافيًا +1 اليوم (ما يصل إلى 3 مرات يوميًا).';
  @override
  String get adRewardWatchButton => 'مشاهدة الإعلان (استخدام 1+)';
  @override
  String get adRewardGranted => 'تم منح الاستخدام الإضافي. حاول ثانية.';
  @override
  String get adRewardNotCompleted =>
      'لم يكتمل الإعلان. لم يتم منح أي استخدام إضافي.';
  @override
  String get adRewardDailyCapReached =>
      'لقد وصلت إلى الحد الأقصى لمكافأة الإعلان اليوم.';
  @override
  String get geminiTimeout =>
      'انتهت مهلة الطلب. تحقق من اتصالك وحاول مرة أخرى.';
  @override
  String get geminiServerError =>
      'خدمة الذكاء الاصطناعي غير متاحة مؤقتًا. يرجى المحاولة مرة أخرى لاحقا.';
  @override
  String get imageNotRecognized =>
      'لم يتم التعرف على الصورة. قم بتحسين الإضاءة أو جرب زاوية أخرى.';
  @override
  String get imageNotPantry =>
      'الثلاجة أو حجرة المؤن غير مرئية. يرجى تصوير مباشرة.';
  @override
  String get parseError =>
      'تعذر تحليل استجابة الذكاء الاصطناعي. يرجى المسح مرة أخرى.';
  @override
  String get modelUnavailable =>
      'نموذج الذكاء الاصطناعي غير متاح. تحقق من وصولك إلى واجهة برمجة التطبيقات (API).';
  @override
  String get genericError => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
  @override
  String get imageDecodeError => 'لا يمكن قراءة الصورة. حاول صورة أخرى.';
  @override
  String get authSubtitle => 'الوصول الذكي إلى المخزن';
  @override
  String get authInitializing => 'تحضير الجلسة…';
  @override
  String get emailLabel => 'بريد إلكتروني';
  @override
  String get passwordLabel => 'كلمة المرور';
  @override
  String get emailRequired => 'البريد الإلكتروني مطلوب';
  @override
  String get emailInvalid => 'بريد إلكتروني غير صالح';
  @override
  String get passwordMin => 'ما لا يقل عن 6 أحرف';
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
  String get signIn => 'تسجيل الدخول';
  @override
  String get signUp => 'إنشاء حساب';
  @override
  String get toggleToSignIn => 'هل لديك حساب بالفعل؟ تسجيل الدخول';
  @override
  String get toggleToSignUp => 'جديد هنا؟ إنشاء حساب';
  @override
  String get guestContinue => 'استمر كضيف';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'تم إنشاء الحساب. افتح رابط التأكيد في صندوق الوارد الخاص بك؛ سيقوم التطبيق بإعلامك عند التحقق.';
  @override
  String get emailConfirmedSuccess =>
      'تم تأكيد بريدك الإلكتروني. حسابك جاهز.';
  @override
  String get emailVerifiedLabel => 'تم التحقق من البريد الإلكتروني';
  @override
  String get proEmailRequiredTitle => 'حساب البريد الإلكتروني مطلوب لـ Pro';
  @override
  String get proEmailRequiredBody =>
      'لا يمكن لحسابات الضيوف شراء Pro. قم بإنشاء حساب بريد إلكتروني للاحتفاظ ببياناتك وفتح الفواتير.';
  @override
  String get proLinkAccountAction => 'إنشاء حساب والمتابعة';
  @override
  String get proAccountLinked =>
      'تم ربط الحساب. يمكنك الاستمرار في الخروج الاحترافي الآن.';
  @override
  String get supabaseNotConfigured =>
      'خدمة الحساب غير متوفرة. يرجى المحاولة مرة أخرى لاحقا.';
  @override
  String get privacyTitle => 'البيانات والخصوصية';
  @override
  String get privacySubtitle => 'الصور وبيانات الحساب';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'لا يتم تخزين صور الإيصالات على الخادم؛ يتم استخراج قائمة المنتجات فقط.\\n\\n'
      'عند تسجيل الدخول، قد يتم حفظ بيانات المسح والحداثة في حسابك.'
      'تعرض الخطة المجانية إعلانات Google AdMob؛ لا يحتوي الإصدار الاحترافي على أي إعلانات.\\n\\n'
      'افتح سياسة الخصوصية عبر الإنترنت للحصول على النص الكامل.';
  @override
  String get privacyViewOnline => 'فتح سياسة الخصوصية';
  @override
  String get pantryHistoryTitle => 'تاريخ المخزن';
  @override
  String get pantryHistoryEmpty =>
      'لم يتم حفظ أي عمليات مسح حتى الآن.\\nافحص ثلاجتك لإنشاء السجل.';
  @override
  String get pantryHistorySubtitle => 'عمليات المسح المحفوظة في السحابة';
  @override
  String get splashTagline => 'الإنتاج والمؤن - تطبيق واحد';
  @override
  String get splashLoading => 'تحميل…';
  @override
  String get onboardingSkip => 'يتخطى';
  @override
  String get onboardingNext => 'التالي';
  @override
  String get onboardingStart => 'يبدأ';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'عمليات المسح الأخيرة';
  @override
  String get cameraTapToOpen => 'اضغط على أيقونة لفتح الكاميرا';
  @override
  String get cameraOrGalleryHint => 'افتح الكاميرا أو اختر من المعرض';
  @override
  String get captureOrGalleryHint => 'التقط أو اختر من المعرض';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'إغلاق الكاميرا';
  @override
  String get noIngredients => 'لم يتم الكشف عن أي مكونات.';
  @override
  String get recipeInstructions => 'تعليمات';
  @override
  String get untitledRecipe => 'وصفة بلا عنوان';
  @override
  String get genericLoadError => 'حدث خطأ ما. يرجى المحاولة مرة أخرى.';
  @override
  String get scanConfirmTitle => 'تأكيد الصورة';
  @override
  String get scanConfirmSubtitle =>
      'إرسال هذه الصورة؟ يبدأ تحليل الوصفة بعد التأكيد.';
  @override
  String get scanConfirmAnalyze => 'تحليل';
  @override
  String get scanConfirmCancel => 'يلغي';
  @override
  String get scanConfirmRetake => 'إعادة الالتقاط';
  @override
  String get scanConfirmPickOther => 'اختر آخر';
  @override
  String get clearRecentScans => 'مسح عمليات الفحص الأخيرة';
  @override
  String get clearRecentScansSubtitle => 'يحذف التاريخ المحلي على الجهاز';
  @override
  String get clearRecentScansConfirmTitle => 'هل تريد مسح عمليات الفحص الأخيرة؟';
  @override
  String get clearRecentScansConfirmBody =>
      'لا يمكن التراجع. المفضلة لا تتأثر.';
  @override
  String get clearRecentScansDone => 'تم مسح عمليات الفحص الأخيرة';
  @override
  String get deleteAction => 'يمسح';
  @override
  String get imageQualityTitle => 'جودة الصورة منخفضة';
  @override
  String get imageQualityDark => 'الصورة داكنة جدًا. أضف الضوء وأعد المحاولة.';
  @override
  String get imageQualityBlurry =>
      'قد تكون الصورة ضبابية. حافظ على ثباتك واستعد.';
  @override
  String get imageQualityContinue => 'استمر على أي حال';
  @override
  String get imageQualityRetake => 'إعادة الالتقاط';
  @override
  String receiptQueueTitle(int count) => '$count الإيصال (الإيصالات) في انتظار عدم الاتصال';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'إيصال ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'عملية';
  @override
  String get receiptQueuedOffline =>
      'غير متصل. الإيصال في قائمة الانتظار؛ العملية عند الاتصال.';
  @override
  String get receiptLowConfidenceBlock =>
      'قم بتحرير العناصر منخفضة الثقة قبل حفظها (رمز القلم الرصاص).';
  @override
  String get unifiedPantryTitle => 'المخزون الموحد';
  @override
  String get unifiedPantryEmpty => 'لا توجد عناصر أو عمليات المسح حتى الآن.';
  @override
  String get searchHint => 'بحث عن المنتجات...';
  @override
  String get navShopping => 'التسوق';
  @override
  String get shoppingAddHint => 'أضف العنصر المفقود';
  @override
  String get shoppingEmpty => 'قائمة التسوق الخاصة بك فارغة.';
  @override
  String get shoppingClearDone => 'اكتمل المسح';
  @override
  String get shoppingDoneSection => 'منتهي';
  @override
  String get shoppingAddFromRecipe => 'إضافة العناصر غير الموجودة في مخزون الاستلام';
  @override
  String get freshnessViewCalendar => 'تقويم';
  @override
  String get freshnessViewList => 'قائمة';
  @override
  String get cookToday => 'ماذا تطبخ اليوم؟';
  @override
  String get cookTodayNoUrgent =>
      'لا توجد عناصر عاجلة. قم بمسح الإيصال ضوئيًا لتتبع مدى نضارته.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'تمت رؤيته في الفحص ولكن ليس في مخزون الاستلام: ${items.join(', ')}';
  @override
  String get exportLocalData => 'تصدير البيانات المحلية';
  @override
  String get exportLocalDataSubtitle => 'نسخ JSON إلى الحافظة';
  @override
  String get exportLocalDataDone => 'تم نسخ البيانات إلى الحافظة';
  @override
  String get clearLocalData => 'حذف البيانات المحلية';
  @override
  String get clearLocalDataSubtitle =>
      'النضارة، التسوق، التفضيلات (لا رجعة فيه)';
  @override
  String get clearLocalDataConfirmTitle => 'هل تريد حذف البيانات المحلية؟';
  @override
  String get clearLocalDataConfirmBody =>
      'تمت إزالة مخزون الحداثة وقائمة التسوق من الجهاز.';
  @override
  String get clearLocalDataDone => 'تم مسح البيانات المحلية';
  @override
  String get settingsTitle => 'إعدادات';
  @override
  String get languageTitle => 'لغة';
  @override
  String get languageSubtitle => 'لغة التطبيق · 27 لغة';
  @override
  String get localePreparingTitle => 'تحديث اللغة';
  @override
  String get localePreparingSubtitle =>
      'ترجمة الوصفات ونتائج المسح...';
  @override
  String get dietTitle => 'تفضيل النظام الغذائي';
  @override
  String get dietSubtitle => 'يتم تطبيقه على اقتراحات الوصفات';
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
  String get aiUsageLimitsLoading => 'تحميل…';
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
  String get aiUsageLabelPantry => 'مخزن';
  @override
  String get aiUsageLabelReceipt => 'إيصال';
  @override
  String get aiUsageLabelRecipe => 'وصفة';
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
  String get storeUnavailable => 'المتجر غير متاح حالياً. حاول مرة أخرى لاحقاً.';
  @override
  String get proProductIdsNotConfigured => 'معرّفات منتجات Pro غير مُعدّة.';
  @override
  String get noProProductsFound => 'لم يتم العثور على منتجات Pro قابلة للشراء.';
  @override
  String get purchaseFlowFailed => 'تعذّر بدء عملية الشراء.';
  @override
  String get purchaseCompletedProActivated => 'اكتمل الشراء. تم تفعيل خطة Pro.';
  @override
  String get purchaseCompletedVerifyFailed => 'اكتمل الشراء. تعذّر التحقق؛ حاول مرة أخرى قريباً.';
  @override
  String get purchaseFailed => 'فشل الشراء.';
  @override
  String get restorePurchases => 'استعادة المشتريات';
  @override
  String get restorePurchasesStarted => 'جارٍ التحقق من المشتريات السابقة في Play Store…';
  @override
  String get nutritionTitle => 'التغذية (تقدير)';
  @override
  String get nutritionPerServing => 'لكل وجبة';
  @override
  String get nutritionCalories => 'سعرات حرارية';
  @override
  String get nutritionProtein => 'بروتين';
  @override
  String get nutritionCarbs => 'الكربوهيدرات';
  @override
  String get nutritionFat => 'سمين';
  @override
  String get nutritionEstimateNote =>
      'تقدير الذكاء الاصطناعي فقط؛ ليست نصيحة طبية أو غذائية.';
  @override
  String get barcodeScanTitle => 'مسح الباركود';
  @override
  String get barcodeScanHint =>
      'محاذاة الباركود في الإطار. البحث عن المنتج عبر Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'لم يتم العثور على المنتج. حاول مسح الإيصال أو الثلاجة بدلاً من ذلك.';
  @override
  String get barcodeConfirmTitle => 'تأكيد المنتج';
  @override
  String get barcodeAddToPantry => 'أضف إلى مخزون النضارة';
  @override
  String get navScan => 'مسح';
  @override
  String get captureTypeFridge => 'ثلاجة';
  @override
  String get captureTypeReceipt => 'إيصال';
  @override
  String get captureTypeBarcode => 'الباركود';
  @override
  String get sectionAccount => 'حساب';
  @override
  String get sectionPreferences => 'التفضيلات';
  @override
  String get sectionApp => 'برنامج';
  @override
  String get sectionPrivacy => 'خصوصية';
  @override
  String get sessionTitle => 'حصة';
  @override
  String get guestUser => 'مستخدم ضيف';
  @override
  String get favoritesTitle => 'المفضلة';
  @override
  String get favoritesSubtitle => 'وصفات قمت بحفظها';
  @override
  String get freshnessInventorySubtitle =>
      'المنتجات من الإيصالات وتواريخ انتهاء الصلاحية';
  @override
  String get pantrySyncSubtitle => 'سحب مخزون الحداثة من السحابة';
  @override
  String get showOnboardingAgain => 'عرض جولة الصعود مرة أخرى';
  @override
  String get signOut => 'تسجيل الخروج';
  @override
  String get scanSubtitleSmart => 'مسح المخزن الذكي';
  @override
  String get scanSubtitleReceipt => 'فحص الاستلام وتتبع الحداثة';
  @override
  String get tooltipSettings => 'إعدادات';
  @override
  String get tooltipToggleGuide => 'تبديل دليل الإطار';
  @override
  String get tooltipModesAbout => 'حول أوضاع المسح';
  @override
  String get galleryLabel => 'معرض';
  @override
  String get cameraLoading => 'جارٍ تحضير الكاميرا…';
  @override
  String get cameraUnavailable =>
      'الكاميرا غير متاحة.\\nتحقق من الأذونات وحاول مرة أخرى.';
  @override
  String get captureFailed =>
      'فشل الالتقاط. تحقق من إذن الكاميرا وحاول مرة أخرى.';
  @override
  String get receiptCaptureAlign =>
      'قم بمحاذاة الاستلام في الإطار الرأسي والتقاطه';
  @override
  String get receiptCameraHint =>
      'افتح الكاميرا أو اختر صورة إيصال من المعرض';
  @override
  String get pickPhotoHint => 'اضغط على الزر لاختيار صورة';
  @override
  String get desktopGalleryHint =>
      'وضع سطح المكتب - اختر صورة الثلاجة من المعرض.';
  @override
  String get noCameraOnDevice => 'لم يتم العثور على كاميرا على هذا الجهاز.';
  @override
  String get openCameraButton => 'افتح الكاميرا';
  @override
  String get pickPhotoButton => 'اختر الصورة';
  @override
  String get overlayGuideOn => 'دليل على';
  @override
  String get overlayGuideOff => 'دليل قبالة';
  @override
  String get modeSheetTitle => 'أوضاع المسح';
  @override
  String get modeSheetSubtitle =>
      'اختر قبل الالتقاط؛ فهو يغير قواعد وصفة الذكاء الاصطناعي.';
  @override
  String get scanModeQuickLabel => 'مسح سريع';
  @override
  String get scanModeQuickSubtitle => 'وصفات أقل من 15 دقيقة';
  @override
  String get scanModeQuickDesc =>
      'وجبات يومية عملية. جميع الوصفات مجموعها 15 دقيقة أو أقل؛ تقنيات بسيطة (مقلاة واحدة، سلطة، قلي سريع).';
  @override
  String get scanModeSurvivalLabel => 'ينقذ';
  @override
  String get scanModeSurvivalSubtitle => 'استخدم العناصر منتهية الصلاحية أولاً';
  @override
  String get scanModeSurvivalDesc =>
      'يقلل من النفايات. يعطي الأولوية للعناصر التي تبدو قريبة من التلف. يتم إعطاء الأولوية لعناصر حقل التلميح الاختيارية.';
  @override
  String get scanModeChefLabel => 'وضع الشيف';
  @override
  String get scanModeChefSubtitle => 'الذواقة ومفصلة';
  @override
  String get scanModeChefDesc =>
      'وصفات أكثر دقة. تقنيات متعددة الطبقات، وأوقات طهي أطول؛ وصفتين على الأقل تم وضع علامة صعبة عليهما.';
  @override
  String get scanModeQuickBestFor =>
      'وجبات نهاية الأسبوع مع الحد الأدنى من المكونات والوقت';
  @override
  String get scanModeQuickExamples =>
      '• عجة لمدة 10 دقائق\\n• معكرونة في مقلاة واحدة\\n• غلاف أو وعاء بدون طهي';
  @override
  String get scanModeSurvivalBestFor =>
      'استخدام العناصر قبل انتهاء صلاحيتها وتقليل الهدر';
  @override
  String get scanModeSurvivalExamples =>
      '• حساء الخضار النظيف\\n• فريتاتا الفرن\\n• بقايا الأرز المقلي';
  @override
  String get scanModeChefBestFor =>
      'عشاء خاص، ضيوف، أو تعلم تقنية';
  @override
  String get scanModeChefExamples =>
      '• صلصة البروتين\\n• طبق مقرمش + كريمي\\n• مقبلات بالخضار المكرمل';
  @override
  String get scanModeIdealForLabel => 'الأفضل ل';
  @override
  String get scanModeExamplesLabel => 'أطباق سبيل المثال';
  @override
  String get survivalHintAddFromPantry => 'أضف من النضارة';
  @override
  String get filterAll => 'الجميع';
  @override
  String get filterCritical => 'شديد الأهمية';
  @override
  String get filterWarning => 'تحذير';
  @override
  String get filterSafe => 'آمن';
  @override
  String get recipesScreenTitle => 'وصفات';
  @override
  String get copyRecipe => 'ينسخ';
  @override
  String get shareRecipe => 'يشارك';
  @override
  String get recipeCopiedSnack => 'تم نسخ الوصفة إلى الحافظة';
  @override
  String get survivalHintTitle => 'تنتهي قريبا';
  @override
  String get survivalHintOptional => 'اختياري - على سبيل المثال. الحليب والطماطم واللبن';
  @override
  String get survivalHintPlaceholder => 'افصل بفواصل';
  @override
  String get scanConfirmReceiptLabel => 'مسح الإيصالات';
  @override
  String get scanSavedHistory => 'تم حفظ المسح الضوئي في سجل المخزن';
  @override
  String get scanSaveFailedPrefix => 'تعذر حفظ المسح الضوئي';
  @override
  String get daysUnit => 'أيام';
  @override
  String get okButton => 'نعم';
  @override
  String get recipesDetectedIngredients => 'المكونات المكتشفة';
  @override
  String recipesAiCount(int count) => 'وصفات الذكاء الاصطناعي ·$count';
  @override
  String get galleryPickMessage => 'اختر صورة من المعرض';
  @override
  String get favoritesEmpty =>
      'ليست هناك أي وصفات مفضلة حتى الآن.\\nانقر على القلب الموجود على نتائج الوصفات.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'وصفة ${index + 1}' : 'وصفة';

  @override
  String get timeAgoJustNow => 'الآن';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}م منذ';
  @override
  String timeAgoHours(int hours) => '${hours}ح منذ';
  @override
  String timeAgoDays(int days) => '${days}د منذ';
  @override
  String get daysExpired => 'منتهي الصلاحية';
  @override
  String get daysToday => 'اليوم';
  @override
  String get daysTomorrow => 'غداً';
  @override
  String daysCount(int days) => '$days أيام';
  @override
  String unifiedDaysRemaining(int days) => '$days الأيام المتبقية';
  @override
  String productCount(int count) => '$count أغراض';
  @override
  String get unifiedSourceReceipt => 'إيصال';
  @override
  String get unifiedSourceScan => 'مسح';
  @override
  String unifiedLastScan(String date) => 'المسح الأخير ·$date';
  @override
  String get receiptFieldProductName => 'اسم المنتج';
  @override
  String get receiptFieldQuantity => 'كمية';
  @override
  String get receiptFieldCategory => 'فئة';
  @override
  String expiryApprox(int days) => 'الأفضل قبل ~$days أيام';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'تمت إضافة المكونات المفقودة إلى قائمة التسوق';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients مكونات ·$recipes وصفات';
  @override
  String get favoriteAddTooltip => 'أضف إلى المفضلة';
  @override
  String get favoriteRemoveTooltip => 'إزالة من المفضلة';
  @override
  String get favoriteAddedSnack => 'تمت إضافتها إلى المفضلة';
  @override
  String get favoriteRemovedSnack => 'تمت الإزالة من المفضلة';
  @override
  String get onboardingScanTitle => 'مسح مخزن الخاص بك';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'قائمة التسوق';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'المفضلة وعمليات المسح الأخيرة';
  @override
  String get onboardingFavoritesBody =>
      'حفظ الوصفات التي تريدها. يتم فتح عمليات الفحص الأخيرة بسرعة من الشاشة الرئيسية.';
  @override
  String get onboardingCloudTitle => 'تاريخ السحابة';
  @override
  String get onboardingCloudBody =>
      'قم بتسجيل الدخول لحفظ سجل المسح في حسابك والعودة في أي وقت.';
  @override
  String get onboardingPermissionsTitle => 'الكاميرا والإشعارات';
  @override
  String get onboardingPermissionsBody =>
      'يحتاج CyberChef إلى الكاميرا لمسح الثلاجة والإيصالات والباركود. الإشعارات الاختيارية تذكّرك عند اقتراب انتهاء صلاحية الطعام.';
  @override
  String get emptyStateScanReceipt => 'مسح الإيصال';
  @override
  String get emptyStateStartScan => 'بدء المسح';
  @override
  String get manageSubscriptions => 'إدارة الاشتراك';
  @override
  String get notificationCriticalChannelName => 'تنبيهات النضارة';
  @override
  String get notificationCriticalChannelDesc => 'العناصر التي تنتهي صلاحيتها قريبا';
  @override
  String get notificationDailyChannelName => 'ملخص يومي';
  @override
  String get notificationDailyChannelDesc => 'تذكير بالنضارة اليومية';
  @override
  String get notificationCriticalTitle => 'العناصر التي تنتهي صلاحيتها قريبا';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra - التحقق من لوحة الحداثة.';
  @override
  String get notificationDailyTitle => 'فحص النضارة';
  @override
  String get notificationDailyBody =>
      'قم بمراجعة العناصر التي يجب عليك استخدامها اليوم.';
  @override
  String get widgetFreshnessGood => 'نضارة تبدو جيدة';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count قد تنتهي صلاحية العناصر اليوم';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical شديد الأهمية ·$warning تحذير';
  @override
  String get categoryDairy => 'ألبان';
  @override
  String get categoryMeat => 'اللحوم / الأسماك';
  @override
  String get categoryFruit => 'الفاكهة';
  @override
  String get categoryVegetable => 'نباتي';
  @override
  String get categoryBeverage => 'المشروبات';
  @override
  String get categoryBakery => 'مخبز';
  @override
  String get categoryPantry => 'مخزن';
  @override
  String calendarMonthName(int month) => const [
        'يناير',
        'فبراير',
        'يمشي',
        'أبريل',
        'يمكن',
        'يونيو',
        'يوليو',
        'أغسطس',
        'سبتمبر',
        'أكتوبر',
        'نوفمبر',
        'ديسمبر',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'وصفات';
  @override
  String get recipesPlaceholderBody =>
      'ستظهر نتائج الوصفة هنا بعد إجراء فحص ناجح.';
  @override
  String get recipeSamplePlating => 'طلاء العينة';
  @override
  String get recipeShareInstructionsHeader => 'تعليمات:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'إكسب.';
  @override
  String get themeTitle => 'سمة';
  @override
  String get themeSubtitle => 'لوحة الألوان والخلفية';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'الافتراضي الأخضر الداكن';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'نغمات زرقاء باردة';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'لهجات العنبر الدافئة';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'لهجة الأرجواني الداكن';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'خلفية فاتحة';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'كريم دافئ مع لهجة برتقالية';
}
