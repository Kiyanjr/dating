import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
//  FloatingHeartsLayer
//  Decorative animated hearts that float upward across the background.
// ─────────────────────────────────────────────────────────────────────────────

class FloatingHeartsLayer extends StatefulWidget {
  const FloatingHeartsLayer({super.key});

  @override
  State<FloatingHeartsLayer> createState() =>
      _FloatingHeartsLayerState();
}

class _FloatingHeartsLayerState extends State<FloatingHeartsLayer>
    with TickerProviderStateMixin {
  static const _emojis = [
    '💕', '🌹', '💗', '❤️', '💖', '🌸', '💝', '✨'
  ];

  final List<_HeartParticle> _particles = [];
  late final AnimationController _tickCtrl;

  @override
  void initState() {
    super.initState();

    // Create 18 particles with staggered timing
    for (int i = 0; i < 18; i++) {
      _particles.add(
        _HeartParticle(
          emoji:       _emojis[i % _emojis.length],
          xFrac:       (i * 37 % 100) / 100.0,
          durationSec: 8 + (i * 13 % 14),
          delaySec:    (i * 7 % 12).toDouble(),
          sizeFactor:  0.8 + (i % 5) * 0.15,
          vsync:       this,
        ),
      );
    }

    // Ticker to drive setState for position updates
    _tickCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _tickCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tickCtrl.dispose();
    for (final p in _particles) {
      p.ctrl.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return IgnorePointer(
      child: Stack(
        children: _particles.map((p) {
          final val = p.ctrl.value;
          final opacity = val < 0.1
              ? val * 4
              : val > 0.9
                  ? (1 - val) * 10
                  : 0.25;
          return Positioned(
            left: size.width * p.xFrac,
            top:  size.height * (1.0 - val),
            child: Opacity(
              opacity: opacity.clamp(0.0, 1.0),
              child: Text(
                p.emoji,
                style: TextStyle(fontSize: 14 * p.sizeFactor),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
//  _HeartParticle
// ─────────────────────────────────────────────────────────────────────────────
class _HeartParticle {
  _HeartParticle({
    required this.emoji,
    required this.xFrac,
    required int durationSec,
    required double delaySec,
    required this.sizeFactor,
    required TickerProvider vsync,
  }) {
    ctrl = AnimationController(
      vsync: vsync,
      duration: Duration(seconds: durationSec),
    );
    Future.delayed(
      Duration(milliseconds: (delaySec * 1000).toInt()),
      () { if (!ctrl.isCompleted) ctrl.repeat(); },
    );
  }

  final String emoji;
  final double xFrac;
  final double sizeFactor;
  late final AnimationController ctrl;
}
