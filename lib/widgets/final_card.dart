import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../theme/app_colors.dart';
import 'pulse_heart.dart';

class FinalCard extends StatelessWidget {
  const FinalCard({
    super.key,
    required this.invite,
    required this.onRestart,
  });

  final DateInvite invite;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.rose.withOpacity(0.25),
            blurRadius: 60,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(28, 36, 28, 32),
      child: Column(
        children: [
          // Animated pulsing heart
          const PulseHeart(),
          const SizedBox(height: 12),

          // Title
          Text(
            'You asked\n${invite.personName}!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Georgia',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.rose,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 8),

          // Optional message
          Text(
            invite.message.isNotEmpty
                ? '"${invite.message}"'
                    '${invite.senderName.isNotEmpty ? ' — ${invite.senderName}' : ''}'
                : 'Your romantic invite is ready. Fingers crossed! 🌹',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.textLight,
              fontStyle: FontStyle.italic,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          // Summary banner
          _DateBanner(invite: invite),
          const SizedBox(height: 20),

          // Restart button
          GestureDetector(
            onTap: onRestart,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 28, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.petal, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Text(
                'Start over 🌸',
                style: TextStyle(
                    color: AppColors.blush,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Date summary banner ───────────────────────────────────────────────────────
class _DateBanner extends StatelessWidget {
  const _DateBanner({required this.invite});
  final DateInvite invite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.rose, AppColors.blush],
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _BannerRow('📍', invite.place),
          const SizedBox(height: 8),
          _BannerRow('📅', invite.formattedDate()),
          const SizedBox(height: 8),
          _BannerRow('🕰️', invite.timeOfDay),
          const SizedBox(height: 8),
          _BannerRow('✨', invite.vibe),
        ],
      ),
    );
  }
}

class _BannerRow extends StatelessWidget {
  const _BannerRow(this.icon, this.text);
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(icon, style: const TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
