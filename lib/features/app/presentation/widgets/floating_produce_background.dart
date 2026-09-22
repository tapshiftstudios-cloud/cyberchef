import 'dart:math' as math;

import 'package:flutter/material.dart';

/// Splash arka planında yavaşça hareket eden meyve / sebze emojileri.
class FloatingProduceBackground extends StatefulWidget {
  const FloatingProduceBackground({super.key, this.isLight = false});

  final bool isLight;

  @override
  State<FloatingProduceBackground> createState() =>
      _FloatingProduceBackgroundState();
}

class _FloatingProduceBackgroundState extends State<FloatingProduceBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _orbit;

  static const _produce = [
    _ProduceSpec('🍅', 0.0, 28),
    _ProduceSpec('🧅', 0.55, 24),
    _ProduceSpec('🌿', 1.1, 22),
    _ProduceSpec('🥕', 1.65, 26),
    _ProduceSpec('🥬', 2.2, 24),
    _ProduceSpec('🍋', 2.75, 22),
    _ProduceSpec('🥦', 3.3, 26),
    _ProduceSpec('🍇', 3.85, 24),
    _ProduceSpec('🫑', 4.4, 22),
    _ProduceSpec('🥑', 4.95, 24),
    _ProduceSpec('🍊', 5.5, 26),
    _ProduceSpec('🍌', 6.05, 22),
  ];

  @override
  void initState() {
    super.initState();
    _orbit = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat();
  }

  @override
  void dispose() {
    _orbit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _orbit,
      builder: (context, _) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final h = constraints.maxHeight;
            final cx = w / 2;
            final cy = h / 2;
            final orbitR = math.min(w, h) * 0.38;
            final drift = _orbit.value * 2 * math.pi;

            return Stack(
              clipBehavior: Clip.none,
              children: [
                for (final item in _produce)
                  _buildOrbitingItem(
                    item: item,
                    cx: cx,
                    cy: cy,
                    orbitR: orbitR,
                    drift: drift,
                  ),
                ..._buildDrifters(w, h, drift),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildOrbitingItem({
    required _ProduceSpec item,
    required double cx,
    required double cy,
    required double orbitR,
    required double drift,
  }) {
    final angle = drift + item.phase;
    final wobble = math.sin(drift * 2 + item.phase) * 14;
    final x = cx + math.cos(angle) * orbitR - item.size / 2;
    final y = cy + math.sin(angle) * orbitR * 0.92 + wobble - item.size / 2;
    final raw = 0.42 + 0.28 * (0.5 + 0.5 * math.sin(drift + item.phase));
    final minO = widget.isLight ? 0.18 : 0.25;
    final maxO = widget.isLight ? 0.52 : 0.75;
    final opacity = raw.clamp(minO, maxO);

    return Positioned(
      left: x,
      top: y,
      child: Opacity(
        opacity: opacity,
        child: Text(
          item.emoji,
          style: TextStyle(fontSize: item.size, height: 1),
        ),
      ),
    );
  }

  List<Widget> _buildDrifters(double w, double h, double drift) {
    const extras = ['🍎', '🥒', '🌽', '🍓', '🧄', '🫒'];
    final widgets = <Widget>[];
    for (var i = 0; i < extras.length; i++) {
      final t = drift * 0.6 + i * 1.1;
      final x = (w * (0.12 + (i % 3) * 0.28)) + math.sin(t) * 22;
      final y = (h * (0.08 + (i % 2) * 0.75)) + math.cos(t * 1.3) * 18;
      widgets.add(
        Positioned(
          left: x,
          top: y,
          child: Opacity(
            opacity: widget.isLight ? 0.14 : 0.2,
            child: Text(extras[i], style: const TextStyle(fontSize: 20)),
          ),
        ),
      );
    }
    return widgets;
  }
}

class _ProduceSpec {
  const _ProduceSpec(this.emoji, this.phase, this.size);

  final String emoji;
  final double phase;
  final double size;
}
