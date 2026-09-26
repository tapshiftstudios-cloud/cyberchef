import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/l10n/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../services/recipe_image_fallback.dart';
import '../../../../services/recipe_image_service.dart';

/// Tarif kartı kapak görseli: API/stock arama + yerel önbellek (V1).
class RecipeVisual extends StatefulWidget {
  const RecipeVisual({
    super.key,
    required this.title,
    this.imageSearchTitle,
    this.imageUrl,
    this.ingredients = const [],
    this.height = 148,
    this.radius = 14,
    this.compact = false,
  });

  final String title;
  final String? imageSearchTitle;
  final String? imageUrl;
  final List<String> ingredients;
  final double height;
  final double radius;
  final bool compact;

  @override
  State<RecipeVisual> createState() => _RecipeVisualState();
}

class _RecipeVisualState extends State<RecipeVisual> {
  late Future<String> _imageFuture;
  var _photoVisible = false;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  @override
  void didUpdateWidget(covariant RecipeVisual oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.title != widget.title ||
        oldWidget.imageSearchTitle != widget.imageSearchTitle ||
        oldWidget.imageUrl != widget.imageUrl ||
        oldWidget.ingredients != widget.ingredients) {
      _loadImage();
    }
  }

  void _loadImage() {
    setState(() => _photoVisible = false);
    _imageFuture = RecipeImageService.instance.resolveUrl(
      widget.imageSearchTitle ?? widget.title,
      explicitUrl: widget.imageUrl,
      ingredients: widget.ingredients,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = _styleForTitle(widget.title);
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: Container(
        height: widget.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: style.colors,
          ),
        ),
        child: FutureBuilder<String>(
          future: _imageFuture,
          builder: (context, snapshot) {
            final searchTitle = widget.imageSearchTitle ?? widget.title;
            final imageUrl = snapshot.data ??
                RecipeImageFallback.urlForTitle(searchTitle);
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      if (progress == null) {
                        if (!_photoVisible) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (mounted) setState(() => _photoVisible = true);
                          });
                        }
                        return child;
                      }
                      return const SizedBox.shrink();
                    },
                    errorBuilder: (_, __, ___) {
                      if (_photoVisible) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (mounted) setState(() => _photoVisible = false);
                        });
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.18),
                          Colors.black.withValues(alpha: 0.35),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -24,
                  bottom: -26,
                  child: Icon(
                    Icons.restaurant,
                    size: 124,
                    color: Colors.white.withValues(alpha: 0.12),
                  ),
                ),
                Positioned(
                  left: 14,
                  top: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: Colors.white.withValues(alpha: 0.2)),
                    ),
                    child: Text(
                      AppStrings.recipeSamplePlating,
                      style: GoogleFonts.inter(
                        fontSize: widget.compact ? 10 : 11,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.92),
                      ),
                    ),
                  ),
                ),
                if (!_photoVisible)
                  Center(
                    child: Text(
                      style.emoji,
                      style: TextStyle(fontSize: widget.compact ? 38 : 48),
                    ),
                  ),
                Positioned(
                  left: 14,
                  right: 14,
                  bottom: 10,
                  child: Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: widget.compact ? 12 : 13,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                      shadows: const [
                        Shadow(blurRadius: 8, color: Colors.black54),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _RecipeVisualStyle _styleForTitle(String rawTitle) {
    final t = rawTitle.toLowerCase();
    if (_any(t, const ['chicken', 'tavuk', 'meat', 'et', 'kebap'])) {
      return const _RecipeVisualStyle(
        emoji: '🍗',
        colors: [Color(0xFF7A2E2E), Color(0xFFE28B4E)],
      );
    }
    if (_any(t, const ['soup', 'çorba', 'corba'])) {
      return const _RecipeVisualStyle(
        emoji: '🍲',
        colors: [Color(0xFF214D67), Color(0xFF4BA3A8)],
      );
    }
    if (_any(t, const ['pasta', 'makarna', 'noodle'])) {
      return const _RecipeVisualStyle(
        emoji: '🍝',
        colors: [Color(0xFF7B431E), Color(0xFFE6A24A)],
      );
    }
    if (_any(t, const ['salad', 'salata'])) {
      return const _RecipeVisualStyle(
        emoji: '🥗',
        colors: [Color(0xFF1D5A3B), Color(0xFF4AB87C)],
      );
    }
    if (_any(t, const ['rice', 'pilav', 'bowl'])) {
      return const _RecipeVisualStyle(
        emoji: '🍛',
        colors: [Color(0xFF6B5128), Color(0xFFC5A15A)],
      );
    }
    if (_any(t, const ['dessert', 'cake', 'tatlı', 'tatli'])) {
      return const _RecipeVisualStyle(
        emoji: '🍰',
        colors: [Color(0xFF6A2B63), Color(0xFFC56AB8)],
      );
    }
    return const _RecipeVisualStyle(
      emoji: '🍽️',
      colors: [Color(0xFF254A78), Color(0xFF47A1C6)],
    );
  }

  bool _any(String text, List<String> words) {
    for (final w in words) {
      if (text.contains(w)) return true;
    }
    return false;
  }
}

class _RecipeVisualStyle {
  const _RecipeVisualStyle({
    required this.emoji,
    required this.colors,
  });

  final String emoji;
  final List<Color> colors;
}
