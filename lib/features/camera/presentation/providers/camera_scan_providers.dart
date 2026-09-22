import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/enums/camera_capture_type.dart';
import '../../../../core/enums/scan_mode.dart';
import '../../../../core/l10n/app_strings.dart';
import '../../../../core/storage/user_preferences_storage.dart';

final cameraCaptureTypeProvider =
    StateProvider<CameraCaptureType>((ref) => CameraCaptureType.fridge);

final selectedScanModeProvider =
    StateNotifierProvider<SelectedScanModeNotifier, ScanMode>(
  (ref) => SelectedScanModeNotifier(),
);

class SelectedScanModeNotifier extends StateNotifier<ScanMode> {
  SelectedScanModeNotifier() : super(ScanMode.quickScan) {
    _load();
  }

  Future<void> _load() async {
    state = await UserPreferencesStorage.loadScanMode();
  }

  Future<void> setMode(ScanMode mode) async {
    state = mode;
    await UserPreferencesStorage.saveScanMode(mode);
  }
}

final isScanningProvider = StateProvider<bool>((ref) => true);

final survivalExpiryHintProvider = StateProvider<String>((ref) => '');

/// Analiz overlay başlık + alt metin (adım adım).
final analysisStatusProvider = StateProvider<({String title, String subtitle})>(
  (ref) => (
    title: AppStrings.analysisTitle,
    subtitle: AppStrings.stepPrepareImage,
  ),
);
