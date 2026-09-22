import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

/// Çevrimdışı fiş analizi kuyruğu (görüntü dosyaları).
abstract final class ReceiptOfflineQueue {
  static const _indexFileName = 'receipt_queue_index.json';

  static Future<File> _indexFile() async {
    final dir = await getApplicationDocumentsDirectory();
    return File('${dir.path}/$_indexFileName');
  }

  static Future<List<ReceiptQueueEntry>> loadAll() async {
    final file = await _indexFile();
    if (!await file.exists()) return [];
    try {
      final list = jsonDecode(await file.readAsString()) as List<dynamic>;
      return list
          .map((e) => ReceiptQueueEntry.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> enqueue(Uint8List imageBytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final id = DateTime.now().millisecondsSinceEpoch.toString();
    final imageFile = File('${dir.path}/receipt_queue_$id.jpg');
    await imageFile.writeAsBytes(imageBytes);

    final entries = await loadAll();
    entries.insert(
      0,
      ReceiptQueueEntry(
        id: id,
        imagePath: imageFile.path,
        createdAt: DateTime.now(),
      ),
    );
    await _saveIndex(entries);
  }

  static Future<void> remove(String id) async {
    final entries = await loadAll();
    for (final e in entries) {
      if (e.id == id) {
        final f = File(e.imagePath);
        if (await f.exists()) await f.delete();
        break;
      }
    }
    entries.removeWhere((e) => e.id == id);
    await _saveIndex(entries);
  }

  static Future<void> _saveIndex(List<ReceiptQueueEntry> entries) async {
    final file = await _indexFile();
    await file.writeAsString(
      jsonEncode(entries.map((e) => e.toJson()).toList()),
    );
  }
}

class ReceiptQueueEntry {
  const ReceiptQueueEntry({
    required this.id,
    required this.imagePath,
    required this.createdAt,
  });

  final String id;
  final String imagePath;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'image_path': imagePath,
        'created_at': createdAt.toIso8601String(),
      };

  factory ReceiptQueueEntry.fromJson(Map<String, dynamic> json) {
    return ReceiptQueueEntry(
      id: json['id'] as String,
      imagePath: json['image_path'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
