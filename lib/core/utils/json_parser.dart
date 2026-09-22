import 'dart:convert';

/// Extracts JSON object from Gemini text (handles markdown fences).
Map<String, dynamic> parseGeminiJson(String raw) {
  var text = raw.trim();

  if (text.startsWith('```')) {
    text = text.replaceFirst(RegExp(r'^```(?:json)?\s*', multiLine: true), '');
    text = text.replaceFirst(RegExp(r'\s*```$'), '');
    text = text.trim();
  }

  final start = text.indexOf('{');
  final end = text.lastIndexOf('}');
  if (start == -1 || end == -1 || end <= start) {
    throw const FormatException('No JSON object found in model response.');
  }

  final jsonSlice = text.substring(start, end + 1);
  final decoded = jsonDecode(jsonSlice);
  if (decoded is! Map<String, dynamic>) {
    throw const FormatException('Expected a JSON object at the root.');
  }
  return decoded;
}
