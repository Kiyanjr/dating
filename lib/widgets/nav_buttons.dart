import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../theme/app_colors.dart';

class NavButtons extends StatelessWidget {
  const NavButtons({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.invite,
    required this.onNext,
    required this.onBack,
  });

  final int step;
  final int totalSteps;
  final DateInvite invite;
  final VoidCallback onNext;
  final VoidCallback onBack;

  // ── Validation ───────────────────────────────────────────────────────────
  bool _validate(BuildContext ctx) {
    String? err;

    if (step == 0 && invite.personName.trim().isEmpty) {
      err = 'Please enter their name 🌹';
    } else if (step == 1 && invite.place.trim().isEmpty) {
      err = 'Please choose or write a place 📍';
    } else if (step == 2 && invite.date == null) {
      err = 'Please pick a date 💐';
    } else if (step == 2 && invite.timeOfDay.isEmpty) {
      err = 'Please pick a time of day 🌙';
    } else if (step == 3 && invite.vibe.isEmpty) {
      err = 'Please pick a vibe 💫';
    }

    if (err != null) {
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(err),
          backgroundColor: AppColors.rose,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
        ),
      );
      return false;
    }
    return true;
  }

  // ── Build ────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back button (hidden on first step)
        if (step > 0) ...[
          _BackButton(onTap: onBack),
          const SizedBox(width: 10),
        ],

        // Next / Send button
        Expanded(
          child: _NextButton(
            label: step == totalSteps - 1 ? '💌 Send the invite!' : 'Next →',
            onTap: () {
              if (_validate(context)) onNext();
            },
          ),
        ),
      ],
    );
  }
}

// ── Back button ──────────────────────────────────────────────────────────────
class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: AppColors.cream,
          border: Border.all(color: AppColors.petal, width: 2),
          borderRadius: BorderRadius.circular(14),
        ),
        child: const Text(
          '← Back',
          style: TextStyle(
              color: AppColors.blush, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}

// ── Next / Send button ───────────────────────────────────────────────────────
class _NextButton extends StatelessWidget {
  const _NextButton({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [AppColors.rose, AppColors.blush],
          ),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: AppColors.rose.withOpacity(0.4),
              blurRadius: 20,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
