import 'strings_base.dart';

class StringsEs implements StringsBase {
  const StringsEs();

  @override
  String get analysisTitle => 'analizando la despensa';
  @override
  String get stepPrepareImage => 'Preparando foto…';
  @override
  String get stepAnalyzeAi => 'Detectando ingredientes...';
  @override
  String get stepBuildRecipes => 'Recetas de construcción…';
  @override
  String get receiptAnalysisTitle => 'Recibo de lectura';
  @override
  String get stepReceiptPrepare => 'Preparando imagen del recibo…';
  @override
  String get stepReceiptOcr => 'Reconociendo elementos...';
  @override
  String get stepReceiptInfer => 'Estimando la vida útil...';
  @override
  String get receiptNotRecognized =>
      'No se pudo leer el recibo. Pruebe con una foto más clara y plana.';
  @override
  String get receiptNotDetected =>
      'No se detectó ningún recibo. Alinee el recibo en el marco.';
  @override
  String get receiptConfirmTitle => 'Confirmar artículos de recepción';
  @override
  String get receiptConfirmSubtitle =>
      'Seleccione elementos para agregar. Mantenga presionado para editar.';
  @override
  String get receiptConfirmSave => 'Añadir a la despensa';
  @override
  String get receiptSelectOne => 'Seleccione al menos un elemento.';
  @override
  String get receiptSaved => 'Artículos agregados al inventario de frescura';
  @override
  String get scanConfirmSubtitleReceipt =>
      '¿Enviar esta foto del recibo? El análisis OCR comienza después de confirmar.';
  @override
  String get navFreshness => 'Frescura';
  @override
  String get freshnessPanelTitle => 'Panel de frescura';
  @override
  String get freshnessCritical => 'Crítico (0 a 2 días)';
  @override
  String get freshnessWarning => 'Advertencia (3 a 5 días)';
  @override
  String get freshnessSafe => 'Seguro (6+ días)';
  @override
  String get freshnessEmpty =>
      'Aún no hay artículos rastreados. Escanee un recibo para crear inventario.';
  @override
  String get freshnessListTitle => 'Inventario de frescura';
  @override
  String get freshnessListEmpty => 'No hay elementos en este filtro.';
  @override
  String get freshnessSuggestRecipes => 'Sugerir recetas con estos';
  @override
  String get savingsPanelTitle => 'Panel de ahorro';
  @override
  String get savingsPanelEmptyHint =>
      'Marque los artículos que están a punto de caducar como “Comida preparada” para realizar un seguimiento del desperdicio evitado aquí.';
  @override
  String get savingsStatItems => 'Rescatado';
  @override
  String get savingsStatWaste => 'Desperdicio evitado';
  @override
  String get savingsStatMoney => 'Est. ahorros';
  @override
  String get savingsDashboardTitle => 'Análisis de ahorro';
  @override
  String get savingsDashboardSubtitle =>
      'Resumen de los alimentos que guardó de la basura este mes.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingrediente salvado del desperdicio este mes'
          : '$count Ingredientes salvados de los residuos este mes';
  @override
  String savingsKgPrevented(String kg) => 'Se evita el desperdicio de alimentos:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Ganancia financiera estimada:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'últimas 4 semanas';
  @override
  String get savingsRecentTitle => 'Rescates recientes';
  @override
  String get savingsEmptySubtitle =>
      'Aún no hay registros. Cuando utiliza un elemento crítico o de advertencia, aparece aquí.';
  @override
  String get savingsHowItWorks =>
      'Los artículos utilizados dentro de los 5 días posteriores a su vencimiento cuentan como rescatados. El peso y el valor se estiman a partir de los promedios de las categorías.';
  @override
  String get pantryNamesLocaleNote =>
      'Los nombres de productos y tiendas aparecen guardados en su recibo; Los términos comunes se muestran en inglés.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Usado el último día.' : 'Usado con$days quedan días';
  @override
  String get savingsMealMade => 'comida hecha';
  @override
  String savingsMealMadeConfirm(String name) => 'Marca$name como se consume?';
  @override
  String savingsRescuedSnack(String money) => 'Ahorros registrados ·$money';
  @override
  String get freshnessRecipeTitle => 'Preparando recetas';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Se requiere al menos un elemento para las recetas.';
  @override
  String get freshnessCriticalBanner => 'Expira pronto';
  @override
  String get freshnessViewAll => 'Ver todo';
  @override
  String get receiptCaptureHints =>
      'Mantenga el recibo plano, buena iluminación. Todas las líneas visibles en el marco vertical.';
  @override
  String get receiptPurchaseDate => 'Fecha de compra';
  @override
  String get receiptTapToEdit => 'Editar';
  @override
  String get receiptEditItem => 'Editar elemento';
  @override
  String get receiptEditSave => 'Ahorrar';
  @override
  String get receiptExpiryDaysLabel => 'Vida útil estimada (días)';
  @override
  String get receiptMergedSnack => 'Algunos elementos se fusionaron con registros existentes';
  @override
  String get receiptCloudSyncFailed => 'No se pudo guardar en la nube';
  @override
  String get receiptCloudSynced => 'Elementos sincronizados con la nube';
  @override
  String get pantrySyncAction => 'Sincronizar datos de frescura';
  @override
  String get pantrySyncDone => 'Datos de frescura actualizados';
  @override
  String get pantrySyncFailed => 'Error de sincronización';
  @override
  String get freshnessNotificationsTitle => 'Notificaciones de frescura';
  @override
  String get freshnessNotificationsSubtitle =>
      'Elementos críticos y recordatorio diario.';
  @override
  String get freshnessNotificationTimeLabel => 'Tiempo de recordatorio diario';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'todos los días en$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Esta semana:$critical crítico,$warning elementos de advertencia. Utilice estos primero.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Error de red. Comprueba tu conexión y vuelve a intentarlo.';
  @override
  String get geminiQuotaExceeded =>
      'Se superó la cuota de IA. Espere unos minutos y vuelva a intentarlo.';
  @override
  String get geminiBillingDepleted =>
      'Los créditos de prepago de Google AI Studio se han agotado. Agregue facturación en ai.google.dev para restaurar las funciones de IA.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'El reintento automático puede estar disponible en$minutes mín.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Se alcanzó el límite diario de traducción de IA (3/3). Las recetas usan traducción básica hasta mañana.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Tienes$remaining Las traducciones de IA quedaron hoy.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Se alcanzó el límite de escaneo diario de la despensa (3). Inténtelo de nuevo mañana.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Se alcanzó el límite diario de escaneo de recibos (2). Inténtelo de nuevo mañana.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Se alcanzó el límite de generación de recetas diarias (3). Inténtelo de nuevo mañana.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Espere por favor$seconds segundo(s) antes de volver a intentarlo.';
  @override
  String get adRewardTitlePantry => 'Se alcanzó el límite de escaneo de la despensa';
  @override
  String get adRewardTitleReceipt => 'Se alcanzó el límite de escaneo de recibos';
  @override
  String get adRewardTitleRecipe => 'Se alcanzó el límite de generación de recetas';
  @override
  String get adRewardSubtitle =>
      'Mire un anuncio breve para ganar +1 uso adicional hoy (hasta 3 por día).';
  @override
  String get adRewardWatchButton => 'Ver anuncio (+1 uso)';
  @override
  String get adRewardGranted => 'Uso extra concedido. Intentar otra vez.';
  @override
  String get adRewardNotCompleted =>
      'El anuncio no se completó. No se concedió ningún uso adicional.';
  @override
  String get adRewardDailyCapReached =>
      'Has alcanzado el límite de recompensas publicitarias de hoy.';
  @override
  String get geminiTimeout =>
      'Se agotó el tiempo de espera de la solicitud. Comprueba tu conexión y vuelve a intentarlo.';
  @override
  String get geminiServerError =>
      'El servicio de IA no está disponible temporalmente. Inténtelo de nuevo más tarde.';
  @override
  String get imageNotRecognized =>
      'Imagen no reconocida. Mejore la iluminación o pruebe con otro ángulo.';
  @override
  String get imageNotPantry =>
      'Nevera o despensa no visible. Por favor fotografíe directamente.';
  @override
  String get parseError =>
      'No se pudo analizar la respuesta de la IA. Por favor escanee nuevamente.';
  @override
  String get modelUnavailable =>
      'Modelo de IA no disponible. Verifique su acceso API.';
  @override
  String get genericError => 'Algo salió mal. Por favor inténtalo de nuevo.';
  @override
  String get imageDecodeError => 'No se pudo leer la foto. Prueba con otra imagen.';
  @override
  String get authSubtitle => 'Acceso inteligente a la despensa';
  @override
  String get authInitializing => 'Preparando sesión…';
  @override
  String get emailLabel => 'Correo electrónico';
  @override
  String get passwordLabel => 'Contraseña';
  @override
  String get emailRequired => 'Correo electrónico requerido';
  @override
  String get emailInvalid => 'Correo electrónico no válido';
  @override
  String get passwordMin => 'Al menos 6 caracteres';
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
  String get signIn => 'Iniciar sesión';
  @override
  String get signUp => 'Crear una cuenta';
  @override
  String get toggleToSignIn => '¿Ya tienes una cuenta? Iniciar sesión';
  @override
  String get toggleToSignUp => '¿Nuevo aquí? Crear una cuenta';
  @override
  String get guestContinue => 'Continuar como invitado';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Cuenta creada. Abra el enlace de confirmación en su bandeja de entrada; la aplicación te notificará cuando se verifique.';
  @override
  String get emailConfirmedSuccess =>
      'Su correo electrónico está confirmado. Tu cuenta está lista.';
  @override
  String get emailVerifiedLabel => 'Correo electrónico verificado';
  @override
  String get proEmailRequiredTitle => 'Se requiere una cuenta de correo electrónico para Pro';
  @override
  String get proEmailRequiredBody =>
      'Las cuentas de invitado no pueden comprar Pro. Crea una cuenta de correo electrónico para conservar tus datos y desbloquear la facturación.';
  @override
  String get proLinkAccountAction => 'Crear cuenta y continuar';
  @override
  String get proAccountLinked =>
      'Cuenta vinculada. Puede continuar con el pago Pro ahora.';
  @override
  String get supabaseNotConfigured =>
      'Servicio de cuenta no disponible. Inténtelo de nuevo más tarde.';
  @override
  String get privacyTitle => 'Datos y privacidad';
  @override
  String get privacySubtitle => 'Fotos y datos de la cuenta.';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'Las imágenes de los recibos no se almacenan en el servidor; sólo se extrae la lista de productos.\\n\\n'
      'Cuando inicie sesión, los escaneos y los datos de actualización pueden guardarse en su cuenta.'
      'El plan gratuito muestra anuncios de Google AdMob; Pro no tiene anuncios.\\n\\n'
      'Abra la política de privacidad en línea para ver el texto completo.';
  @override
  String get privacyViewOnline => 'Abrir política de privacidad';
  @override
  String get pantryHistoryTitle => 'Historia de la despensa';
  @override
  String get pantryHistoryEmpty =>
      'Aún no hay escaneos guardados.\\nEscanea tu refrigerador para crear un historial.';
  @override
  String get pantryHistorySubtitle => 'Escaneos guardados en la nube';
  @override
  String get splashTagline => 'Productos y despensa: una aplicación';
  @override
  String get splashLoading => 'Cargando…';
  @override
  String get onboardingSkip => 'Saltar';
  @override
  String get onboardingNext => 'Próximo';
  @override
  String get onboardingStart => 'Comenzar';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Escaneos recientes';
  @override
  String get cameraTapToOpen => 'Toque el ícono para abrir la cámara';
  @override
  String get cameraOrGalleryHint => 'Abra la cámara o seleccione de la galería';
  @override
  String get captureOrGalleryHint => 'Capturar o seleccionar de la galería';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Cerrar cámara';
  @override
  String get noIngredients => 'No se detectaron ingredientes.';
  @override
  String get recipeInstructions => 'Instrucciones';
  @override
  String get untitledRecipe => 'Receta sin título';
  @override
  String get genericLoadError => 'Algo salió mal. Por favor inténtalo de nuevo.';
  @override
  String get scanConfirmTitle => 'Confirmar foto';
  @override
  String get scanConfirmSubtitle =>
      '¿Enviar esta foto? El análisis de la receta comienza después de que usted confirme.';
  @override
  String get scanConfirmAnalyze => 'Analizar';
  @override
  String get scanConfirmCancel => 'Cancelar';
  @override
  String get scanConfirmRetake => 'Volver a tomar';
  @override
  String get scanConfirmPickOther => 'Elige otro';
  @override
  String get clearRecentScans => 'Borrar escaneos recientes';
  @override
  String get clearRecentScansSubtitle => 'Elimina el historial local en el dispositivo';
  @override
  String get clearRecentScansConfirmTitle => '¿Borrar escaneos recientes?';
  @override
  String get clearRecentScansConfirmBody =>
      'No se puede deshacer. Los favoritos no se ven afectados.';
  @override
  String get clearRecentScansDone => 'Se borraron los análisis recientes';
  @override
  String get deleteAction => 'Borrar';
  @override
  String get imageQualityTitle => 'Baja calidad de la foto';
  @override
  String get imageQualityDark => 'La imagen es demasiado oscura. Agregue luz y vuelva a intentarlo.';
  @override
  String get imageQualityBlurry =>
      'La imagen puede estar borrosa. Mantente firme y retoma.';
  @override
  String get imageQualityContinue => 'Continuar de todos modos';
  @override
  String get imageQualityRetake => 'Volver a tomar';
  @override
  String receiptQueueTitle(int count) => '$count recibo(s) esperando fuera de línea';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Recibo ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Proceso';
  @override
  String get receiptQueuedOffline =>
      'Desconectado. Recibo en cola; proceso cuando está conectado.';
  @override
  String get receiptLowConfidenceBlock =>
      'Edite elementos de baja confianza antes de guardarlos (icono de lápiz).';
  @override
  String get unifiedPantryTitle => 'Inventario unificado';
  @override
  String get unifiedPantryEmpty => 'Aún no hay elementos ni escaneos.';
  @override
  String get searchHint => 'Buscar productos…';
  @override
  String get navShopping => 'Compras';
  @override
  String get shoppingAddHint => 'Agregar elemento faltante';
  @override
  String get shoppingEmpty => 'Tu lista de compras está vacía.';
  @override
  String get shoppingClearDone => 'Borrar completado';
  @override
  String get shoppingDoneSection => 'Hecho';
  @override
  String get shoppingAddFromRecipe => 'Agregar artículos que no están en el inventario de recibos';
  @override
  String get freshnessViewCalendar => 'Calendario';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => '¿Qué cocinar hoy?';
  @override
  String get cookTodayNoUrgent =>
      'Sin artículos urgentes. Escanee un recibo para realizar un seguimiento de la frescura.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Visto en el escaneo pero no en el inventario de recibos: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Exportar datos locales';
  @override
  String get exportLocalDataSubtitle => 'Copia JSON al portapapeles';
  @override
  String get exportLocalDataDone => 'Datos copiados al portapapeles';
  @override
  String get clearLocalData => 'Eliminar datos locales';
  @override
  String get clearLocalDataSubtitle =>
      'Frescura, compras, preferencias (irreversible)';
  @override
  String get clearLocalDataConfirmTitle => '¿Eliminar datos locales?';
  @override
  String get clearLocalDataConfirmBody =>
      'El inventario de frescura y la lista de compras se eliminaron del dispositivo.';
  @override
  String get clearLocalDataDone => 'Datos locales borrados';
  @override
  String get settingsTitle => 'Ajustes';
  @override
  String get languageTitle => 'Idioma';
  @override
  String get languageSubtitle => 'Idioma de la aplicación · 27 idiomas';
  @override
  String get localePreparingTitle => 'Actualizando idioma';
  @override
  String get localePreparingSubtitle =>
      'Traduciendo recetas y resultados de escaneo...';
  @override
  String get dietTitle => 'Preferencia de dieta';
  @override
  String get dietSubtitle => 'Aplicado a sugerencias de recetas.';
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
  String get aiUsageLimitsLoading => 'Cargando…';
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
  String get aiUsageLabelPantry => 'Despensa';
  @override
  String get aiUsageLabelReceipt => 'Recibo';
  @override
  String get aiUsageLabelRecipe => 'Receta';
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
  String get storeUnavailable =>
      'La tienda no está disponible. Inténtalo de nuevo más tarde.';
  @override
  String get proProductIdsNotConfigured => 'Los ID de producto Pro no están configurados.';
  @override
  String get noProProductsFound => 'No se encontraron productos Pro disponibles.';
  @override
  String get purchaseFlowFailed => 'No se pudo iniciar la compra.';
  @override
  String get purchaseCompletedProActivated => 'Compra completada. Plan Pro activado.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Compra completada. No se pudo verificar aún; inténtalo de nuevo pronto.';
  @override
  String get purchaseFailed => 'La compra falló.';
  @override
  String get restorePurchases => 'Restaurar compras';
  @override
  String get restorePurchasesStarted => 'Comprobando compras anteriores en Play Store…';
  @override
  String get nutritionTitle => 'Nutrición (estimación)';
  @override
  String get nutritionPerServing => 'por porción';
  @override
  String get nutritionCalories => 'calorías';
  @override
  String get nutritionProtein => 'Proteína';
  @override
  String get nutritionCarbs => 'carbohidratos';
  @override
  String get nutritionFat => 'Gordo';
  @override
  String get nutritionEstimateNote =>
      'Sólo estimación de IA; no asesoramiento médico o dietético.';
  @override
  String get barcodeScanTitle => 'escanear código de barras';
  @override
  String get barcodeScanHint =>
      'Alinear el código de barras en el marco. Búsqueda de productos a través de Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Producto no encontrado. En su lugar, intente escanear recibos o refrigeradores.';
  @override
  String get barcodeConfirmTitle => 'Confirmar producto';
  @override
  String get barcodeAddToPantry => 'Agregar al inventario de frescura';
  @override
  String get navScan => 'Escanear';
  @override
  String get captureTypeFridge => 'Refrigerador';
  @override
  String get captureTypeReceipt => 'Recibo';
  @override
  String get captureTypeBarcode => 'Código de barras';
  @override
  String get sectionAccount => 'Cuenta';
  @override
  String get sectionPreferences => 'Preferencias';
  @override
  String get sectionApp => 'Aplicación';
  @override
  String get sectionPrivacy => 'Privacidad';
  @override
  String get sessionTitle => 'Sesión';
  @override
  String get guestUser => 'Usuario invitado';
  @override
  String get favoritesTitle => 'Favoritos';
  @override
  String get favoritesSubtitle => 'Recetas que guardaste';
  @override
  String get freshnessInventorySubtitle =>
      'Productos según recibos y fechas de caducidad.';
  @override
  String get pantrySyncSubtitle => 'Extraiga el inventario de frescura de la nube';
  @override
  String get showOnboardingAgain => 'Mostrar nuevamente el recorrido de incorporación';
  @override
  String get signOut => 'desconectar';
  @override
  String get scanSubtitleSmart => 'Escaneo inteligente de despensa';
  @override
  String get scanSubtitleReceipt => 'Escaneo de recibos y seguimiento de frescura';
  @override
  String get tooltipSettings => 'Ajustes';
  @override
  String get tooltipToggleGuide => 'Alternar guía de marco';
  @override
  String get tooltipModesAbout => 'Acerca de los modos de escaneo';
  @override
  String get galleryLabel => 'Galería';
  @override
  String get cameraLoading => 'Preparando cámara...';
  @override
  String get cameraUnavailable =>
      'La cámara no está disponible.\\nComprueba los permisos y vuelve a intentarlo.';
  @override
  String get captureFailed =>
      'La captura falló. Verifique el permiso de la cámara e inténtelo nuevamente.';
  @override
  String get receiptCaptureAlign =>
      'Alinee el recibo en el marco vertical y capture';
  @override
  String get receiptCameraHint =>
      'Abra la cámara o elija una foto de recibo de la galería';
  @override
  String get pickPhotoHint => 'Toca el botón para elegir una foto.';
  @override
  String get desktopGalleryHint =>
      'Modo de escritorio: elige una foto del refrigerador de la galería.';
  @override
  String get noCameraOnDevice => 'No se encontró ninguna cámara en este dispositivo.';
  @override
  String get openCameraButton => 'cámara abierta';
  @override
  String get pickPhotoButton => 'Elige foto';
  @override
  String get overlayGuideOn => 'Guía sobre';
  @override
  String get overlayGuideOff => 'Guía fuera';
  @override
  String get modeSheetTitle => 'Modos de escaneo';
  @override
  String get modeSheetSubtitle =>
      'Elija antes de capturar; cambia las reglas de las recetas de la IA.';
  @override
  String get scanModeQuickLabel => 'Escaneo rápido';
  @override
  String get scanModeQuickSubtitle => 'Recetas de menos de 15 min';
  @override
  String get scanModeQuickDesc =>
      'Comidas prácticas para el día a día. Todas las recetas duran un total de 15 minutos o menos; técnicas sencillas (una sartén, ensalada, fritura rápida).';
  @override
  String get scanModeSurvivalLabel => 'Rescate';
  @override
  String get scanModeSurvivalSubtitle => 'Utilice primero los artículos que caduquen';
  @override
  String get scanModeSurvivalDesc =>
      'Reduce el desperdicio. Da prioridad a los elementos que parecen estar a punto de estropearse. Los elementos del campo de sugerencias opcionales tienen prioridad.';
  @override
  String get scanModeChefLabel => 'Modo cocinero';
  @override
  String get scanModeChefSubtitle => 'Gourmet y detallado';
  @override
  String get scanModeChefDesc =>
      'Recetas más refinadas. Técnicas en capas, tiempos de cocción más prolongados; al menos dos recetas marcadas con fuerza.';
  @override
  String get scanModeQuickBestFor =>
      'Comidas entre semana con ingredientes y tiempo mínimos';
  @override
  String get scanModeQuickExamples =>
      '• Tortilla de 10 minutos\\n• Pasta en una sartén\\n• Envoltorio o tazón sin cocinar';
  @override
  String get scanModeSurvivalBestFor =>
      'Usar artículos antes de que caduquen y reducir el desperdicio';
  @override
  String get scanModeSurvivalExamples =>
      '• Sopa de verduras limpia\\n• Frittata al horno\\n• Arroz frito sobrante';
  @override
  String get scanModeChefBestFor =>
      'Cenas especiales, invitados o aprender una técnica.';
  @override
  String get scanModeChefExamples =>
      '• Salsa proteica\\n• Plato crujiente y cremoso\\n• Guarnición de verduras caramelizadas';
  @override
  String get scanModeIdealForLabel => 'Lo mejor para';
  @override
  String get scanModeExamplesLabel => 'Platos de ejemplo';
  @override
  String get survivalHintAddFromPantry => 'Añadir de frescura';
  @override
  String get filterAll => 'Todo';
  @override
  String get filterCritical => 'Crítico';
  @override
  String get filterWarning => 'Advertencia';
  @override
  String get filterSafe => 'Seguro';
  @override
  String get recipesScreenTitle => 'Recetas';
  @override
  String get copyRecipe => 'Copiar';
  @override
  String get shareRecipe => 'Compartir';
  @override
  String get recipeCopiedSnack => 'Receta copiada al portapapeles';
  @override
  String get survivalHintTitle => 'Expira pronto';
  @override
  String get survivalHintOptional => 'Opcional, p.e. leche, tomate, yogur';
  @override
  String get survivalHintPlaceholder => 'Separar con comas';
  @override
  String get scanConfirmReceiptLabel => 'Escaneo de recibos';
  @override
  String get scanSavedHistory => 'Escaneo guardado en el historial de la despensa';
  @override
  String get scanSaveFailedPrefix => 'No se pudo guardar el escaneo';
  @override
  String get daysUnit => 'días';
  @override
  String get okButton => 'DE ACUERDO';
  @override
  String get recipesDetectedIngredients => 'Ingredientes detectados';
  @override
  String recipesAiCount(int count) => 'Recetas de IA ·$count';
  @override
  String get galleryPickMessage => 'Elige una foto de la galería';
  @override
  String get favoritesEmpty =>
      'Aún no hay recetas favoritas.\\nToca el corazón en los resultados de las recetas.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Receta ${index + 1}' : 'Receta';

  @override
  String get timeAgoJustNow => 'En este momento';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}hace m';
  @override
  String timeAgoHours(int hours) => '${hours}hace h';
  @override
  String timeAgoDays(int days) => '${days}hace d';
  @override
  String get daysExpired => 'Venció';
  @override
  String get daysToday => 'Hoy';
  @override
  String get daysTomorrow => 'Mañana';
  @override
  String daysCount(int days) => '$days días';
  @override
  String unifiedDaysRemaining(int days) => '$days quedan días';
  @override
  String productCount(int count) => '$count elementos';
  @override
  String get unifiedSourceReceipt => 'Recibo';
  @override
  String get unifiedSourceScan => 'Escanear';
  @override
  String unifiedLastScan(String date) => 'Último escaneo ·$date';
  @override
  String get receiptFieldProductName => 'Nombre del producto';
  @override
  String get receiptFieldQuantity => 'Cantidad';
  @override
  String get receiptFieldCategory => 'Categoría';
  @override
  String expiryApprox(int days) => 'Mejor antes ~$days días';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Se agregaron ingredientes faltantes a la lista de compras';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingredientes ·$recipes recetas';
  @override
  String get favoriteAddTooltip => 'Añadir a favoritos';
  @override
  String get favoriteRemoveTooltip => 'Quitar de favoritos';
  @override
  String get favoriteAddedSnack => 'Añadido a favoritos';
  @override
  String get favoriteRemovedSnack => 'Eliminado de favoritos';
  @override
  String get onboardingScanTitle => 'Escanea tu despensa';
  @override
  String get onboardingScanBody =>
      'Open Scan, tap the camera or Gallery, and confirm before AI runs. Try Quick mode first.';
  @override
  String get onboardingReceiptTitle => 'Receipts → freshness inventory';
  @override
  String get onboardingReceiptBody =>
      'Switch to Receipt, scan a shopping slip, and review items before saving. Offline scans queue automatically.';
  @override
  String get onboardingShoppingTitle => 'Lista de compras';
  @override
  String get onboardingShoppingBody =>
      'Add missing items from the Shopping tab. Pair with Freshness to see what to use first.';
  @override
  String get onboardingRecipesTitle => 'AI recipes in seconds';
  @override
  String get onboardingRecipesBody =>
      'Fridge or freshness scans generate three recipes — Quick, Rescue, or Chef mode.';
  @override
  String get onboardingFavoritesTitle => 'Favoritos y escaneos recientes';
  @override
  String get onboardingFavoritesBody =>
      'Guarda las recetas que te gusten. Los escaneos recientes se abren rápidamente desde la pantalla de inicio.';
  @override
  String get onboardingCloudTitle => 'Historia de la nube';
  @override
  String get onboardingCloudBody =>
      'Inicie sesión para guardar el historial de escaneo en su cuenta y regresar en cualquier momento.';
  @override
  String get onboardingPermissionsTitle => 'Cámara y notificaciones';
  @override
  String get onboardingPermissionsBody =>
      'CyberChef necesita la cámara para escanear la nevera, tickets y códigos de barras. Las notificaciones opcionales te avisan cuando la comida está a punto de caducar.';
  @override
  String get emptyStateScanReceipt => 'Escanear ticket';
  @override
  String get emptyStateStartScan => 'Empezar a escanear';
  @override
  String get manageSubscriptions => 'Gestionar suscripción';
  @override
  String get notificationCriticalChannelName => 'Alertas de frescura';
  @override
  String get notificationCriticalChannelDesc => 'Artículos que caducan pronto';
  @override
  String get notificationDailyChannelName => 'Resumen diario';
  @override
  String get notificationDailyChannelDesc => 'Recordatorio de frescura diario';
  @override
  String get notificationCriticalTitle => 'Artículos que caducan pronto';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Verifique el panel Frescura.';
  @override
  String get notificationDailyTitle => 'control de frescura';
  @override
  String get notificationDailyBody =>
      'Revise los elementos que debería utilizar hoy.';
  @override
  String get widgetFreshnessGood => 'La frescura se ve bien';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count Los artículos pueden caducar hoy.';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical crítico ·$warning advertencia';
  @override
  String get categoryDairy => 'Lácteos';
  @override
  String get categoryMeat => 'Carne/pescado';
  @override
  String get categoryFruit => 'Fruta';
  @override
  String get categoryVegetable => 'Verdura';
  @override
  String get categoryBeverage => 'Bebida';
  @override
  String get categoryBakery => 'Panadería';
  @override
  String get categoryPantry => 'Despensa';
  @override
  String calendarMonthName(int month) => const [
        'Enero',
        'Febrero',
        'Marzo',
        'Abril',
        'Puede',
        'Junio',
        'Julio',
        'Agosto',
        'Septiembre',
        'Octubre',
        'Noviembre',
        'Diciembre',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Recetas';
  @override
  String get recipesPlaceholderBody =>
      'Los resultados de la receta aparecerán aquí después de un escaneo exitoso.';
  @override
  String get recipeSamplePlating => 'Enchapado de muestra';
  @override
  String get recipeShareInstructionsHeader => 'Instrucciones:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Paleta de colores y fondo.';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Verde oscuro predeterminado';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Tonos azules fríos';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Cálidos detalles en ámbar';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Acento morado oscuro';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'fondo claro';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Crema cálida con acento naranja.';
}
