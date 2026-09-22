import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/receipt_offline_queue.dart';

final receiptQueueProvider =
    StateNotifierProvider<ReceiptQueueNotifier, List<ReceiptQueueEntry>>(
  (ref) => ReceiptQueueNotifier(),
);

class ReceiptQueueNotifier extends StateNotifier<List<ReceiptQueueEntry>> {
  ReceiptQueueNotifier() : super(const []) {
    refresh();
  }

  Future<void> refresh() async {
    state = await ReceiptOfflineQueue.loadAll();
  }

  Future<void> enqueue(Uint8List bytes) async {
    await ReceiptOfflineQueue.enqueue(bytes);
    await refresh();
  }

  Future<File?> imageFile(String id) async {
    ReceiptQueueEntry? entry;
    for (final e in state) {
      if (e.id == id) {
        entry = e;
        break;
      }
    }
    if (entry == null) return null;
    final f = File(entry.imagePath);
    if (await f.exists()) return f;
    return null;
  }

  Future<void> remove(String id) async {
    await ReceiptOfflineQueue.remove(id);
    await refresh();
  }
}
