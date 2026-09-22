/// Tarif başına tahmini besin değeri (Gemini).
class NutritionEstimate {
  const NutritionEstimate({
    this.calories,
    this.proteinG,
    this.carbsG,
    this.fatG,
    this.servings = 1,
  });

  final int? calories;
  final int? proteinG;
  final int? carbsG;
  final int? fatG;
  final int servings;

  bool get hasData =>
      calories != null || proteinG != null || carbsG != null || fatG != null;

  factory NutritionEstimate.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const NutritionEstimate();
    return NutritionEstimate(
      calories: (json['calories'] as num?)?.round(),
      proteinG: (json['protein_g'] as num?)?.round(),
      carbsG: (json['carbs_g'] as num?)?.round(),
      fatG: (json['fat_g'] as num?)?.round(),
      servings: (json['servings'] as num?)?.round() ?? 1,
    );
  }

  Map<String, dynamic> toJson() => {
        if (calories != null) 'calories': calories,
        if (proteinG != null) 'protein_g': proteinG,
        if (carbsG != null) 'carbs_g': carbsG,
        if (fatG != null) 'fat_g': fatG,
        'servings': servings,
      };
}
