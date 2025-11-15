import 'package:flutter/material.dart' show DropdownMenuItem;
import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

import '../theme/sketchy_typography.dart';

class SketchyDropdown<T> extends StatelessWidget {
  const SketchyDropdown({
    required this.label,
    required this.items,
    super.key,
    this.value,
    this.onChanged,
  });
  final String label;
  final List<T> items;
  final T? value;
  final ValueChanged<T?>? onChanged;

  @override
  Widget build(BuildContext context) {
    final typography = SketchyTypography.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: typography.body),
        const SizedBox(height: 8),
        WiredCombo(
          value: value,
          items: items
              .map(
                (item) => DropdownMenuItem<T>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(item.toString(), style: typography.body),
                  ),
                ),
              )
              .toList(),
          onChanged: (dynamic selected) {
            if (onChanged != null) {
              onChanged!(selected as T?);
            }
          },
        ),
      ],
    );
  }
}
