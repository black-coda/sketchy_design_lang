import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

import '../theme/sketchy_typography.dart';

/// Hand-drawn checkbox built on top of [WiredCheckbox].
class SketchyCheckbox extends StatelessWidget {
  /// Creates a checkbox bound to [value].
  const SketchyCheckbox({required this.value, super.key, this.onChanged});

  /// Whether the checkbox is checked.
  final bool value;

  /// Change handler invoked with the new value.
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) => WiredCheckbox(
        value: value,
        onChanged: (next) {
          if (onChanged == null) {
            return;
          }
          onChanged!(next ?? false);
        },
      );
}

/// Checkbox paired with a text label.
class SketchyCheckboxTile extends StatelessWidget {
  /// Creates a labeled checkbox.
  const SketchyCheckboxTile({
    required this.label,
    required this.value,
    super.key,
    this.onChanged,
  });

  /// Label rendered next to the checkbox.
  final String label;

  /// Whether the checkbox is checked.
  final bool value;

  /// Change handler invoked with the new value.
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final typography = SketchyTypography.of(context);
    return Row(
      children: [
        Expanded(child: Text(label, style: typography.body)),
        SketchyCheckbox(value: value, onChanged: onChanged),
      ],
    );
  }
}
