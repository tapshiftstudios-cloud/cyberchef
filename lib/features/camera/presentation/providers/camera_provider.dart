import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/camera_platform.dart';

final camerasProvider = FutureProvider<List<CameraDescription>>((ref) async {
  if (!supportsLiveCamera) return [];
  try {
    return await availableCameras();
  } catch (_) {
    return [];
  }
});

final cameraControllerProvider =
    AsyncNotifierProvider<CameraControllerNotifier, CameraController?>(
  CameraControllerNotifier.new,
);

class CameraControllerNotifier extends AsyncNotifier<CameraController?> {
  CameraController? _controller;

  @override
  Future<CameraController?> build() async {
    ref.onDispose(_disposeController);
    return null;
  }

  Future<void> activate() async {
    if (!supportsLiveCamera) return;
    if (state.isLoading) return;
    if (_controller?.value.isInitialized ?? false) return;

    state = const AsyncLoading();

    try {
      final cameras = await ref.read(camerasProvider.future);
      if (cameras.isEmpty) {
        state = const AsyncData(null);
        return;
      }

      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      final controller = CameraController(
        back,
        ResolutionPreset.high,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      await controller.initialize();
      _controller = controller;
      state = AsyncData(controller);
    } catch (e, st) {
      await _disposeController();
      state = AsyncError(e, st);
    }
  }

  Future<void> deactivate() async {
    await _disposeController();
    state = const AsyncData(null);
  }

  Future<void> _disposeController() async {
    final controller = _controller;
    _controller = null;
    if (controller != null) {
      await controller.dispose();
    }
  }

  Future<XFile?> capturePhoto() async {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return null;
    }
    try {
      await controller.setFlashMode(FlashMode.off);
      return controller.takePicture();
    } catch (_) {
      return null;
    }
  }
}
