import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

import '../../core/config/bosch_config.dart';

class HomeConnectAppliance {
  HomeConnectAppliance({
    required this.haId,
    required this.type,
    required this.name,
    required this.connected,
  });

  final String haId;
  final String type;
  final String name;
  final bool connected;

  bool get isFridgeFreezer =>
      type.toLowerCase().contains('fridge') ||
      type.toLowerCase().contains('freezer');
}

class HomeConnectImageRef {
  HomeConnectImageRef({required this.key, this.timestamp});

  final String key;
  final int? timestamp;
}

class HomeConnectApiException implements Exception {
  HomeConnectApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  bool get isInsufficientScope =>
      message.toLowerCase().contains('insufficient scope');

  @override
  String toString() => message;
}

class HomeConnectApi {
  HomeConnectApi({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;

  Uri _uri(String path) => Uri.parse('${BoschConfig.apiHost}$path');

  Map<String, String> _jsonHeaders(String accessToken) => {
        'Authorization': 'Bearer $accessToken',
        'Accept': BoschConfig.jsonAccept,
      };

  Future<List<HomeConnectAppliance>> listAppliances(String accessToken) async {
    final response = await _client
        .get(_uri('/api/homeappliances'), headers: _jsonHeaders(accessToken))
        .timeout(const Duration(seconds: 20));

    if (response.statusCode != 200) {
      throw HomeConnectApiException(
        _errorMessage(response.body) ?? 'homeappliances HTTP ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }

    final json = jsonDecode(response.body);
    final list = extractApplianceMaps(json);
    return list
        .map((e) {
          final haId = e['haId']?.toString() ?? '';
          if (haId.isEmpty) return null;
          return HomeConnectAppliance(
            haId: haId,
            type: e['type']?.toString() ?? '',
            name: e['name']?.toString() ?? haId,
            connected: e['connected'] == true,
          );
        })
        .whereType<HomeConnectAppliance>()
        .toList();
  }

  Future<HomeConnectAppliance> findFridgeFreezer(String accessToken) async {
    final appliances = await listAppliances(accessToken);
    final fridge = appliances.where((a) => a.isFridgeFreezer).toList();
    if (fridge.isEmpty) {
      throw HomeConnectApiException('No FridgeFreezer appliance found (simulator paired?)');
    }
    final connected = fridge.where((a) => a.connected);
    if (connected.isNotEmpty) {
      return connected.first;
    }
    return fridge.first;
  }

  Future<List<HomeConnectImageRef>> listFridgeImages(
    String accessToken,
    String haId,
  ) async {
    final response = await _client
        .get(
          _uri('/api/homeappliances/$haId/images'),
          headers: _jsonHeaders(accessToken),
        )
        .timeout(const Duration(seconds: 20));

    if (response.statusCode == 404) {
      return [];
    }
    if (response.statusCode != 200) {
      throw HomeConnectApiException(
        _errorMessage(response.body) ?? 'images HTTP ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }

    final json = jsonDecode(response.body);
    final images = extractImageMaps(json);
    return images
        .map((e) {
          final key = e['key']?.toString() ?? e['imagekey']?.toString() ?? '';
          if (key.isEmpty) return null;
          final ts = e['timestamp'];
          return HomeConnectImageRef(
            key: key,
            timestamp: ts is int ? ts : int.tryParse(ts?.toString() ?? ''),
          );
        })
        .whereType<HomeConnectImageRef>()
        .toList();
  }

  Future<Uint8List> downloadImage(
    String accessToken,
    String haId,
    String imageKey,
  ) async {
    final encodedKey = Uri.encodeComponent(imageKey);
    final response = await _client
        .get(
          _uri('/api/homeappliances/$haId/images/$encodedKey'),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Accept': 'image/jpeg,image/png,application/octet-stream,*/*',
          },
        )
        .timeout(const Duration(seconds: 30));

    if (response.statusCode != 200) {
      throw HomeConnectApiException(
        'image download HTTP ${response.statusCode}',
        statusCode: response.statusCode,
      );
    }
    return response.bodyBytes;
  }

  Future<Uint8List> fetchLatestFridgePhoto(String accessToken) async {
    final fridge = await findFridgeFreezer(accessToken);
    if (!fridge.connected) {
      throw HomeConnectApiException(
        '${fridge.name} is offline in Home Connect.',
      );
    }
    final images = await listFridgeImages(accessToken, fridge.haId);
    if (images.isEmpty) {
      throw HomeConnectApiException(
        'No fridge camera images yet. Open the simulator fridge or trigger a snapshot.',
      );
    }
    images.sort((a, b) => (b.timestamp ?? 0).compareTo(a.timestamp ?? 0));
    return downloadImage(accessToken, fridge.haId, images.first.key);
  }

  static List<Map<String, dynamic>> extractApplianceMaps(Object? json) {
    if (json is! Map<String, dynamic>) return [];
    final data = json['data'];
    if (data is Map<String, dynamic>) {
      final appliances = data['homeappliances'];
      if (appliances is List) {
        return appliances.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
      }
    }
    return [];
  }

  static List<Map<String, dynamic>> extractImageMaps(Object? json) {
    if (json is! Map<String, dynamic>) return [];
    final data = json['data'];
    if (data is Map<String, dynamic>) {
      final images = data['images'];
      if (images is List) {
        return images.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
      }
    }
    if (data is List) {
      return data.whereType<Map>().map((e) => Map<String, dynamic>.from(e)).toList();
    }
    return [];
  }

  static String? _errorMessage(String body) {
    try {
      final json = jsonDecode(body);
      if (json is Map<String, dynamic>) {
        final err = json['error'];
        if (err is Map) {
          return err['description']?.toString() ?? err['key']?.toString();
        }
      }
    } catch (_) {}
    return null;
  }
}
