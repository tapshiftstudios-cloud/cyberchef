import 'package:cyberchef/services/recipe_image_fallback.dart';
import 'package:cyberchef/services/recipe_image_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  test('explicit imageUrl bypasses lookup', () async {
    final url = await RecipeImageService.instance.resolveUrl(
      'Any title',
      explicitUrl: 'https://example.com/cover.jpg',
    );
    expect(url, 'https://example.com/cover.jpg');
  });

  test('fallback returns unsplash url for soup keyword', () {
    final url = RecipeImageFallback.urlForTitle('Mercimek çorbası');
    expect(url, contains('unsplash.com'));
  });

  test('resolveUrl caches fallback when remote fails', () async {
    final service = RecipeImageService();
    final first = await service.resolveUrl('xyz_nonexistent_meal_qwerty');
    final second = await service.resolveUrl('xyz_nonexistent_meal_qwerty');
    expect(first, second);
    expect(first, contains('unsplash.com'));
  });
}
