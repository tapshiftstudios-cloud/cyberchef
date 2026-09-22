import '../../../../core/enums/scan_mode.dart';
import '../../../recipes/domain/models/recipe_models.dart';

class PantryScanRecord {
  const PantryScanRecord({
    required this.id,
    required this.mode,
    required this.ingredients,
    required this.recipes,
    required this.createdAt,
  });

  factory PantryScanRecord.fromJson(Map<String, dynamic> json) {
    return PantryScanRecord(
      id: json['id'] as String,
      mode: ScanMode.fromApiValue(json['mode'] as String? ?? 'quickScan'),
      ingredients: (json['ingredients'] as List<dynamic>? ?? [])
          .map((e) => e.toString())
          .toList(),
      recipes: (json['recipes'] as List<dynamic>? ?? [])
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  final String id;
  final ScanMode mode;
  final List<String> ingredients;
  final List<Recipe> recipes;
  final DateTime createdAt;

  PantryAnalysisResult get analysis => PantryAnalysisResult(
        ingredients: ingredients,
        recipes: recipes,
      );
}
