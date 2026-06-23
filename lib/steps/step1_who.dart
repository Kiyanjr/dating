import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../widgets/shared_widgets.dart';

class Step1Who extends StatefulWidget {
  const Step1Who({super.key, required this.invite});
  final DateInvite invite;

  @override
  State<Step1Who> createState() => _Step1WhoState();
}

class _Step1WhoState extends State<Step1Who> {
  late final TextEditingController _nameCtrl;
  late final TextEditingController _senderCtrl;

  @override
  void initState() {
    super.initState();
    _nameCtrl   = TextEditingController(text: widget.invite.personName);
    _senderCtrl = TextEditingController(text: widget.invite.senderName);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _senderCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepLabel('Step 1 of 5  ·  Who'),
        const SizedBox(height: 10),

        RomField(
          label: 'Their name 💕',
          hint: 'e.g. Sofia…',
          ctrl: _nameCtrl,
          onChanged: (v) => widget.invite.personName = v,
        ),
        const SizedBox(height: 14),

        RomField(
          label: 'Your name',
          hint: 'Your name…',
          ctrl: _senderCtrl,
          onChanged: (v) => widget.invite.senderName = v,
        ),
      ],
    );
  }
}
