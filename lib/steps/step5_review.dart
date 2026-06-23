import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../theme/app_colors.dart';
import '../widgets/shared_widgets.dart';

class Step5Review extends StatelessWidget {
  const Step5Review({super.key, required this.invite});
  final DateInvite invite;

  @override
  Widget build(BuildContext context) {
    final rows = <({String icon, String label, String value})>[
      (
        icon:  '💌',
        label: 'Invited by',
        value: invite.senderName.isEmpty
            ? 'Someone special'
            : invite.senderName,
      ),
      (icon: '💕', label: 'For',      value: invite.personName),
      (icon: '📍', label: 'Location', value: invite.place),
      (icon: '📅', label: 'Date',     value: invite.formattedDate()),
      (icon: '🕰️', label: 'Time',    value: invite.timeOfDay),
      (icon: '✨', label: 'Vibe',     value: invite.vibe),
      if (invite.message.isNotEmpty)
        (icon: '💬', label: 'Message', value: invite.message),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepLabel('Step 5 of 5  ·  Review'),
          const SizedBox(height: 10),

          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.cream, Color(0xFFFFE4EA)],
              ),
              borderRadius: BorderRadius.circular(18),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: rows
                  .map((r) => SummaryRow(
                        icon:  r.icon,
                        label: r.label,
                        value: r.value,
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
