import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../enums/camera_capture_type.dart';
import '../providers/main_shell_tab_provider.dart';
import '../../features/camera/presentation/providers/camera_scan_providers.dart';

/// Opens the Scan tab, optionally switching capture mode (fridge / receipt / barcode).
void openScanTab(
  WidgetRef ref, {
  CameraCaptureType captureType = CameraCaptureType.fridge,
}) {
  ref.read(cameraCaptureTypeProvider.notifier).state = captureType;
  ref.read(mainShellTabIndexProvider.notifier).state = 0;
}
