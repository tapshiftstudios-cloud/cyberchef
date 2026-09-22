import 'package:cyberchef/core/utils/json_parser.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('parseGeminiJson', () {
    test('parses plain JSON object', () {
      final map = parseGeminiJson('{"ingredients":["a"],"recipes":[]}');

      expect(map['ingredients'], ['a']);
      expect(map['recipes'], isEmpty);
    });

    test('strips markdown code fence', () {
      const raw = '''
```json
{"receipt_detected":true,"items":[]}
```
''';

      final map = parseGeminiJson(raw);

      expect(map['receipt_detected'], isTrue);
    });

    test('extracts JSON when surrounded by extra text', () {
      final map = parseGeminiJson(
        'Here is the result:\n{"ingredients":[],"recipes":[]}\nDone.',
      );

      expect(map, isA<Map<String, dynamic>>());
      expect(map['recipes'], isEmpty);
    });

    test('throws when no JSON object present', () {
      expect(
        () => parseGeminiJson('no json here'),
        throwsA(isA<FormatException>()),
      );
    });

    test('throws when root is not an object', () {
      expect(
        () => parseGeminiJson('[1,2,3]'),
        throwsA(isA<FormatException>()),
      );
    });
  });
}
