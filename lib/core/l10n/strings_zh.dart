import 'strings_base.dart';

class StringsZh implements StringsBase {
  const StringsZh();

  @override
  String get analysisTitle => '分析食品储藏室';
  @override
  String get stepPrepareImage => '正在准备照片...';
  @override
  String get stepAnalyzeAi => '检测成分...';
  @override
  String get stepBuildRecipes => '构建食谱...';
  @override
  String get receiptAnalysisTitle => '阅读回执';
  @override
  String get stepReceiptPrepare => '正在准备收据图像...';
  @override
  String get stepReceiptOcr => '识别物品...';
  @override
  String get stepReceiptInfer => '估计保质期...';
  @override
  String get receiptNotRecognized =>
      '无法读取收据。尝试拍摄更清晰、更平坦的照片。';
  @override
  String get receiptNotDetected =>
      '未检测到收据。将收据与框架对齐。';
  @override
  String get receiptConfirmTitle => '确认收货物品';
  @override
  String get receiptConfirmSubtitle =>
      '选择要添加的项目。长按进行编辑。';
  @override
  String get receiptConfirmSave => '添加到食品储藏室';
  @override
  String get receiptSelectOne => '至少选择一项。';
  @override
  String get receiptSaved => '添加到新鲜度库存的商品';
  @override
  String get scanConfirmSubtitleReceipt =>
      '发送此收据照片吗？确认后开始 OCR 分析。';
  @override
  String get navFreshness => '新鲜';
  @override
  String get freshnessPanelTitle => '新鲜度面板';
  @override
  String get freshnessCritical => '关键（0-2 天）';
  @override
  String get freshnessWarning => '警告（3-5 天）';
  @override
  String get freshnessSafe => '安全（6 天以上）';
  @override
  String get freshnessEmpty =>
      '还没有跟踪的项目。扫描收据以建立库存。';
  @override
  String get freshnessListTitle => '新鲜度库存';
  @override
  String get freshnessListEmpty => '此过滤器中没有项目。';
  @override
  String get freshnessSuggestRecipes => '推荐这些菜谱';
  @override
  String get savingsPanelTitle => '储蓄面板';
  @override
  String get savingsPanelEmptyHint =>
      '将即将过期的物品标记为“餐食制作”，以跟踪此处防止的浪费。';
  @override
  String get savingsStatItems => '获救';
  @override
  String get savingsStatWaste => '防止浪费';
  @override
  String get savingsStatMoney => '预计。储蓄';
  @override
  String get savingsDashboardTitle => '节省分析';
  @override
  String get savingsDashboardSubtitle =>
      '本月您从垃圾箱中保存的食物摘要。';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '本月减少浪费 1 种成分'
          : '$count 本月从废物中节省的成分';
  @override
  String savingsKgPrevented(String kg) => '防止食物浪费：$kg';
  @override
  String savingsFinancialGain(String amount) =>
      '预计财务收益：$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => '过去 4 周';
  @override
  String get savingsRecentTitle => '最近的救援';
  @override
  String get savingsEmptySubtitle =>
      '还没有记录。当您使用严重或警告项目时，它会出现在此处。';
  @override
  String get savingsHowItWorks =>
      '过期5天内使用过的物品算作抢救。权重和价值是根据类别平均值估算的。';
  @override
  String get pantryNamesLocaleNote =>
      '产品和商店名称显示为保存在您的收据上；常用术语以英文显示。';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? '最后一天使用过' : '与使用$days 剩余天数';
  @override
  String get savingsMealMade => '饭菜做的';
  @override
  String savingsMealMadeConfirm(String name) => '标记$name 消耗？';
  @override
  String savingsRescuedSnack(String money) => '节省记录 ·$money';
  @override
  String get freshnessRecipeTitle => '准备食谱';
  @override
  String get freshnessNoIngredientsForRecipes =>
      '食谱至少需要一项。';
  @override
  String get freshnessCriticalBanner => '即将到期';
  @override
  String get freshnessViewAll => '查看全部';
  @override
  String get receiptCaptureHints =>
      '将收据平放，光线良好。所有线条在垂直框架中可见。';
  @override
  String get receiptPurchaseDate => '购买日期';
  @override
  String get receiptTapToEdit => '编辑';
  @override
  String get receiptEditItem => '编辑项目';
  @override
  String get receiptEditSave => '节省';
  @override
  String get receiptExpiryDaysLabel => '预计保质期（天）';
  @override
  String get receiptMergedSnack => '一些项目与现有记录合并';
  @override
  String get receiptCloudSyncFailed => '无法保存到云端';
  @override
  String get receiptCloudSynced => '项目已同步到云端';
  @override
  String get pantrySyncAction => '同步新鲜度数据';
  @override
  String get pantrySyncDone => '新鲜度数据已更新';
  @override
  String get pantrySyncFailed => '同步失败';
  @override
  String get freshnessNotificationsTitle => '新鲜度通知';
  @override
  String get freshnessNotificationsSubtitle =>
      '重要事项及每日提醒';
  @override
  String get freshnessNotificationTimeLabel => '每日提醒时间';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      '每天在$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      '本星期：$critical 批判的，$warning 警告项目。首先使用这些。';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      '网络错误。检查您的连接并重试。';
  @override
  String get geminiQuotaExceeded =>
      '人工智能配额超出。等待几分钟，然后重试。';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studio 预付款积分已耗尽。在 ai.google.dev 上添加计费功能以恢复 AI 功能。';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      '自动重试可能适用于$minutes 分钟。';
  @override
  String get aiTranslationDailyLimitReached =>
      '每日AI翻译上限已达（3/3）。食谱使用基本翻译直到明天。';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      '你有$remaining AI 翻译今天离开。';
  @override
  String get aiPantryScanDailyLimitReached =>
      '每日食品储藏室扫描达到限制 (3)。请明天再试一次。';
  @override
  String get aiReceiptDailyLimitReached =>
      '已达到每日收据扫描限制 (2)。请明天再试一次。';
  @override
  String get aiRecipeDailyLimitReached =>
      '每日配方生成上限达到（3）。请明天再试一次。';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      '请稍等$seconds 再次尝试之前的秒数。';
  @override
  String get adRewardTitlePantry => '已达到食品储藏室扫描限制';
  @override
  String get adRewardTitleReceipt => '已达到收据扫描限制';
  @override
  String get adRewardTitleRecipe => '达到配方生成限制';
  @override
  String get adRewardSubtitle =>
      '今天观看简短广告即可获得 +1 额外使用次数（每天最多 3 次）。';
  @override
  String get adRewardWatchButton => '观看广告（+1 使用）';
  @override
  String get adRewardGranted => '授予额外使用权。再试一次。';
  @override
  String get adRewardNotCompleted =>
      '广告未完成。没有授予额外的使用权。';
  @override
  String get adRewardDailyCapReached =>
      '您已达到今天的广告奖励限额。';
  @override
  String get geminiTimeout =>
      '请求超时。检查您的连接并重试。';
  @override
  String get geminiServerError =>
      'AI服务暂时不可用。请稍后重试。';
  @override
  String get imageNotRecognized =>
      '图像无法识别。改善照明或尝试其他角度。';
  @override
  String get imageNotPantry =>
      '冰箱或食品储藏室不可见。请直接拍照。';
  @override
  String get parseError =>
      '无法解析 AI 响应。请再次扫描。';
  @override
  String get modelUnavailable =>
      'AI模型不可用。检查您的 API 访问权限。';
  @override
  String get genericError => '出了点问题。请再试一次。';
  @override
  String get imageDecodeError => '无法读取照片。尝试另一个图像。';
  @override
  String get authSubtitle => '智能食品储藏室访问';
  @override
  String get authInitializing => '准备会议...';
  @override
  String get emailLabel => '电子邮件';
  @override
  String get passwordLabel => '密码';
  @override
  String get emailRequired => '需要电子邮件';
  @override
  String get emailInvalid => '电子邮件无效';
  @override
  String get passwordMin => '至少 6 个字符';
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
  String get signIn => '登入';
  @override
  String get signUp => '创建账户';
  @override
  String get toggleToSignIn => '已经有帐户？登入';
  @override
  String get toggleToSignUp => '新来的？创建账户';
  @override
  String get guestContinue => '继续以访客身份';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      '帐户已创建。打开收件箱中的确认链接；该应用程序将在验证后通知您。';
  @override
  String get emailConfirmedSuccess =>
      '您的电子邮件已确认。您的帐户已准备就绪。';
  @override
  String get emailVerifiedLabel => '电子邮件已验证';
  @override
  String get proEmailRequiredTitle => '专业版需要电子邮件帐户';
  @override
  String get proEmailRequiredBody =>
      '访客帐户无法购买 Pro。创建一个电子邮件帐户来保存您的数据并解锁账单。';
  @override
  String get proLinkAccountAction => '创建帐户并继续';
  @override
  String get proAccountLinked =>
      '帐户已关联。您现在可以继续 Pro 结账。';
  @override
  String get supabaseNotConfigured =>
      '帐户服务不可用。请稍后重试。';
  @override
  String get privacyTitle => '数据和隐私';
  @override
  String get privacySubtitle => '照片和帐户数据';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      '收据图像不存储在服务器上；仅提取产品列表。\\n\\n'
      '登录后，扫描和新鲜度数据可能会保存到您的帐户中。'
      '免费计划显示 Google AdMob 广告； Pro 没有广告。\\n\\n'
      '打开在线隐私政策查看全文。';
  @override
  String get privacyViewOnline => '开放隐私政策';
  @override
  String get pantryHistoryTitle => '食品储藏室的历史';
  @override
  String get pantryHistoryEmpty =>
      '尚未保存扫描。\\n扫描您的冰箱以建立历史记录。';
  @override
  String get pantryHistorySubtitle => '云保存的扫描';
  @override
  String get splashTagline => '生产和食品储藏室 — 一个应用程序';
  @override
  String get splashLoading => '加载中…';
  @override
  String get onboardingSkip => '跳过';
  @override
  String get onboardingNext => '下一个';
  @override
  String get onboardingStart => '开始';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => '最近的扫描';
  @override
  String get cameraTapToOpen => '点击图标即可打开相机';
  @override
  String get cameraOrGalleryHint => '打开相机或从图库中选择';
  @override
  String get captureOrGalleryHint => '捕获或从图库中挑选';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => '关闭相机';
  @override
  String get noIngredients => '未检测到任何成分。';
  @override
  String get recipeInstructions => '指示';
  @override
  String get untitledRecipe => '无标题食谱';
  @override
  String get genericLoadError => '出了点问题。请再试一次。';
  @override
  String get scanConfirmTitle => '确认照片';
  @override
  String get scanConfirmSubtitle =>
      '发送这张照片？确认后开始配方分析。';
  @override
  String get scanConfirmAnalyze => '分析';
  @override
  String get scanConfirmCancel => '取消';
  @override
  String get scanConfirmRetake => '重拍';
  @override
  String get scanConfirmPickOther => '选择另一个';
  @override
  String get clearRecentScans => '清除最近的扫描';
  @override
  String get clearRecentScansSubtitle => '删除设备上的本地历史记录';
  @override
  String get clearRecentScansConfirmTitle => '清除最近的扫描吗？';
  @override
  String get clearRecentScansConfirmBody =>
      '无法撤消。收藏夹不受影响。';
  @override
  String get clearRecentScansDone => '最近扫描已清除';
  @override
  String get deleteAction => '删除';
  @override
  String get imageQualityTitle => '照片质量低';
  @override
  String get imageQualityDark => '图像太暗。添加灯光并重试。';
  @override
  String get imageQualityBlurry =>
      '图像可能会模糊。保持稳定并重新拍摄。';
  @override
  String get imageQualityContinue => '仍然继续';
  @override
  String get imageQualityRetake => '重拍';
  @override
  String receiptQueueTitle(int count) => '$count 离线等待的收据';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      '收据 ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => '过程';
  @override
  String get receiptQueuedOffline =>
      '离线。收据排队；连接时的过程。';
  @override
  String get receiptLowConfidenceBlock =>
      '保存前编辑低置信度项目（铅笔图标）。';
  @override
  String get unifiedPantryTitle => '统一库存';
  @override
  String get unifiedPantryEmpty => '还没有项目或扫描。';
  @override
  String get searchHint => '搜索产品...';
  @override
  String get navShopping => '购物';
  @override
  String get shoppingAddHint => '添加缺失的项目';
  @override
  String get shoppingEmpty => '您的购物清单是空的。';
  @override
  String get shoppingClearDone => '清除完成';
  @override
  String get shoppingDoneSection => '完毕';
  @override
  String get shoppingAddFromRecipe => '添加不在收货库存中的商品';
  @override
  String get freshnessViewCalendar => '日历';
  @override
  String get freshnessViewList => '列表';
  @override
  String get cookToday => '今天煮什么？';
  @override
  String get cookTodayNoUrgent =>
      '没有紧急物品。扫描收据以追踪新鲜度。';
  @override
  String pantryMismatchHint(List<String> items) =>
      '在扫描中可见，但在收据库存中未见：${items.join(', ')}';
  @override
  String get exportLocalData => '导出本地数据';
  @override
  String get exportLocalDataSubtitle => '将 JSON 复制到剪贴板';
  @override
  String get exportLocalDataDone => '数据复制到剪贴板';
  @override
  String get clearLocalData => '删除本地数据';
  @override
  String get clearLocalDataSubtitle =>
      '新鲜度、购物、偏好（不可逆转）';
  @override
  String get clearLocalDataConfirmTitle => '删除本地数据？';
  @override
  String get clearLocalDataConfirmBody =>
      '新鲜度库存和购物清单已从设备中删除。';
  @override
  String get clearLocalDataDone => '本地数据已清除';
  @override
  String get settingsTitle => '设置';
  @override
  String get languageTitle => '语言';
  @override
  String get languageSubtitle => '应用程序语言 · 27 种语言';
  @override
  String get localePreparingTitle => '更新语言';
  @override
  String get localePreparingSubtitle =>
      '翻译食谱和扫描结果...';
  @override
  String get dietTitle => '饮食偏好';
  @override
  String get dietSubtitle => '应用于食谱建议';
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
  String get aiUsageLimitsLoading => '加载中…';
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
  String get aiUsageLabelPantry => '食品储藏室';
  @override
  String get aiUsageLabelReceipt => '收据';
  @override
  String get aiUsageLabelRecipe => '食谱';
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
  String get storeUnavailable => '商店当前不可用，请稍后再试。';
  @override
  String get proProductIdsNotConfigured => 'Pro 产品 ID 尚未配置。';
  @override
  String get noProProductsFound => '未找到可购买的 Pro 产品。';
  @override
  String get purchaseFlowFailed => '无法开始购买流程。';
  @override
  String get purchaseCompletedProActivated => '购买完成，Pro 计划已激活。';
  @override
  String get purchaseCompletedVerifyFailed => '购买完成，但暂时无法验证，请稍后重试。';
  @override
  String get purchaseFailed => '购买失败。';
  @override
  String get restorePurchases => '恢复购买';
  @override
  String get restorePurchasesStarted => '正在 Play Store 中检查以前的购买…';
  @override
  String get nutritionTitle => '营养（估计）';
  @override
  String get nutritionPerServing => '每份';
  @override
  String get nutritionCalories => '卡路里';
  @override
  String get nutritionProtein => '蛋白质';
  @override
  String get nutritionCarbs => '碳水化合物';
  @override
  String get nutritionFat => '胖的';
  @override
  String get nutritionEstimateNote =>
      '仅人工智能估算；不是医疗或饮食建议。';
  @override
  String get barcodeScanTitle => '扫描条码';
  @override
  String get barcodeScanHint =>
      '对齐框架中的条形码。通过 Open Food Facts 查找产品。';
  @override
  String get barcodeNotFound =>
      '未找到产品。请尝试收据或冰箱扫描。';
  @override
  String get barcodeConfirmTitle => '确认产品';
  @override
  String get barcodeAddToPantry => '添加到新鲜度库存';
  @override
  String get navScan => '扫描';
  @override
  String get captureTypeFridge => '冰箱';
  @override
  String get captureTypeReceipt => '收据';
  @override
  String get captureTypeBarcode => '条码';
  @override
  String get sectionAccount => '帐户';
  @override
  String get sectionPreferences => '偏好设置';
  @override
  String get sectionApp => '应用程序';
  @override
  String get sectionPrivacy => '隐私';
  @override
  String get sessionTitle => '会议';
  @override
  String get guestUser => '访客用户';
  @override
  String get favoritesTitle => '收藏夹';
  @override
  String get favoritesSubtitle => '您保存的食谱';
  @override
  String get freshnessInventorySubtitle =>
      '产品的收据和有效期';
  @override
  String get pantrySyncSubtitle => '从云端提取新鲜度库存';
  @override
  String get showOnboardingAgain => '再次显示入门指南';
  @override
  String get signOut => '登出';
  @override
  String get scanSubtitleSmart => '智能食品柜扫描';
  @override
  String get scanSubtitleReceipt => '收据扫描和新鲜度跟踪';
  @override
  String get tooltipSettings => '设置';
  @override
  String get tooltipToggleGuide => '切换框架指南';
  @override
  String get tooltipModesAbout => '关于扫描模式';
  @override
  String get galleryLabel => '画廊';
  @override
  String get cameraLoading => '准备相机...';
  @override
  String get cameraUnavailable =>
      '相机不可用。\\n检查权限并重试。';
  @override
  String get captureFailed =>
      '捕获失败。检查相机权限并重试。';
  @override
  String get receiptCaptureAlign =>
      '在垂直框架中对齐收据并捕获';
  @override
  String get receiptCameraHint =>
      '打开相机或从图库中选择一张收据照片';
  @override
  String get pickPhotoHint => '点击按钮选择照片';
  @override
  String get desktopGalleryHint =>
      '桌面模式 - 从图库中选择一张冰箱照片。';
  @override
  String get noCameraOnDevice => '在此设备上找不到相机。';
  @override
  String get openCameraButton => '打开相机';
  @override
  String get pickPhotoButton => '选择照片';
  @override
  String get overlayGuideOn => '指南';
  @override
  String get overlayGuideOff => '引导出发';
  @override
  String get modeSheetTitle => '扫描模式';
  @override
  String get modeSheetSubtitle =>
      '捕捉前选择；它改变了人工智能食谱规则。';
  @override
  String get scanModeQuickLabel => '快速扫描';
  @override
  String get scanModeQuickSubtitle => '15 分钟内的食谱';
  @override
  String get scanModeQuickDesc =>
      '实用的日常饮食。所有食谱总计 15 分钟或更短；简单的技术（一锅、沙拉、快炒）。';
  @override
  String get scanModeSurvivalLabel => '救援';
  @override
  String get scanModeSurvivalSubtitle => '首先使用过期的物品';
  @override
  String get scanModeSurvivalDesc =>
      '减少浪费。优先处理看起来接近变质的物品。可选提示字段项目具有优先级。';
  @override
  String get scanModeChefLabel => '厨师模式';
  @override
  String get scanModeChefSubtitle => '美食与细节';
  @override
  String get scanModeChefDesc =>
      '更精致的食谱。分层技术，更长的烹饪时间；至少有两个食谱被标记为“hard”。';
  @override
  String get scanModeQuickBestFor =>
      '周末晚餐用最少的食材和时间';
  @override
  String get scanModeQuickExamples =>
      '• 10 分钟煎蛋卷\\n• 一盘意大利面\\n• 免煮卷饼或碗';
  @override
  String get scanModeSurvivalBestFor =>
      '在物品过期前使用物品并减少浪费';
  @override
  String get scanModeSurvivalExamples =>
      '• 清空蔬菜汤\\n• 烤箱菜肉馅煎蛋饼\\n• 剩菜炒饭';
  @override
  String get scanModeChefBestFor =>
      '特别晚宴、客人或学习技术';
  @override
  String get scanModeChefExamples =>
      '• 平底锅酱蛋白\\n• 脆皮+奶油盘\\n• 焦糖蔬菜装饰';
  @override
  String get scanModeIdealForLabel => '最适合';
  @override
  String get scanModeExamplesLabel => '示例菜肴';
  @override
  String get survivalHintAddFromPantry => '从新鲜度开始添加';
  @override
  String get filterAll => '全部';
  @override
  String get filterCritical => '批判的';
  @override
  String get filterWarning => '警告';
  @override
  String get filterSafe => '安全的';
  @override
  String get recipesScreenTitle => '食谱';
  @override
  String get copyRecipe => '复制';
  @override
  String get shareRecipe => '分享';
  @override
  String get recipeCopiedSnack => '食谱已复制到剪贴板';
  @override
  String get survivalHintTitle => '即将到期';
  @override
  String get survivalHintOptional => '可选 — 例如牛奶、番茄、酸奶';
  @override
  String get survivalHintPlaceholder => '用逗号分隔';
  @override
  String get scanConfirmReceiptLabel => '收据扫描';
  @override
  String get scanSavedHistory => '扫描保存到食品储藏室历史记录';
  @override
  String get scanSaveFailedPrefix => '无法保存扫描';
  @override
  String get daysUnit => '天';
  @override
  String get okButton => '好的';
  @override
  String get recipesDetectedIngredients => '检出成分';
  @override
  String recipesAiCount(int count) => '人工智能食谱·$count';
  @override
  String get galleryPickMessage => '从图库中选择照片';
  @override
  String get favoritesEmpty =>
      '还没有最喜欢的食谱。\\n点击食谱结果上的心形。';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? '食谱 ${index + 1}' : '食谱';

  @override
  String get timeAgoJustNow => '现在';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}米前';
  @override
  String timeAgoHours(int hours) => '${hours}小时前';
  @override
  String timeAgoDays(int days) => '${days}几天前';
  @override
  String get daysExpired => '已到期';
  @override
  String get daysToday => '今天';
  @override
  String get daysTomorrow => '明天';
  @override
  String daysCount(int days) => '$days 天';
  @override
  String unifiedDaysRemaining(int days) => '$days 剩余天数';
  @override
  String productCount(int count) => '$count 项目';
  @override
  String get unifiedSourceReceipt => '收据';
  @override
  String get unifiedSourceScan => '扫描';
  @override
  String unifiedLastScan(String date) => '上次扫描·$date';
  @override
  String get receiptFieldProductName => '产品名称';
  @override
  String get receiptFieldQuantity => '数量';
  @override
  String get receiptFieldCategory => '类别';
  @override
  String expiryApprox(int days) => '之前最好~$days 天';
  @override
  String barcodeEan(String code) => '欧洲商品编码协会$code';
  @override
  String get shoppingListAddedSnack =>
      '购物清单中添加了缺少的成分';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients 原料 ·$recipes 食谱';
  @override
  String get favoriteAddTooltip => '添加到收藏夹';
  @override
  String get favoriteRemoveTooltip => '从收藏夹中删除';
  @override
  String get favoriteAddedSnack => '已添加至收藏夹';
  @override
  String get favoriteRemovedSnack => '已从收藏夹中删除';
  @override
  String get onboardingScanTitle => '扫描你的食品储藏室';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => '购物清单';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => '收藏夹和最近扫描的内容';
  @override
  String get onboardingFavoritesBody =>
      '保存您喜欢的食谱。最近的扫描可从主屏幕快速打开。';
  @override
  String get onboardingCloudTitle => '云历史';
  @override
  String get onboardingCloudBody =>
      '登录以将扫描历史记录保存到您的帐户并随时返回。';
  @override
  String get onboardingPermissionsTitle => '相机和通知';
  @override
  String get onboardingPermissionsBody => 'CyberChef 需要相机权限来扫描冰箱、收据和条形码。可选通知会在食物即将过期时提醒您。';
  @override
  String get emptyStateScanReceipt => '扫描收据';
  @override
  String get emptyStateStartScan => '开始扫描';
  @override
  String get manageSubscriptions => '管理订阅';
  @override
  String get notificationCriticalChannelName => '新鲜度提醒';
  @override
  String get notificationCriticalChannelDesc => '商品即将过期';
  @override
  String get notificationDailyChannelName => '每日总结';
  @override
  String get notificationDailyChannelDesc => '每日新鲜提醒';
  @override
  String get notificationCriticalTitle => '商品即将过期';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — 检查新鲜度面板。';
  @override
  String get notificationDailyTitle => '新鲜度检查';
  @override
  String get notificationDailyBody =>
      '查看您今天应该使用的物品。';
  @override
  String get widgetFreshnessGood => '新鲜度看起来不错';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count 商品今天可能会过期';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical 批判的 ·$warning 警告';
  @override
  String get categoryDairy => '奶制品';
  @override
  String get categoryMeat => '肉/鱼';
  @override
  String get categoryFruit => '水果';
  @override
  String get categoryVegetable => '蔬菜';
  @override
  String get categoryBeverage => '饮料';
  @override
  String get categoryBakery => '面包店';
  @override
  String get categoryPantry => '食品储藏室';
  @override
  String calendarMonthName(int month) => const [
        '一月',
        '二月',
        '行进',
        '四月',
        '可能',
        '六月',
        '七月',
        '八月',
        '九月',
        '十月',
        '十一月',
        '十二月',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => '食谱';
  @override
  String get recipesPlaceholderBody =>
      '成功扫描后，配方结果将显示在此处。';
  @override
  String get recipeSamplePlating => '样品电镀';
  @override
  String get recipeShareInstructionsHeader => '指示：';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => '过期。';
  @override
  String get themeTitle => '主题';
  @override
  String get themeSubtitle => '调色板和背景';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => '默认深绿色';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => '冷蓝色调';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => '温暖的琥珀色点缀';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => '紫色调深色';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => '浅色背景';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => '带有橙色调的温暖奶油色';
}
