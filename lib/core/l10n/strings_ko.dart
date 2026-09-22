import 'strings_base.dart';

class StringsKo implements StringsBase {
  const StringsKo();

  @override
  String get analysisTitle => '식료품 저장실 분석 중';
  @override
  String get stepPrepareImage => '사진 준비 중…';
  @override
  String get stepAnalyzeAi => '성분 감지…';
  @override
  String get stepBuildRecipes => '레시피 작성 중…';
  @override
  String get receiptAnalysisTitle => '독서 영수증';
  @override
  String get stepReceiptPrepare => '영수증 이미지 준비 중…';
  @override
  String get stepReceiptOcr => '항목 인식 중…';
  @override
  String get stepReceiptInfer => '유통기한 추정 중…';
  @override
  String get receiptNotRecognized =>
      '영수증을 읽을 수 없습니다. 더 선명하고 평면적인 사진을 찍어보세요.';
  @override
  String get receiptNotDetected =>
      '영수증이 감지되지 않았습니다. 영수증을 프레임에 맞추세요.';
  @override
  String get receiptConfirmTitle => '영수증 항목 확인';
  @override
  String get receiptConfirmSubtitle =>
      '추가할 항목을 선택하세요. 편집하려면 길게 누르세요.';
  @override
  String get receiptConfirmSave => '식료품 저장실에 추가';
  @override
  String get receiptSelectOne => '항목을 하나 이상 선택하세요.';
  @override
  String get receiptSaved => '신선도 재고에 추가된 품목';
  @override
  String get scanConfirmSubtitleReceipt =>
      '이 영수증 사진을 보내시겠습니까? 확인 후 OCR 분석이 시작됩니다.';
  @override
  String get navFreshness => '선도';
  @override
  String get freshnessPanelTitle => '신선도 패널';
  @override
  String get freshnessCritical => '심각(0~2일)';
  @override
  String get freshnessWarning => '경고(3~5일)';
  @override
  String get freshnessSafe => '안전함(6일 이상)';
  @override
  String get freshnessEmpty =>
      '아직 추적된 항목이 없습니다. 영수증을 스캔하여 재고를 구축하세요.';
  @override
  String get freshnessListTitle => '신선도 재고';
  @override
  String get freshnessListEmpty => '이 필터에는 항목이 없습니다.';
  @override
  String get freshnessSuggestRecipes => '이걸로 레시피를 추천해주세요';
  @override
  String get savingsPanelTitle => '저축 패널';
  @override
  String get savingsPanelEmptyHint =>
      '여기에서 방지된 폐기물을 추적하려면 유통기한이 임박한 품목을 "만든 식사"로 표시하세요.';
  @override
  String get savingsStatItems => '구출됨';
  @override
  String get savingsStatWaste => '폐기물 방지';
  @override
  String get savingsStatMoney => '예상 저금';
  @override
  String get savingsDashboardTitle => '저축 분석';
  @override
  String get savingsDashboardSubtitle =>
      '이번 달에 쓰레기통에서 절약한 음식 요약입니다.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '이번 달 폐기물에서 절약된 성분 1개'
          : '$count 이번달 쓰레기로 절약한 재료들';
  @override
  String savingsKgPrevented(String kg) => '음식물 쓰레기 방지:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      '예상 금전적 이득:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => '지난 4주';
  @override
  String get savingsRecentTitle => '최근 구조';
  @override
  String get savingsEmptySubtitle =>
      '아직 기록이 없습니다. 중요 또는 경고 항목을 사용하면 여기에 표시됩니다.';
  @override
  String get savingsHowItWorks =>
      '만료일로부터 5일 이내에 사용된 품목은 구출된 것으로 간주됩니다. 무게와 가치는 카테고리 평균을 기준으로 추정됩니다.';
  @override
  String get pantryNamesLocaleNote =>
      '제품 및 매장 이름은 영수증에 저장된 대로 표시됩니다. 일반적인 용어는 영어로 표시됩니다.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? '마지막 날에 사용함' : '함께 사용$days 일 남음';
  @override
  String get savingsMealMade => '식사가 만들어졌습니다.';
  @override
  String savingsMealMadeConfirm(String name) => '표시$name 소비된 만큼?';
  @override
  String savingsRescuedSnack(String money) => '절감액 기록 ·$money';
  @override
  String get freshnessRecipeTitle => '레시피 준비 중';
  @override
  String get freshnessNoIngredientsForRecipes =>
      '레시피에는 하나 이상의 항목이 필요합니다.';
  @override
  String get freshnessCriticalBanner => '곧 만료됨';
  @override
  String get freshnessViewAll => '모두 보기';
  @override
  String get receiptCaptureHints =>
      '영수증을 평평하게 유지하고 조명이 좋습니다. 수직 프레임에 모든 선이 표시됩니다.';
  @override
  String get receiptPurchaseDate => '구매일';
  @override
  String get receiptTapToEdit => '편집하다';
  @override
  String get receiptEditItem => '항목 수정';
  @override
  String get receiptEditSave => '구하다';
  @override
  String get receiptExpiryDaysLabel => '예상 유통기한(일)';
  @override
  String get receiptMergedSnack => '일부 항목이 기존 기록과 병합되었습니다.';
  @override
  String get receiptCloudSyncFailed => '클라우드에 저장할 수 없습니다.';
  @override
  String get receiptCloudSynced => '클라우드에 동기화된 항목';
  @override
  String get pantrySyncAction => '최신 데이터 동기화';
  @override
  String get pantrySyncDone => '신선도 데이터가 업데이트되었습니다.';
  @override
  String get pantrySyncFailed => '동기화 실패';
  @override
  String get freshnessNotificationsTitle => '신선도 알림';
  @override
  String get freshnessNotificationsSubtitle =>
      '중요 항목 및 일일 알림';
  @override
  String get freshnessNotificationTimeLabel => '일일 알림 시간';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      '매일$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      '이번 주:$critical 비판적인,$warning 경고 항목. 이것을 먼저 사용하십시오.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      '네트워크 오류입니다. 연결을 확인하고 다시 시도하세요.';
  @override
  String get geminiQuotaExceeded =>
      'AI 할당량을 초과했습니다. 몇 분 정도 기다렸다가 다시 시도해 보세요.';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studio 선불 크레딧이 소진되었습니다. AI 기능을 복원하려면 ai.google.dev에서 결제를 추가하세요.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      '자동 재시도는 다음에서 사용할 수 있습니다.$minutes 분.';
  @override
  String get aiTranslationDailyLimitReached =>
      '일일 AI 번역 한도(3/3)에 도달했습니다. 레시피는 내일까지 기본번역을 사용합니다.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      '당신은$remaining AI 번역이 오늘 남았습니다.';
  @override
  String get aiPantryScanDailyLimitReached =>
      '일일 식료품 저장실 검색 한도(3)에 도달했습니다. 내일 다시 시도해 주세요.';
  @override
  String get aiReceiptDailyLimitReached =>
      '일일 영수증 스캔 한도(2)에 도달했습니다. 내일 다시 시도해 주세요.';
  @override
  String get aiRecipeDailyLimitReached =>
      '일일 레시피 생성 한도(3)에 도달했습니다. 내일 다시 시도해 주세요.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      '기다리세요$seconds 초 후에 다시 시도하세요.';
  @override
  String get adRewardTitlePantry => '식료품 저장실 스캔 한도에 도달했습니다.';
  @override
  String get adRewardTitleReceipt => '영수증 스캔 한도에 도달했습니다.';
  @override
  String get adRewardTitleRecipe => '레시피 생성 한도에 도달했습니다.';
  @override
  String get adRewardSubtitle =>
      '오늘 짧은 광고를 시청하시면 +1 추가 사용권을 얻으실 수 있습니다(하루 최대 3회).';
  @override
  String get adRewardWatchButton => '광고 시청(+1 사용)';
  @override
  String get adRewardGranted => '추가 사용이 허용됩니다. 다시 시도해 보세요.';
  @override
  String get adRewardNotCompleted =>
      '광고가 완료되지 않았습니다. 추가 사용은 허용되지 않았습니다.';
  @override
  String get adRewardDailyCapReached =>
      '오늘의 광고 보상 한도에 도달했습니다.';
  @override
  String get geminiTimeout =>
      '요청 시간이 초과되었습니다. 연결을 확인하고 다시 시도하세요.';
  @override
  String get geminiServerError =>
      'AI 서비스를 일시적으로 사용할 수 없습니다. 나중에 다시 시도해 주세요.';
  @override
  String get imageNotRecognized =>
      '이미지가 인식되지 않습니다. 조명을 개선하거나 다른 각도를 시도해 보세요.';
  @override
  String get imageNotPantry =>
      '냉장고나 식료품 저장실이 보이지 않습니다. 직접 촬영해주세요.';
  @override
  String get parseError =>
      'AI 응답을 구문 분석할 수 없습니다. 다시 스캔해 주세요.';
  @override
  String get modelUnavailable =>
      'AI 모델을 사용할 수 없습니다. API 액세스를 확인하세요.';
  @override
  String get genericError => '문제가 발생했습니다. 다시 시도해 주세요.';
  @override
  String get imageDecodeError => '사진을 읽을 수 없습니다. 다른 이미지를 시도해 보세요.';
  @override
  String get authSubtitle => '스마트 식료품 저장실 액세스';
  @override
  String get authInitializing => '세션 준비 중…';
  @override
  String get emailLabel => '이메일';
  @override
  String get passwordLabel => '비밀번호';
  @override
  String get emailRequired => '이메일 필요';
  @override
  String get emailInvalid => '잘못된 이메일';
  @override
  String get passwordMin => '6자 이상';
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
  String get signIn => '로그인';
  @override
  String get signUp => '계정 만들기';
  @override
  String get toggleToSignIn => '이미 계정이 있나요? 로그인';
  @override
  String get toggleToSignUp => '여기에 새로 왔나요? 계정 만들기';
  @override
  String get guestContinue => '게스트로 계속';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      '계정이 생성되었습니다. 받은 편지함에서 확인 링크를 엽니다. 확인되면 앱에서 알려드립니다.';
  @override
  String get emailConfirmedSuccess =>
      '귀하의 이메일이 확인되었습니다. 귀하의 계정이 준비되었습니다.';
  @override
  String get emailVerifiedLabel => '이메일이 확인되었습니다.';
  @override
  String get proEmailRequiredTitle => 'Pro에는 이메일 계정이 필요합니다';
  @override
  String get proEmailRequiredBody =>
      '게스트 계정은 Pro를 구매할 수 없습니다. 데이터를 유지하고 청구를 잠금 해제하려면 이메일 계정을 만드세요.';
  @override
  String get proLinkAccountAction => '계정을 만들고 계속하세요';
  @override
  String get proAccountLinked =>
      '계정이 연결되었습니다. 이제 Pro 결제를 계속할 수 있습니다.';
  @override
  String get supabaseNotConfigured =>
      '계정 서비스를 이용할 수 없습니다. 나중에 다시 시도해 주세요.';
  @override
  String get privacyTitle => '데이터 및 개인정보 보호';
  @override
  String get privacySubtitle => '사진 및 계정 데이터';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      '영수증 이미지는 서버에 저장되지 않습니다. 제품 목록만 추출됩니다.\\n\\n'
      '로그인하면 스캔 및 최신 데이터가 귀하의 계정에 저장될 수 있습니다.'
      '무료 요금제에는 Google AdMob 광고가 표시됩니다. Pro에는 광고가 없습니다.\\n\\n'
      '전문을 보려면 온라인 개인정보 보호정책을 열어보세요.';
  @override
  String get privacyViewOnline => '개인 정보 보호 정책 열기';
  @override
  String get pantryHistoryTitle => '식료품 저장실의 역사';
  @override
  String get pantryHistoryEmpty =>
      '아직 저장된 스캔이 없습니다.\\n냉장고를 스캔하여 기록을 만드세요.';
  @override
  String get pantryHistorySubtitle => '클라우드 저장 스캔';
  @override
  String get splashTagline => '농산물 및 식료품 저장실 — 하나의 앱';
  @override
  String get splashLoading => '로드 중…';
  @override
  String get onboardingSkip => '건너뛰다';
  @override
  String get onboardingNext => '다음';
  @override
  String get onboardingStart => '시작';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => '최근 스캔';
  @override
  String get cameraTapToOpen => '아이콘을 탭하여 카메라를 엽니다.';
  @override
  String get cameraOrGalleryHint => '카메라를 열거나 갤러리에서 선택';
  @override
  String get captureOrGalleryHint => '갤러리에서 캡처 또는 선택';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => '카메라 닫기';
  @override
  String get noIngredients => '성분이 검출되지 않았습니다.';
  @override
  String get recipeInstructions => '지침';
  @override
  String get untitledRecipe => '제목 없는 레시피';
  @override
  String get genericLoadError => '문제가 발생했습니다. 다시 시도해 주세요.';
  @override
  String get scanConfirmTitle => '사진 확인';
  @override
  String get scanConfirmSubtitle =>
      '이 사진을 보내시겠습니까? 레시피 분석은 확인 후 시작됩니다.';
  @override
  String get scanConfirmAnalyze => '분석하다';
  @override
  String get scanConfirmCancel => '취소';
  @override
  String get scanConfirmRetake => '다시 잡다';
  @override
  String get scanConfirmPickOther => '다른 것을 선택하세요';
  @override
  String get clearRecentScans => '최근 스캔 지우기';
  @override
  String get clearRecentScansSubtitle => '기기에서 로컬 기록을 삭제합니다.';
  @override
  String get clearRecentScansConfirmTitle => '최근 스캔을 삭제하시겠습니까?';
  @override
  String get clearRecentScansConfirmBody =>
      '취소할 수 없습니다. 즐겨찾기는 영향을 받지 않습니다.';
  @override
  String get clearRecentScansDone => '최근 스캔이 삭제되었습니다.';
  @override
  String get deleteAction => '삭제';
  @override
  String get imageQualityTitle => '낮은 사진 품질';
  @override
  String get imageQualityDark => '이미지가 너무 어둡습니다. 조명을 추가하고 다시 시도하세요.';
  @override
  String get imageQualityBlurry =>
      '이미지가 흐릿할 수 있습니다. 안정을 취하고 다시 촬영하세요.';
  @override
  String get imageQualityContinue => '무시하고 계속';
  @override
  String get imageQualityRetake => '다시 잡다';
  @override
  String receiptQueueTitle(int count) => '$count 오프라인 대기 중인 영수증';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      '영수증 ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => '프로세스';
  @override
  String get receiptQueuedOffline =>
      '오프라인. 영수증이 대기 중입니다. 연결되면 처리됩니다.';
  @override
  String get receiptLowConfidenceBlock =>
      '저장하기 전에 신뢰도가 낮은 항목을 편집하세요(연필 아이콘).';
  @override
  String get unifiedPantryTitle => '통합 재고';
  @override
  String get unifiedPantryEmpty => '아직 항목이나 스캔이 없습니다.';
  @override
  String get searchHint => '제품 검색…';
  @override
  String get navShopping => '쇼핑';
  @override
  String get shoppingAddHint => '누락된 항목 추가';
  @override
  String get shoppingEmpty => '쇼핑 목록이 비어 있습니다.';
  @override
  String get shoppingClearDone => '클리어 완료';
  @override
  String get shoppingDoneSection => '완료';
  @override
  String get shoppingAddFromRecipe => '영수증 재고에 없는 품목 추가';
  @override
  String get freshnessViewCalendar => '달력';
  @override
  String get freshnessViewList => '목록';
  @override
  String get cookToday => '오늘은 뭘 요리할까?';
  @override
  String get cookTodayNoUrgent =>
      '급한 물건은 없습니다. 영수증을 스캔하여 신선도를 추적하세요.';
  @override
  String pantryMismatchHint(List<String> items) =>
      '스캔에는 표시되지만 영수증 인벤토리에는 표시되지 않음: ${items.join(', ')}';
  @override
  String get exportLocalData => '로컬 데이터 내보내기';
  @override
  String get exportLocalDataSubtitle => 'JSON을 클립보드에 복사합니다.';
  @override
  String get exportLocalDataDone => '데이터가 클립보드에 복사되었습니다.';
  @override
  String get clearLocalData => '로컬 데이터 삭제';
  @override
  String get clearLocalDataSubtitle =>
      '신선함, 쇼핑, 취향(되돌릴 수 없음)';
  @override
  String get clearLocalDataConfirmTitle => '로컬 데이터를 삭제하시겠습니까?';
  @override
  String get clearLocalDataConfirmBody =>
      '기기에서 신선도 재고 및 쇼핑 목록이 삭제되었습니다.';
  @override
  String get clearLocalDataDone => '로컬 데이터가 삭제되었습니다.';
  @override
  String get settingsTitle => '설정';
  @override
  String get languageTitle => '언어';
  @override
  String get languageSubtitle => '앱 언어 · 27개 언어';
  @override
  String get localePreparingTitle => '언어 업데이트 중';
  @override
  String get localePreparingSubtitle =>
      '레시피를 번역하고 결과를 스캔하는 중…';
  @override
  String get dietTitle => '다이어트 선호도';
  @override
  String get dietSubtitle => '레시피 제안에 적용됨';
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
  String get aiUsageLimitsLoading => '로드 중…';
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
  String get aiUsageLabelPantry => '식료품 저장실';
  @override
  String get aiUsageLabelReceipt => '영수증';
  @override
  String get aiUsageLabelRecipe => '레시피';
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
  String get storeUnavailable => '스토어를 사용할 수 없습니다. 나중에 다시 시도하세요.';
  @override
  String get proProductIdsNotConfigured => 'Pro 제품 ID가 구성되지 않았습니다.';
  @override
  String get noProProductsFound => '구매 가능한 Pro 제품을 찾을 수 없습니다.';
  @override
  String get purchaseFlowFailed => '구매를 시작할 수 없습니다.';
  @override
  String get purchaseCompletedProActivated => '구매가 완료되었습니다. Pro 플랜이 활성화되었습니다.';
  @override
  String get purchaseCompletedVerifyFailed => '구매는 완료되었으나 확인하지 못했습니다. 잠시 후 다시 시도하세요.';
  @override
  String get purchaseFailed => '구매에 실패했습니다.';
  @override
  String get restorePurchases => '구매 복원';
  @override
  String get restorePurchasesStarted => 'Play Store에서 이전 구매를 확인하는 중…';
  @override
  String get nutritionTitle => '영양(추정)';
  @override
  String get nutritionPerServing => '서빙 당';
  @override
  String get nutritionCalories => '칼로리';
  @override
  String get nutritionProtein => '단백질';
  @override
  String get nutritionCarbs => '탄수화물';
  @override
  String get nutritionFat => '지방';
  @override
  String get nutritionEstimateNote =>
      'AI 추정만; 의학적 조언이나 식이요법 조언이 아닙니다.';
  @override
  String get barcodeScanTitle => '바코드 스캔';
  @override
  String get barcodeScanHint =>
      '프레임에 바코드를 맞춥니다. Open Food Facts를 통한 제품 검색.';
  @override
  String get barcodeNotFound =>
      '제품을 찾을 수 없습니다. 대신 영수증이나 냉장고 스캔을 시도해 보세요.';
  @override
  String get barcodeConfirmTitle => '제품 확인';
  @override
  String get barcodeAddToPantry => '신선도 재고에 추가';
  @override
  String get navScan => '주사';
  @override
  String get captureTypeFridge => '냉장고';
  @override
  String get captureTypeReceipt => '영수증';
  @override
  String get captureTypeBarcode => '바코드';
  @override
  String get sectionAccount => '계정';
  @override
  String get sectionPreferences => '환경설정';
  @override
  String get sectionApp => '앱';
  @override
  String get sectionPrivacy => '은둔';
  @override
  String get sessionTitle => '세션';
  @override
  String get guestUser => '게스트 사용자';
  @override
  String get favoritesTitle => '즐겨찾기';
  @override
  String get favoritesSubtitle => '저장한 레시피';
  @override
  String get freshnessInventorySubtitle =>
      '영수증 및 만료 날짜의 제품';
  @override
  String get pantrySyncSubtitle => '클라우드에서 신선도 재고 가져오기';
  @override
  String get showOnboardingAgain => '온보딩 투어 다시 표시';
  @override
  String get signOut => '로그아웃';
  @override
  String get scanSubtitleSmart => '스마트 식료품 저장실 스캔';
  @override
  String get scanSubtitleReceipt => '영수증 스캔 및 신선도 추적';
  @override
  String get tooltipSettings => '설정';
  @override
  String get tooltipToggleGuide => '프레임 가이드 전환';
  @override
  String get tooltipModesAbout => '스캔 모드 정보';
  @override
  String get galleryLabel => '갱도';
  @override
  String get cameraLoading => '카메라 준비 중…';
  @override
  String get cameraUnavailable =>
      '카메라를 사용할 수 없습니다.\\n권한을 확인하고 다시 시도하세요.';
  @override
  String get captureFailed =>
      '캡처에 실패했습니다. 카메라 권한을 확인하고 다시 시도하세요.';
  @override
  String get receiptCaptureAlign =>
      '세로 프레임에 영수증 정렬 및 캡처';
  @override
  String get receiptCameraHint =>
      '카메라를 열거나 갤러리에서 영수증 사진을 선택하세요';
  @override
  String get pickPhotoHint => '버튼을 탭하여 사진을 선택하세요.';
  @override
  String get desktopGalleryHint =>
      '데스크탑 모드 - 갤러리에서 냉장고 사진을 선택하세요.';
  @override
  String get noCameraOnDevice => '이 기기에서 카메라를 찾을 수 없습니다.';
  @override
  String get openCameraButton => '카메라 열기';
  @override
  String get pickPhotoButton => '사진 선택';
  @override
  String get overlayGuideOn => '안내';
  @override
  String get overlayGuideOff => '가이드 오프';
  @override
  String get modeSheetTitle => '스캔 모드';
  @override
  String get modeSheetSubtitle =>
      '캡처하기 전에 선택하십시오. AI 레시피 규칙을 변경합니다.';
  @override
  String get scanModeQuickLabel => '빠른 스캔';
  @override
  String get scanModeQuickSubtitle => '15분 미만의 레시피';
  @override
  String get scanModeQuickDesc =>
      '실용적인 일상 식사. 모든 레시피의 총 길이는 15분 이내입니다. 간단한 기술(팬 한 개, 샐러드, 퀵 프라이).';
  @override
  String get scanModeSurvivalLabel => '구조하다';
  @override
  String get scanModeSurvivalSubtitle => '만료되는 항목을 먼저 사용하세요';
  @override
  String get scanModeSurvivalDesc =>
      '낭비를 줄입니다. 손상될 가능성이 있는 항목을 우선적으로 처리합니다. 선택적 힌트 필드 항목의 우선순위가 높습니다.';
  @override
  String get scanModeChefLabel => '셰프 모드';
  @override
  String get scanModeChefSubtitle => '미식가 & 디테일';
  @override
  String get scanModeChefDesc =>
      '더욱 세련된 레시피. 계층화된 기술, 더 길어진 요리 시간; 하드로 표시된 레시피가 두 개 이상 있습니다.';
  @override
  String get scanModeQuickBestFor =>
      '최소한의 재료와 시간으로 즐기는 주중 식사';
  @override
  String get scanModeQuickExamples =>
      '• 10분 오믈렛\\n• 원팬 파스타\\n• 조리가 필요 없는 랩 또는 그릇';
  @override
  String get scanModeSurvivalBestFor =>
      '만료되기 전에 물품을 사용하고 폐기물 줄이기';
  @override
  String get scanModeSurvivalExamples =>
      '• 깔끔한 야채 수프\\n• 오븐 프리타타\\n• 남은 볶음밥';
  @override
  String get scanModeChefBestFor =>
      '특별 만찬, 손님 또는 기술 학습';
  @override
  String get scanModeChefExamples =>
      '• 팬 소스 단백질\\n• 바삭하고 크리미한 접시\\n• 캐러멜 처리된 야채 가니쉬';
  @override
  String get scanModeIdealForLabel => '다음에 가장 적합';
  @override
  String get scanModeExamplesLabel => '예시 요리';
  @override
  String get survivalHintAddFromPantry => '신선함에서 추가';
  @override
  String get filterAll => '모두';
  @override
  String get filterCritical => '비판적인';
  @override
  String get filterWarning => '경고';
  @override
  String get filterSafe => '안전한';
  @override
  String get recipesScreenTitle => '조리법';
  @override
  String get copyRecipe => '복사';
  @override
  String get shareRecipe => '공유하다';
  @override
  String get recipeCopiedSnack => '레시피가 클립보드에 복사되었습니다.';
  @override
  String get survivalHintTitle => '곧 만료됨';
  @override
  String get survivalHintOptional => '선택 사항 — 예: 우유, 토마토, 요구르트';
  @override
  String get survivalHintPlaceholder => '쉼표로 구분하세요.';
  @override
  String get scanConfirmReceiptLabel => '영수증 스캔';
  @override
  String get scanSavedHistory => '식품 저장실 기록에 저장된 스캔';
  @override
  String get scanSaveFailedPrefix => '스캔을 저장할 수 없습니다.';
  @override
  String get daysUnit => '날';
  @override
  String get okButton => '좋아요';
  @override
  String get recipesDetectedIngredients => '검출된 성분';
  @override
  String recipesAiCount(int count) => 'AI 레시피 ·$count';
  @override
  String get galleryPickMessage => '갤러리에서 사진 선택';
  @override
  String get favoritesEmpty =>
      '아직 즐겨찾는 레시피가 없습니다.\\n레시피 결과에서 하트를 탭하세요.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? '레시피 ${index + 1}' : '레시피';

  @override
  String get timeAgoJustNow => '방금';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}몇 분 전';
  @override
  String timeAgoHours(int hours) => '${hours}시간 전';
  @override
  String timeAgoDays(int days) => '${days}일 전';
  @override
  String get daysExpired => '만료됨';
  @override
  String get daysToday => '오늘';
  @override
  String get daysTomorrow => '내일';
  @override
  String daysCount(int days) => '$days 날';
  @override
  String unifiedDaysRemaining(int days) => '$days 일 남음';
  @override
  String productCount(int count) => '$count 아이템';
  @override
  String get unifiedSourceReceipt => '영수증';
  @override
  String get unifiedSourceScan => '주사';
  @override
  String unifiedLastScan(String date) => '마지막 스캔 ·$date';
  @override
  String get receiptFieldProductName => '제품명';
  @override
  String get receiptFieldQuantity => '수량';
  @override
  String get receiptFieldCategory => '범주';
  @override
  String expiryApprox(int days) => '이전에 최고 ~$days 날';
  @override
  String barcodeEan(String code) => '이안$code';
  @override
  String get shoppingListAddedSnack =>
      '쇼핑 목록에 누락된 재료가 추가되었습니다.';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients 재료 ·$recipes 조리법';
  @override
  String get favoriteAddTooltip => '즐겨찾기에 추가';
  @override
  String get favoriteRemoveTooltip => '즐겨찾기에서 제거';
  @override
  String get favoriteAddedSnack => '즐겨찾기에 추가됨';
  @override
  String get favoriteRemovedSnack => '즐겨찾기에서 삭제됨';
  @override
  String get onboardingScanTitle => '식료품 저장실을 스캔하세요';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => '쇼핑 목록';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => '즐겨찾기 및 최근 스캔';
  @override
  String get onboardingFavoritesBody =>
      '마음에 드는 레시피를 저장해 보세요. 최근 스캔은 홈 화면에서 빠르게 열립니다.';
  @override
  String get onboardingCloudTitle => '클라우드 기록';
  @override
  String get onboardingCloudBody =>
      '스캔 기록을 계정에 저장하고 언제든지 다시 방문하려면 로그인하세요.';
  @override
  String get onboardingPermissionsTitle => '카메라 및 알림';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef는 냉장고, 영수증, 바코드 스캔에 카메라가 필요합니다. 선택적 알림으로 유통기한이 임박한 식품을 알려줍니다.';
  @override
  String get emptyStateScanReceipt => '영수증 스캔';
  @override
  String get emptyStateStartScan => '스캔 시작';
  @override
  String get manageSubscriptions => '구독 관리';
  @override
  String get notificationCriticalChannelName => '신선도 알림';
  @override
  String get notificationCriticalChannelDesc => '곧 만료되는 항목';
  @override
  String get notificationDailyChannelName => '일일 요약';
  @override
  String get notificationDailyChannelDesc => '매일 신선도 알림';
  @override
  String get notificationCriticalTitle => '곧 만료되는 항목';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — 신선도 패널을 확인하세요.';
  @override
  String get notificationDailyTitle => '신선도 확인';
  @override
  String get notificationDailyBody =>
      '오늘 사용해야 할 항목을 검토하세요.';
  @override
  String get widgetFreshnessGood => '신선도가 좋아보이네요';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count 상품이 오늘 만료될 수 있습니다.';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical 비판적인 ·$warning 경고';
  @override
  String get categoryDairy => '낙농';
  @override
  String get categoryMeat => '고기 / 생선';
  @override
  String get categoryFruit => '과일';
  @override
  String get categoryVegetable => '채소';
  @override
  String get categoryBeverage => '음료';
  @override
  String get categoryBakery => '빵집';
  @override
  String get categoryPantry => '식료품 저장실';
  @override
  String calendarMonthName(int month) => const [
        '1월',
        '2월',
        '3월',
        '4월',
        '5월',
        '6월',
        '칠월',
        '팔월',
        '구월',
        '십월',
        '십일월',
        '12월',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => '조리법';
  @override
  String get recipesPlaceholderBody =>
      '스캔이 성공적으로 완료되면 레시피 결과가 여기에 표시됩니다.';
  @override
  String get recipeSamplePlating => '샘플 도금';
  @override
  String get recipeShareInstructionsHeader => '지침:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => '특급.';
  @override
  String get themeTitle => '주제';
  @override
  String get themeSubtitle => '색상 팔레트 및 배경';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => '기본 진한 녹색';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => '시원한 블루 톤';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => '따뜻한 호박색 액센트';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => '보라색 악센트 어두운';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => '밝은 배경';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => '오렌지 포인트가 있는 따뜻한 크림';
}
