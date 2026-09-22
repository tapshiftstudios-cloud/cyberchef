import 'strings_base.dart';

class StringsVi implements StringsBase {
  const StringsVi();

  @override
  String get analysisTitle => 'Phân tích phòng đựng thức ăn';
  @override
  String get stepPrepareImage => 'Đang chuẩn bị ảnh…';
  @override
  String get stepAnalyzeAi => 'Phát hiện thành phần…';
  @override
  String get stepBuildRecipes => 'Xây dựng công thức nấu ăn…';
  @override
  String get receiptAnalysisTitle => 'Đã đọc biên nhận';
  @override
  String get stepReceiptPrepare => 'Đang chuẩn bị hình ảnh biên nhận…';
  @override
  String get stepReceiptOcr => 'Đang nhận dạng các mục…';
  @override
  String get stepReceiptInfer => 'Đang ước tính thời hạn sử dụng…';
  @override
  String get receiptNotRecognized =>
      'Không thể đọc biên nhận. Hãy thử một bức ảnh rõ ràng hơn, phẳng hơn.';
  @override
  String get receiptNotDetected =>
      'Không phát hiện biên nhận. Căn chỉnh biên nhận trong khung.';
  @override
  String get receiptConfirmTitle => 'Xác nhận các mặt hàng đã nhận';
  @override
  String get receiptConfirmSubtitle =>
      'Chọn các mục để thêm. Nhấn và giữ để chỉnh sửa.';
  @override
  String get receiptConfirmSave => 'Thêm vào phòng đựng thức ăn';
  @override
  String get receiptSelectOne => 'Chọn ít nhất một mục.';
  @override
  String get receiptSaved => 'Các mặt hàng được thêm vào kho hàng mới';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Gửi ảnh biên nhận này? Phân tích OCR bắt đầu sau khi bạn xác nhận.';
  @override
  String get navFreshness => 'Độ tươi';
  @override
  String get freshnessPanelTitle => 'Bảng điều khiển độ tươi';
  @override
  String get freshnessCritical => 'Quan trọng (0–2 ngày)';
  @override
  String get freshnessWarning => 'Cảnh báo (3–5 ngày)';
  @override
  String get freshnessSafe => 'An toàn (hơn 6 ngày)';
  @override
  String get freshnessEmpty =>
      'Chưa có mục nào được theo dõi. Quét biên nhận để xây dựng hàng tồn kho.';
  @override
  String get freshnessListTitle => 'kiểm kê độ tươi';
  @override
  String get freshnessListEmpty => 'Không có mục nào trong bộ lọc này.';
  @override
  String get freshnessSuggestRecipes => 'Gợi ý công thức nấu ăn với những thứ này';
  @override
  String get savingsPanelTitle => 'Bảng tiết kiệm';
  @override
  String get savingsPanelEmptyHint =>
      'Đánh dấu các mặt hàng sắp hết hạn là “Thực phẩm chế biến” để theo dõi chất thải được ngăn chặn tại đây.';
  @override
  String get savingsStatItems => 'được giải cứu';
  @override
  String get savingsStatWaste => 'Ngăn chặn chất thải';
  @override
  String get savingsStatMoney => 'Ước tính. tiết kiệm';
  @override
  String get savingsDashboardTitle => 'Phân tích tiết kiệm';
  @override
  String get savingsDashboardSubtitle =>
      'Tóm tắt thực phẩm bạn đã tiết kiệm từ thùng rác — tháng này.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 thành phần được cứu khỏi rác thải trong tháng này'
          : '$count nguyên liệu được cứu khỏi rác thải trong tháng này';
  @override
  String savingsKgPrevented(String kg) => 'Ngăn ngừa lãng phí thực phẩm:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Lợi ích tài chính ước tính:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => '4 tuần qua';
  @override
  String get savingsRecentTitle => 'Những cuộc giải cứu gần đây';
  @override
  String get savingsEmptySubtitle =>
      'Chưa có hồ sơ nào. Khi bạn sử dụng một mục quan trọng hoặc cảnh báo, nó sẽ xuất hiện ở đây.';
  @override
  String get savingsHowItWorks =>
      'Các mặt hàng được sử dụng trong vòng 5 ngày kể từ ngày hết hạn được tính là được giải cứu. Trọng lượng và giá trị được ước tính từ mức trung bình của danh mục.';
  @override
  String get pantryNamesLocaleNote =>
      'Tên sản phẩm và cửa hàng xuất hiện như đã lưu trên biên nhận của bạn; các thuật ngữ phổ biến được hiển thị bằng tiếng Anh.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Đã sử dụng vào ngày hôm qua' : 'Được sử dụng với$days ngày còn lại';
  @override
  String get savingsMealMade => 'Bữa ăn được thực hiện';
  @override
  String savingsMealMadeConfirm(String name) => 'Đánh dấu$name được tiêu thụ như thế nào?';
  @override
  String savingsRescuedSnack(String money) => 'Khoản tiết kiệm được ghi lại ·$money';
  @override
  String get freshnessRecipeTitle => 'Chuẩn bị công thức nấu ăn';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Cần có ít nhất một vật phẩm cho công thức nấu ăn.';
  @override
  String get freshnessCriticalBanner => 'Sắp hết hạn';
  @override
  String get freshnessViewAll => 'Xem tất cả';
  @override
  String get receiptCaptureHints =>
      'Giữ biên lai phẳng, ánh sáng tốt. Tất cả các dòng hiển thị trong khung dọc.';
  @override
  String get receiptPurchaseDate => 'Ngày mua';
  @override
  String get receiptTapToEdit => 'Biên tập';
  @override
  String get receiptEditItem => 'Chỉnh sửa mục';
  @override
  String get receiptEditSave => 'Cứu';
  @override
  String get receiptExpiryDaysLabel => 'Thời hạn sử dụng ước tính (ngày)';
  @override
  String get receiptMergedSnack => 'Một số mục được hợp nhất với các bản ghi hiện có';
  @override
  String get receiptCloudSyncFailed => 'Không thể lưu vào đám mây';
  @override
  String get receiptCloudSynced => 'Các mục được đồng bộ hóa với đám mây';
  @override
  String get pantrySyncAction => 'Đồng bộ hóa dữ liệu làm mới';
  @override
  String get pantrySyncDone => 'Đã cập nhật dữ liệu về độ mới';
  @override
  String get pantrySyncFailed => 'Đồng bộ hóa không thành công';
  @override
  String get freshnessNotificationsTitle => 'Thông báo về độ mới';
  @override
  String get freshnessNotificationsSubtitle =>
      'Các mục quan trọng và nhắc nhở hàng ngày';
  @override
  String get freshnessNotificationTimeLabel => 'Thời gian nhắc nhở hàng ngày';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Mỗi ngày tại$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Tuần này:$critical phê bình,$warning các mục cảnh báo. Hãy sử dụng những thứ này trước tiên.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Lỗi mạng. Hãy kiểm tra kết nối của bạn và thử lại.';
  @override
  String get geminiQuotaExceeded =>
      'Đã vượt quá hạn ngạch AI. Đợi vài phút và thử lại.';
  @override
  String get geminiBillingDepleted =>
      'Tín dụng trả trước của Google AI Studio đã cạn. Thêm thông tin thanh toán tại ai.google.dev để khôi phục các tính năng AI.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Tự động thử lại có thể có sẵn trong$minutes phút.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Đã đạt đến giới hạn dịch AI hàng ngày (3/3). Bí quyết sử dụng bản dịch cơ bản cho đến ngày mai.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'bạn có$remaining (Các) bản dịch AI còn lại hôm nay.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Đã đạt đến giới hạn quét phòng đựng thức ăn hàng ngày (3). Vui lòng thử lại vào ngày mai.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Đã đạt đến giới hạn quét biên nhận hàng ngày (2). Vui lòng thử lại vào ngày mai.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Đã đạt đến giới hạn tạo công thức hàng ngày (3). Vui lòng thử lại vào ngày mai.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Vui lòng chờ$seconds (các) giây trước khi thử lại.';
  @override
  String get adRewardTitlePantry => 'Đã đạt đến giới hạn quét phòng đựng thức ăn';
  @override
  String get adRewardTitleReceipt => 'Đã đạt đến giới hạn quét biên nhận';
  @override
  String get adRewardTitleRecipe => 'Đã đạt đến giới hạn tạo công thức';
  @override
  String get adRewardSubtitle =>
      'Xem một quảng cáo ngắn để kiếm thêm 1 lần sử dụng ngay hôm nay (tối đa 3 lần mỗi ngày).';
  @override
  String get adRewardWatchButton => 'Xem quảng cáo (+1 lần sử dụng)';
  @override
  String get adRewardGranted => 'Được sử dụng thêm. Hãy thử lại.';
  @override
  String get adRewardNotCompleted =>
      'Quảng cáo chưa được hoàn thành. Không có sử dụng thêm đã được cấp.';
  @override
  String get adRewardDailyCapReached =>
      'Bạn đã đạt đến giới hạn phần thưởng quảng cáo của ngày hôm nay.';
  @override
  String get geminiTimeout =>
      'Yêu cầu đã hết thời gian chờ. Hãy kiểm tra kết nối của bạn và thử lại.';
  @override
  String get geminiServerError =>
      'Dịch vụ AI tạm thời không khả dụng. Vui lòng thử lại sau.';
  @override
  String get imageNotRecognized =>
      'Hình ảnh không được nhận dạng. Cải thiện ánh sáng hoặc thử một góc độ khác.';
  @override
  String get imageNotPantry =>
      'Tủ lạnh hoặc phòng đựng thức ăn không nhìn thấy được. Vui lòng chụp ảnh trực tiếp.';
  @override
  String get parseError =>
      'Không thể phân tích cú pháp phản hồi AI. Vui lòng quét lại.';
  @override
  String get modelUnavailable =>
      'Mô hình AI không có sẵn. Kiểm tra quyền truy cập API của bạn.';
  @override
  String get genericError => 'Đã xảy ra lỗi. Vui lòng thử lại.';
  @override
  String get imageDecodeError => 'Không thể đọc được ảnh. Hãy thử một hình ảnh khác.';
  @override
  String get authSubtitle => 'Truy cập phòng đựng thức ăn thông minh';
  @override
  String get authInitializing => 'Đang chuẩn bị phiên…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Mật khẩu';
  @override
  String get emailRequired => 'Cần có email';
  @override
  String get emailInvalid => 'Email không hợp lệ';
  @override
  String get passwordMin => 'Ít nhất 6 ký tự';
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
  String get signIn => 'Đăng nhập';
  @override
  String get signUp => 'Tạo tài khoản';
  @override
  String get toggleToSignIn => 'Đã có tài khoản? Đăng nhập';
  @override
  String get toggleToSignUp => 'Mới ở đây à? Tạo tài khoản';
  @override
  String get guestContinue => 'Tiếp tục làm khách';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Tài khoản đã được tạo. Mở liên kết xác nhận trong hộp thư đến của bạn; ứng dụng sẽ thông báo cho bạn khi được xác minh.';
  @override
  String get emailConfirmedSuccess =>
      'Email của bạn đã được xác nhận. Tài khoản của bạn đã sẵn sàng.';
  @override
  String get emailVerifiedLabel => 'Đã xác minh email';
  @override
  String get proEmailRequiredTitle => 'Cần có tài khoản email cho Pro';
  @override
  String get proEmailRequiredBody =>
      'Tài khoản khách không thể mua Pro. Tạo một tài khoản email để giữ dữ liệu của bạn và mở khóa thanh toán.';
  @override
  String get proLinkAccountAction => 'Tạo tài khoản và tiếp tục';
  @override
  String get proAccountLinked =>
      'Đã liên kết tài khoản. Bạn có thể tiếp tục thanh toán Pro ngay bây giờ.';
  @override
  String get supabaseNotConfigured =>
      'Dịch vụ tài khoản không có sẵn. Vui lòng thử lại sau.';
  @override
  String get privacyTitle => 'Dữ liệu & quyền riêng tư';
  @override
  String get privacySubtitle => 'Ảnh và dữ liệu tài khoản';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Hình ảnh biên nhận không được lưu trữ trên máy chủ; chỉ có danh sách sản phẩm được trích xuất.\\n\\n'
      'Khi đăng nhập, dữ liệu quét và dữ liệu làm mới có thể được lưu vào tài khoản của bạn.'
      'Gói miễn phí hiển thị quảng cáo Google AdMob; Pro không có quảng cáo.\\n\\n'
      'Mở chính sách bảo mật trực tuyến để xem toàn văn.';
  @override
  String get privacyViewOnline => 'Chính sách bảo mật mở';
  @override
  String get pantryHistoryTitle => 'Lịch sử phòng đựng thức ăn';
  @override
  String get pantryHistoryEmpty =>
      'Chưa có bản quét nào được lưu.\\nQuét tủ lạnh của bạn để xây dựng lịch sử.';
  @override
  String get pantryHistorySubtitle => 'Quét được lưu trên đám mây';
  @override
  String get splashTagline => 'Sản xuất & đựng thức ăn - một ứng dụng';
  @override
  String get splashLoading => 'Đang tải…';
  @override
  String get onboardingSkip => 'Nhảy';
  @override
  String get onboardingNext => 'Kế tiếp';
  @override
  String get onboardingStart => 'Bắt đầu';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Các lần quét gần đây';
  @override
  String get cameraTapToOpen => 'Nhấn vào biểu tượng để mở camera';
  @override
  String get cameraOrGalleryHint => 'Mở máy ảnh hoặc chọn từ thư viện';
  @override
  String get captureOrGalleryHint => 'Chụp hoặc chọn từ thư viện';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Đóng máy ảnh';
  @override
  String get noIngredients => 'Không có thành phần nào được phát hiện.';
  @override
  String get recipeInstructions => 'Hướng dẫn';
  @override
  String get untitledRecipe => 'Công thức không có tiêu đề';
  @override
  String get genericLoadError => 'Đã xảy ra lỗi. Vui lòng thử lại.';
  @override
  String get scanConfirmTitle => 'Xác nhận ảnh';
  @override
  String get scanConfirmSubtitle =>
      'Gửi ảnh này? Phân tích công thức bắt đầu sau khi bạn xác nhận.';
  @override
  String get scanConfirmAnalyze => 'Phân tích';
  @override
  String get scanConfirmCancel => 'Hủy bỏ';
  @override
  String get scanConfirmRetake => 'Thi lại';
  @override
  String get scanConfirmPickOther => 'Chọn cái khác';
  @override
  String get clearRecentScans => 'Xóa các lần quét gần đây';
  @override
  String get clearRecentScansSubtitle => 'Xóa lịch sử cục bộ trên thiết bị';
  @override
  String get clearRecentScansConfirmTitle => 'Xóa các lần quét gần đây?';
  @override
  String get clearRecentScansConfirmBody =>
      'Không thể hoàn tác. Mục yêu thích không bị ảnh hưởng.';
  @override
  String get clearRecentScansDone => 'Đã xóa các lần quét gần đây';
  @override
  String get deleteAction => 'Xóa bỏ';
  @override
  String get imageQualityTitle => 'Chất lượng ảnh thấp';
  @override
  String get imageQualityDark => 'Hình ảnh quá tối. Thêm ánh sáng và thử lại.';
  @override
  String get imageQualityBlurry =>
      'Hình ảnh có thể bị mờ. Giữ ổn định và lấy lại.';
  @override
  String get imageQualityContinue => 'Vẫn tiếp tục';
  @override
  String get imageQualityRetake => 'Thi lại';
  @override
  String receiptQueueTitle(int count) => '$count (các) biên nhận đang chờ ngoại tuyến';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Biên lai ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Quá trình';
  @override
  String get receiptQueuedOffline =>
      'Ngoại tuyến. Biên nhận xếp hàng đợi; xử lý khi được kết nối.';
  @override
  String get receiptLowConfidenceBlock =>
      'Chỉnh sửa các mục có độ tin cậy thấp trước khi lưu (biểu tượng bút chì).';
  @override
  String get unifiedPantryTitle => 'Khoảng không quảng cáo thống nhất';
  @override
  String get unifiedPantryEmpty => 'Chưa có mục hoặc bản quét nào.';
  @override
  String get searchHint => 'Tìm kiếm sản phẩm…';
  @override
  String get navShopping => 'Mua sắm';
  @override
  String get shoppingAddHint => 'Thêm mục còn thiếu';
  @override
  String get shoppingEmpty => 'Danh sách mua sắm của bạn trống.';
  @override
  String get shoppingClearDone => 'Xóa hoàn thành';
  @override
  String get shoppingDoneSection => 'Xong';
  @override
  String get shoppingAddFromRecipe => 'Thêm các mặt hàng không có trong kho biên nhận';
  @override
  String get freshnessViewCalendar => 'Lịch';
  @override
  String get freshnessViewList => 'Danh sách';
  @override
  String get cookToday => 'Hôm nay nấu món gì?';
  @override
  String get cookTodayNoUrgent =>
      'Không có mục khẩn cấp. Quét biên nhận để theo dõi độ tươi.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Nhìn thấy trong bản quét nhưng không thấy trong kho biên nhận: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Xuất dữ liệu cục bộ';
  @override
  String get exportLocalDataSubtitle => 'Sao chép JSON vào clipboard';
  @override
  String get exportLocalDataDone => 'Đã sao chép dữ liệu vào clipboard';
  @override
  String get clearLocalData => 'Xóa dữ liệu cục bộ';
  @override
  String get clearLocalDataSubtitle =>
      'Sự tươi mới, mua sắm, sở thích (không thể đảo ngược)';
  @override
  String get clearLocalDataConfirmTitle => 'Xóa dữ liệu cục bộ?';
  @override
  String get clearLocalDataConfirmBody =>
      'Danh sách mua sắm và hàng tồn kho mới đã bị xóa khỏi thiết bị.';
  @override
  String get clearLocalDataDone => 'Đã xóa dữ liệu cục bộ';
  @override
  String get settingsTitle => 'Cài đặt';
  @override
  String get languageTitle => 'Ngôn ngữ';
  @override
  String get languageSubtitle => 'Ngôn ngữ ứng dụng · 27 ngôn ngữ';
  @override
  String get localePreparingTitle => 'Đang cập nhật ngôn ngữ';
  @override
  String get localePreparingSubtitle =>
      'Dịch công thức nấu ăn và quét kết quả…';
  @override
  String get dietTitle => 'Ưu tiên ăn kiêng';
  @override
  String get dietSubtitle => 'Áp dụng cho đề xuất công thức nấu ăn';
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
  String get aiUsageLimitsLoading => 'Đang tải…';
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
  String get aiUsageLabelPantry => 'Phòng đựng thức ăn';
  @override
  String get aiUsageLabelReceipt => 'Biên lai';
  @override
  String get aiUsageLabelRecipe => 'Công thức';
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
  String get storeUnavailable => 'Cửa hàng hiện không khả dụng. Hãy thử lại sau.';
  @override
  String get proProductIdsNotConfigured => 'ID sản phẩm Pro chưa được cấu hình.';
  @override
  String get noProProductsFound => 'Không tìm thấy sản phẩm Pro để mua.';
  @override
  String get purchaseFlowFailed => 'Không thể bắt đầu mua hàng.';
  @override
  String get purchaseCompletedProActivated => 'Mua thành công. Gói Pro đã được kích hoạt.';
  @override
  String get purchaseCompletedVerifyFailed => 'Mua thành công nhưng chưa xác minh được; thử lại sau.';
  @override
  String get purchaseFailed => 'Mua thất bại.';
  @override
  String get restorePurchases => 'Khôi phục giao dịch';
  @override
  String get restorePurchasesStarted => 'Đang kiểm tra giao dịch trước trên Play Store…';
  @override
  String get nutritionTitle => 'Dinh dưỡng (ước tính)';
  @override
  String get nutritionPerServing => 'mỗi khẩu phần';
  @override
  String get nutritionCalories => 'Calo';
  @override
  String get nutritionProtein => 'chất đạm';
  @override
  String get nutritionCarbs => 'Carb';
  @override
  String get nutritionFat => 'Mập';
  @override
  String get nutritionEstimateNote =>
      'Chỉ ước tính AI; không phải lời khuyên về y tế hoặc chế độ ăn uống.';
  @override
  String get barcodeScanTitle => 'Quét mã vạch';
  @override
  String get barcodeScanHint =>
      'Căn chỉnh mã vạch trong khung. Tra cứu sản phẩm qua Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Không tìm thấy sản phẩm. Thay vào đó hãy thử quét biên lai hoặc tủ lạnh.';
  @override
  String get barcodeConfirmTitle => 'Xác nhận sản phẩm';
  @override
  String get barcodeAddToPantry => 'Thêm vào kho hàng tươi mới';
  @override
  String get navScan => 'Quét';
  @override
  String get captureTypeFridge => 'Tủ lạnh';
  @override
  String get captureTypeReceipt => 'Biên lai';
  @override
  String get captureTypeBarcode => 'Mã vạch';
  @override
  String get sectionAccount => 'Tài khoản';
  @override
  String get sectionPreferences => 'Tùy chọn';
  @override
  String get sectionApp => 'Ứng dụng';
  @override
  String get sectionPrivacy => 'Sự riêng tư';
  @override
  String get sessionTitle => 'Phiên họp';
  @override
  String get guestUser => 'Người dùng khách';
  @override
  String get favoritesTitle => 'Yêu thích';
  @override
  String get favoritesSubtitle => 'Công thức nấu ăn bạn đã lưu';
  @override
  String get freshnessInventorySubtitle =>
      'Sản phẩm từ hóa đơn và ngày hết hạn';
  @override
  String get pantrySyncSubtitle => 'Kéo hàng tồn kho mới từ đám mây';
  @override
  String get showOnboardingAgain => 'Hiển thị lại chuyến tham quan giới thiệu';
  @override
  String get signOut => 'Đăng xuất';
  @override
  String get scanSubtitleSmart => 'Quét phòng đựng thức ăn thông minh';
  @override
  String get scanSubtitleReceipt => 'Quét biên nhận và theo dõi độ mới';
  @override
  String get tooltipSettings => 'Cài đặt';
  @override
  String get tooltipToggleGuide => 'Hướng dẫn chuyển đổi khung';
  @override
  String get tooltipModesAbout => 'Giới thiệu về chế độ quét';
  @override
  String get galleryLabel => 'Phòng trưng bày';
  @override
  String get cameraLoading => 'Đang chuẩn bị máy ảnh…';
  @override
  String get cameraUnavailable =>
      'Máy ảnh không có sẵn.\\nHãy kiểm tra quyền và thử lại.';
  @override
  String get captureFailed =>
      'Chụp không thành công. Hãy kiểm tra quyền của máy ảnh và thử lại.';
  @override
  String get receiptCaptureAlign =>
      'Căn chỉnh biên nhận theo khung dọc và chụp';
  @override
  String get receiptCameraHint =>
      'Mở camera hoặc chọn ảnh biên nhận từ thư viện';
  @override
  String get pickPhotoHint => 'Nhấn vào nút để chọn ảnh';
  @override
  String get desktopGalleryHint =>
      'Chế độ máy tính để bàn - chọn ảnh tủ lạnh từ thư viện.';
  @override
  String get noCameraOnDevice => 'Không tìm thấy máy ảnh trên thiết bị này.';
  @override
  String get openCameraButton => 'Mở máy ảnh';
  @override
  String get pickPhotoButton => 'Chọn ảnh';
  @override
  String get overlayGuideOn => 'Hướng dẫn về';
  @override
  String get overlayGuideOff => 'Hướng dẫn tắt';
  @override
  String get modeSheetTitle => 'Chế độ quét';
  @override
  String get modeSheetSubtitle =>
      'Chọn trước khi chụp; nó thay đổi các quy tắc công thức AI.';
  @override
  String get scanModeQuickLabel => 'Quét nhanh';
  @override
  String get scanModeQuickSubtitle => 'Công thức nấu ăn dưới 15 phút';
  @override
  String get scanModeQuickDesc =>
      'Bữa ăn thiết thực hàng ngày. Tất cả các công thức nấu ăn có tổng thời gian là 15 phút hoặc ít hơn; kỹ thuật đơn giản (một chảo, salad, chiên nhanh).';
  @override
  String get scanModeSurvivalLabel => 'Giải thoát';
  @override
  String get scanModeSurvivalSubtitle => 'Sử dụng các mặt hàng hết hạn trước';
  @override
  String get scanModeSurvivalDesc =>
      'Giảm chất thải. Ưu tiên những món đồ có vẻ sắp hư hỏng. Các mục trường gợi ý tùy chọn được ưu tiên.';
  @override
  String get scanModeChefLabel => 'Chế độ đầu bếp';
  @override
  String get scanModeChefSubtitle => 'Ngon & chi tiết';
  @override
  String get scanModeChefDesc =>
      'Công thức nấu ăn tinh tế hơn. Kỹ thuật xếp lớp, thời gian nấu lâu hơn; ít nhất hai công thức nấu ăn được đánh dấu khó.';
  @override
  String get scanModeQuickBestFor =>
      'Bữa ăn tối trong tuần với nguyên liệu và thời gian tối thiểu';
  @override
  String get scanModeQuickExamples =>
      '• Trứng ốp lết 10 phút\\n→ Mì ống một chảo\\n→ Giấy bọc hoặc bát không cần nấu';
  @override
  String get scanModeSurvivalBestFor =>
      'Sử dụng các mặt hàng trước khi chúng hết hạn và cắt giảm lãng phí';
  @override
  String get scanModeSurvivalExamples =>
      '• Súp rau sạch\\n thơ frittata bỏ lò\\n Cơm rang còn sót lại';
  @override
  String get scanModeChefBestFor =>
      'Những bữa tối đặc biệt, những vị khách hoặc học một kỹ thuật';
  @override
  String get scanModeChefExamples =>
      '• Chả sốt đạm\\n→ Đĩa giòn + kem\\n→ Rau củ caramen trang trí';
  @override
  String get scanModeIdealForLabel => 'Tốt nhất cho';
  @override
  String get scanModeExamplesLabel => 'Món ăn ví dụ';
  @override
  String get survivalHintAddFromPantry => 'Thêm từ sự tươi mới';
  @override
  String get filterAll => 'Tất cả';
  @override
  String get filterCritical => 'Phê bình';
  @override
  String get filterWarning => 'Cảnh báo';
  @override
  String get filterSafe => 'An toàn';
  @override
  String get recipesScreenTitle => 'Công thức nấu ăn';
  @override
  String get copyRecipe => 'Sao chép';
  @override
  String get shareRecipe => 'Chia sẻ';
  @override
  String get recipeCopiedSnack => 'Đã sao chép công thức vào bảng nhớ tạm';
  @override
  String get survivalHintTitle => 'Sắp hết hạn';
  @override
  String get survivalHintOptional => 'Tùy chọn - ví dụ: sữa, cà chua, sữa chua';
  @override
  String get survivalHintPlaceholder => 'Phân cách bằng dấu phẩy';
  @override
  String get scanConfirmReceiptLabel => 'Quét biên nhận';
  @override
  String get scanSavedHistory => 'Đã lưu bản quét vào lịch sử phòng đựng thức ăn';
  @override
  String get scanSaveFailedPrefix => 'Không thể lưu bản quét';
  @override
  String get daysUnit => 'ngày';
  @override
  String get okButton => 'ĐƯỢC RỒI';
  @override
  String get recipesDetectedIngredients => 'Thành phần được phát hiện';
  @override
  String recipesAiCount(int count) => 'Công thức nấu ăn AI ·$count';
  @override
  String get galleryPickMessage => 'Chọn ảnh từ thư viện';
  @override
  String get favoritesEmpty =>
      'Chưa có công thức nấu ăn yêu thích nào.\\nHãy nhấn vào trái tim trên kết quả công thức nấu ăn.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Công thức ${index + 1}' : 'Công thức';

  @override
  String get timeAgoJustNow => 'Vừa rồi';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}cách đây vài phút';
  @override
  String timeAgoHours(int hours) => '${hours}giờ trước';
  @override
  String timeAgoDays(int days) => '${days}ngày trước';
  @override
  String get daysExpired => 'Hết hạn';
  @override
  String get daysToday => 'Hôm nay';
  @override
  String get daysTomorrow => 'Ngày mai';
  @override
  String daysCount(int days) => '$days ngày';
  @override
  String unifiedDaysRemaining(int days) => '$days ngày còn lại';
  @override
  String productCount(int count) => '$count mặt hàng';
  @override
  String get unifiedSourceReceipt => 'Biên lai';
  @override
  String get unifiedSourceScan => 'Quét';
  @override
  String unifiedLastScan(String date) => 'Lần quét cuối cùng ·$date';
  @override
  String get receiptFieldProductName => 'Tên sản phẩm';
  @override
  String get receiptFieldQuantity => 'Số lượng';
  @override
  String get receiptFieldCategory => 'Loại';
  @override
  String expiryApprox(int days) => 'Tốt nhất trước ~$days ngày';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Thiếu thành phần được thêm vào danh sách mua sắm';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients thành phần ·$recipes công thức nấu ăn';
  @override
  String get favoriteAddTooltip => 'Thêm vào mục yêu thích';
  @override
  String get favoriteRemoveTooltip => 'Xóa khỏi mục yêu thích';
  @override
  String get favoriteAddedSnack => 'Đã thêm vào mục yêu thích';
  @override
  String get favoriteRemovedSnack => 'Đã xóa khỏi mục yêu thích';
  @override
  String get onboardingScanTitle => 'Quét phòng đựng thức ăn của bạn';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'danh sách mua sắm';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Mục yêu thích & bản quét gần đây';
  @override
  String get onboardingFavoritesBody =>
      'Lưu công thức nấu ăn bạn thích. Các lần quét gần đây sẽ mở nhanh chóng từ màn hình chính.';
  @override
  String get onboardingCloudTitle => 'Lịch sử đám mây';
  @override
  String get onboardingCloudBody =>
      'Đăng nhập để lưu lịch sử quét vào tài khoản của bạn và quay lại bất kỳ lúc nào.';
  @override
  String get onboardingPermissionsTitle => 'Camera & thông báo';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef cần camera để quét tủ lạnh, hóa đơn và mã vạch. Thông báo tùy chọn nhắc khi thực phẩm sắp hết hạn.';
  @override
  String get emptyStateScanReceipt => 'Quét hóa đơn';
  @override
  String get emptyStateStartScan => 'Bắt đầu quét';
  @override
  String get manageSubscriptions => 'Quản lý đăng ký';
  @override
  String get notificationCriticalChannelName => 'Cảnh báo độ tươi';
  @override
  String get notificationCriticalChannelDesc => 'Hàng sắp hết hạn';
  @override
  String get notificationDailyChannelName => 'Tóm tắt hàng ngày';
  @override
  String get notificationDailyChannelDesc => 'Nhắc nhở độ tươi hàng ngày';
  @override
  String get notificationCriticalTitle => 'Hàng sắp hết hạn';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Kiểm tra bảng Freshness.';
  @override
  String get notificationDailyTitle => 'Kiểm tra độ tươi';
  @override
  String get notificationDailyBody =>
      'Review những món đồ bạn nên sử dụng ngay hôm nay.';
  @override
  String get widgetFreshnessGood => 'Độ tươi có vẻ tốt';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count các mặt hàng có thể hết hạn ngày hôm nay';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical phê bình ·$warning cảnh báo';
  @override
  String get categoryDairy => 'Sữa';
  @override
  String get categoryMeat => 'Thịt/cá';
  @override
  String get categoryFruit => 'Hoa quả';
  @override
  String get categoryVegetable => 'Rau quả';
  @override
  String get categoryBeverage => 'nước giải khát';
  @override
  String get categoryBakery => 'tiệm bánh';
  @override
  String get categoryPantry => 'Phòng đựng thức ăn';
  @override
  String calendarMonthName(int month) => const [
        'Tháng Một',
        'Tháng hai',
        'Bước đều',
        'Tháng tư',
        'Có thể',
        'Tháng sáu',
        'Tháng bảy',
        'Tháng tám',
        'Tháng 9',
        'tháng mười',
        'Tháng mười một',
        'Tháng 12',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Công thức nấu ăn';
  @override
  String get recipesPlaceholderBody =>
      'Kết quả công thức nấu ăn sẽ xuất hiện ở đây sau khi quét thành công.';
  @override
  String get recipeSamplePlating => 'Mạ mẫu';
  @override
  String get recipeShareInstructionsHeader => 'Hướng dẫn:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'chủ đề';
  @override
  String get themeSubtitle => 'Bảng màu và nền';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Màu xanh đậm mặc định';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Tông màu xanh mát';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Điểm nhấn màu hổ phách ấm áp';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Điểm nhấn màu tím đậm';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Nền sáng';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Kem ấm với điểm nhấn màu cam';
}
