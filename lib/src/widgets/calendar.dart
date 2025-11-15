import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

/// Sketchy-flavored calendar built on top of [WiredCalendar].
class SketchyCalendar extends StatelessWidget {
  /// Creates a calendar highlighting [selected].
  const SketchyCalendar({super.key, this.selected, this.onSelected});

  /// Initially selected date.
  final DateTime? selected;

  /// Callback invoked when the selection changes.
  final ValueChanged<DateTime>? onSelected;

  @override
  Widget build(BuildContext context) => WiredCalendar(
    selected: selected == null ? null : _format(selected!),
    onSelected: (value) {
      if (onSelected == null) return;
      final parsed = DateTime.tryParse(value);
      if (parsed != null) {
        onSelected!(parsed);
      }
    },
  );
}

String _format(DateTime value) {
  final year = value.year.toString().padLeft(4, '0');
  final month = value.month.toString().padLeft(2, '0');
  final day = value.day.toString().padLeft(2, '0');
  return '$year$month$day';
}
