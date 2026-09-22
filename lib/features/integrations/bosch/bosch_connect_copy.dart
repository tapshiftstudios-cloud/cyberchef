import '../../../core/l10n/app_strings.dart';

/// Bosch integration copy (EN/TR only until Home Connect ships widely).
abstract final class BoschConnectCopy {
  static bool get _tr => AppStrings.isTurkish;

  static String get sectionTitle =>
      _tr ? 'Akıllı ev (beta)' : 'Smart home (beta)';

  static String get sectionSubtitle => _tr
      ? 'Geliştirici demosu: Home Connect + AI tarama. Mağaza sürümünde kapalı.'
      : 'Developer demo: Home Connect + AI scan. Hidden in store builds.';

  static String get connectTitle =>
      _tr ? 'Bosch dolabımı bağla' : 'Connect Bosch fridge';

  static String get connectSubtitle => _tr
      ? 'Home Connect hesabınla giriş yap (OAuth)'
      : 'Sign in with your Home Connect account (OAuth)';

  static String get connectedSubtitle =>
      _tr ? 'Home Connect bağlı' : 'Home Connect linked';

  /// Shown when linked but camera Images scope is missing (typical beta).
  static String get connectedDemoMode => _tr
      ? 'Bağlı (beta) · kamera: galeri demosu'
      : 'Linked (beta) · camera: gallery demo';

  static String get disconnectTitle =>
      _tr ? 'Bağlantıyı kes' : 'Disconnect';

  static String get disconnectBody => _tr
      ? 'Home Connect bağlantısı bu cihazdan silinir.'
      : 'Removes Home Connect link from this device.';

  static String get backendMissing => _tr
      ? 'BOSCH_BACKEND_URL tanımlı değil (.env)'
      : 'BOSCH_BACKEND_URL is not set (.env)';

  static String get connectSuccess =>
      _tr ? 'Bosch hesabı bağlandı' : 'Bosch account connected';

  static String get connectFailed =>
      _tr ? 'Bağlantı başarısız' : 'Connection failed';

  static String get connectingSubtitle =>
      _tr ? 'Home Connect açılıyor…' : 'Opening Home Connect…';

  static String get backendUnreachableHint => _tr
      ? 'PC\'de backend çalışıyor mu? Telefon aynı Wi‑Fi\'de mi? (.env BOSCH_BACKEND_URL)'
      : 'Is the backend running on your PC? Same Wi‑Fi? (check BOSCH_BACKEND_URL in .env)';

  static String get webViewTitle =>
      _tr ? 'Home Connect girişi' : 'Home Connect sign-in';

  static String oauthError(String code) =>
      _tr ? 'OAuth hatası: $code' : 'OAuth error: $code';

  static String get syncFromFridgeTitle =>
      _tr ? 'Dolaptan envanteri güncelle' : 'Update pantry from fridge';

  static String get syncFromFridgeSubtitle => _tr
      ? 'Kamera veya galeri fotoğrafı → AI tarif'
      : 'Camera or gallery photo → AI recipes';

  static String get syncFetchingPhoto => _tr
      ? 'Buzdolabı fotoğrafı alınıyor…'
      : 'Fetching fridge photo…';

  static String get syncFailed =>
      _tr ? 'Dolap senkronu başarısız' : 'Fridge sync failed';

  static String get syncDone => _tr
      ? 'Dolap taraması tamamlandı'
      : 'Fridge scan complete';

  static String get notLinked => _tr
      ? 'Önce Home Connect bağlantısı gerekli'
      : 'Connect Home Connect first';

  static String get scopeReconnectHint => _tr
      ? 'Bosch kamera izni (FridgeFreezer-Images) portalda yoksa galeri demosunu kullan.'
      : 'If Bosch camera scope is unavailable, use the gallery demo.';

  static String connectedWithScope(String scope) => _tr
      ? 'Bağlı · kamera izni var'
      : 'Linked · camera scope granted';

  static String get imagesScopeMissing => _tr
      ? 'Buzdolabı kamerası için Bosch partner izni gerekir; galeri demosu kullanılabilir.'
      : 'Fridge camera needs Bosch partner approval; gallery demo works.';

  static String get demoPhotoDialogTitle => _tr
      ? 'Galeri demosu'
      : 'Gallery demo';

  static String get demoPhotoDialogBody => _tr
      ? 'Home Connect kamerası bu hesapta kapalı. AI testi için dolap fotoğrafı seç.'
      : 'Home Connect camera is not available for this app. Pick a fridge photo to test AI.';

  static String get demoPhotoPick => _tr ? 'Fotoğraf seç' : 'Pick photo';

  static String get demoPhotoCancel => _tr ? 'İptal' : 'Cancel';
}
