import 'package:cyberchef/services/bosch/home_connect_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parses homeappliances list', () {
    const json = {
      'data': {
        'homeappliances': [
          {
            'haId': 'SIEMENS-HCS05FRF1-ABC',
            'type': 'FridgeFreezer',
            'name': 'Fridge Simulator',
            'connected': true,
          },
        ],
      },
    };
    final list = HomeConnectApi.extractApplianceMaps(json);
    expect(list.length, 1);
    expect(list.first['haId'], 'SIEMENS-HCS05FRF1-ABC');
  });

  test('detects insufficient scope errors', () {
    final e = HomeConnectApiException('Insufficient scope for this resource');
    expect(e.isInsufficientScope, isTrue);
    expect(
      HomeConnectApiException('images HTTP 403').isInsufficientScope,
      isFalse,
    );
  });

  test('parses images list', () {
    const json = {
      'data': {
        'images': [
          {'key': 'img-1', 'timestamp': 100},
        ],
      },
    };
    final list = HomeConnectApi.extractImageMaps(json);
    expect(list.first['key'], 'img-1');
  });
}
