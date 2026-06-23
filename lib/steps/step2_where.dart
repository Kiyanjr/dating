import 'package:flutter/material.dart';
import '../models/date_invite.dart';
import '../widgets/shared_widgets.dart';

class Step2Where extends StatefulWidget {
  const Step2Where({super.key, required this.invite});
  final DateInvite invite;

  @override
  State<Step2Where> createState() => _Step2WhereState();
}

class _Step2WhereState extends State<Step2Where> {
  // List of (emoji, label) place options
  static const _places = [
    ('☕',  'Cozy Café'),
    ('🌆',  'Rooftop Restaurant'),
    ('🕯️', 'Candlelit Dinner'),
    ('🧺',  'Park Picnic'),
    ('🌅',  'Beach Sunset'),
    ('🎬',  'Cinema Night'),
    ('🍰',  'Dessert Bar'),
    ('🎁',  'Surprise Me!'),
  ];

  String _selected = '';
  late final TextEditingController _customCtrl;

  @override
  void initState() {
    super.initState();
    _customCtrl = TextEditingController();
    _selected   = widget.invite.place;
  }

  @override
  void dispose() {
    _customCtrl.dispose();
    super.dispose();
  }

  void _selectPlace(String label) {
    setState(() => _selected = label);
    widget.invite.place = label;
    _customCtrl.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepLabel('Step 2 of 5  ·  Where'),
          const SizedBox(height: 10),

          // Chip grid
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: _places.map((p) {
              return RomChip(
                label: '${p.$1} ${p.$2}',
                selected: _selected == p.$2,
                onTap: () => _selectPlace(p.$2),
              );
            }).toList(),
          ),
          const SizedBox(height: 14),

          // Custom input
          RomField(
            label: 'Or write your own spot',
            hint: 'Your dream location…',
            ctrl: _customCtrl,
            onChanged: (v) {
              if (v.isNotEmpty) {
                setState(() => _selected = '');
                widget.invite.place = v;
              }
            },
          ),
        ],
      ),
    );
  }
}
