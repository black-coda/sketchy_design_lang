import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

import '../theme/sketchy_typography.dart';

class SketchySwitch extends StatelessWidget {
  const SketchySwitch({required this.value, super.key, this.onChanged});
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) => WiredToggle(
    value: value,
    onChange: (next) {
      if (onChanged == null) return false;
      onChanged!(next);
      return true;
    },
  );
}

class SketchySwitchTile extends StatelessWidget {
  const SketchySwitchTile({
    required this.label,
    required this.value,
    super.key,
    this.onChanged,
  });
  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final typography = SketchyTypography.of(context);
    return Row(
      children: [
        Expanded(child: Text(label, style: typography.body)),
        SketchySwitch(value: value, onChanged: onChanged),
      ],
    );
  }
}
