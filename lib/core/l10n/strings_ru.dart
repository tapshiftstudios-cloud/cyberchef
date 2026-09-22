import 'strings_base.dart';

class StringsRu implements StringsBase {
  const StringsRu();

  @override
  String get analysisTitle => 'Анализ кладовой';
  @override
  String get stepPrepareImage => 'Готовим фото…';
  @override
  String get stepAnalyzeAi => 'Обнаружение ингредиентов…';
  @override
  String get stepBuildRecipes => 'Строительные рецепты…';
  @override
  String get receiptAnalysisTitle => 'Квитанция о прочтении';
  @override
  String get stepReceiptPrepare => 'Подготовка изображения квитанции…';
  @override
  String get stepReceiptOcr => 'Распознавание предметов…';
  @override
  String get stepReceiptInfer => 'Оценка срока годности…';
  @override
  String get receiptNotRecognized =>
      'Не удалось прочитать чек. Попробуйте сделать более четкую и плоскую фотографию.';
  @override
  String get receiptNotDetected =>
      'Квитанция не обнаружена. Выровняйте чек в рамке.';
  @override
  String get receiptConfirmTitle => 'Подтвердить получение товаров';
  @override
  String get receiptConfirmSubtitle =>
      'Выберите элементы для добавления. Длительное нажатие для редактирования.';
  @override
  String get receiptConfirmSave => 'Добавить в кладовку';
  @override
  String get receiptSelectOne => 'Выберите хотя бы один элемент.';
  @override
  String get receiptSaved => 'Товары добавлены в инвентарь свежести';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Отправить это фото чека? OCR-анализ начнется после вашего подтверждения.';
  @override
  String get navFreshness => 'Свежесть';
  @override
  String get freshnessPanelTitle => 'Панель свежести';
  @override
  String get freshnessCritical => 'Критический (0–2 дня)';
  @override
  String get freshnessWarning => 'Предупреждение (3–5 дней)';
  @override
  String get freshnessSafe => 'Безопасно (6+ дней)';
  @override
  String get freshnessEmpty =>
      'Отслеживаемых товаров пока нет. Отсканируйте квитанцию, чтобы составить инвентарь.';
  @override
  String get freshnessListTitle => 'Свежесть инвентаря';
  @override
  String get freshnessListEmpty => 'В этом фильтре нет элементов.';
  @override
  String get freshnessSuggestRecipes => 'Предлагайте рецепты с этим';
  @override
  String get savingsPanelTitle => 'Панель экономии';
  @override
  String get savingsPanelEmptyHint =>
      'Помечайте продукты с истекающим сроком годности как «Приготовленная еда», чтобы отслеживать предотвращаемые здесь отходы.';
  @override
  String get savingsStatItems => 'Спасен';
  @override
  String get savingsStatWaste => 'Предотвращение отходов';
  @override
  String get savingsStatMoney => 'Стандартное восточное время. сбережения';
  @override
  String get savingsDashboardTitle => 'Аналитика экономии';
  @override
  String get savingsDashboardSubtitle =>
      'Краткое описание еды, которую вы сохранили из мусорного ведра за этот месяц.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? 'В этом месяце от мусора спасён 1 ингредиент'
          : '$count ингредиенты, спасенные от отходов в этом месяце';
  @override
  String savingsKgPrevented(String kg) => 'Пищевые отходы предотвращаются:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Предполагаемая финансовая выгода:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Последние 4 недели';
  @override
  String get savingsRecentTitle => 'Недавние спасения';
  @override
  String get savingsEmptySubtitle =>
      'Записей пока нет. Когда вы используете критический или предупреждающий элемент, он появляется здесь.';
  @override
  String get savingsHowItWorks =>
      'Предметы, использованные в течение 5 дней после истечения срока годности, считаются спасенными. Вес и стоимость оцениваются по средним показателям по категориям.';
  @override
  String get pantryNamesLocaleNote =>
      'Названия продуктов и магазинов отображаются в том виде, в каком они сохранены в вашей квитанции; общие термины показаны на английском языке.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Использовано в последний день' : 'Используется с$days осталось дней';
  @override
  String get savingsMealMade => 'Еда приготовлена';
  @override
  String savingsMealMadeConfirm(String name) => 'Отметка$name как потребляется?';
  @override
  String savingsRescuedSnack(String money) => 'Экономия зафиксирована ·$money';
  @override
  String get freshnessRecipeTitle => 'Готовим рецепты';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Для рецептов требуется хотя бы один предмет.';
  @override
  String get freshnessCriticalBanner => 'Срок действия скоро истекает';
  @override
  String get freshnessViewAll => 'Посмотреть все';
  @override
  String get receiptCaptureHints =>
      'Держите чек ровно, хорошее освещение. Все линии видны в вертикальной рамке.';
  @override
  String get receiptPurchaseDate => 'Дата покупки';
  @override
  String get receiptTapToEdit => 'Редактировать';
  @override
  String get receiptEditItem => 'Редактировать элемент';
  @override
  String get receiptEditSave => 'Сохранять';
  @override
  String get receiptExpiryDaysLabel => 'Ориентировочный срок хранения (дни)';
  @override
  String get receiptMergedSnack => 'Некоторые элементы объединены с существующими записями';
  @override
  String get receiptCloudSyncFailed => 'Не удалось сохранить в облако';
  @override
  String get receiptCloudSynced => 'Объекты, синхронизированные с облаком';
  @override
  String get pantrySyncAction => 'Синхронизировать данные о свежести';
  @override
  String get pantrySyncDone => 'Данные о свежести обновлены.';
  @override
  String get pantrySyncFailed => 'Синхронизация не удалась';
  @override
  String get freshnessNotificationsTitle => 'Уведомления о свежести';
  @override
  String get freshnessNotificationsSubtitle =>
      'Критические предметы и ежедневное напоминание';
  @override
  String get freshnessNotificationTimeLabel => 'Время ежедневного напоминания';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Каждый день в$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'На этой неделе:$critical критический,$warning предупреждающие предметы. Используйте их в первую очередь.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Ошибка сети. Проверьте подключение и повторите попытку.';
  @override
  String get geminiQuotaExceeded =>
      'Квота AI превышена. Подождите несколько минут и повторите попытку.';
  @override
  String get geminiBillingDepleted =>
      'Предоплата Google AI Studio исчерпана. Добавьте биллинг на ai.google.dev, чтобы восстановить функции ИИ.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Автоматическая повторная попытка может быть доступна в$minutes мин.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Достигнут ежедневный лимит перевода ИИ (3/3). Рецепты используют базовый перевод до завтра.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'У вас есть$remaining AI перевод(ы) вышел сегодня.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Достигнут предел ежедневного сканирования кладовой (3). Пожалуйста, повторите попытку завтра.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Достигнут лимит сканирования ежедневных чеков (2). Пожалуйста, повторите попытку завтра.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Достигнут лимит создания ежедневных рецептов (3). Пожалуйста, повторите попытку завтра.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'пожалуйста, подождите$seconds секунды, прежде чем повторить попытку.';
  @override
  String get adRewardTitlePantry => 'Достигнут предел сканирования кладовой';
  @override
  String get adRewardTitleReceipt => 'Достигнут лимит сканирования чеков';
  @override
  String get adRewardTitleRecipe => 'Достигнут предел генерации рецептов';
  @override
  String get adRewardSubtitle =>
      'Посмотрите короткую рекламу и получите +1 дополнительное использование сегодня (до 3 в день).';
  @override
  String get adRewardWatchButton => 'Посмотреть рекламу (+1 использование)';
  @override
  String get adRewardGranted => 'Дополнительное использование разрешено. Попробуйте еще раз.';
  @override
  String get adRewardNotCompleted =>
      'Объявление не было завершено. Никакого дополнительного использования не было предоставлено.';
  @override
  String get adRewardDailyCapReached =>
      'Вы достигли сегодняшнего лимита вознаграждений за рекламу.';
  @override
  String get geminiTimeout =>
      'Время запроса истекло. Проверьте подключение и повторите попытку.';
  @override
  String get geminiServerError =>
      'Сервис AI временно недоступен. Пожалуйста, повторите попытку позже.';
  @override
  String get imageNotRecognized =>
      'Изображение не распознано. Улучшите освещение или попробуйте другой ракурс.';
  @override
  String get imageNotPantry =>
      'Холодильник или кладовая не видны. Пожалуйста, сфотографируйте напрямую.';
  @override
  String get parseError =>
      'Не удалось проанализировать ответ ИИ. Пожалуйста, отсканируйте еще раз.';
  @override
  String get modelUnavailable =>
      'Модель AI недоступна. Проверьте доступ к API.';
  @override
  String get genericError => 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
  @override
  String get imageDecodeError => 'Не удалось прочитать фото. Попробуйте другое изображение.';
  @override
  String get authSubtitle => 'Умный доступ к кладовой';
  @override
  String get authInitializing => 'Подготовка сеанса…';
  @override
  String get emailLabel => 'Электронная почта';
  @override
  String get passwordLabel => 'Пароль';
  @override
  String get emailRequired => 'Требуется электронная почта';
  @override
  String get emailInvalid => 'Неверный адрес электронной почты';
  @override
  String get passwordMin => 'Минимум 6 символов';
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
  String get signIn => 'Войти';
  @override
  String get signUp => 'Зарегистрироваться';
  @override
  String get toggleToSignIn => 'У вас уже есть аккаунт? Войти';
  @override
  String get toggleToSignUp => 'Впервые здесь? Зарегистрироваться';
  @override
  String get guestContinue => 'Продолжить в качестве гостя';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Аккаунт создан. Откройте ссылку подтверждения в своем почтовом ящике; приложение уведомит вас о подтверждении.';
  @override
  String get emailConfirmedSuccess =>
      'Ваш адрес электронной почты подтвержден. Ваш аккаунт готов.';
  @override
  String get emailVerifiedLabel => 'Адрес электронной почты подтвержден';
  @override
  String get proEmailRequiredTitle => 'Учетная запись электронной почты необходима для версии Pro';
  @override
  String get proEmailRequiredBody =>
      'Гостевые аккаунты не могут приобрести Pro. Создайте учетную запись электронной почты, чтобы сохранить свои данные и разблокировать выставление счетов.';
  @override
  String get proLinkAccountAction => 'Создать учетную запись и продолжить';
  @override
  String get proAccountLinked =>
      'Аккаунт привязан. Вы можете продолжить оформление заказа Pro сейчас.';
  @override
  String get supabaseNotConfigured =>
      'Сервис аккаунта недоступен. Пожалуйста, повторите попытку позже.';
  @override
  String get privacyTitle => 'Данные и конфиденциальность';
  @override
  String get privacySubtitle => 'Фотографии и данные аккаунта';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Изображения квитанций не хранятся на сервере; извлекается только список продуктов.\\n\\n'
      'После входа в систему данные сканирования и актуальности могут быть сохранены в вашей учетной записи.'
      'Бесплатный план показывает рекламу Google AdMob; В версии Pro нет рекламы.\\n\\n'
      'Откройте политику конфиденциальности в Интернете, чтобы получить полный текст.';
  @override
  String get privacyViewOnline => 'Открытая политика конфиденциальности';
  @override
  String get pantryHistoryTitle => 'История кладовой';
  @override
  String get pantryHistoryEmpty =>
      'Сохраненных сканирований пока нет.\\nСканируйте холодильник, чтобы создать историю.';
  @override
  String get pantryHistorySubtitle => 'Сканирование, сохраненное в облаке';
  @override
  String get splashTagline => 'Производство и кладовая — одно приложение';
  @override
  String get splashLoading => 'Загрузка…';
  @override
  String get onboardingSkip => 'Пропускать';
  @override
  String get onboardingNext => 'Следующий';
  @override
  String get onboardingStart => 'Начинать';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Недавние сканы';
  @override
  String get cameraTapToOpen => 'Нажмите значок, чтобы открыть камеру';
  @override
  String get cameraOrGalleryHint => 'Откройте камеру или выберите из галереи.';
  @override
  String get captureOrGalleryHint => 'Сфотографируйте или выберите из галереи';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Закрыть камеру';
  @override
  String get noIngredients => 'Ингредиенты не обнаружены.';
  @override
  String get recipeInstructions => 'Инструкции';
  @override
  String get untitledRecipe => 'Рецепт без названия';
  @override
  String get genericLoadError => 'Что-то пошло не так. Пожалуйста, попробуйте еще раз.';
  @override
  String get scanConfirmTitle => 'Подтвердить фото';
  @override
  String get scanConfirmSubtitle =>
      'Отправить это фото? Анализ рецепта начнется после вашего подтверждения.';
  @override
  String get scanConfirmAnalyze => 'Анализировать';
  @override
  String get scanConfirmCancel => 'Отмена';
  @override
  String get scanConfirmRetake => 'Пересдать';
  @override
  String get scanConfirmPickOther => 'Выбрать другой';
  @override
  String get clearRecentScans => 'Очистить недавние сканирования';
  @override
  String get clearRecentScansSubtitle => 'Удаляет локальную историю на устройстве';
  @override
  String get clearRecentScansConfirmTitle => 'Очистить недавние сканы?';
  @override
  String get clearRecentScansConfirmBody =>
      'Невозможно отменить. Избранное не затрагивается.';
  @override
  String get clearRecentScansDone => 'Последние сканы удалены.';
  @override
  String get deleteAction => 'Удалить';
  @override
  String get imageQualityTitle => 'Низкое качество фото';
  @override
  String get imageQualityDark => 'Изображение слишком темное. Добавьте свет и повторите попытку.';
  @override
  String get imageQualityBlurry =>
      'Изображение может быть размытым. Держитесь устойчиво и повторите попытку.';
  @override
  String get imageQualityContinue => 'Продолжить в любом случае';
  @override
  String get imageQualityRetake => 'Пересдать';
  @override
  String receiptQueueTitle(int count) => '$count квитанции ждут в автономном режиме';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Квитанция ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Процесс';
  @override
  String get receiptQueuedOffline =>
      'Офлайн. Квитанция поставлена ​​в очередь; процесс при подключении.';
  @override
  String get receiptLowConfidenceBlock =>
      'Отредактируйте элементы с низким уровнем достоверности перед сохранением (значок карандаша).';
  @override
  String get unifiedPantryTitle => 'Единый инвентарь';
  @override
  String get unifiedPantryEmpty => 'Товаров и сканов пока нет.';
  @override
  String get searchHint => 'Поиск продуктов…';
  @override
  String get navShopping => 'Шоппинг';
  @override
  String get shoppingAddHint => 'Добавить недостающий элемент';
  @override
  String get shoppingEmpty => 'Ваш список покупок пуст.';
  @override
  String get shoppingClearDone => 'Очистить завершено';
  @override
  String get shoppingDoneSection => 'Сделанный';
  @override
  String get shoppingAddFromRecipe => 'Добавить товары, которых нет в наличии';
  @override
  String get freshnessViewCalendar => 'Календарь';
  @override
  String get freshnessViewList => 'Список';
  @override
  String get cookToday => 'Что приготовить сегодня?';
  @override
  String get cookTodayNoUrgent =>
      'Никаких срочных дел. Сканируйте чек, чтобы отслеживать свежесть.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Виден при сканировании, но не в инвентаре чеков: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Экспортировать локальные данные';
  @override
  String get exportLocalDataSubtitle => 'Копирует JSON в буфер обмена.';
  @override
  String get exportLocalDataDone => 'Данные скопированы в буфер обмена';
  @override
  String get clearLocalData => 'Удалить локальные данные';
  @override
  String get clearLocalDataSubtitle =>
      'Свежесть, покупки, предпочтения (необратимые)';
  @override
  String get clearLocalDataConfirmTitle => 'Удалить локальные данные?';
  @override
  String get clearLocalDataConfirmBody =>
      'Инвентарь свежести и список покупок удалены с устройства.';
  @override
  String get clearLocalDataDone => 'Локальные данные удалены.';
  @override
  String get settingsTitle => 'Настройки';
  @override
  String get languageTitle => 'Язык';
  @override
  String get languageSubtitle => 'Язык приложения · 27 языков';
  @override
  String get localePreparingTitle => 'Обновление языка';
  @override
  String get localePreparingSubtitle =>
      'Перевод рецептов и результатов сканирования…';
  @override
  String get dietTitle => 'Диетические предпочтения';
  @override
  String get dietSubtitle => 'Применимо к предложениям рецептов';
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
  String get aiUsageLimitsLoading => 'Загрузка…';
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
  String get aiUsageLabelPantry => 'Кладовая';
  @override
  String get aiUsageLabelReceipt => 'Квитанция';
  @override
  String get aiUsageLabelRecipe => 'Рецепт';
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
  String get storeUnavailable => 'Магазин недоступен. Попробуйте позже.';
  @override
  String get proProductIdsNotConfigured => 'Идентификаторы продуктов Pro не настроены.';
  @override
  String get noProProductsFound => 'Нет доступных продуктов Pro для покупки.';
  @override
  String get purchaseFlowFailed => 'Не удалось начать покупку.';
  @override
  String get purchaseCompletedProActivated => 'Покупка завершена. План Pro активирован.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Покупка завершена. Не удалось проверить; повторите позже.';
  @override
  String get purchaseFailed => 'Покупка не удалась.';
  @override
  String get restorePurchases => 'Восстановить покупки';
  @override
  String get restorePurchasesStarted => 'Проверка предыдущих покупок в Play Store…';
  @override
  String get nutritionTitle => 'Питание (оценка)';
  @override
  String get nutritionPerServing => 'за порцию';
  @override
  String get nutritionCalories => 'Калории';
  @override
  String get nutritionProtein => 'Белок';
  @override
  String get nutritionCarbs => 'Углеводы';
  @override
  String get nutritionFat => 'Толстый';
  @override
  String get nutritionEstimateNote =>
      'Только оценка ИИ; не медицинские или диетические рекомендации.';
  @override
  String get barcodeScanTitle => 'Сканировать штрих-код';
  @override
  String get barcodeScanHint =>
      'Выровняйте штрих-код в рамке. Поиск продуктов через Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Товар не найден. Вместо этого попробуйте сканировать чек или холодильник.';
  @override
  String get barcodeConfirmTitle => 'Подтвердить продукт';
  @override
  String get barcodeAddToPantry => 'Добавить в список свежести';
  @override
  String get navScan => 'Сканировать';
  @override
  String get captureTypeFridge => 'Холодильник';
  @override
  String get captureTypeReceipt => 'Квитанция';
  @override
  String get captureTypeBarcode => 'Штрих-код';
  @override
  String get sectionAccount => 'Счет';
  @override
  String get sectionPreferences => 'Предпочтения';
  @override
  String get sectionApp => 'Приложение';
  @override
  String get sectionPrivacy => 'Конфиденциальность';
  @override
  String get sessionTitle => 'Сессия';
  @override
  String get guestUser => 'Гость пользователь';
  @override
  String get favoritesTitle => 'Избранное';
  @override
  String get favoritesSubtitle => 'Рецепты, которые вы сохранили';
  @override
  String get freshnessInventorySubtitle =>
      'Товары по чекам и срокам годности';
  @override
  String get pantrySyncSubtitle => 'Извлекайте данные о свежести из облака';
  @override
  String get showOnboardingAgain => 'Показать ознакомительный тур еще раз';
  @override
  String get signOut => 'выход';
  @override
  String get scanSubtitleSmart => 'Умное сканирование кладовой';
  @override
  String get scanSubtitleReceipt => 'Сканирование чеков и отслеживание свежести';
  @override
  String get tooltipSettings => 'Настройки';
  @override
  String get tooltipToggleGuide => 'Переключить направляющую рамки';
  @override
  String get tooltipModesAbout => 'О режимах сканирования';
  @override
  String get galleryLabel => 'Галерея';
  @override
  String get cameraLoading => 'Подготовка камеры…';
  @override
  String get cameraUnavailable =>
      'Камера недоступна.\\nПроверьте разрешения и повторите попытку.';
  @override
  String get captureFailed =>
      'Захватить не удалось. Проверьте разрешение камеры и повторите попытку.';
  @override
  String get receiptCaptureAlign =>
      'Выровняйте чек в вертикальной рамке и запечатлейте';
  @override
  String get receiptCameraHint =>
      'Откройте камеру или выберите фотографию чека из галереи.';
  @override
  String get pickPhotoHint => 'Нажмите кнопку, чтобы выбрать фотографию';
  @override
  String get desktopGalleryHint =>
      'Режим рабочего стола — выберите фотографию холодильника из галереи.';
  @override
  String get noCameraOnDevice => 'На этом устройстве не найдена камера.';
  @override
  String get openCameraButton => 'Открыть камеру';
  @override
  String get pickPhotoButton => 'Выбрать фото';
  @override
  String get overlayGuideOn => 'Руководство по';
  @override
  String get overlayGuideOff => 'Отправляйтесь';
  @override
  String get modeSheetTitle => 'Режимы сканирования';
  @override
  String get modeSheetSubtitle =>
      'Выберите перед захватом; это меняет правила рецептов ИИ.';
  @override
  String get scanModeQuickLabel => 'Быстрое сканирование';
  @override
  String get scanModeQuickSubtitle => 'Рецепты до 15 мин.';
  @override
  String get scanModeQuickDesc =>
      'Практичные блюда на каждый день. Все рецепты занимают не более 15 минут; простые приемы (одна сковорода, салат, быстрая обжарка).';
  @override
  String get scanModeSurvivalLabel => 'Спасать';
  @override
  String get scanModeSurvivalSubtitle => 'Сначала используйте предметы с истекающим сроком годности';
  @override
  String get scanModeSurvivalDesc =>
      'Уменьшает отходы. Отдает приоритет предметам, которые выглядят близкими к порче. Необязательные элементы поля подсказки имеют приоритет.';
  @override
  String get scanModeChefLabel => 'Режим шеф-повара';
  @override
  String get scanModeChefSubtitle => 'Изысканный и подробный';
  @override
  String get scanModeChefDesc =>
      'Более изысканные рецепты. Слоистые методы, более длительное время приготовления; как минимум два рецепта отмечены как жесткие.';
  @override
  String get scanModeQuickBestFor =>
      'Вечерний обед с минимумом ингредиентов и времени';
  @override
  String get scanModeQuickExamples =>
      '• Омлет за 10 минут.\\n• Макароны в одной кастрюле.\\n• Обертка или миска, не требующая готовки.';
  @override
  String get scanModeSurvivalBestFor =>
      'Использование предметов до истечения срока их годности и сокращение отходов';
  @override
  String get scanModeSurvivalExamples =>
      '• Очищенный овощной суп.\\n• Фриттата, приготовленная в духовке.\\n• Оставшийся жареный рис.';
  @override
  String get scanModeChefBestFor =>
      'Особые ужины, гости или изучение техники';
  @override
  String get scanModeChefExamples =>
      '• Белковый соус для сковороды.\\n• Хрустящая + сливочная тарелка.\\n• Карамелизированный овощной гарнир.';
  @override
  String get scanModeIdealForLabel => 'Лучшее для';
  @override
  String get scanModeExamplesLabel => 'Примеры блюд';
  @override
  String get survivalHintAddFromPantry => 'Добавить из свежести';
  @override
  String get filterAll => 'Все';
  @override
  String get filterCritical => 'Критический';
  @override
  String get filterWarning => 'Предупреждение';
  @override
  String get filterSafe => 'Безопасный';
  @override
  String get recipesScreenTitle => 'Рецепты';
  @override
  String get copyRecipe => 'Копировать';
  @override
  String get shareRecipe => 'Делиться';
  @override
  String get recipeCopiedSnack => 'Рецепт скопирован в буфер обмена.';
  @override
  String get survivalHintTitle => 'Срок действия скоро истекает';
  @override
  String get survivalHintOptional => 'Необязательно — например. молоко, помидоры, йогурт';
  @override
  String get survivalHintPlaceholder => 'Разделять запятыми';
  @override
  String get scanConfirmReceiptLabel => 'Скан чека';
  @override
  String get scanSavedHistory => 'Скан сохранен в истории кладовой.';
  @override
  String get scanSaveFailedPrefix => 'Не удалось сохранить скан';
  @override
  String get daysUnit => 'дни';
  @override
  String get okButton => 'ХОРОШО';
  @override
  String get recipesDetectedIngredients => 'Обнаруженные ингредиенты';
  @override
  String recipesAiCount(int count) => 'Рецепты ИИ ·$count';
  @override
  String get galleryPickMessage => 'Выберите фотографию из галереи';
  @override
  String get favoritesEmpty =>
      'Любимых рецептов пока нет.\\nНажмите на сердечко, чтобы увидеть результаты рецептов.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Рецепт ${index + 1}' : 'Рецепт';

  @override
  String get timeAgoJustNow => 'Прямо сейчас';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}м назад';
  @override
  String timeAgoHours(int hours) => '${hours}час назад';
  @override
  String timeAgoDays(int days) => '${days}день назад';
  @override
  String get daysExpired => 'Истекший';
  @override
  String get daysToday => 'Сегодня';
  @override
  String get daysTomorrow => 'Завтра';
  @override
  String daysCount(int days) => '$days дни';
  @override
  String unifiedDaysRemaining(int days) => '$days осталось дней';
  @override
  String productCount(int count) => '$count предметы';
  @override
  String get unifiedSourceReceipt => 'Квитанция';
  @override
  String get unifiedSourceScan => 'Сканировать';
  @override
  String unifiedLastScan(String date) => 'Последнее сканирование ·$date';
  @override
  String get receiptFieldProductName => 'Название продукта';
  @override
  String get receiptFieldQuantity => 'Количество';
  @override
  String get receiptFieldCategory => 'Категория';
  @override
  String expiryApprox(int days) => 'Лучше до ~$days дни';
  @override
  String barcodeEan(String code) => 'ЕАН$code';
  @override
  String get shoppingListAddedSnack =>
      'Недостающие ингредиенты добавлены в список покупок';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ингредиенты ·$recipes рецепты';
  @override
  String get favoriteAddTooltip => 'Добавить в избранное';
  @override
  String get favoriteRemoveTooltip => 'Удалить из избранного';
  @override
  String get favoriteAddedSnack => 'Добавлено в избранное';
  @override
  String get favoriteRemovedSnack => 'Удалено из избранного';
  @override
  String get onboardingScanTitle => 'Сканируйте свою кладовку';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Список покупок';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Избранное и недавние сканы';
  @override
  String get onboardingFavoritesBody =>
      'Сохраняйте рецепты, которые вам нравятся. Последние сканы быстро открываются с главного экрана.';
  @override
  String get onboardingCloudTitle => 'История облака';
  @override
  String get onboardingCloudBody =>
      'Войдите, чтобы сохранить историю сканирования в своей учетной записи и вернуться в любое время.';
  @override
  String get onboardingPermissionsTitle => 'Камера и уведомления';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef нужен доступ к камере для сканирования холодильника, чеков и штрихкодов. Необязательные уведомления напоминают о скором сроке годности.';
  @override
  String get emptyStateScanReceipt => 'Сканировать чек';
  @override
  String get emptyStateStartScan => 'Начать сканирование';
  @override
  String get manageSubscriptions => 'Управление подпиской';
  @override
  String get notificationCriticalChannelName => 'Оповещения о свежести';
  @override
  String get notificationCriticalChannelDesc => 'Срок действия товаров скоро истекает';
  @override
  String get notificationDailyChannelName => 'Ежедневная сводка';
  @override
  String get notificationDailyChannelDesc => 'Ежедневное напоминание о свежести';
  @override
  String get notificationCriticalTitle => 'Срок действия товаров скоро истекает';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Проверьте панель «Свежесть».';
  @override
  String get notificationDailyTitle => 'Проверка свежести';
  @override
  String get notificationDailyBody =>
      'Просмотрите предметы, которые вам следует использовать сегодня.';
  @override
  String get widgetFreshnessGood => 'Свежесть выглядит хорошо';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count срок действия товаров может истечь сегодня';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical критический ·$warning предупреждение';
  @override
  String get categoryDairy => 'Молочный';
  @override
  String get categoryMeat => 'Мясо/рыба';
  @override
  String get categoryFruit => 'Фрукты';
  @override
  String get categoryVegetable => 'Овощной';
  @override
  String get categoryBeverage => 'Напиток';
  @override
  String get categoryBakery => 'Пекарня';
  @override
  String get categoryPantry => 'Кладовая';
  @override
  String calendarMonthName(int month) => const [
        'январь',
        'февраль',
        'Маршировать',
        'апрель',
        'Может',
        'Июнь',
        'Июль',
        'Август',
        'Сентябрь',
        'Октябрь',
        'ноябрь',
        'декабрь',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Рецепты';
  @override
  String get recipesPlaceholderBody =>
      'Результаты рецепта появятся здесь после успешного сканирования.';
  @override
  String get recipeSamplePlating => 'Образец покрытия';
  @override
  String get recipeShareInstructionsHeader => 'Инструкции:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Эксп.';
  @override
  String get themeTitle => 'Тема';
  @override
  String get themeSubtitle => 'Цветовая палитра и фон';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'По умолчанию темно-зеленый';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Холодные синие тона';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Теплые янтарные акценты';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Фиолетовый акцент темный';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Светлый фон';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Теплый кремовый с оранжевым акцентом';
}
