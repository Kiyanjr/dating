import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CardHeader extends StatelessWidget {
  const CardHeader({super.key, required this.step});

  final int step;

  static const _emojis = ['💌', '📍', '📅', '🌹', '✨'];

  static const _titles = [
    'Will you go out\nwith me?',
    'Pick a place',
    'Choose a date',
    'Set the vibe',
    'Your invite',
  ];

  static const _subtitles = [
    'Just a few details to make it perfect ✨',
    'Where would you like to take them?',
    'When is the magic happening?',
    'What feeling are you going for?',
    'Review before sending 💕',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_emojis[step], style: const TextStyle(fontSize: 44)),
        const SizedBox(height: 8),
        Text(
          _titles[step],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Georgia',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: AppColors.deep,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          _subtitles[step],
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 13,
            color: AppColors.textLight,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
