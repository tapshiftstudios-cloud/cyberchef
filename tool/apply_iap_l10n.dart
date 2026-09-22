// ignore_for_file: avoid_print

import 'dart:io';

/// Patches monetization / empty-state strings in generated locale files.
/// Run: dart run tool/apply_iap_l10n.dart
void main() {
  const keys = [
    'storeUnavailable',
    'proProductIdsNotConfigured',
    'noProProductsFound',
    'purchaseFlowFailed',
    'purchaseCompletedProActivated',
    'purchaseCompletedVerifyFailed',
    'purchaseFailed',
    'restorePurchases',
    'restorePurchasesStarted',
    'manageSubscriptions',
    'emptyStateScanReceipt',
    'emptyStateStartScan',
    'onboardingPermissionsTitle',
    'onboardingPermissionsBody',
  ];

  final root = Directory.current;
  if (!File('${root.path}/pubspec.yaml').existsSync()) {
    stderr.writeln('Run from project root.');
    exit(1);
  }

  var patched = 0;
  for (final entry in _translations.entries) {
    final code = entry.key;
    final file = File('lib/core/l10n/strings_$code.dart');
    if (!file.existsSync()) {
      print('Skip missing strings_$code.dart');
      continue;
    }
    var content = file.readAsStringSync();
    for (final key in keys) {
      final value = entry.value[key];
      if (value == null) continue;
      final before = content;
      content = _patchGetter(content, key, value);
      if (content != before) {
        patched++;
      } else {
        print('WARN: $code.$key not found');
      }
    }
    file.writeAsStringSync(content);
    print('Updated strings_$code.dart');
  }
  print('Patched $patched getters.');
}

String _patchGetter(String content, String key, String value) {
  final replacement = _formatGetter(key, value);
  final multi = RegExp(
    '@override\\s+String get $key =>\\s*\\n\\s*\'(?:\\\\\'|[^\'])*\'(?:\\s*\\n\\s*\'(?:\\\\\'|[^\'])*\')*;',
  );
  if (multi.hasMatch(content)) {
    return content.replaceFirst(
      multi,
      '@override\n  $replacement',
    );
  }
  final single = RegExp(
    '@override\\s+String get $key =>\\s*\'(?:\\\\\'|[^\'])*\';',
  );
  if (single.hasMatch(content)) {
    return content.replaceFirst(
      single,
      '@override\n  $replacement',
    );
  }
  return content;
}

String _formatGetter(String key, String value) {
  final escaped = value.replaceAll("'", r"\'");
  if (escaped.length > 56 || escaped.contains('\n')) {
    return "String get $key =>\n      '$escaped';";
  }
  return "String get $key => '$escaped';";
}

const _translations = <String, Map<String, String>>{
  'de': {
    'storeUnavailable':
        'Der Store ist derzeit nicht verfügbar. Bitte versuchen Sie es später erneut.',
    'proProductIdsNotConfigured':
        'Pro-Produkt-IDs sind noch nicht konfiguriert.',
    'noProProductsFound': 'Keine kaufbaren Pro-Produkte gefunden.',
    'purchaseFlowFailed': 'Kauf konnte nicht gestartet werden.',
    'purchaseCompletedProActivated':
        'Kauf abgeschlossen. Pro-Plan aktiviert.',
    'purchaseCompletedVerifyFailed':
        'Kauf abgeschlossen. Verifizierung derzeit nicht möglich, bitte später erneut versuchen.',
    'purchaseFailed': 'Kauf fehlgeschlagen.',
    'restorePurchases': 'Käufe wiederherstellen',
    'restorePurchasesStarted':
        'Frühere Käufe im Play Store werden überprüft…',
    'manageSubscriptions': 'Abo verwalten',
    'emptyStateScanReceipt': 'Beleg scannen',
    'emptyStateStartScan': 'Scan starten',
    'onboardingPermissionsTitle': 'Kamera & Benachrichtigungen',
    'onboardingPermissionsBody':
        'CyberChef benötigt Kamerazugriff zum Scannen von Kühlschrank, Belegen und Barcodes. Optionale Benachrichtigungen erinnern Sie, wenn Lebensmittel ablaufen.',
  },
  'fr': {
    'storeUnavailable':
        'Le magasin est indisponible. Réessayez plus tard.',
    'proProductIdsNotConfigured':
        'Les identifiants produit Pro ne sont pas configurés.',
    'noProProductsFound': 'Aucun produit Pro disponible à l\'achat.',
    'purchaseFlowFailed': 'Impossible de démarrer l\'achat.',
    'purchaseCompletedProActivated':
        'Achat terminé. Plan Pro activé.',
    'purchaseCompletedVerifyFailed':
        'Achat terminé. Vérification impossible pour le moment, réessayez bientôt.',
    'purchaseFailed': 'Échec de l\'achat.',
    'restorePurchases': 'Restaurer les achats',
    'restorePurchasesStarted':
        'Vérification des achats précédents sur le Play Store…',
    'manageSubscriptions': 'Gérer l\'abonnement',
    'emptyStateScanReceipt': 'Scanner un reçu',
    'emptyStateStartScan': 'Commencer le scan',
    'onboardingPermissionsTitle': 'Caméra et notifications',
    'onboardingPermissionsBody':
        'CyberChef a besoin de la caméra pour scanner le frigo, les reçus et les codes-barres. Les notifications optionnelles vous rappellent quand les aliments expirent bientôt.',
  },
  'es': {
    'storeUnavailable':
        'La tienda no está disponible. Inténtalo de nuevo más tarde.',
    'proProductIdsNotConfigured':
        'Los ID de producto Pro no están configurados.',
    'noProProductsFound': 'No se encontraron productos Pro disponibles.',
    'purchaseFlowFailed': 'No se pudo iniciar la compra.',
    'purchaseCompletedProActivated':
        'Compra completada. Plan Pro activado.',
    'purchaseCompletedVerifyFailed':
        'Compra completada. No se pudo verificar aún; inténtalo de nuevo pronto.',
    'purchaseFailed': 'La compra falló.',
    'restorePurchases': 'Restaurar compras',
    'restorePurchasesStarted':
        'Comprobando compras anteriores en Play Store…',
    'manageSubscriptions': 'Gestionar suscripción',
    'emptyStateScanReceipt': 'Escanear ticket',
    'emptyStateStartScan': 'Empezar a escanear',
    'onboardingPermissionsTitle': 'Cámara y notificaciones',
    'onboardingPermissionsBody':
        'CyberChef necesita la cámara para escanear la nevera, tickets y códigos de barras. Las notificaciones opcionales te avisan cuando la comida está a punto de caducar.',
  },
  'pt': {
    'storeUnavailable':
        'A loja está indisponível. Tente novamente mais tarde.',
    'proProductIdsNotConfigured':
        'Os IDs de produto Pro não estão configurados.',
    'noProProductsFound': 'Nenhum produto Pro disponível para compra.',
    'purchaseFlowFailed': 'Não foi possível iniciar a compra.',
    'purchaseCompletedProActivated':
        'Compra concluída. Plano Pro ativado.',
    'purchaseCompletedVerifyFailed':
        'Compra concluída. Não foi possível verificar agora; tente novamente em breve.',
    'purchaseFailed': 'Falha na compra.',
    'restorePurchases': 'Restaurar compras',
    'restorePurchasesStarted':
        'Verificando compras anteriores na Play Store…',
    'manageSubscriptions': 'Gerenciar assinatura',
    'emptyStateScanReceipt': 'Escanear recibo',
    'emptyStateStartScan': 'Começar a escanear',
    'onboardingPermissionsTitle': 'Câmera e notificações',
    'onboardingPermissionsBody':
        'O CyberChef precisa da câmera para escanear a geladeira, recibos e códigos de barras. Notificações opcionais lembram quando os alimentos estão prestes a vencer.',
  },
  'it': {
    'storeUnavailable':
        'Lo store non è disponibile. Riprova più tardi.',
    'proProductIdsNotConfigured':
        'Gli ID prodotto Pro non sono configurati.',
    'noProProductsFound': 'Nessun prodotto Pro acquistabile trovato.',
    'purchaseFlowFailed': 'Impossibile avviare l\'acquisto.',
    'purchaseCompletedProActivated':
        'Acquisto completato. Piano Pro attivato.',
    'purchaseCompletedVerifyFailed':
        'Acquisto completato. Verifica non riuscita; riprova tra poco.',
    'purchaseFailed': 'Acquisto non riuscito.',
    'restorePurchases': 'Ripristina acquisti',
    'restorePurchasesStarted':
        'Verifica acquisti precedenti su Play Store…',
    'manageSubscriptions': 'Gestisci abbonamento',
    'emptyStateScanReceipt': 'Scansiona scontrino',
    'emptyStateStartScan': 'Inizia scansione',
    'onboardingPermissionsTitle': 'Fotocamera e notifiche',
    'onboardingPermissionsBody':
        'CyberChef usa la fotocamera per scansionare frigo, scontrini e codici a barre. Le notifiche opzionali ti avvisano quando il cibo sta per scadere.',
  },
  'nl': {
    'storeUnavailable':
        'De store is niet beschikbaar. Probeer het later opnieuw.',
    'proProductIdsNotConfigured':
        'Pro-product-ID\'s zijn niet geconfigureerd.',
    'noProProductsFound': 'Geen Pro-producten gevonden om te kopen.',
    'purchaseFlowFailed': 'Aankoop kon niet worden gestart.',
    'purchaseCompletedProActivated':
        'Aankoop voltooid. Pro-abonnement geactiveerd.',
    'purchaseCompletedVerifyFailed':
        'Aankoop voltooid. Verificatie mislukt; probeer het binnenkort opnieuw.',
    'purchaseFailed': 'Aankoop mislukt.',
    'restorePurchases': 'Aankopen herstellen',
    'restorePurchasesStarted':
        'Eerdere aankopen in Play Store controleren…',
    'manageSubscriptions': 'Abonnement beheren',
    'emptyStateScanReceipt': 'Bon scannen',
    'emptyStateStartScan': 'Begin met scannen',
    'onboardingPermissionsTitle': 'Camera en meldingen',
    'onboardingPermissionsBody':
        'CyberChef heeft cameratoegang nodig om koelkast, bonnen en barcodes te scannen. Optionele meldingen waarschuwen wanneer voedsel bijna verloopt.',
  },
  'pl': {
    'storeUnavailable':
        'Sklep jest niedostępny. Spróbuj ponownie później.',
    'proProductIdsNotConfigured':
        'Identyfikatory produktów Pro nie są skonfigurowane.',
    'noProProductsFound': 'Nie znaleziono produktów Pro do zakupu.',
    'purchaseFlowFailed': 'Nie udało się rozpocząć zakupu.',
    'purchaseCompletedProActivated':
        'Zakup zakończony. Plan Pro aktywowany.',
    'purchaseCompletedVerifyFailed':
        'Zakup zakończony. Weryfikacja nie powiodła się; spróbuj ponownie wkrótce.',
    'purchaseFailed': 'Zakup nie powiódł się.',
    'restorePurchases': 'Przywróć zakupy',
    'restorePurchasesStarted':
        'Sprawdzanie poprzednich zakupów w Play Store…',
    'manageSubscriptions': 'Zarządzaj subskrypcją',
    'emptyStateScanReceipt': 'Skanuj paragon',
    'emptyStateStartScan': 'Rozpocznij skanowanie',
    'onboardingPermissionsTitle': 'Aparat i powiadomienia',
    'onboardingPermissionsBody':
        'CyberChef potrzebuje aparatu do skanowania lodówki, paragonów i kodów kreskowych. Opcjonalne powiadomienia przypominają o zbliżającym się terminie ważności.',
  },
  'ru': {
    'storeUnavailable':
        'Магазин недоступен. Попробуйте позже.',
    'proProductIdsNotConfigured':
        'Идентификаторы продуктов Pro не настроены.',
    'noProProductsFound': 'Нет доступных продуктов Pro для покупки.',
    'purchaseFlowFailed': 'Не удалось начать покупку.',
    'purchaseCompletedProActivated':
        'Покупка завершена. План Pro активирован.',
    'purchaseCompletedVerifyFailed':
        'Покупка завершена. Не удалось проверить; повторите позже.',
    'purchaseFailed': 'Покупка не удалась.',
    'restorePurchases': 'Восстановить покупки',
    'restorePurchasesStarted':
        'Проверка предыдущих покупок в Play Store…',
    'manageSubscriptions': 'Управление подпиской',
    'emptyStateScanReceipt': 'Сканировать чек',
    'emptyStateStartScan': 'Начать сканирование',
    'onboardingPermissionsTitle': 'Камера и уведомления',
    'onboardingPermissionsBody':
        'CyberChef нужен доступ к камере для сканирования холодильника, чеков и штрихкодов. Необязательные уведомления напоминают о скором сроке годности.',
  },
  'ja': {
    'storeUnavailable':
        'ストアは現在利用できません。後でもう一度お試しください。',
    'proProductIdsNotConfigured':
        'Pro商品IDが設定されていません。',
    'noProProductsFound': '購入可能なPro商品が見つかりません。',
    'purchaseFlowFailed': '購入を開始できませんでした。',
    'purchaseCompletedProActivated':
        '購入が完了しました。Proプランが有効になりました。',
    'purchaseCompletedVerifyFailed':
        '購入は完了しましたが、確認できませんでした。しばらくしてから再試行してください。',
    'purchaseFailed': '購入に失敗しました。',
    'restorePurchases': '購入を復元',
    'restorePurchasesStarted':
        'Play Storeで以前の購入を確認しています…',
    'manageSubscriptions': 'サブスクリプションを管理',
    'emptyStateScanReceipt': 'レシートをスキャン',
    'emptyStateStartScan': 'スキャンを開始',
    'onboardingPermissionsTitle': 'カメラと通知',
    'onboardingPermissionsBody':
        'CyberChefは冷蔵庫・レシート・バーコードのスキャンにカメラが必要です。任意の通知で賞味期限が近い食品をお知らせします。',
  },
  'ko': {
    'storeUnavailable':
        '스토어를 사용할 수 없습니다. 나중에 다시 시도하세요.',
    'proProductIdsNotConfigured':
        'Pro 제품 ID가 구성되지 않았습니다.',
    'noProProductsFound': '구매 가능한 Pro 제품을 찾을 수 없습니다.',
    'purchaseFlowFailed': '구매를 시작할 수 없습니다.',
    'purchaseCompletedProActivated':
        '구매가 완료되었습니다. Pro 플랜이 활성화되었습니다.',
    'purchaseCompletedVerifyFailed':
        '구매는 완료되었으나 확인하지 못했습니다. 잠시 후 다시 시도하세요.',
    'purchaseFailed': '구매에 실패했습니다.',
    'restorePurchases': '구매 복원',
    'restorePurchasesStarted':
        'Play Store에서 이전 구매를 확인하는 중…',
    'manageSubscriptions': '구독 관리',
    'emptyStateScanReceipt': '영수증 스캔',
    'emptyStateStartScan': '스캔 시작',
    'onboardingPermissionsTitle': '카메라 및 알림',
    'onboardingPermissionsBody':
        'CyberChef는 냉장고, 영수증, 바코드 스캔에 카메라가 필요합니다. 선택적 알림으로 유통기한이 임박한 식품을 알려줍니다.',
  },
  'zh': {
    'storeUnavailable':
        '商店当前不可用，请稍后再试。',
    'proProductIdsNotConfigured':
        'Pro 产品 ID 尚未配置。',
    'noProProductsFound': '未找到可购买的 Pro 产品。',
    'purchaseFlowFailed': '无法开始购买流程。',
    'purchaseCompletedProActivated':
        '购买完成，Pro 计划已激活。',
    'purchaseCompletedVerifyFailed':
        '购买完成，但暂时无法验证，请稍后重试。',
    'purchaseFailed': '购买失败。',
    'restorePurchases': '恢复购买',
    'restorePurchasesStarted':
        '正在 Play Store 中检查以前的购买…',
    'manageSubscriptions': '管理订阅',
    'emptyStateScanReceipt': '扫描收据',
    'emptyStateStartScan': '开始扫描',
    'onboardingPermissionsTitle': '相机和通知',
    'onboardingPermissionsBody':
        'CyberChef 需要相机权限来扫描冰箱、收据和条形码。可选通知会在食物即将过期时提醒您。',
  },
  'hi': {
    'storeUnavailable':
        'स्टोर अभी उपलब्ध नहीं है। बाद में पुनः प्रयास करें।',
    'proProductIdsNotConfigured':
        'Pro उत्पाद ID कॉन्फ़िगर नहीं हैं।',
    'noProProductsFound': 'कोई खरीद योग्य Pro उत्पाद नहीं मिला।',
    'purchaseFlowFailed': 'खरीद प्रक्रिया शुरू नहीं हो सकी।',
    'purchaseCompletedProActivated':
        'खरीद पूर्ण। Pro योजना सक्रिय।',
    'purchaseCompletedVerifyFailed':
        'खरीद पूर्ण, सत्यापन असफल; कृपया थोड़ी देर बाद पुनः प्रयास करें।',
    'purchaseFailed': 'खरीद विफल।',
    'restorePurchases': 'खरीद पुनर्स्थापित करें',
    'restorePurchasesStarted':
        'Play Store में पिछली खरीद जाँची जा रही है…',
    'manageSubscriptions': 'सदस्यता प्रबंधित करें',
    'emptyStateScanReceipt': 'रसीद स्कैन करें',
    'emptyStateStartScan': 'स्कैन शुरू करें',
    'onboardingPermissionsTitle': 'कैमरा और सूचनाएँ',
    'onboardingPermissionsBody':
        'CyberChef को फ्रिज, रसीद और बारकोड स्कैन के लिए कैमरा चाहिए। वैकल्पिक सूचनाएँ समाप्ति के करीब भोजन की याद दिलाती हैं।',
  },
  'id': {
    'storeUnavailable':
        'Toko tidak tersedia. Coba lagi nanti.',
    'proProductIdsNotConfigured':
        'ID produk Pro belum dikonfigurasi.',
    'noProProductsFound': 'Tidak ada produk Pro yang dapat dibeli.',
    'purchaseFlowFailed': 'Tidak dapat memulai pembelian.',
    'purchaseCompletedProActivated':
        'Pembelian selesai. Paket Pro diaktifkan.',
    'purchaseCompletedVerifyFailed':
        'Pembelian selesai. Verifikasi gagal; coba lagi sebentar lagi.',
    'purchaseFailed': 'Pembelian gagal.',
    'restorePurchases': 'Pulihkan pembelian',
    'restorePurchasesStarted':
        'Memeriksa pembelian sebelumnya di Play Store…',
    'manageSubscriptions': 'Kelola langganan',
    'emptyStateScanReceipt': 'Pindai struk',
    'emptyStateStartScan': 'Mulai pemindaian',
    'onboardingPermissionsTitle': 'Kamera & notifikasi',
    'onboardingPermissionsBody':
        'CyberChef membutuhkan kamera untuk memindai kulkas, struk, dan barcode. Notifikasi opsional mengingatkan saat makanan hampir kedaluwarsa.',
  },
  'vi': {
    'storeUnavailable':
        'Cửa hàng hiện không khả dụng. Hãy thử lại sau.',
    'proProductIdsNotConfigured':
        'ID sản phẩm Pro chưa được cấu hình.',
    'noProProductsFound': 'Không tìm thấy sản phẩm Pro để mua.',
    'purchaseFlowFailed': 'Không thể bắt đầu mua hàng.',
    'purchaseCompletedProActivated':
        'Mua thành công. Gói Pro đã được kích hoạt.',
    'purchaseCompletedVerifyFailed':
        'Mua thành công nhưng chưa xác minh được; thử lại sau.',
    'purchaseFailed': 'Mua thất bại.',
    'restorePurchases': 'Khôi phục giao dịch',
    'restorePurchasesStarted':
        'Đang kiểm tra giao dịch trước trên Play Store…',
    'manageSubscriptions': 'Quản lý đăng ký',
    'emptyStateScanReceipt': 'Quét hóa đơn',
    'emptyStateStartScan': 'Bắt đầu quét',
    'onboardingPermissionsTitle': 'Camera & thông báo',
    'onboardingPermissionsBody':
        'CyberChef cần camera để quét tủ lạnh, hóa đơn và mã vạch. Thông báo tùy chọn nhắc khi thực phẩm sắp hết hạn.',
  },
  'ar': {
    'storeUnavailable':
        'المتجر غير متاح حالياً. حاول مرة أخرى لاحقاً.',
    'proProductIdsNotConfigured':
        'معرّفات منتجات Pro غير مُعدّة.',
    'noProProductsFound': 'لم يتم العثور على منتجات Pro قابلة للشراء.',
    'purchaseFlowFailed': 'تعذّر بدء عملية الشراء.',
    'purchaseCompletedProActivated':
        'اكتمل الشراء. تم تفعيل خطة Pro.',
    'purchaseCompletedVerifyFailed':
        'اكتمل الشراء. تعذّر التحقق؛ حاول مرة أخرى قريباً.',
    'purchaseFailed': 'فشل الشراء.',
    'restorePurchases': 'استعادة المشتريات',
    'restorePurchasesStarted':
        'جارٍ التحقق من المشتريات السابقة في Play Store…',
    'manageSubscriptions': 'إدارة الاشتراك',
    'emptyStateScanReceipt': 'مسح الإيصال',
    'emptyStateStartScan': 'بدء المسح',
    'onboardingPermissionsTitle': 'الكاميرا والإشعارات',
    'onboardingPermissionsBody':
        'يحتاج CyberChef إلى الكاميرا لمسح الثلاجة والإيصالات والباركود. الإشعارات الاختيارية تذكّرك عند اقتراب انتهاء صلاحية الطعام.',
  },
  'uk': {
    'storeUnavailable':
        'Магазин недоступний. Спробуйте пізніше.',
    'proProductIdsNotConfigured':
        'Ідентифікатори продуктів Pro не налаштовані.',
    'noProProductsFound': 'Немає доступних продуктів Pro для покупки.',
    'purchaseFlowFailed': 'Не вдалося розпочати покупку.',
    'purchaseCompletedProActivated':
        'Покупку завершено. План Pro активовано.',
    'purchaseCompletedVerifyFailed':
        'Покупку завершено. Не вдалося перевірити; спробуйте знову незабаром.',
    'purchaseFailed': 'Покупка не вдалася.',
    'restorePurchases': 'Відновити покупки',
    'restorePurchasesStarted':
        'Перевірка попередніх покупок у Play Store…',
    'manageSubscriptions': 'Керувати підпискою',
    'emptyStateScanReceipt': 'Сканувати чек',
    'emptyStateStartScan': 'Почати сканування',
    'onboardingPermissionsTitle': 'Камера та сповіщення',
    'onboardingPermissionsBody':
        'CyberChef потребує камери для сканування холодильника, чеків і штрихкодів. Необов’язкові сповіщення нагадують про термін придатності.',
  },
  'cs': {
    'storeUnavailable':
        'Obchod není dostupný. Zkuste to později.',
    'proProductIdsNotConfigured':
        'ID produktů Pro nejsou nakonfigurována.',
    'noProProductsFound': 'Nebyly nalezeny žádné produkty Pro k zakoupení.',
    'purchaseFlowFailed': 'Nákup se nepodařilo spustit.',
    'purchaseCompletedProActivated':
        'Nákup dokončen. Plán Pro aktivován.',
    'purchaseCompletedVerifyFailed':
        'Nákup dokončen. Ověření se nezdařilo; zkuste to brzy znovu.',
    'purchaseFailed': 'Nákup se nezdařil.',
    'restorePurchases': 'Obnovit nákupy',
    'restorePurchasesStarted':
        'Kontrola předchozích nákupů v Play Store…',
    'manageSubscriptions': 'Spravovat předplatné',
    'emptyStateScanReceipt': 'Skenovat účtenku',
    'emptyStateStartScan': 'Začít skenovat',
    'onboardingPermissionsTitle': 'Fotoaparát a oznámení',
    'onboardingPermissionsBody':
        'CyberChef potřebuje fotoaparát ke skenování lednice, účtenek a čárových kódů. Volitelná oznámení připomenou blížící se expiraci.',
  },
  'ro': {
    'storeUnavailable':
        'Magazinul nu este disponibil. Încercați mai târziu.',
    'proProductIdsNotConfigured':
        'ID-urile produselor Pro nu sunt configurate.',
    'noProProductsFound': 'Nu s-au găsit produse Pro de cumpărat.',
    'purchaseFlowFailed': 'Nu s-a putut începe achiziția.',
    'purchaseCompletedProActivated':
        'Achiziție finalizată. Plan Pro activat.',
    'purchaseCompletedVerifyFailed':
        'Achiziție finalizată. Verificarea a eșuat; încercați din nou curând.',
    'purchaseFailed': 'Achiziția a eșuat.',
    'restorePurchases': 'Restaurează achizițiile',
    'restorePurchasesStarted':
        'Se verifică achizițiile anterioare în Play Store…',
    'manageSubscriptions': 'Gestionează abonamentul',
    'emptyStateScanReceipt': 'Scanează bonul',
    'emptyStateStartScan': 'Începe scanarea',
    'onboardingPermissionsTitle': 'Cameră și notificări',
    'onboardingPermissionsBody':
        'CyberChef are nevoie de cameră pentru a scana frigiderul, bonurile și codurile de bare. Notificările opționale vă amintesc când alimentele expiră curând.',
  },
  'sv': {
    'storeUnavailable':
        'Butiken är inte tillgänglig. Försök igen senare.',
    'proProductIdsNotConfigured':
        'Pro-produkt-ID:n är inte konfigurerade.',
    'noProProductsFound': 'Inga Pro-produkter hittades att köpa.',
    'purchaseFlowFailed': 'Köpet kunde inte startas.',
    'purchaseCompletedProActivated':
        'Köp slutfört. Pro-plan aktiverad.',
    'purchaseCompletedVerifyFailed':
        'Köp slutfört. Verifiering misslyckades; försök igen snart.',
    'purchaseFailed': 'Köpet misslyckades.',
    'restorePurchases': 'Återställ köp',
    'restorePurchasesStarted':
        'Kontrollerar tidigare köp i Play Store…',
    'manageSubscriptions': 'Hantera prenumeration',
    'emptyStateScanReceipt': 'Skanna kvitto',
    'emptyStateStartScan': 'Börja skanna',
    'onboardingPermissionsTitle': 'Kamera och aviseringar',
    'onboardingPermissionsBody':
        'CyberChef behöver kamera för att skanna kylskåp, kvitton och streckkoder. Valfria aviseringar påminner när mat håller på att gå ut.',
  },
  'da': {
    'storeUnavailable':
        'Butikken er ikke tilgængelig. Prøv igen senere.',
    'proProductIdsNotConfigured':
        'Pro-produkt-ID\'er er ikke konfigureret.',
    'noProProductsFound': 'Ingen Pro-produkter fundet til køb.',
    'purchaseFlowFailed': 'Købet kunne ikke startes.',
    'purchaseCompletedProActivated':
        'Køb gennemført. Pro-plan aktiveret.',
    'purchaseCompletedVerifyFailed':
        'Køb gennemført. Verifikation mislykkedes; prøv igen snart.',
    'purchaseFailed': 'Købet mislykkedes.',
    'restorePurchases': 'Gendan køb',
    'restorePurchasesStarted':
        'Tjekker tidligere køb i Play Store…',
    'manageSubscriptions': 'Administrer abonnement',
    'emptyStateScanReceipt': 'Scan kvittering',
    'emptyStateStartScan': 'Start skanning',
    'onboardingPermissionsTitle': 'Kamera og notifikationer',
    'onboardingPermissionsBody':
        'CyberChef har brug for kamera til at scanne køleskab, kvitteringer og stregkoder. Valgfrie notifikationer minder dig om mad der snart udløber.',
  },
  'fi': {
    'storeUnavailable':
        'Kauppa ei ole käytettävissä. Yritä myöhemmin uudelleen.',
    'proProductIdsNotConfigured':
        'Pro-tuotetunnuksia ei ole määritetty.',
    'noProProductsFound': 'Ostettavia Pro-tuotteita ei löytynyt.',
    'purchaseFlowFailed': 'Ostoa ei voitu aloittaa.',
    'purchaseCompletedProActivated':
        'Osto valmis. Pro-suunnitelma aktivoitu.',
    'purchaseCompletedVerifyFailed':
        'Osto valmis. Vahvistus epäonnistui; yritä pian uudelleen.',
    'purchaseFailed': 'Osto epäonnistui.',
    'restorePurchases': 'Palauta ostot',
    'restorePurchasesStarted':
        'Tarkistetaan aiempia ostoja Play Storessa…',
    'manageSubscriptions': 'Hallitse tilausta',
    'emptyStateScanReceipt': 'Skannaa kuitti',
    'emptyStateStartScan': 'Aloita skannaus',
    'onboardingPermissionsTitle': 'Kamera ja ilmoitukset',
    'onboardingPermissionsBody':
        'CyberChef tarvitsee kameran jääkaapin, kuittien ja viivakoodien skannaukseen. Valinnaiset ilmoitukset muistuttavat vanhenevista elintarvikkeista.',
  },
  'el': {
    'storeUnavailable':
        'Το κατάστημα δεν είναι διαθέσιμο. Δοκιμάστε αργότερα.',
    'proProductIdsNotConfigured':
        'Τα αναγνωριστικά προϊόντων Pro δεν έχουν ρυθμιστεί.',
    'noProProductsFound': 'Δεν βρέθηκαν προϊόντα Pro προς αγορά.',
    'purchaseFlowFailed': 'Δεν ήταν δυνατή η έναρξη αγοράς.',
    'purchaseCompletedProActivated':
        'Η αγορά ολοκληρώθηκε. Το πλάνο Pro ενεργοποιήθηκε.',
    'purchaseCompletedVerifyFailed':
        'Η αγορά ολοκληρώθηκε. Η επαλήθευση απέτυχε· δοκιμάστε ξανά σύντομα.',
    'purchaseFailed': 'Η αγορά απέτυχε.',
    'restorePurchases': 'Επαναφορά αγορών',
    'restorePurchasesStarted':
        'Έλεγχος προηγούμενων αγορών στο Play Store…',
    'manageSubscriptions': 'Διαχείριση συνδρομής',
    'emptyStateScanReceipt': 'Σάρωση απόδειξης',
    'emptyStateStartScan': 'Έναρξη σάρωσης',
    'onboardingPermissionsTitle': 'Κάμερα και ειδοποιήσεις',
    'onboardingPermissionsBody':
        'Το CyberChef χρειάζεται κάμερα για σάρωση ψυγείου, αποδείξεων και barcode. Προαιρετικές ειδοποιήσεις υπενθυμίζουν λήξη τροφίμων.',
  },
  'hu': {
    'storeUnavailable':
        'Az áruház nem elérhető. Próbálja újra később.',
    'proProductIdsNotConfigured':
        'A Pro termékazonosítók nincsenek beállítva.',
    'noProProductsFound': 'Nem található megvásárolható Pro termék.',
    'purchaseFlowFailed': 'A vásárlás nem indítható el.',
    'purchaseCompletedProActivated':
        'Vásárlás kész. Pro csomag aktiválva.',
    'purchaseCompletedVerifyFailed':
        'Vásárlás kész. Az ellenőrzés sikertelen; próbálja újra hamarosan.',
    'purchaseFailed': 'A vásárlás sikertelen.',
    'restorePurchases': 'Vásárlások visszaállítása',
    'restorePurchasesStarted':
        'Korábbi vásárlások ellenőrzése a Play Store-ban…',
    'manageSubscriptions': 'Előfizetés kezelése',
    'emptyStateScanReceipt': 'Nyugta szkennelése',
    'emptyStateStartScan': 'Szkennelés indítása',
    'onboardingPermissionsTitle': 'Kamera és értesítések',
    'onboardingPermissionsBody':
        'A CyberChef kamerát igényel a hűtő, nyugták és vonalkódok szkenneléséhez. Az opcionális értesítések emlékeztetnek a lejáró élelmiszerekre.',
  },
  'ms': {
    'storeUnavailable':
        'Kedai tidak tersedia. Cuba lagi nanti.',
    'proProductIdsNotConfigured':
        'ID produk Pro belum dikonfigurasi.',
    'noProProductsFound': 'Tiada produk Pro untuk dibeli.',
    'purchaseFlowFailed': 'Tidak dapat memulakan pembelian.',
    'purchaseCompletedProActivated':
        'Pembelian selesai. Pelan Pro diaktifkan.',
    'purchaseCompletedVerifyFailed':
        'Pembelian selesai. Pengesahan gagal; cuba lagi sebentar lagi.',
    'purchaseFailed': 'Pembelian gagal.',
    'restorePurchases': 'Pulihkan pembelian',
    'restorePurchasesStarted':
        'Menyemak pembelian terdahulu di Play Store…',
    'manageSubscriptions': 'Urus langganan',
    'emptyStateScanReceipt': 'Imbas resit',
    'emptyStateStartScan': 'Mula imbas',
    'onboardingPermissionsTitle': 'Kamera & pemberitahuan',
    'onboardingPermissionsBody':
        'CyberChef memerlukan kamera untuk imbas peti sejuk, resit dan kod bar. Pemberitahuan pilihan mengingatkan makanan hampir luput.',
  },
  'th': {
    'storeUnavailable':
        'ร้านค้าไม่พร้อมใช้งาน ลองใหม่ภายหลัง',
    'proProductIdsNotConfigured':
        'ยังไม่ได้ตั้งค่า ID ผลิตภัณฑ์ Pro',
    'noProProductsFound': 'ไม่พบผลิตภัณฑ์ Pro ที่ซื้อได้',
    'purchaseFlowFailed': 'ไม่สามารถเริ่มการซื้อได้',
    'purchaseCompletedProActivated':
        'ซื้อสำเร็จ เปิดใช้แผน Pro แล้ว',
    'purchaseCompletedVerifyFailed':
        'ซื้อสำเร็จ แต่ยังยืนยันไม่ได้ ลองใหม่อีกครั้งเร็วๆ นี้',
    'purchaseFailed': 'การซื้อล้มเหลว',
    'restorePurchases': 'กู้คืนการซื้อ',
    'restorePurchasesStarted':
        'กำลังตรวจสอบการซื้อก่อนหน้าใน Play Store…',
    'manageSubscriptions': 'จัดการการสมัครสมาชิก',
    'emptyStateScanReceipt': 'สแกนใบเสร็จ',
    'emptyStateStartScan': 'เริ่มสแกน',
    'onboardingPermissionsTitle': 'กล้องและการแจ้งเตือน',
    'onboardingPermissionsBody':
        'CyberChef ต้องใช้กล้องเพื่อสแกนตู้เย็น ใบเสร็จ และบาร์โค้ด การแจ้งเตือนเสริมเตือนเมื่ออาหารใกล้หมดอายุ',
  },
};
