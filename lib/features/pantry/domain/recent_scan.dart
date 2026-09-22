import '../../../core/enums/scan_mode.dart';
import '../../recipes/domain/models/recipe_models.dart';

class RecentScan {
  const RecentScan({
    required this.id,
    required this.scannedAt,
    required this.mode,
    required this.analysis,
  });

  factory RecentScan.fromJson(Map<String, dynamic> json) {
    return RecentScan(
      id: json['id'] as String,
      scannedAt: DateTime.parse(json['scannedAt'] as String),
      mode: ScanMode.fromApiValue(json['mode'] as String? ?? ''),
      analysis: PantryAnalysisResult.fromJson(
        json['analysis'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'scannedAt': scannedAt.toIso8601String(),
        'mode': mode.name,
        'analysis': analysis.toJson(),
      };

  final String id;
  final DateTime scannedAt;
  final ScanMode mode;
  final PantryAnalysisResult analysis;

  String get headline {
    if (analysis.recipes.isNotEmpty) return analysis.recipes.first.title;
    if (analysis.ingredients.isNotEmpty) {
      return analysis.ingredients.take(3).join(', ');
    }
    return 'Tarama';
  }
}
