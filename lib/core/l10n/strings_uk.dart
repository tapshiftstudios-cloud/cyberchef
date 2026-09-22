import 'strings_base.dart';

class StringsUk implements StringsBase {
  const StringsUk();

  @override
  String get analysisTitle => 'Розбір комори';
  @override
  String get stepPrepareImage => 'Підготовка фото…';
  @override
  String get stepAnalyzeAi => 'Виявлення інгредієнтів…';
  @override
  String get stepBuildRecipes => 'Рецепти будівництва…';
  @override
  String get receiptAnalysisTitle => 'Квитанція про читання';
  @override
  String get stepReceiptPrepare => 'Підготовка зображення квитанції…';
  @override
  String get stepReceiptOcr => 'Розпізнавання елементів…';
  @override
  String get stepReceiptInfer => 'Оцінка терміну зберігання…';
  @override
  String get receiptNotRecognized =>
      'Не вдалося прочитати квитанцію. Спробуйте зробити більш чітке та пласке фото.';
  @override
  String get receiptNotDetected =>
      'Квитанцію не виявлено. Вирівняйте квитанцію в рамці.';
  @override
  String get receiptConfirmTitle => 'Підтвердьте отримання товарів';
  @override
  String get receiptConfirmSubtitle =>
      'Виберіть елементи для додавання. Утримуйте, щоб редагувати.';
  @override
  String get receiptConfirmSave => 'Додати в комору';
  @override
  String get receiptSelectOne => 'Виберіть принаймні один предмет.';
  @override
  String get receiptSaved => 'Предмети додано до інвентарю свіжості';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Надіслати цю фотографію квитанції? Аналіз OCR починається після підтвердження.';
  @override
  String get navFreshness => 'Свіжість';
  @override
  String get freshnessPanelTitle => 'Панель свіжості';
  @override
  String get freshnessCritical => 'Критичний (0–2 дні)';
  @override
  String get freshnessWarning => 'Попередження (3–5 днів)';
  @override
  String get freshnessSafe => 'Безпечний (6+ днів)';
  @override
  String get freshnessEmpty =>
      'Відстежуваних товарів ще немає. Відскануйте квитанцію, щоб створити інвентар.';
  @override
  String get freshnessListTitle => 'Інвентаризація свіжості';
  @override
  String get freshnessListEmpty => 'Немає елементів у цьому фільтрі.';
  @override
  String get freshnessSuggestRecipes => 'Запропонуйте рецепти з ними';
  @override
  String get savingsPanelTitle => 'Панель збереження';
  @override
  String get savingsPanelEmptyHint =>
      'Позначайте продукти, термін придатності яких майже закінчився, як «Приготовлена ​​їжа», щоб відстежувати тут відходи.';
  @override
  String get savingsStatItems => 'Врятували';
  @override
  String get savingsStatWaste => 'Попереджено утворення відходів';
  @override
  String get savingsStatMoney => 'Приблизно заощадження';
  @override
  String get savingsDashboardTitle => 'Аналітика заощаджень';
  @override
  String get savingsDashboardSubtitle =>
      'Підсумок їжі, яку ви врятували зі смітника — цього місяця.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 інгредієнт врятовано від сміття цього місяця'
          : '$count інгредієнти, врятовані від відходів цього місяця';
  @override
  String savingsKgPrevented(String kg) => 'Попередження харчових відходів:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Приблизний фінансовий прибуток:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Останні 4 тижні';
  @override
  String get savingsRecentTitle => 'Останні порятунки';
  @override
  String get savingsEmptySubtitle =>
      'Записів ще немає. Коли ви використовуєте критичний або попереджувальний елемент, він з’являється тут.';
  @override
  String get savingsHowItWorks =>
      'Предмети, використані протягом 5 днів після закінчення терміну придатності, вважаються врятованими. Вага та вартість оцінюються на основі середніх показників категорії.';
  @override
  String get pantryNamesLocaleNote =>
      'Назви продуктів і магазинів відображаються у вашій квитанції як збережені; загальні терміни показані англійською мовою.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Використовувався в останній день' : 'Використовується з$days залишилося днів';
  @override
  String get savingsMealMade => 'Їжа зроблена';
  @override
  String savingsMealMadeConfirm(String name) => 'Марк$name як спожито?';
  @override
  String savingsRescuedSnack(String money) => 'Економія зафіксована ·$money';
  @override
  String get freshnessRecipeTitle => 'Приготування рецептів';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Для рецептів потрібен принаймні один елемент.';
  @override
  String get freshnessCriticalBanner => 'Термін дії скоро закінчується';
  @override
  String get freshnessViewAll => 'Переглянути всі';
  @override
  String get receiptCaptureHints =>
      'Тримайте квитанцію рівно, добре освітлення. Усі лінії видно у вертикальній рамці.';
  @override
  String get receiptPurchaseDate => 'Дата покупки';
  @override
  String get receiptTapToEdit => 'Редагувати';
  @override
  String get receiptEditItem => 'Редагувати елемент';
  @override
  String get receiptEditSave => 'зберегти';
  @override
  String get receiptExpiryDaysLabel => 'Орієнтовний термін зберігання (днів)';
  @override
  String get receiptMergedSnack => 'Деякі елементи об’єднано з існуючими записами';
  @override
  String get receiptCloudSyncFailed => 'Не вдалося зберегти в хмару';
  @override
  String get receiptCloudSynced => 'Елементи, синхронізовані з хмарою';
  @override
  String get pantrySyncAction => 'Синхронізувати дані про актуальність';
  @override
  String get pantrySyncDone => 'Дані про свіжість оновлено';
  @override
  String get pantrySyncFailed => 'Помилка синхронізації';
  @override
  String get freshnessNotificationsTitle => 'Сповіщення про свіжість';
  @override
  String get freshnessNotificationsSubtitle =>
      'Критичні предмети та щоденне нагадування';
  @override
  String get freshnessNotificationTimeLabel => 'Щоденний час нагадування';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Щодня о$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Цього тижня:$critical критичний,$warning елементи попередження. Спершу використовуйте ці.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Помилка мережі. Перевірте підключення та повторіть спробу.';
  @override
  String get geminiQuotaExceeded =>
      'Перевищено квоту AI. Зачекайте кілька хвилин і повторіть спробу.';
  @override
  String get geminiBillingDepleted =>
      'Кредити на передоплату Google AI Studio вичерпано. Щоб відновити функції штучного інтелекту, додайте платіж на ai.google.dev.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'Автоматична повторна спроба може бути доступна в$minutes хв.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Досягнуто щоденного ліміту перекладу AI (3/3). Рецепти використовують базовий переклад до завтра.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Ви маєте$remaining Переклад(и) AI залишився сьогодні.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Досягнуто щоденного ліміту сканування комори (3). Спробуйте ще раз завтра.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Досягнуто денного ліміту сканування чеків (2). Спробуйте ще раз завтра.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Досягнуто денного ліміту створення рецептів (3). Спробуйте ще раз завтра.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Будь ласка, зачекайте$seconds секунди перед повторною спробою.';
  @override
  String get adRewardTitlePantry => 'Досягнуто ліміту сканування комори';
  @override
  String get adRewardTitleReceipt => 'Досягнуто ліміту сканування квитанції';
  @override
  String get adRewardTitleRecipe => 'Досягнуто ліміту створення рецептів';
  @override
  String get adRewardSubtitle =>
      'Перегляньте коротку рекламу, щоб отримати +1 додаткове використання сьогодні (до 3 на день).';
  @override
  String get adRewardWatchButton => 'Переглянути рекламу (+1 використання)';
  @override
  String get adRewardGranted => 'Додаткове використання надано. Спробуйте знову.';
  @override
  String get adRewardNotCompleted =>
      'Оголошення не завершено. Додаткове використання не надано.';
  @override
  String get adRewardDailyCapReached =>
      'Ви досягли сьогоднішнього ліміту винагород за рекламу.';
  @override
  String get geminiTimeout =>
      'Час очікування запиту минув. Перевірте підключення та повторіть спробу.';
  @override
  String get geminiServerError =>
      'Служба ШІ тимчасово недоступна. Спробуйте пізніше.';
  @override
  String get imageNotRecognized =>
      'Зображення не розпізнано. Покращте освітлення або спробуйте інший ракурс.';
  @override
  String get imageNotPantry =>
      'Холодильник чи комора не видно. Будь ласка, фотографуйте безпосередньо.';
  @override
  String get parseError =>
      'Не вдалося проаналізувати відповідь ШІ. Відскануйте ще раз.';
  @override
  String get modelUnavailable =>
      'Модель AI недоступна. Перевірте доступ до API.';
  @override
  String get genericError => 'Щось пішло не так. Спробуйте ще раз.';
  @override
  String get imageDecodeError => 'Не вдалося прочитати фото. Спробуйте інше зображення.';
  @override
  String get authSubtitle => 'Розумний доступ до комори';
  @override
  String get authInitializing => 'Підготовка сесії…';
  @override
  String get emailLabel => 'Електронна пошта';
  @override
  String get passwordLabel => 'Пароль';
  @override
  String get emailRequired => 'Потрібна електронна адреса';
  @override
  String get emailInvalid => 'Недійсна електронна адреса';
  @override
  String get passwordMin => 'Мінімум 6 символів';
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
  String get signIn => 'Увійдіть';
  @override
  String get signUp => 'Створити акаунт';
  @override
  String get toggleToSignIn => 'Вже маєте акаунт? Увійдіть';
  @override
  String get toggleToSignUp => 'Новий тут? Створити акаунт';
  @override
  String get guestContinue => 'Продовжити як гість';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Обліковий запис створено. Відкрийте посилання для підтвердження в папці "Вхідні"; програма повідомить вас про перевірку.';
  @override
  String get emailConfirmedSuccess =>
      'Ваш email підтверджено. Ваш обліковий запис готовий.';
  @override
  String get emailVerifiedLabel => 'Електронна адреса підтверджена';
  @override
  String get proEmailRequiredTitle => 'Обліковий запис електронної пошти потрібен для Pro';
  @override
  String get proEmailRequiredBody =>
      'Облікові записи гостей не можуть придбати Pro. Створіть обліковий запис електронної пошти, щоб зберігати свої дані та розблокувати виставлення рахунків.';
  @override
  String get proLinkAccountAction => 'Створити обліковий запис і продовжити';
  @override
  String get proAccountLinked =>
      'Обліковий запис пов’язано. Ви можете продовжити оформлення замовлення Pro зараз.';
  @override
  String get supabaseNotConfigured =>
      'Служба облікового запису недоступна. Спробуйте пізніше.';
  @override
  String get privacyTitle => 'Дані та конфіденційність';
  @override
  String get privacySubtitle => 'Фотографії та облікові дані';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Зображення квитанцій не зберігаються на сервері; витягується лише список продуктів.\\n\\n'
      'Після входу в обліковий запис дані про сканування та свіжість можуть зберігатися.'
      'Безкоштовний план показує рекламу Google AdMob; У Pro немає реклами.\\n\\n'
      'Відкрийте політику конфіденційності онлайн, щоб переглянути повний текст.';
  @override
  String get privacyViewOnline => 'Відкрита політика конфіденційності';
  @override
  String get pantryHistoryTitle => 'Історія комори';
  @override
  String get pantryHistoryEmpty =>
      'Ще немає збережених сканувань.\\nВідскануйте свій холодильник, щоб створити історію.';
  @override
  String get pantryHistorySubtitle => 'Скани, збережені в хмарі';
  @override
  String get splashTagline => 'Продукти та комора — один додаток';
  @override
  String get splashLoading => 'Завантаження…';
  @override
  String get onboardingSkip => 'Пропустити';
  @override
  String get onboardingNext => 'Далі';
  @override
  String get onboardingStart => 'старт';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Останні скани';
  @override
  String get cameraTapToOpen => 'Торкніться значка, щоб відкрити камеру';
  @override
  String get cameraOrGalleryHint => 'Відкрийте камеру або виберіть із галереї';
  @override
  String get captureOrGalleryHint => 'Зніміть або виберіть із галереї';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Закрити камеру';
  @override
  String get noIngredients => 'No ingredients detected.';
  @override
  String get recipeInstructions => 'Інструкції';
  @override
  String get untitledRecipe => 'Рецепт без назви';
  @override
  String get genericLoadError => 'Щось пішло не так. Спробуйте ще раз.';
  @override
  String get scanConfirmTitle => 'Підтвердити фото';
  @override
  String get scanConfirmSubtitle =>
      'Надіслати це фото? Аналіз рецепта починається після підтвердження.';
  @override
  String get scanConfirmAnalyze => 'Аналізуйте';
  @override
  String get scanConfirmCancel => 'Скасувати';
  @override
  String get scanConfirmRetake => 'Перезняти';
  @override
  String get scanConfirmPickOther => 'Виберіть інший';
  @override
  String get clearRecentScans => 'Очистити останні сканування';
  @override
  String get clearRecentScansSubtitle => 'Видалення локальної історії на пристрої';
  @override
  String get clearRecentScansConfirmTitle => 'Очистити останні сканування?';
  @override
  String get clearRecentScansConfirmBody =>
      'Не можна скасувати. Вибране не впливає.';
  @override
  String get clearRecentScansDone => 'Останні сканування видалено';
  @override
  String get deleteAction => 'Видалити';
  @override
  String get imageQualityTitle => 'Низька якість фото';
  @override
  String get imageQualityDark => 'Зображення надто темне. Додайте світло та повторіть спробу.';
  @override
  String get imageQualityBlurry =>
      'Зображення може бути розмитим. Тримайся і повтори.';
  @override
  String get imageQualityContinue => 'Все одно продовжуй';
  @override
  String get imageQualityRetake => 'Перезняти';
  @override
  String receiptQueueTitle(int count) => '$count квитанції в режимі офлайн';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Квитанція ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'процес';
  @override
  String get receiptQueuedOffline =>
      'Офлайн. Надходження в черзі; процес при підключенні.';
  @override
  String get receiptLowConfidenceBlock =>
      'Відредагуйте малонадійні елементи перед збереженням (значок олівця).';
  @override
  String get unifiedPantryTitle => 'Уніфікований інвентар';
  @override
  String get unifiedPantryEmpty => 'Елементів чи сканованих матеріалів ще немає.';
  @override
  String get searchHint => 'Пошук продуктів…';
  @override
  String get navShopping => 'Шопінг';
  @override
  String get shoppingAddHint => 'Додайте відсутній елемент';
  @override
  String get shoppingEmpty => 'Ваш список покупок порожній.';
  @override
  String get shoppingClearDone => 'Очищення завершено';
  @override
  String get shoppingDoneSection => 'Готово';
  @override
  String get shoppingAddFromRecipe => 'Додайте предмети, яких немає в інвентарі квитанцій';
  @override
  String get freshnessViewCalendar => 'Календар';
  @override
  String get freshnessViewList => 'Список';
  @override
  String get cookToday => 'Що приготувати сьогодні?';
  @override
  String get cookTodayNoUrgent =>
      'Немає термінових речей. Відскануйте чек, щоб відстежити свіжість.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Відскановано, але не в інвентарі квитанцій: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Експорт локальних даних';
  @override
  String get exportLocalDataSubtitle => 'Копіює JSON у буфер обміну';
  @override
  String get exportLocalDataDone => 'Дані скопійовано в буфер обміну';
  @override
  String get clearLocalData => 'Видалити локальні дані';
  @override
  String get clearLocalDataSubtitle =>
      'Свіжість, покупки, уподобання (безповоротно)';
  @override
  String get clearLocalDataConfirmTitle => 'Видалити локальні дані?';
  @override
  String get clearLocalDataConfirmBody =>
      'Інвентар свіжості та список покупок видалено з пристрою.';
  @override
  String get clearLocalDataDone => 'Локальні дані очищено';
  @override
  String get settingsTitle => 'Налаштування';
  @override
  String get languageTitle => 'Мова';
  @override
  String get languageSubtitle => 'Мова програми · 27 мов';
  @override
  String get localePreparingTitle => 'Оновлення мови';
  @override
  String get localePreparingSubtitle =>
      'Переклад рецептів і результатів сканування…';
  @override
  String get dietTitle => 'Перевага дієти';
  @override
  String get dietSubtitle => 'Застосовується до пропозицій рецептів';
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
  String get aiUsageLimitsLoading => 'Завантаження…';
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
  String get aiUsageLabelPantry => 'Комора';
  @override
  String get aiUsageLabelReceipt => 'розписка';
  @override
  String get aiUsageLabelRecipe => 'рецепт';
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
  String get storeUnavailable => 'Магазин недоступний. Спробуйте пізніше.';
  @override
  String get proProductIdsNotConfigured => 'Ідентифікатори продуктів Pro не налаштовані.';
  @override
  String get noProProductsFound => 'Немає доступних продуктів Pro для покупки.';
  @override
  String get purchaseFlowFailed => 'Не вдалося розпочати покупку.';
  @override
  String get purchaseCompletedProActivated => 'Покупку завершено. План Pro активовано.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Покупку завершено. Не вдалося перевірити; спробуйте знову незабаром.';
  @override
  String get purchaseFailed => 'Покупка не вдалася.';
  @override
  String get restorePurchases => 'Відновити покупки';
  @override
  String get restorePurchasesStarted => 'Перевірка попередніх покупок у Play Store…';
  @override
  String get nutritionTitle => 'Харчування (оцінка)';
  @override
  String get nutritionPerServing => 'на порцію';
  @override
  String get nutritionCalories => 'Калорії';
  @override
  String get nutritionProtein => 'білок';
  @override
  String get nutritionCarbs => 'вуглеводи';
  @override
  String get nutritionFat => 'Жир';
  @override
  String get nutritionEstimateNote =>
      'лише оцінка AI; не медичні чи дієтичні поради.';
  @override
  String get barcodeScanTitle => 'Сканувати штрих-код';
  @override
  String get barcodeScanHint =>
      'Вирівняти штрих-код у рамці. Пошук продукту через Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Товар не знайдено. Натомість спробуйте сканувати квитанцію чи холодильник.';
  @override
  String get barcodeConfirmTitle => 'Підтвердити товар';
  @override
  String get barcodeAddToPantry => 'Додайте до інвентарю свіжості';
  @override
  String get navScan => 'Сканувати';
  @override
  String get captureTypeFridge => 'холодильник';
  @override
  String get captureTypeReceipt => 'розписка';
  @override
  String get captureTypeBarcode => 'Штрих-код';
  @override
  String get sectionAccount => 'Обліковий запис';
  @override
  String get sectionPreferences => 'Уподобання';
  @override
  String get sectionApp => 'додаток';
  @override
  String get sectionPrivacy => 'Конфіденційність';
  @override
  String get sessionTitle => 'Сесія';
  @override
  String get guestUser => 'Гість користувач';
  @override
  String get favoritesTitle => 'Вибране';
  @override
  String get favoritesSubtitle => 'Рецепти, які ви зберегли';
  @override
  String get freshnessInventorySubtitle =>
      'Товари з чеків і термінів придатності';
  @override
  String get pantrySyncSubtitle => 'Отримайте інвентар свіжості з хмари';
  @override
  String get showOnboardingAgain => 'Знову показати вступний тур';
  @override
  String get signOut => 'Вийти';
  @override
  String get scanSubtitleSmart => 'Розумне сканування комори';
  @override
  String get scanSubtitleReceipt => 'Сканування чеків і відстеження свіжості';
  @override
  String get tooltipSettings => 'Налаштування';
  @override
  String get tooltipToggleGuide => 'Перемкнути направляючу рамки';
  @override
  String get tooltipModesAbout => 'Про режими сканування';
  @override
  String get galleryLabel => 'Галерея';
  @override
  String get cameraLoading => 'Підготовка камери…';
  @override
  String get cameraUnavailable =>
      'Камера недоступна.\\nПеревірте дозволи та повторіть спробу.';
  @override
  String get captureFailed =>
      'Не вдалося зняти. Перевірте дозвіл камери та повторіть спробу.';
  @override
  String get receiptCaptureAlign =>
      'Вирівняйте квитанцію у вертикальній рамці та захопіть';
  @override
  String get receiptCameraHint =>
      'Відкрийте камеру або виберіть фотографію квитанції з галереї';
  @override
  String get pickPhotoHint => 'Натисніть кнопку, щоб вибрати фотографію';
  @override
  String get desktopGalleryHint =>
      'Режим робочого столу — виберіть фотографію холодильника з галереї.';
  @override
  String get noCameraOnDevice => 'На цьому пристрої не знайдено камери.';
  @override
  String get openCameraButton => 'Відкрита камера';
  @override
  String get pickPhotoButton => 'Виберіть фото';
  @override
  String get overlayGuideOn => 'Керівництво по';
  @override
  String get overlayGuideOff => 'Гід геть';
  @override
  String get modeSheetTitle => 'Режими сканування';
  @override
  String get modeSheetSubtitle =>
      'Виберіть перед захопленням; він змінює правила рецептів ШІ.';
  @override
  String get scanModeQuickLabel => 'Швидке сканування';
  @override
  String get scanModeQuickSubtitle => 'Рецепти до 15 хв';
  @override
  String get scanModeQuickDesc =>
      'Практичні щоденні страви. Усі рецепти займають 15 хвилин або менше; прості техніки (одна сковорода, салат, швидка смаження).';
  @override
  String get scanModeSurvivalLabel => 'Порятунок';
  @override
  String get scanModeSurvivalSubtitle => 'Спочатку використовуйте продукти, термін придатності яких закінчується';
  @override
  String get scanModeSurvivalDesc =>
      'Зменшує відходи. Надає пріоритет предметам, які на вигляд близькі до псування. Додаткові елементи поля підказок мають пріоритет.';
  @override
  String get scanModeChefLabel => 'Режим шеф-кухаря';
  @override
  String get scanModeChefSubtitle => 'Вишуканий і детальний';
  @override
  String get scanModeChefDesc =>
      'Більш вишукані рецепти. Багатошарова техніка, довший час приготування; принаймні два рецепти, позначені важко.';
  @override
  String get scanModeQuickBestFor =>
      'Їжа ввечері з мінімальною кількістю продуктів і часу';
  @override
  String get scanModeQuickExamples =>
      '• 10-хвилинний омлет\\n• Паста на одній сковороді\\n• Обгортка або миска, які не варити';
  @override
  String get scanModeSurvivalBestFor =>
      'Використання предметів до закінчення терміну їх придатності та скорочення відходів';
  @override
  String get scanModeSurvivalExamples =>
      '• Чистий овочевий суп\\n• Фрітата в духовці\\n• Залишки смаженого рису';
  @override
  String get scanModeChefBestFor =>
      'Особливі вечері, гості або вивчення техніки';
  @override
  String get scanModeChefExamples =>
      '• Білковий соус для пательні\\n• Хрустка + вершкова тарілка\\n• Карамелізований овочевий гарнір';
  @override
  String get scanModeIdealForLabel => 'Найкраще для';
  @override
  String get scanModeExamplesLabel => 'Приклад страв';
  @override
  String get survivalHintAddFromPantry => 'Додайте від свіжості';
  @override
  String get filterAll => 'все';
  @override
  String get filterCritical => 'Критичний';
  @override
  String get filterWarning => 'УВАГА';
  @override
  String get filterSafe => 'Безпечний';
  @override
  String get recipesScreenTitle => 'рецепти';
  @override
  String get copyRecipe => 'Копіювати';
  @override
  String get shareRecipe => 'Поділіться';
  @override
  String get recipeCopiedSnack => 'Рецепт скопійовано в буфер обміну';
  @override
  String get survivalHintTitle => 'Термін дії скоро закінчується';
  @override
  String get survivalHintOptional => 'Необов’язково — напр. молоко, помідори, йогурт';
  @override
  String get survivalHintPlaceholder => 'Виділіть комами';
  @override
  String get scanConfirmReceiptLabel => 'Скан квитанції';
  @override
  String get scanSavedHistory => 'Сканування збережено в історії комори';
  @override
  String get scanSaveFailedPrefix => 'Не вдалося зберегти скан';
  @override
  String get daysUnit => 'днів';
  @override
  String get okButton => 'добре';
  @override
  String get recipesDetectedIngredients => 'Виявлені інгредієнти';
  @override
  String recipesAiCount(int count) => 'ШІ рецепти ·$count';
  @override
  String get galleryPickMessage => 'Виберіть фото з галереї';
  @override
  String get favoritesEmpty =>
      'Ще немає улюблених рецептів.\\nТоркніться сердечком у результатах рецептів.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Рецепт ${index + 1}' : 'рецепт';

  @override
  String get timeAgoJustNow => 'Просто зараз';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}м тому';
  @override
  String timeAgoHours(int hours) => '${hours}год тому';
  @override
  String timeAgoDays(int days) => '${days}d тому';
  @override
  String get daysExpired => 'Термін дії минув';
  @override
  String get daysToday => 'Сьогодні';
  @override
  String get daysTomorrow => 'завтра';
  @override
  String daysCount(int days) => '$days днів';
  @override
  String unifiedDaysRemaining(int days) => '$days залишилося днів';
  @override
  String productCount(int count) => '$count елементи';
  @override
  String get unifiedSourceReceipt => 'розписка';
  @override
  String get unifiedSourceScan => 'Сканувати';
  @override
  String unifiedLastScan(String date) => 'Останнє сканування ·$date';
  @override
  String get receiptFieldProductName => 'Назва товару';
  @override
  String get receiptFieldQuantity => 'Кількість';
  @override
  String get receiptFieldCategory => 'Категорія';
  @override
  String expiryApprox(int days) => 'Найкращий до ~$days днів';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Відсутні інгредієнти додано до списку покупок';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients інгредієнти ·$recipes рецепти';
  @override
  String get favoriteAddTooltip => 'Додати в обране';
  @override
  String get favoriteRemoveTooltip => 'Видалити з вибраного';
  @override
  String get favoriteAddedSnack => 'Додано до обраних';
  @override
  String get favoriteRemovedSnack => 'Видалено з вибраного';
  @override
  String get onboardingScanTitle => 'Скануйте свою комору';
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
  String get onboardingFavoritesTitle => 'Вибране та останні сканування';
  @override
  String get onboardingFavoritesBody =>
      'Зберігайте рецепти, які вам подобаються. Останні скановані файли швидко відкриваються з головного екрана.';
  @override
  String get onboardingCloudTitle => 'Хмарна історія';
  @override
  String get onboardingCloudBody =>
      'Увійдіть, щоб зберегти історію сканування у своєму обліковому записі та повернутися будь-коли.';
  @override
  String get onboardingPermissionsTitle => 'Камера та сповіщення';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef потребує камери для сканування холодильника, чеків і штрихкодів. Необов’язкові сповіщення нагадують про термін придатності.';
  @override
  String get emptyStateScanReceipt => 'Сканувати чек';
  @override
  String get emptyStateStartScan => 'Почати сканування';
  @override
  String get manageSubscriptions => 'Керувати підпискою';
  @override
  String get notificationCriticalChannelName => 'Сповіщення про свіжість';
  @override
  String get notificationCriticalChannelDesc => 'Термін дії товарів скоро закінчиться';
  @override
  String get notificationDailyChannelName => 'Щоденний підсумок';
  @override
  String get notificationDailyChannelDesc => 'Щоденне нагадування про свіжість';
  @override
  String get notificationCriticalTitle => 'Термін дії товарів скоро закінчиться';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Перевірте панель «Свіжість».';
  @override
  String get notificationDailyTitle => 'Перевірка свіжості';
  @override
  String get notificationDailyBody =>
      'Перегляньте речі, якими ви повинні скористатися сьогодні.';
  @override
  String get widgetFreshnessGood => 'Свіжість виглядає добре';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count термін дії елементів може закінчитися сьогодні';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical критичний ·$warning УВАГА';
  @override
  String get categoryDairy => 'Молочна';
  @override
  String get categoryMeat => 'М\'ясо / риба';
  @override
  String get categoryFruit => 'фрукти';
  @override
  String get categoryVegetable => 'Овочевий';
  @override
  String get categoryBeverage => 'Напій';
  @override
  String get categoryBakery => 'Пекарня';
  @override
  String get categoryPantry => 'Комора';
  @override
  String calendarMonthName(int month) => const [
        'січня',
        'Лютий',
        'березень',
        'квітень',
        'травня',
        'червень',
        'липень',
        'Серпень',
        'вересень',
        'жовтень',
        'Листопад',
        'грудень',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'рецепти';
  @override
  String get recipesPlaceholderBody =>
      'Результати рецептів з’являться тут після успішного сканування.';
  @override
  String get recipeSamplePlating => 'Покриття зразків';
  @override
  String get recipeShareInstructionsHeader => 'Інструкції:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Тема';
  @override
  String get themeSubtitle => 'Колірна палітра і фон';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Темно-зелений за замовчуванням';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Холодні сині тони';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Теплі бурштинові акценти';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Фіолетовий акцент темний';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Світлий фон';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Теплий крем з апельсиновим акцентом';
}
