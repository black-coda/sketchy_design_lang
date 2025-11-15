import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

import '../theme/sketchy_typography.dart';

/// Rough-styled radio button built on [WiredRadio].
class SketchyRadio<T> extends StatelessWidget {
  /// Creates a radio widget tied to [value] within a group.
  const SketchyRadio({
    required this.value,
    required this.groupValue,
    super.key,
    this.onChanged,
  });

  /// Value represented by this radio option.
  final T value;

  /// Currently selected group value.
  final T? groupValue;

  /// Callback invoked when the radio is selected.
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) => WiredRadio<T>(
    value: value,
    groupValue: groupValue,
    onChanged: (next) {
      if (onChanged == null) return false;
      onChanged!(next);
      return true;
    },
  );
}

/// Labeled radio tile that wires the text + control.
class SketchyRadioTile<T> extends StatelessWidget {
  /// Creates a radio tile with text label [title].
  const SketchyRadioTile({
    required this.title,
    required this.value,
    required this.groupValue,
    super.key,
    this.onChanged,
  });

  /// Text rendered next to the radio control.
  final String title;

  /// Option this tile represents.
  final T value;

  /// Currently selected group value.
  final T? groupValue;

  /// Callback invoked when the radio is tapped.
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final typography = SketchyTypography.of(context);
    return Row(
      children: [
        Expanded(child: Text(title, style: typography.body)),
        SketchyRadio<T>(
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
