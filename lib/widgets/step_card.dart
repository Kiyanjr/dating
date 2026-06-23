import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../theme/app_colors.dart';
import '../steps/step1_who.dart';
import '../steps/step2_where.dart';
import '../steps/step3_when.dart';
import '../steps/step4_vibe.dart';
import '../steps/step5_review.dart';
import 'card_header.dart';
import 'nav_buttons.dart';
import 'progress_dots.dart';

class StepCard extends StatelessWidget {
  const StepCard({
    super.key,
    required this.step,
    required this.invite,
    required this.totalSteps,
    required this.pageCtrl,
    required this.onNext,
    required this.onBack,
  });

  final int step;
  final DateInvite invite;
  final int totalSteps;
  final PageController pageCtrl;
  final VoidCallback onNext;
  final VoidCallback onBack;

  static const _stepHeights = <double>[200, 340, 320, 300, 380];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.rose.withOpacity(0.22),
            blurRadius: 60,
            offset: const Offset(0, 20),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(28, 32, 28, 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Progress indicator ───────────────────────────────────
          ProgressDots(current: step, total: totalSteps),
          const SizedBox(height: 20),

          // ── Per-step header (emoji + title + subtitle) ───────────
          CardHeader(step: step),
          const SizedBox(height: 24),

          // ── Step content (PageView, swipe disabled) ───────────────
          SizedBox(
            height: _stepHeights[step],
            child: PageView(
              controller: pageCtrl,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Step1Who(invite: invite),
                Step2Where(invite: invite),
                Step3When(invite: invite),
                Step4Vibe(invite: invite),
                Step5Review(invite: invite),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // ── Back / Next buttons ───────────────────────────────────
          NavButtons(
            step: step,
            totalSteps: totalSteps,
            invite: invite,
            onNext: onNext,
            onBack: onBack,
          ),
        ],
      ),
    );
  }
}
