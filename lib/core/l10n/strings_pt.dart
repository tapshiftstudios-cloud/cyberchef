import 'strings_base.dart';

class StringsPt implements StringsBase {
  const StringsPt();

  @override
  String get analysisTitle => 'Analisando a despensa';
  @override
  String get stepPrepareImage => 'Preparando foto…';
  @override
  String get stepAnalyzeAi => 'Detectando ingredientes…';
  @override
  String get stepBuildRecipes => 'Construindo receitas…';
  @override
  String get receiptAnalysisTitle => 'Recibo de leitura';
  @override
  String get stepReceiptPrepare => 'Preparando imagem do recibo…';
  @override
  String get stepReceiptOcr => 'Reconhecendo itens…';
  @override
  String get stepReceiptInfer => 'Estimando a vida útil…';
  @override
  String get receiptNotRecognized =>
      'Não foi possível ler o recibo. Experimente uma foto mais nítida e plana.';
  @override
  String get receiptNotDetected =>
      'Nenhum recibo detectado. Alinhe o recibo na moldura.';
  @override
  String get receiptConfirmTitle => 'Confirmar itens de recebimento';
  @override
  String get receiptConfirmSubtitle =>
      'Selecione os itens a serem adicionados. Pressione e segure para editar.';
  @override
  String get receiptConfirmSave => 'Adicionar à despensa';
  @override
  String get receiptSelectOne => 'Selecione pelo menos um item.';
  @override
  String get receiptSaved => 'Itens adicionados ao inventário de atualização';
  @override
  String get scanConfirmSubtitleReceipt =>
      'Enviar esta foto do recibo? A análise de OCR começa após a confirmação.';
  @override
  String get navFreshness => 'Frescura';
  @override
  String get freshnessPanelTitle => 'Painel de frescor';
  @override
  String get freshnessCritical => 'Crítico (0–2 dias)';
  @override
  String get freshnessWarning => 'Aviso (3–5 dias)';
  @override
  String get freshnessSafe => 'Seguro (6+ dias)';
  @override
  String get freshnessEmpty =>
      'Nenhum item rastreado ainda. Digitalize um recibo para criar um inventário.';
  @override
  String get freshnessListTitle => 'Inventário de frescor';
  @override
  String get freshnessListEmpty => 'Nenhum item neste filtro.';
  @override
  String get freshnessSuggestRecipes => 'Sugira receitas com estes';
  @override
  String get savingsPanelTitle => 'Painel de poupança';
  @override
  String get savingsPanelEmptyHint =>
      'Marque os itens quase vencidos como “Refeição feita” para rastrear o desperdício evitado aqui.';
  @override
  String get savingsStatItems => 'Resgatado';
  @override
  String get savingsStatWaste => 'Desperdício evitado';
  @override
  String get savingsStatMoney => 'Husa. poupança';
  @override
  String get savingsDashboardTitle => 'Análise de poupança';
  @override
  String get savingsDashboardSubtitle =>
      'Resumo dos alimentos que você guardou do lixo – este mês.';
  @override
  String savingsItemsThisMonth(int count) =>
      count == 1
          ? '1 ingrediente salvo do desperdício este mês'
          : '$count ingredientes salvos do desperdício este mês';
  @override
  String savingsKgPrevented(String kg) => 'Desperdício alimentar evitado:$kg';
  @override
  String savingsFinancialGain(String amount) =>
      'Ganho financeiro estimado:$amount';
  @override
  String savingsMoneyTry(int amount) => '$amount TRY';
  @override
  String get savingsTrendTitle => 'Últimas 4 semanas';
  @override
  String get savingsRecentTitle => 'Resgates recentes';
  @override
  String get savingsEmptySubtitle =>
      'Ainda não há registros. Quando você usa um item crítico ou de aviso, ele aparece aqui.';
  @override
  String get savingsHowItWorks =>
      'Itens usados ​​dentro de 5 dias após o vencimento contam como resgatados. O peso e o valor são estimados a partir das médias das categorias.';
  @override
  String get pantryNamesLocaleNote =>
      'Os nomes dos produtos e das lojas aparecem como salvos no seu recibo; termos comuns são mostrados em inglês.';
  @override
  String savingsRescuedDaysLeft(int days) =>
      days == 0 ? 'Usado no último dia' : 'Usado com$days dias restantes';
  @override
  String get savingsMealMade => 'Refeição feita';
  @override
  String savingsMealMadeConfirm(String name) => 'Marca$name como consumido?';
  @override
  String savingsRescuedSnack(String money) => 'Economias registradas ·$money';
  @override
  String get freshnessRecipeTitle => 'Preparando receitas';
  @override
  String get freshnessNoIngredientsForRecipes =>
      'Pelo menos um item é necessário para receitas.';
  @override
  String get freshnessCriticalBanner => 'Expira em breve';
  @override
  String get freshnessViewAll => 'Ver tudo';
  @override
  String get receiptCaptureHints =>
      'Mantenha o recibo plano e com boa iluminação. Todas as linhas visíveis no quadro vertical.';
  @override
  String get receiptPurchaseDate => 'Data de compra';
  @override
  String get receiptTapToEdit => 'Editar';
  @override
  String get receiptEditItem => 'Editar item';
  @override
  String get receiptEditSave => 'Salvar';
  @override
  String get receiptExpiryDaysLabel => 'Vida útil estimada (dias)';
  @override
  String get receiptMergedSnack => 'Alguns itens mesclados com registros existentes';
  @override
  String get receiptCloudSyncFailed => 'Não foi possível salvar na nuvem';
  @override
  String get receiptCloudSynced => 'Itens sincronizados com a nuvem';
  @override
  String get pantrySyncAction => 'Sincronizar dados de atualização';
  @override
  String get pantrySyncDone => 'Dados de atualização atualizados';
  @override
  String get pantrySyncFailed => 'Falha na sincronização';
  @override
  String get freshnessNotificationsTitle => 'Notificações de atualização';
  @override
  String get freshnessNotificationsSubtitle =>
      'Itens críticos e lembrete diário';
  @override
  String get freshnessNotificationTimeLabel => 'Hora do lembrete diário';
  @override
  String freshnessNotificationTimeValue(String time24) =>
      'Todos os dias às$time24';
  @override
  String freshnessWeeklySummary(int critical, int warning) =>
      'Essa semana:$critical crítico,$warning itens de advertência. Use-os primeiro.';
  @override
  String get geminiKeyMissing =>
      'AI service unavailable. Please try again later.';
  @override
  String get networkError =>
      'Erro de rede. Verifique sua conexão e tente novamente.';
  @override
  String get geminiQuotaExceeded =>
      'Cota de IA excedida. Aguarde alguns minutos e tente novamente.';
  @override
  String get geminiBillingDepleted =>
      'Os créditos de pré-pagamento do Google AI Studio acabaram. Adicione faturamento em ai.google.dev para restaurar os recursos de IA.';
  @override
  String aiQuotaRetryInMinutes(int minutes) =>
      'A nova tentativa automática pode estar disponível em$minutes min.';
  @override
  String get aiTranslationDailyLimitReached =>
      'Limite diário de tradução da IA ​​atingido (3/3). As receitas usam tradução básica até amanhã.';
  @override
  String aiTranslationRemainingToday(int remaining) =>
      'Você tem$remaining Tradução(ões) de IA saindo hoje.';
  @override
  String get aiPantryScanDailyLimitReached =>
      'Limite diário de verificação da despensa atingido (3). Por favor, tente novamente amanhã.';
  @override
  String get aiReceiptDailyLimitReached =>
      'Limite diário de digitalização de recibos atingido (2). Por favor, tente novamente amanhã.';
  @override
  String get aiRecipeDailyLimitReached =>
      'Limite diário de geração de receitas atingido (3). Por favor, tente novamente amanhã.';
  @override
  String aiActionCooldownSeconds(int seconds) =>
      'Por favor, aguarde$seconds segundo(s) antes de tentar novamente.';
  @override
  String get adRewardTitlePantry => 'Limite de verificação da despensa atingido';
  @override
  String get adRewardTitleReceipt => 'Limite de digitalização de recibos atingido';
  @override
  String get adRewardTitleRecipe => 'Limite de geração de receitas atingido';
  @override
  String get adRewardSubtitle =>
      'Assista a um pequeno anúncio para ganhar +1 uso extra hoje (até 3 por dia).';
  @override
  String get adRewardWatchButton => 'Assistir ao anúncio (+1 uso)';
  @override
  String get adRewardGranted => 'Uso extra concedido. Tente novamente.';
  @override
  String get adRewardNotCompleted =>
      'O anúncio não foi concluído. Nenhum uso extra foi concedido.';
  @override
  String get adRewardDailyCapReached =>
      'Você atingiu o limite de recompensas de anúncios de hoje.';
  @override
  String get geminiTimeout =>
      'A solicitação expirou. Verifique sua conexão e tente novamente.';
  @override
  String get geminiServerError =>
      'O serviço de IA está temporariamente indisponível. Por favor, tente novamente mais tarde.';
  @override
  String get imageNotRecognized =>
      'Imagem não reconhecida. Melhore a iluminação ou tente outro ângulo.';
  @override
  String get imageNotPantry =>
      'Geladeira ou despensa não visíveis. Por favor fotografe diretamente.';
  @override
  String get parseError =>
      'Não foi possível analisar a resposta da IA. Por favor, digitalize novamente.';
  @override
  String get modelUnavailable =>
      'Modelo de IA indisponível. Verifique seu acesso à API.';
  @override
  String get genericError => 'Algo deu errado. Por favor, tente novamente.';
  @override
  String get imageDecodeError => 'Não foi possível ler a foto. Experimente outra imagem.';
  @override
  String get authSubtitle => 'Acesso inteligente à despensa';
  @override
  String get authInitializing => 'Preparando sessão…';
  @override
  String get emailLabel => 'E-mail';
  @override
  String get passwordLabel => 'Senha';
  @override
  String get emailRequired => 'E-mail obrigatório';
  @override
  String get emailInvalid => 'E-mail inválido';
  @override
  String get passwordMin => 'Pelo menos 6 caracteres';
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
  String get signIn => 'Entrar';
  @override
  String get signUp => 'Criar uma conta';
  @override
  String get toggleToSignIn => 'Já tem uma conta? Entrar';
  @override
  String get toggleToSignUp => 'Novo aqui? Criar uma conta';
  @override
  String get guestContinue => 'Continuar como convidado';
  @override
  String get authContinueOffline => 'Continue offline (no cloud sync)';
  @override
  String get authSupabaseUnreachable =>
      'Cannot reach the cloud server. Your Supabase project may be paused, deleted, or blocked on this network.';
  @override
  String get accountCreated =>
      'Conta criada. Abra o link de confirmação em sua caixa de entrada; o aplicativo irá notificá-lo quando verificado.';
  @override
  String get emailConfirmedSuccess =>
      'Seu e-mail está confirmado. Sua conta está pronta.';
  @override
  String get emailVerifiedLabel => 'E-mail verificado';
  @override
  String get proEmailRequiredTitle => 'Conta de e-mail necessária para Pro';
  @override
  String get proEmailRequiredBody =>
      'Contas de convidados não podem comprar o Pro. Crie uma conta de e-mail para manter seus dados e desbloquear o faturamento.';
  @override
  String get proLinkAccountAction => 'Crie uma conta e continue';
  @override
  String get proAccountLinked =>
      'Conta vinculada. Você pode continuar para a finalização da compra Pro agora.';
  @override
  String get supabaseNotConfigured =>
      'Serviço de conta indisponível. Por favor, tente novamente mais tarde.';
  @override
  String get privacyTitle => 'Dados e privacidade';
  @override
  String get privacySubtitle => 'Fotos e dados da conta';
  @override
  String get privacyBody =>
      'CyberChef processes fridge photos for recipes and receipt images only for receipt scanning. '
      'As imagens de recibo não são armazenadas no servidor; apenas a lista de produtos é extraída.\\n\\n'
      'Quando conectado, as verificações e os dados atualizados podem ser salvos em sua conta.'
      'O plano gratuito mostra anúncios do Google AdMob; O Pro não tem anúncios.\\n\\n'
      'Abra a política de privacidade online para ver o texto completo.';
  @override
  String get privacyViewOnline => 'Política de privacidade aberta';
  @override
  String get pantryHistoryTitle => 'História da despensa';
  @override
  String get pantryHistoryEmpty =>
      'Nenhuma digitalização salva ainda.\\nExamine sua geladeira para criar um histórico.';
  @override
  String get pantryHistorySubtitle => 'Verificações salvas na nuvem';
  @override
  String get splashTagline => 'Produção e despensa – um aplicativo';
  @override
  String get splashLoading => 'Carregando…';
  @override
  String get onboardingSkip => 'Pular';
  @override
  String get onboardingNext => 'Próximo';
  @override
  String get onboardingStart => 'Começar';
  @override
  String onboardingProgress(int current, int total) => '$current / $total';
  @override
  String get sendFeedbackTitle => 'Send feedback';
  @override
  String get sendFeedbackSubtitle => 'Share ideas or report issues';
  @override
  String get recentScansTitle => 'Verificações recentes';
  @override
  String get cameraTapToOpen => 'Toque no ícone para abrir a câmera';
  @override
  String get cameraOrGalleryHint => 'Abra a câmera ou escolha na galeria';
  @override
  String get captureOrGalleryHint => 'Capture ou escolha na galeria';
  @override
  String scanFooterHint(String modeLabel, {required bool cameraLive}) {
    final base =
        cameraLive ? captureOrGalleryHint : cameraOrGalleryHint;
    return '$base · $modeLabel';
  }
  @override
  String get closeCamera => 'Fechar câmera';
  @override
  String get noIngredients => 'Nenhum ingrediente detectado.';
  @override
  String get recipeInstructions => 'Instruções';
  @override
  String get untitledRecipe => 'Receita sem título';
  @override
  String get genericLoadError => 'Algo deu errado. Por favor, tente novamente.';
  @override
  String get scanConfirmTitle => 'Confirmar foto';
  @override
  String get scanConfirmSubtitle =>
      'Enviar esta foto? A análise da receita começa após a confirmação.';
  @override
  String get scanConfirmAnalyze => 'Analisar';
  @override
  String get scanConfirmCancel => 'Cancelar';
  @override
  String get scanConfirmRetake => 'Retomar';
  @override
  String get scanConfirmPickOther => 'Escolha outro';
  @override
  String get clearRecentScans => 'Limpar verificações recentes';
  @override
  String get clearRecentScansSubtitle => 'Exclui o histórico local no dispositivo';
  @override
  String get clearRecentScansConfirmTitle => 'Limpar verificações recentes?';
  @override
  String get clearRecentScansConfirmBody =>
      'Não pode ser desfeito. Os favoritos não são afetados.';
  @override
  String get clearRecentScansDone => 'Verificações recentes apagadas';
  @override
  String get deleteAction => 'Excluir';
  @override
  String get imageQualityTitle => 'Baixa qualidade da foto';
  @override
  String get imageQualityDark => 'A imagem está muito escura. Adicione luz e tente novamente.';
  @override
  String get imageQualityBlurry =>
      'A imagem pode ficar desfocada. Mantenha-se firme e refaça.';
  @override
  String get imageQualityContinue => 'Continuar mesmo assim';
  @override
  String get imageQualityRetake => 'Retomar';
  @override
  String receiptQueueTitle(int count) => '$count recibo(s) aguardando off-line';
  @override
  String receiptQueueItem(int d, int m, int h, int min) =>
      'Recibo ·$d/$m · $h:${min.toString().padLeft(2,'0')}';
  @override
  String get receiptQueueProcess => 'Processo';
  @override
  String get receiptQueuedOffline =>
      'Off-line. Recibo em fila; processo quando conectado.';
  @override
  String get receiptLowConfidenceBlock =>
      'Edite itens de baixa confiança antes de salvar (ícone de lápis).';
  @override
  String get unifiedPantryTitle => 'Inventário unificado';
  @override
  String get unifiedPantryEmpty => 'Nenhum item ou digitalização ainda.';
  @override
  String get searchHint => 'Pesquisar produtos…';
  @override
  String get navShopping => 'Compras';
  @override
  String get shoppingAddHint => 'Adicionar item ausente';
  @override
  String get shoppingEmpty => 'Sua lista de compras está vazia.';
  @override
  String get shoppingClearDone => 'Limpeza concluída';
  @override
  String get shoppingDoneSection => 'Feito';
  @override
  String get shoppingAddFromRecipe => 'Adicionar itens que não estão no inventário de recebimento';
  @override
  String get freshnessViewCalendar => 'Calendário';
  @override
  String get freshnessViewList => 'Lista';
  @override
  String get cookToday => 'O que cozinhar hoje?';
  @override
  String get cookTodayNoUrgent =>
      'Sem itens urgentes. Digitalize um recibo para rastrear a atualização.';
  @override
  String pantryMismatchHint(List<String> items) =>
      'Visto na digitalização, mas não no inventário de recebimento: ${items.join(', ')}';
  @override
  String get exportLocalData => 'Exportar dados locais';
  @override
  String get exportLocalDataSubtitle => 'Copia JSON para a área de transferência';
  @override
  String get exportLocalDataDone => 'Dados copiados para a área de transferência';
  @override
  String get clearLocalData => 'Excluir dados locais';
  @override
  String get clearLocalDataSubtitle =>
      'Frescor, compras, preferências (irreversíveis)';
  @override
  String get clearLocalDataConfirmTitle => 'Excluir dados locais?';
  @override
  String get clearLocalDataConfirmBody =>
      'Inventário de atualização e lista de compras removidos do dispositivo.';
  @override
  String get clearLocalDataDone => 'Dados locais apagados';
  @override
  String get settingsTitle => 'Configurações';
  @override
  String get languageTitle => 'Linguagem';
  @override
  String get languageSubtitle => 'Idioma do aplicativo · 27 idiomas';
  @override
  String get localePreparingTitle => 'Atualizando idioma';
  @override
  String get localePreparingSubtitle =>
      'Traduzindo receitas e resultados de digitalização…';
  @override
  String get dietTitle => 'Preferência de dieta';
  @override
  String get dietSubtitle => 'Aplicado a sugestões de receitas';
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
  String get aiUsageLimitsLoading => 'Carregando…';
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
  String get aiUsageLabelRecipe => 'Receita';
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
  String get storeUnavailable => 'A loja está indisponível. Tente novamente mais tarde.';
  @override
  String get proProductIdsNotConfigured => 'Os IDs de produto Pro não estão configurados.';
  @override
  String get noProProductsFound => 'Nenhum produto Pro disponível para compra.';
  @override
  String get purchaseFlowFailed => 'Não foi possível iniciar a compra.';
  @override
  String get purchaseCompletedProActivated => 'Compra concluída. Plano Pro ativado.';
  @override
  String get purchaseCompletedVerifyFailed =>
      'Compra concluída. Não foi possível verificar agora; tente novamente em breve.';
  @override
  String get purchaseFailed => 'Falha na compra.';
  @override
  String get restorePurchases => 'Restaurar compras';
  @override
  String get restorePurchasesStarted => 'Verificando compras anteriores na Play Store…';
  @override
  String get nutritionTitle => 'Nutrição (estimativa)';
  @override
  String get nutritionPerServing => 'por porção';
  @override
  String get nutritionCalories => 'Calorias';
  @override
  String get nutritionProtein => 'Proteína';
  @override
  String get nutritionCarbs => 'Carboidratos';
  @override
  String get nutritionFat => 'Gordo';
  @override
  String get nutritionEstimateNote =>
      'Apenas estimativa de IA; não aconselhamento médico ou dietético.';
  @override
  String get barcodeScanTitle => 'Digitalizar código de barras';
  @override
  String get barcodeScanHint =>
      'Alinhe o código de barras no quadro. Pesquisa de produtos por meio do Open Food Facts.';
  @override
  String get barcodeNotFound =>
      'Produto não encontrado. Em vez disso, experimente o recibo ou a digitalização da geladeira.';
  @override
  String get barcodeConfirmTitle => 'Confirmar produto';
  @override
  String get barcodeAddToPantry => 'Adicionar ao inventário de atualização';
  @override
  String get navScan => 'Digitalizar';
  @override
  String get captureTypeFridge => 'Geladeira';
  @override
  String get captureTypeReceipt => 'Recibo';
  @override
  String get captureTypeBarcode => 'Código de barras';
  @override
  String get sectionAccount => 'Conta';
  @override
  String get sectionPreferences => 'Preferências';
  @override
  String get sectionApp => 'Aplicativo';
  @override
  String get sectionPrivacy => 'Privacidade';
  @override
  String get sessionTitle => 'Sessão';
  @override
  String get guestUser => 'Usuário convidado';
  @override
  String get favoritesTitle => 'Favoritos';
  @override
  String get favoritesSubtitle => 'Receitas que você salvou';
  @override
  String get freshnessInventorySubtitle =>
      'Produtos de recibos e datas de vencimento';
  @override
  String get pantrySyncSubtitle => 'Extraia inventário de atualização da nuvem';
  @override
  String get showOnboardingAgain => 'Mostrar tour de integração novamente';
  @override
  String get signOut => 'sair';
  @override
  String get scanSubtitleSmart => 'Verificação inteligente da despensa';
  @override
  String get scanSubtitleReceipt => 'Verificação de recibo e rastreamento de atualização';
  @override
  String get tooltipSettings => 'Configurações';
  @override
  String get tooltipToggleGuide => 'Alternar guia de quadro';
  @override
  String get tooltipModesAbout => 'Sobre modos de digitalização';
  @override
  String get galleryLabel => 'Galeria';
  @override
  String get cameraLoading => 'Preparando câmera…';
  @override
  String get cameraUnavailable =>
      'Câmera indisponível.\\nVerifique as permissões e tente novamente.';
  @override
  String get captureFailed =>
      'Falha na captura. Verifique a permissão da câmera e tente novamente.';
  @override
  String get receiptCaptureAlign =>
      'Alinhe o recibo no quadro vertical e capture';
  @override
  String get receiptCameraHint =>
      'Abra a câmera ou escolha uma foto do recibo da galeria';
  @override
  String get pickPhotoHint => 'Toque no botão para escolher uma foto';
  @override
  String get desktopGalleryHint =>
      'Modo desktop – escolha uma foto da geladeira na galeria.';
  @override
  String get noCameraOnDevice => 'Nenhuma câmera encontrada neste dispositivo.';
  @override
  String get openCameraButton => 'Câmera aberta';
  @override
  String get pickPhotoButton => 'Escolha a foto';
  @override
  String get overlayGuideOn => 'Guia sobre';
  @override
  String get overlayGuideOff => 'Guia';
  @override
  String get modeSheetTitle => 'Modos de digitalização';
  @override
  String get modeSheetSubtitle =>
      'Escolha antes da captura; muda as regras da receita da IA.';
  @override
  String get scanModeQuickLabel => 'Verificação rápida';
  @override
  String get scanModeQuickSubtitle => 'Receitas com menos de 15 min';
  @override
  String get scanModeQuickDesc =>
      'Refeições práticas para o dia a dia. Todas as receitas totalizam 15 minutos ou menos; técnicas simples (uma frigideira, salada, fritura rápida).';
  @override
  String get scanModeSurvivalLabel => 'Resgatar';
  @override
  String get scanModeSurvivalSubtitle => 'Use itens expirados primeiro';
  @override
  String get scanModeSurvivalDesc =>
      'Reduz o desperdício. Prioriza itens que parecem prestes a estragar. Itens de campo de dica opcionais são priorizados.';
  @override
  String get scanModeChefLabel => 'Modo chef';
  @override
  String get scanModeChefSubtitle => 'Gourmet e detalhado';
  @override
  String get scanModeChefDesc =>
      'Receitas mais refinadas. Técnicas em camadas, tempos de cozimento mais longos; pelo menos duas receitas marcadas como difíceis.';
  @override
  String get scanModeQuickBestFor =>
      'Refeições durante a semana com ingredientes e tempo mínimos';
  @override
  String get scanModeQuickExamples =>
      '• Omelete de 10 minutos\\n• Massa única\\n• Wrap ou tigela sem cozimento';
  @override
  String get scanModeSurvivalBestFor =>
      'Usar itens antes que expirem e reduzir o desperdício';
  @override
  String get scanModeSurvivalExamples =>
      '• Sopa vegetariana limpa\\n• Fritada de forno\\n• Sobras de arroz frito';
  @override
  String get scanModeChefBestFor =>
      'Jantares especiais, convidados ou aprendizado de uma técnica';
  @override
  String get scanModeChefExamples =>
      '• Molho proteico\\n• Prato crocante e cremoso\\n• Guarnição de vegetais caramelizados';
  @override
  String get scanModeIdealForLabel => 'Melhor para';
  @override
  String get scanModeExamplesLabel => 'Pratos de exemplo';
  @override
  String get survivalHintAddFromPantry => 'Adicione do frescor';
  @override
  String get filterAll => 'Todos';
  @override
  String get filterCritical => 'Crítico';
  @override
  String get filterWarning => 'Aviso';
  @override
  String get filterSafe => 'Seguro';
  @override
  String get recipesScreenTitle => 'Receitas';
  @override
  String get copyRecipe => 'Cópia';
  @override
  String get shareRecipe => 'Compartilhar';
  @override
  String get recipeCopiedSnack => 'Receita copiada para a área de transferência';
  @override
  String get survivalHintTitle => 'Expira em breve';
  @override
  String get survivalHintOptional => 'Opcional - por ex. leite, tomate, iogurte';
  @override
  String get survivalHintPlaceholder => 'Separar com vírgulas';
  @override
  String get scanConfirmReceiptLabel => 'Verificação de recibo';
  @override
  String get scanSavedHistory => 'Digitalização salva no histórico da despensa';
  @override
  String get scanSaveFailedPrefix => 'Não foi possível salvar a digitalização';
  @override
  String get daysUnit => 'dias';
  @override
  String get okButton => 'OK';
  @override
  String get recipesDetectedIngredients => 'Ingredientes detectados';
  @override
  String recipesAiCount(int count) => 'Receitas de IA ·$count';
  @override
  String get galleryPickMessage => 'Escolha uma foto da galeria';
  @override
  String get favoritesEmpty =>
      'Ainda não há receitas favoritas.\\nToque no coração nos resultados da receita.';
  @override
  String recipeDetailTitle(int? index) =>
      index != null ? 'Receita ${index + 1}' : 'Receita';

  @override
  String get timeAgoJustNow => 'Agora mesmo';
  @override
  String timeAgoMinutes(int minutes) => '${minutes}há muito tempo';
  @override
  String timeAgoHours(int hours) => '${hours}h atrás';
  @override
  String timeAgoDays(int days) => '${days}d atrás';
  @override
  String get daysExpired => 'Expirado';
  @override
  String get daysToday => 'Hoje';
  @override
  String get daysTomorrow => 'Amanhã';
  @override
  String daysCount(int days) => '$days dias';
  @override
  String unifiedDaysRemaining(int days) => '$days dias restantes';
  @override
  String productCount(int count) => '$count Unid';
  @override
  String get unifiedSourceReceipt => 'Recibo';
  @override
  String get unifiedSourceScan => 'Digitalizar';
  @override
  String unifiedLastScan(String date) => 'Última verificação ·$date';
  @override
  String get receiptFieldProductName => 'Nome do produto';
  @override
  String get receiptFieldQuantity => 'Quantidade';
  @override
  String get receiptFieldCategory => 'Categoria';
  @override
  String expiryApprox(int days) => 'Melhor antes ~$days dias';
  @override
  String barcodeEan(String code) => 'EAN$code';
  @override
  String get shoppingListAddedSnack =>
      'Ingredientes ausentes adicionados à lista de compras';
  @override
  String pantryHistorySummary(int ingredients, int recipes) =>
      '$ingredients ingredientes ·$recipes receitas';
  @override
  String get favoriteAddTooltip => 'Adicionar aos favoritos';
  @override
  String get favoriteRemoveTooltip => 'Remover dos favoritos';
  @override
  String get favoriteAddedSnack => 'Adicionado aos favoritos';
  @override
  String get favoriteRemovedSnack => 'Removido dos favoritos';
  @override
  String get onboardingScanTitle => 'Digitalize sua despensa';
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
  String get onboardingFavoritesTitle => 'Favoritos e verificações recentes';
  @override
  String get onboardingFavoritesBody =>
      'Salve receitas que você gosta. As verificações recentes abrem rapidamente na tela inicial.';
  @override
  String get onboardingCloudTitle => 'Histórico da nuvem';
  @override
  String get onboardingCloudBody =>
      'Faça login para salvar o histórico de digitalização em sua conta e retornar a qualquer momento.';
  @override
  String get onboardingPermissionsTitle => 'Câmera e notificações';
  @override
  String get onboardingPermissionsBody =>
      'O CyberChef precisa da câmera para escanear a geladeira, recibos e códigos de barras. Notificações opcionais lembram quando os alimentos estão prestes a vencer.';
  @override
  String get emptyStateScanReceipt => 'Escanear recibo';
  @override
  String get emptyStateStartScan => 'Começar a escanear';
  @override
  String get manageSubscriptions => 'Gerenciar assinatura';
  @override
  String get notificationCriticalChannelName => 'Alertas de atualização';
  @override
  String get notificationCriticalChannelDesc => 'Itens expirando em breve';
  @override
  String get notificationDailyChannelName => 'Resumo diário';
  @override
  String get notificationDailyChannelDesc => 'Lembrete de frescor diário';
  @override
  String get notificationCriticalTitle => 'Itens expirando em breve';
  @override
  String notificationCriticalBody(String names, String extra) =>
      '$names$extra — Verifique o painel Frescura.';
  @override
  String get notificationDailyTitle => 'Verificação de frescor';
  @override
  String get notificationDailyBody =>
      'Revise os itens que você deve usar hoje.';
  @override
  String get widgetFreshnessGood => 'O frescor parece bom';
  @override
  String widgetFreshnessCritical(int count) =>
      '$count itens podem expirar hoje';
  @override
  String widgetCountsSummary(int critical, int warning) =>
      '$critical crítico ·$warning aviso';
  @override
  String get categoryDairy => 'Laticínio';
  @override
  String get categoryMeat => 'Carne / peixe';
  @override
  String get categoryFruit => 'Fruta';
  @override
  String get categoryVegetable => 'Vegetal';
  @override
  String get categoryBeverage => 'Bebida';
  @override
  String get categoryBakery => 'Padaria';
  @override
  String get categoryPantry => 'Despensa';
  @override
  String calendarMonthName(int month) => const [
        'Janeiro',
        'Fevereiro',
        'Marchar',
        'abril',
        'Poderia',
        'Junho',
        'Julho',
        'Agosto',
        'Setembro',
        'outubro',
        'novembro',
        'dezembro',
      ][month - 1];
  @override
  String get appBrandName => 'CyberChef';
  @override
  String appVersionLabel(String version) => 'CyberChef v$version';
  @override
  String get recipesPlaceholderTitle => 'Receitas';
  @override
  String get recipesPlaceholderBody =>
      'Os resultados da receita aparecerão aqui após uma verificação bem-sucedida.';
  @override
  String get recipeSamplePlating => 'Revestimento de amostra';
  @override
  String get recipeShareInstructionsHeader => 'Instruções:';
  @override
  String get recipeShareFooter => '— CyberChef';
  @override
  String get expiryDatePrefix => 'Exp.';
  @override
  String get themeTitle => 'Tema';
  @override
  String get themeSubtitle => 'Paleta de cores e fundo';
  @override
  String get themeNeonLabel => 'Neon';
  @override
  String get themeNeonSubtitle => 'Verde escuro padrão';
  @override
  String get themeOceanLabel => 'Ocean';
  @override
  String get themeOceanSubtitle => 'Tons azuis legais';
  @override
  String get themeEmberLabel => 'Ember';
  @override
  String get themeEmberSubtitle => 'Acentos quentes de âmbar';
  @override
  String get themeLavenderLabel => 'Lavender';
  @override
  String get themeLavenderSubtitle => 'Sotaque roxo escuro';
  @override
  String get themeDaylightLabel => 'Daylight';
  @override
  String get themeDaylightSubtitle => 'Fundo claro';
  @override
  String get themeCreamLabel => 'Cream';
  @override
  String get themeCreamSubtitle => 'Creme quente com detalhes em laranja';
}
