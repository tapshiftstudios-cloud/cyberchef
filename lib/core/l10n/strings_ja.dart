import 'strings_base.dart';

class StringsJa implements StringsBase {
  const StringsJa();

  @override
  String get analysisTitle => 'パントリーの分析';
  @override
  String get stepPrepareImage => '写真を準備中…';
  @override
  String get stepAnalyzeAi => '成分を検出中…';
  @override
  String get stepBuildRecipes => 'レシピを構築中…';
  @override
  String get receiptAnalysisTitle => 'レシートを読む';
  @override
  String get stepReceiptPrepare => 'レシート画像を準備しています…';
  @override
  String get stepReceiptOcr => 'アイテムを認識中…';
  @override
  String get stepReceiptInfer => '保存期間を見積もっています…';
  @override
  String get receiptNotRecognized =>
      'レシートを読み取れませんでした。より鮮明で平坦な写真を試してください。';
  @override
  String get receiptNotDetected =>
      'レシートが検出されませんでした。レシートを枠内に合わせます。';
  @override
  String get receiptConfirmTitle => '領収書の確認';
  @override
  String get receiptConfirmSubtitle =>
      '追加する項目を選択します。長押しして編集します。';
  @override
  String get receiptConfirmSave => 'パントリーに追加';
  @override
  String get receiptSelectOne => '少なくとも 1 つの項目を選択してください。';
  @override
  String get receiptSaved => '鮮度在庫にアイテムが追加されました';
  @override
  String get scanConfirmSubtitleReceipt =>
      'この領収書の写真を送信しますか?確認後、OCR解析が開始されます。';
  @override
  String get navFreshness => '鮮度';
  @override
  String get freshnessPanelTitle => '鮮度パネル';
  @override
  String get freshnessCritical => '重大 (0 ～ 2 日)';
  @override
  String get freshnessWarning => '警告 (3 ～ 5 日)';
  @override
  String get freshnessSafe => '安全 (6 日以上)';
  @override
  String get freshnessEmpty =>
      'まだ追跡されたアイテムはありません。レシートをスキャンして在庫を構築します。';
  @override
  String get freshnessListTitle => '鮮度在庫';
  @override
  String get freshnessListEmpty => 'このフィルタには項目がありません。';
  @override
  String get freshnessSuggestRecipes => 'これらを使ったレシピを提案します';
  @override
  String get savingsPanelTitle => '貯蓄パネル';
  @override
  String get savingsPanelEmptyHint =>
      'ここで防止された無駄を追跡するために、期限切れが近い商品に「食事済み」とマークを付けます。';
  @override
  String get savingsStatItems => '救出された';
  @override
  String get savingsStatWaste => '無駄の防止';
  @override
  String get savingsStatMoney => 'EST（東部基準時。貯蓄';
  @override
  String get savingsDashboardTitle => '貯蓄分析';
  @override
  String get savingsDashboardSubtitle =>
      '今月、ゴミ箱から節約した食べ物のまとめ。';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '今月は食材を 1 つ無駄なく節約できました'
          : '$count 今月廃棄物から節約された食材';
  @override
  String savingsKgPrevented(String kg) => '食品廃棄物の防止:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      '推定経済的利益:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => '過去 4 週間';
  @override
  String get savingsRecentTitle => '最近の救助';
  @override
  String get savingsEmptySubtitle =>
      'まだ記録がありません。重要または警告アイテムを使用すると、ここに表示されます。';
  @override
  String get savingsHowItWorks =>
      '有効期限から 5 日以内に使用されたアイテムはレスキューされたものとしてカウントされます。重量と価値はカテゴリの平均から推定されます。';
  @override
  String get pantryNamesLocaleNote =>
      '製品名と店舗名はレシートに保存されたとおりに表示されます。一般的な用語は英語で表示されます。';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? '最終日に利用しました' : 'と一緒に使用$days 残り日数';
  @override
  String get savingsMealMade => '食事ができました';
  @override
  String savingsMealMadeConfirm(String name) => 'マーク$name 消費されたように？';
  @override
  String savingsRescuedSnack(String money) => '貯蓄が記録されました ·$money';
  @override
  String get freshnessRecipeTitle => 'レシピの準備中';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'レシピには少なくとも 1 つのアイテムが必要です。';
  @override
  String get freshnessCriticalBanner => 'もうすぐ期限切れになります';
  @override
  String get freshnessViewAll => 'すべて見る';
  @override
  String get receiptCaptureHints =>
      'レシートを平らに持ち、照明が適切であること。すべての行が垂直フレームに表示されます。';
  @override
  String get receiptPurchaseDate => '購入日';
  @override
  String get receiptTapToEdit => '編集';
  @override
  String get receiptEditItem => '項目を編集する';
  @override
  String get receiptEditSave => '保存';
  @override
  String get receiptExpiryDaysLabel => '推定保存期間 (日)';
  @override
  String get receiptMergedSnack => '一部のアイテムは既存のレコードとマージされました';
  @override
  String get receiptCloudSyncFailed => 'クラウドに保存できませんでした';
  @override
  String get receiptCloudSynced => 'クラウドに同期されたアイテム';
  @override
  String get pantrySyncAction => '鮮度データを同期する';
  @override
  String get pantrySyncDone => '鮮度データを更新しました';
  @override
  String get pantrySyncFailed => '同期に失敗しました';
  @override
  String get freshnessNotificationsTitle => '鮮度通知';
  @override
  String get freshnessNotificationsSubtitle =>
      '重要なアイテムと毎日のリマインダー';
  @override
  String get freshnessNotificationTimeLabel => '毎日のリマインダー時間';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      '毎日、$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      '今週：$critical 致命的、$warning 警告事項。まずはこれらを使用してください。';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'ネットワークエラー。接続を確認して、もう一度試してください。';
  @override
  String get geminiQuotaExceeded =>
      'AI の割り当てを超過しました。数分待ってからもう一度試してください。';
  @override
  String get geminiBillingDepleted =>
      'Google AI Studio の前払いクレジットがなくなりました。 AI 機能を復元するには、ai.google.dev に請求を追加します。';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      '自動再試行は次の場所で利用できる場合があります。$minutes 分。';
  @override
  String get aiTranslationDailyLimitReached =>
      '1 日あたりの AI 翻訳の制限に達しました (3/3)。レシピは明日まで基本翻訳を使用します。';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'あなたが持っている$remaining AI 翻訳は本日終了しました。';
  @override
  String get aiPantryScanDailyLimitReached =>
      '毎日のパントリー スキャンの制限に達しました (3)。明日もう一度試してください。';
  @override
  String get aiReceiptDailyLimitReached =>
      '1 日あたりのレシート スキャン制限に達しました (2)。明日もう一度試してください。';
  @override
  String get aiRecipeDailyLimitReached =>
      '毎日のレシピ生成制限に達しました (3)。明日もう一度試してください。';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'お待ちください$seconds 秒前に再試行してください。';
  @override
  String get adRewardTitlePantry => 'パントリースキャンの制限に達しました';
  @override
  String get adRewardTitleReceipt => '受信スキャンの制限に達しました';
  @override
  String get adRewardTitleRecipe => 'レシピ生成の制限に達しました';
  @override
  String get adRewardSubtitle =>
      '短い広告を視聴すると、今日 +1 回の追加使用を獲得できます (1 日あたり最大 3 回)。';
  @override
  String get adRewardWatchButton => '広告を見る (+1 回使用)';
  @override
  String get adRewardGranted => '追加使用が許可されます。もう一度やり直してください。';
  @override
  String get adRewardNotCompleted =>
      '広告は完了していません。余分な使用は認められませんでした。';
  @override
  String get adRewardDailyCapReached =>
      '今日の広告報酬の上限に達しました。';
  @override
  String get geminiTimeout =>
      'リクエストがタイムアウトしました。接続を確認して、もう一度試してください。';
  @override
  String get geminiServerError =>
      'AIサービスが一時的に利用できなくなりました。後でもう一度試してください。';
  @override
  String get imageNotRecognized =>
      '画像が認識されません。照明を改善するか、別の角度を試してください。';
  @override
  String get imageNotPantry =>
      '冷蔵庫やパントリーは見えません。直接撮影してください。';
  @override
  String get parseError =>
      'AI 応答を解析できませんでした。もう一度スキャンしてください。';
  @override
  String get modelUnavailable =>
      'AI モデルは利用できません。 API アクセスを確認してください。';
  @override
  String get genericError => '何か問題が発生しました。もう一度試してください。';
  @override
  String get imageDecodeError => '写真を読み取れませんでした。別の画像を試してください。';
  @override
  String get authSubtitle => 'スマートパントリーへのアクセス';
  @override
  String get authInitializing => 'セッションを準備しています…';
  @override
  String get emailLabel => '電子メール';
  @override
  String get passwordLabel => 'パスワード';
  @override
  String get emailRequired => 'メールアドレスが必要です';
  @override
  String get emailInvalid => '無効な電子メール';
  @override
  String get passwordMin => '少なくとも6文字';
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
  String get signIn => 'サインイン';
  @override
  String get signUp => 'アカウントを作成する';
  @override
  String get toggleToSignIn => 'すでにアカウントをお持ちですか?サインイン';
  @override
  String get toggleToSignUp => 'ここは新しいですか？アカウントを作成する';
  @override
  String get guestContinue => 'ゲストとして続行';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'アカウントが作成されました。受信箱にある確認リンクを開きます。確認されるとアプリから通知されます。';
  @override
  String get emailConfirmedSuccess =>
      'あなたのメールアドレスが確認されました。アカウントの準備ができました。';
  @override
  String get emailVerifiedLabel => 'メール認証済み';
  @override
  String get proEmailRequiredTitle => 'Proにはメールアカウントが必要です';
  @override
  String get proEmailRequiredBody =>
      'ゲスト アカウントでは Pro を購入できません。データを保存し、請求のロックを解除するには、電子メール アカウントを作成します。';
  @override
  String get proLinkAccountAction => 'アカウントを作成して続行';
  @override
  String get proAccountLinked =>
      'アカウントがリンクされました。今すぐプロのチェックアウトに進むことができます。';
  @override
  String get supabaseNotConfigured =>
      'アカウントサービスが利用できません。後でもう一度試してください。';
  @override
  String get privacyTitle => 'データとプライバシー';
  @override
  String get privacySubtitle => '写真とアカウントデータ';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'レシート画像はサーバーに保存されません。製品リストのみが抽出されます。\\n\\n'
      'サインインすると、スキャンと鮮度データがアカウントに保存される場合があります。'
      '無料プランでは Google AdMob 広告が表示されます。 Pro には広告がありません。\\n\\n'
      'オンライン プライバシー ポリシーを開いて全文をご覧ください。';
  @override
  String get privacyViewOnline => 'プライバシーポリシーを開く';
  @override
  String get pantryHistoryTitle => 'パントリーの歴史';
  @override
  String get pantryHistoryEmpty =>
      '保存されたスキャンはまだありません。\\n冷蔵庫をスキャンして履歴を作成します。';
  @override
  String get pantryHistorySubtitle => 'クラウドに保存されたスキャン';
  @override
  String get splashTagline => '生産と食料庫 — 1 つのアプリ';
  @override
  String get splashLoading => '読み込み中…';
  @override
  String get onboardingSkip => 'スキップ';
  @override
  String get onboardingNext => '次';
  @override
  String get onboardingStart => '始める';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => '最近のスキャン';
  @override
  String get cameraTapToOpen => 'アイコンをタップしてカメラを開きます';
  @override
  String get cameraOrGalleryHint => 'カメラを開くかギャラリーから選択します';
  @override
  String get captureOrGalleryHint => 'キャプチャまたはギャラリーから選択';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'カメラを閉じる';
  @override
  String get noIngredients => '成分は検出されませんでした。';
  @override
  String get recipeInstructions => '説明書';
  @override
  String get untitledRecipe => '無題のレシピ';
  @override
  String get genericLoadError => '何か問題が発生しました。もう一度試してください。';
  @override
  String get scanConfirmTitle => '写真の確認';
  @override
  String get scanConfirmSubtitle =>
      'この写真を送りますか？確認後、レシピ解析が始まります。';
  @override
  String get scanConfirmAnalyze => '分析する';
  @override
  String get scanConfirmCancel => 'キャンセル';
  @override
  String get scanConfirmRetake => 'リテイク';
  @override
  String get scanConfirmPickOther => '別のものを選択してください';
  @override
  String get clearRecentScans => '最近のスキャンをクリアする';
  @override
  String get clearRecentScansSubtitle => 'デバイス上のローカル履歴を削除します';
  @override
  String get clearRecentScansConfirmTitle => '最近のスキャンをクリアしますか?';
  @override
  String get clearRecentScansConfirmBody =>
      '元に戻すことはできません。お気に入りには影響しません。';
  @override
  String get clearRecentScansDone => '最近のスキャンがクリアされました';
  @override
  String get deleteAction => '消去';
  @override
  String get imageQualityTitle => '写真の品質が低い';
  @override
  String get imageQualityDark => '画像が暗すぎます。ライトを追加して再試行してください。';
  @override
  String get imageQualityBlurry =>
      '画像がぼやける場合があります。しっかりと保持してやり直してください。';
  @override
  String get imageQualityContinue => 'とにかく続けてください';
  @override
  String get imageQualityRetake => 'リテイク';
  @override
  String receiptQueueTitle(int count) => '$count オフラインで待機中のレシート';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'レシート ・$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'プロセス';
  @override
  String get receiptQueuedOffline =>
      'オフライン。受信はキューに入れられました。接続時の処理。';
  @override
  String get receiptLowConfidenceBlock =>
      '信頼性の低い項目は保存する前に編集します (鉛筆アイコン)。';
  @override
  String get unifiedPantryTitle => '統合在庫';
  @override
  String get unifiedPantryEmpty => 'まだアイテムもスキャンもありません。';
  @override
  String get searchHint => '製品を検索…';
  @override
  String get navShopping => '買い物';
  @override
  String get shoppingAddHint => '不足している項目を追加する';
  @override
  String get shoppingEmpty => '買い物リストは空です。';
  @override
  String get shoppingClearDone => 'クリア完了';
  @override
  String get shoppingDoneSection => '終わり';
  @override
  String get shoppingAddFromRecipe => '入庫在庫にないアイテムを追加する';
  @override
  String get freshnessViewCalendar => 'カレンダー';
  @override
  String get freshnessViewList => 'リスト';
  @override
  String get cookToday => '今日は何を料理しましょうか？';
  @override
  String get cookTodayNoUrgent =>
      '急ぎの商品はありません。レシートをスキャンして鮮度を追跡します。';
  @override
  String pantryMismatchHint(List<String> items) =>
      'スキャンでは表示されるが、受入在庫では表示されない: ${items.join(', ')}';
  @override
  String get exportLocalData => 'ローカルデータをエクスポートする';
  @override
  String get exportLocalDataSubtitle => 'JSONをクリップボードにコピーします';
  @override
  String get exportLocalDataDone => 'クリップボードにコピーされたデータ';
  @override
  String get clearLocalData => 'ローカルデータを削除する';
  @override
  String get clearLocalDataSubtitle =>
      '新鮮さ、買い物、好み（不可逆的）';
  @override
  String get clearLocalDataConfirmTitle => 'ローカルデータを削除しますか?';
  @override
  String get clearLocalDataConfirmBody =>
      '鮮度在庫と買い物リストがデバイスから削除されました。';
  @override
  String get clearLocalDataDone => 'ローカルデータがクリアされました';
  @override
  String get settingsTitle => '設定';
  @override
  String get languageTitle => '言語';
  @override
  String get languageSubtitle => 'アプリ言語・27言語';
  @override
  String get localePreparingTitle => '言語を更新しています';
  @override
  String get localePreparingSubtitle =>
      'レシピとスキャン結果を翻訳中…';
  @override
  String get dietTitle => '食事の好み';
  @override
  String get dietSubtitle => 'レシピ提案に適用';
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
  String get aiUsageLimitsLoading => '読み込み中…';
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
  String get aiUsageLabelPantry => 'パントリー';
  @override
  String get aiUsageLabelReceipt => 'レシート';
  @override
  String get aiUsageLabelRecipe => 'レシピ';
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
  String get storeUnavailable => 'ストアは現在利用できません。後でもう一度お試しください。';
  @override
  String get proProductIdsNotConfigured => 'Pro商品IDが設定されていません。';
  @override
  String get noProProductsFound => '購入可能なPro商品が見つかりません。';
  @override
  String get purchaseFlowFailed => '購入を開始できませんでした。';
  @override
  String get purchaseCompletedProActivated => '購入が完了しました。Proプランが有効になりました。';
  @override
  String get purchaseCompletedVerifyFailed => '購入は完了しましたが、確認できませんでした。しばらくしてから再試行してください。';
  @override
  String get purchaseFailed => '購入に失敗しました。';
  @override
  String get restorePurchases => '購入を復元';
  @override
  String get restorePurchasesStarted => 'Play Storeで以前の購入を確認しています…';
  @override
  String get nutritionTitle => '栄養成分（推定値）';
  @override
  String get nutritionPerServing => '1回分あたり';
  @override
  String get nutritionCalories => 'カロリー';
  @override
  String get nutritionProtein => 'タンパク質';
  @override
  String get nutritionCarbs => '炭水化物';
  @override
  String get nutritionFat => '脂肪';
  @override
  String get nutritionEstimateNote =>
      'AI 推定のみ。医学的または食事に関するアドバイスではありません。';
  @override
  String get barcodeScanTitle => 'バーコードをスキャンする';
  @override
  String get barcodeScanHint =>
      'バーコードをフレーム内に配置します。 Open Food Facts による製品検索。';
  @override
  String get barcodeNotFound =>
      '製品が見つかりません。代わりに、レシートまたは冷蔵庫のスキャンを試してください。';
  @override
  String get barcodeConfirmTitle => '製品を確認する';
  @override
  String get barcodeAddToPantry => '鮮度在庫に追加';
  @override
  String get navScan => 'スキャン';
  @override
  String get captureTypeFridge => '冷蔵庫';
  @override
  String get captureTypeReceipt => 'レシート';
  @override
  String get captureTypeBarcode => 'バーコード';
  @override
  String get sectionAccount => 'アカウント';
  @override
  String get sectionPreferences => '設定';
  @override
  String get sectionApp => 'アプリ';
  @override
  String get sectionPrivacy => 'プライバシー';
  @override
  String get sessionTitle => 'セッション';
  @override
  String get guestUser => 'ゲストユーザー';
  @override
  String get favoritesTitle => 'お気に入り';
  @override
  String get favoritesSubtitle => '保存したレシピ';
  @override
  String get freshnessInventorySubtitle =>
      'レシートと賞味期限からの商品';
  @override
  String get pantrySyncSubtitle => '鮮度在庫をクラウドから取得する';
  @override
  String get showOnboardingAgain => 'オンボーディング ツアーを再度表示する';
  @override
  String get signOut => 'サインアウト';
  @override
  String get scanSubtitleSmart => 'スマートパントリースキャン';
  @override
  String get scanSubtitleReceipt => 'レシートスキャンと鮮度追跡';
  @override
  String get tooltipSettings => '設定';
  @override
  String get tooltipToggleGuide => 'フレームガイドの切り替え';
  @override
  String get tooltipModesAbout => 'スキャンモードについて';
  @override
  String get galleryLabel => 'ギャラリー';
  @override
  String get cameraLoading => 'カメラを準備中…';
  @override
  String get cameraUnavailable =>
      'カメラが利用できません。\\n権限を確認して、再試行してください。';
  @override
  String get captureFailed =>
      'キャプチャに失敗しました。カメラの許可を確認して再試行してください。';
  @override
  String get receiptCaptureAlign =>
      'レシートを縦枠に合わせて取り込む';
  @override
  String get receiptCameraHint =>
      'カメラを開くか、ギャラリーからレシートの写真を選択します';
  @override
  String get pickPhotoHint => 'ボタンをタップして写真を選択します';
  @override
  String get desktopGalleryHint =>
      'デスクトップ モード — ギャラリーから冷蔵庫の写真を選択します。';
  @override
  String get noCameraOnDevice => 'このデバイスにはカメラが見つかりません。';
  @override
  String get openCameraButton => 'カメラを開く';
  @override
  String get pickPhotoButton => '写真を選ぶ';
  @override
  String get overlayGuideOn => 'のご案内';
  @override
  String get overlayGuideOff => 'ガイドオフ';
  @override
  String get modeSheetTitle => 'スキャンモード';
  @override
  String get modeSheetSubtitle =>
      'キャプチャの前に選択してください。 AI レシピのルールが変わります。';
  @override
  String get scanModeQuickLabel => 'クイックスキャン';
  @override
  String get scanModeQuickSubtitle => '15分以内のレシピ';
  @override
  String get scanModeQuickDesc =>
      '実用的な毎日の食事。すべてのレシピは合計 15 分以内です。簡単なテクニック（ワンパン、サラダ、クイックフライ）。';
  @override
  String get scanModeSurvivalLabel => 'レスキュー';
  @override
  String get scanModeSurvivalSubtitle => '期限切れのアイテムを最初に使用する';
  @override
  String get scanModeSurvivalDesc =>
      '無駄を減らします。ネタバレに近いものを優先します。オプションのヒントフィールドの項目が優先されます。';
  @override
  String get scanModeChefLabel => 'シェフモード';
  @override
  String get scanModeChefSubtitle => 'グルメ＆詳しい情報';
  @override
  String get scanModeChefDesc =>
      'さらに洗練されたレシピ。技術を重ね、調理時間を長くします。少なくとも 2 つのレシピに難しいマークが付いていること。';
  @override
  String get scanModeQuickBestFor =>
      '最小限の材料と時間で作る平日の夜の食事';
  @override
  String get scanModeQuickExamples =>
      '• 10 分のオムレツ\\n• ワンパンパスタ\\n• 調理不要のラップまたはボウル';
  @override
  String get scanModeSurvivalBestFor =>
      '期限内にアイテムを使用し、無駄を削減する';
  @override
  String get scanModeSurvivalExamples =>
      '• きれいな野菜スープ\\n• オーブンのフリッタータ\\n• 残り物のチャーハン';
  @override
  String get scanModeChefBestFor =>
      '特別なディナー、ゲスト、またはテクニックの学習';
  @override
  String get scanModeChefExamples =>
      '• パンソースプロテイン\\n• カリカリかつクリーミーなプレート\\n• キャラメル野菜の付け合わせ';
  @override
  String get scanModeIdealForLabel => 'こんな方に最適';
  @override
  String get scanModeExamplesLabel => '料理例';
  @override
  String get survivalHintAddFromPantry => '鮮度から追加';
  @override
  String get filterAll => '全て';
  @override
  String get filterCritical => '致命的';
  @override
  String get filterWarning => '警告';
  @override
  String get filterSafe => '安全';
  @override
  String get recipesScreenTitle => 'レシピ';
  @override
  String get copyRecipe => 'コピー';
  @override
  String get shareRecipe => '共有';
  @override
  String get recipeCopiedSnack => 'レシピをクリップボードにコピーしました';
  @override
  String get survivalHintTitle => 'もうすぐ期限切れになります';
  @override
  String get survivalHintOptional => 'オプション — 例:牛乳、トマト、ヨーグルト';
  @override
  String get survivalHintPlaceholder => 'カンマで区切る';
  @override
  String get scanConfirmReceiptLabel => 'レシートスキャン';
  @override
  String get scanSavedHistory => 'スキャンがパントリー履歴に保存されました';
  @override
  String get scanSaveFailedPrefix => 'スキャンを保存できませんでした';
  @override
  String get daysUnit => '日';
  @override
  String get okButton => 'わかりました';
  @override
  String get recipesDetectedIngredients => '検出された成分';
  @override
  String recipesAiCount(int count) => 'AIレシピ・$count';
  @override
  String get galleryPickMessage => 'ギャラリーから写真を選択';
  @override
  String get favoritesEmpty =>
      'お気に入りのレシピはまだありません。\\nレシピ結果のハートをタップしてください。';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'レシピ ${index + 1}' : 'レシピ';

  @override
  String get timeAgoJustNow => 'ちょうど今';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}何分前';
  @override
  String timeAgoHours(int hours) => '${hours}時間前';
  @override
  String timeAgoDays(int days) => '${days}一日前';
  @override
  String get daysExpired => '期限切れ';
  @override
  String get daysToday => '今日';
  @override
  String get daysTomorrow => '明日';
  @override
  String daysCount(int days) => '$days 日';
  @override
  String unifiedDaysRemaining(int days) => '$days 残り日数';
  @override
  String productCount(int count) => '$count アイテム';
  @override
  String get unifiedSourceReceipt => 'レシート';
  @override
  String get unifiedSourceScan => 'スキャン';
  @override
  String unifiedLastScan(String date) => '最後のスキャン ·$date';
  @override
  String get receiptFieldProductName => '製品名';
  @override
  String get receiptFieldQuantity => '量';
  @override
  String get receiptFieldCategory => 'カテゴリ';
  @override
  String expiryApprox(int days) => '賞味期限〜$days 日';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      '足りない食材が買い物リストに追加されました';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients 材料 ・$recipes レシピ';
  @override
  String get favoriteAddTooltip => 'お気に入りに追加';
  @override
  String get favoriteRemoveTooltip => 'お気に入りから削除';
  @override
  String get favoriteAddedSnack => 'お気に入りに追加されました';
  @override
  String get favoriteRemovedSnack => 'お気に入りから削除されました';
  @override
  String get onboardingScanTitle => 'パントリーをスキャンする';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => '買い物リスト';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'お気に入りと最近のスキャン';
  @override
  String get onboardingFavoritesBody =>
      '気に入ったレシピを保存します。最近のスキャンはホーム画面からすぐに開きます。';
  @override
  String get onboardingCloudTitle => 'クラウドの歴史';
  @override
  String get onboardingCloudBody =>
      'サインインしてスキャン履歴をアカウントに保存し、いつでも戻ってください。';
  @override
  String get onboardingPermissionsTitle => 'カメラと通知';
  @override
  String get onboardingPermissionsBody =>
      'CyberChefは冷蔵庫・レシート・バーコードのスキャンにカメラが必要です。任意の通知で賞味期限が近い食品をお知らせします。';
  @override
  String get emptyStateScanReceipt => 'レシートをスキャン';
  @override
  String get emptyStateStartScan => 'スキャンを開始';
  @override
  String get manageSubscriptions => 'サブスクリプションを管理';
  @override
  String get notificationCriticalChannelName => '鮮度アラート';
  @override
  String get notificationCriticalChannelDesc => 'もうすぐ期限切れになるアイテム';
  @override
  String get notificationDailyChannelName => '毎日のまとめ';
  @override
  String get notificationDailyChannelDesc => '毎日の鮮度リマインダー';
  @override
  String get notificationCriticalTitle => 'もうすぐ期限切れになるアイテム';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — [鮮度]パネルを確認します。';
  @override
  String get notificationDailyTitle => '鮮度チェック';
  @override
  String get notificationDailyBody =>
      '今日使うべきアイテムを見直しましょう。';
  @override
  String get widgetFreshnessGood => '鮮度が良さそうです';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count アイテムは今日期限切れになる可能性があります';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical 致命的 ・$warning 警告';
  @override
  String get categoryDairy => '乳製品';
  @override
  String get categoryMeat => '肉・魚';
  @override
  String get categoryFruit => 'フルーツ';
  @override
  String get categoryVegetable => '野菜';
  @override
  String get categoryBeverage => '飲料';
  @override
  String get categoryBakery => 'ベーカリー';
  @override
  String get categoryPantry => 'パントリー';
  @override
  String calendarMonthName(int month) => const [
        '1月',
        '2月',
        '行進',
        '4月',
        '5月',
        '6月',
        '7月',
        '8月',
        '9月',
        '10月',
        '11月',
        '12月',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'レシピ';
  @override
  String get recipesPlaceholderBody =>
      'スキャンが成功すると、レシピ結果がここに表示されます。';
  @override
  String get recipeSamplePlating => 'サンプルめっき';
  @override
  String get recipeShareInstructionsHeader => '説明書：';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => '経験値';
  @override
  String get themeTitle => 'テーマ';
  @override
  String get themeSubtitle => 'カラーパレットと背景';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'デフォルトのダークグリーン';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'クールなブルートーン';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => '温かみのある琥珀のアクセント';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'パープルアクセントダーク';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => '明るい背景';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'オレンジのアクセントが効いた温かいクリーム';
}
