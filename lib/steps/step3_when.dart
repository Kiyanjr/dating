import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../theme/app_colors.dart';
import '../widgets/shared_widgets.dart';

class Step3When extends StatefulWidget {
  const Step3When({super.key, required this.invite});
  final DateInvite invite;

  @override
  State<Step3When> createState() => _Step3WhenState();
}

class _Step3WhenState extends State<Step3When> {
  // (emoji, short label, full value stored in invite)
  static const _times = [
    ('🌤️', 'Morning',    'Morning (9–11 AM)'),
    ('☀️',  'Lunchtime', 'Lunch (12–2 PM)'),
    ('🌇',  'Afternoon', 'Afternoon (3–5 PM)'),
    ('🌅',  'Sunset',    'Sunset (6–7 PM)'),
    ('🌙',  'Evening',   'Evening (7–9 PM)'),
    ('✨',  'Late Night','Late Night (9 PM+)'),
  ];

  // ── Date picker ────────────────────────────────────────────────────────
  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.rose,
            onPrimary: AppColors.white,
            surface: AppColors.cream,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) setState(() => widget.invite.date = picked);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepLabel('Step 3 of 5  ·  When'),
          const SizedBox(height: 10),

          // ── Date picker button ─────────────────────────────────────
          GestureDetector(
            onTap: _pickDate,
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: AppColors.cream,
                border: Border.all(color: AppColors.petal, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.calendar_today,
                      color: AppColors.rose, size: 18),
                  const SizedBox(width: 10),
                  Text(
                    widget.invite.date == null
                        ? 'Tap to pick a date…'
                        : widget.invite.formattedDate(),
                    style: TextStyle(
                      fontSize: 15,
                      color: widget.invite.date == null
                          ? AppColors.textLight
                          : AppColors.textDark,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // ── Time of day grid ───────────────────────────────────────
          const Text(
            'Best time of day',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: AppColors.rose,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1.6,
            children: _times.map((t) {
              final isSel = widget.invite.timeOfDay == t.$3;
              return GestureDetector(
                onTap: () =>
                    setState(() => widget.invite.timeOfDay = t.$3),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    color: isSel ? AppColors.blush : AppColors.cream,
                    border: Border.all(
                      color:
                          isSel ? AppColors.blush : AppColors.petal,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(t.$1,
                          style: const TextStyle(fontSize: 18)),
                      const SizedBox(height: 2),
                      Text(
                        t.$2,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: isSel
                              ? AppColors.white
                              : AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
