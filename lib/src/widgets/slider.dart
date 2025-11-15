import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

class SketchySlider extends StatelessWidget {
  const SketchySlider({
    required this.value,
    super.key,
    this.min = 0,
    this.max = 1,
    this.onChanged,
  });
  final double value;
  final double min;
  final double max;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) => WiredSlider(
    value: value,
    min: min,
    max: max,
    onChanged: (next) {
      if (onChanged == null) return false;
      onChanged!(next);
      return true;
    },
  );
}
