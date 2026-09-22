import 'package:cyberchef/services/bosch/bosch_oauth_callback.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('detects callback path with code', () {
    final uri = Uri.parse(
      'http://192.168.1.10:3000/bosch/callback?code=abc&state=xyz',
    );
    expect(BoschOAuthCallback.looksLikeCallback(uri), isTrue);
    final parsed = BoschOAuthCallback.tryParse(uri);
    expect(parsed?.code, 'abc');
    expect(parsed?.state, 'xyz');
  });

  test('detects API Web Client example.com redirect', () {
    final uri = Uri.parse('https://example.com/?code=abc&state=xyz');
    expect(BoschOAuthCallback.looksLikeCallback(uri), isTrue);
    expect(BoschOAuthCallback.tryParse(uri)?.code, 'abc');
  });

  test('throws on oauth error query', () {
    final uri = Uri.parse(
      'http://localhost:3000/bosch/callback?error=access_denied',
    );
    expect(
      () => BoschOAuthCallback.tryParse(uri),
      throwsA(isA<BoschOAuthCallbackException>()),
    );
  });
}
