import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../theme/app_colors.dart';
import '../widgets/floating_hearts_layer.dart';
import '../widgets/step_card.dart';
import '../widgets/final_card.dart';

class AskOutScreen extends StatefulWidget {
  const AskOutScreen({super.key});

  @override
  State<AskOutScreen> createState() => _AskOutScreenState();
}

class _AskOutScreenState extends State<AskOutScreen> {
  static const int totalSteps = 5;

  int _step = 0; // 0-indexed; when _step == totalSteps → final screen
  final DateInvite _invite    = DateInvite();
  final PageController _pageCtrl = PageController();

  // ── Navigation ──────────────────────────────────────────────────────────
  void _goNext() {
    if (_step < totalSteps - 1) {
      setState(() => _step++);
      _pageCtrl.animateToPage(
        _step,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      setState(() => _step = totalSteps); // show final card
    }
  }

  void _goBack() {
    if (_step > 0 && _step < totalSteps) {
      setState(() => _step--);
      _pageCtrl.animateToPage(
        _step,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _restart() {
    setState(() {
      _invite.reset();
      _step = 0;
    });
    _pageCtrl.jumpToPage(0);
  }

  // ── Build ────────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.deepBg1,
              AppColors.deepBg2,
              AppColors.rose,
              AppColors.blush,
            ],
            stops: [0.0, 0.35, 0.70, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Decorative floating hearts in background
            const FloatingHeartsLayer(),

            // Scrollable centred content
            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 24),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: _step == totalSteps
                        ? FinalCard(
                            invite: _invite,
                            onRestart: _restart,
                          )
                        : StepCard(
                            step: _step,
                            invite: _invite,
                            totalSteps: totalSteps,
                            pageCtrl: _pageCtrl,
                            onNext: _goNext,
                            onBack: _goBack,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
