import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../widgets/shared_widgets.dart';

class Step4Vibe extends StatefulWidget {
  const Step4Vibe({super.key, required this.invite});
  final DateInvite invite;

  @override
  State<Step4Vibe> createState() => _Step4VibeState();
}

class _Step4VibeState extends State<Step4Vibe> {
  // (emoji, short label, full value stored in invite)
  static const _vibes = [
    ('🕯️', 'Romantic',     'Romantic & intimate'),
    ('🎉',  'Fun & Playful','Fun & playful'),
    ('😌',  'Chill',        'Chill & relaxed'),
    ('🥂',  'Elegant',      'Elegant & classy'),
    ('🌿',  'Adventurous',  'Adventurous'),
    ('🍓',  'Sweet',        'Sweet & low-key'),
  ];

  late final TextEditingController _msgCtrl;

  @override
  void initState() {
    super.initState();
    _msgCtrl =
        TextEditingController(text: widget.invite.message);
  }

  @override
  void dispose() {
    _msgCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepLabel('Step 4 of 5  ·  Vibe'),
          const SizedBox(height: 10),

          // Vibe chips
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _vibes.map((v) {
              return RomChip(
                label: '${v.$1} ${v.$2}',
                selected: widget.invite.vibe == v.$3,
                onTap: () =>
                    setState(() => widget.invite.vibe = v.$3),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),

          // Sweet message textarea
          RomField(
            label: 'A sweet message 💬',
            hint: "Write something from the heart… "
                "e.g. I've been wanting to ask you this for a while 🌹",
            ctrl: _msgCtrl,
            onChanged: (v) => widget.invite.message = v,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
