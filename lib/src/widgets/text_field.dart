import 'package:flutter/widgets.dart';
import 'package:wired_elements/wired_elements.dart';

import '../theme/sketchy_typography.dart';

class SketchyTextField extends StatelessWidget {
  const SketchyTextField({
    super.key,
    this.label,
    this.controller,
    this.onChanged,
    this.hintText,
    this.errorText,
  });
  final String? label;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final typography = SketchyTypography.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WiredInput(
          labelText: label,
          labelStyle: typography.body,
          controller: controller,
          hintText: hintText,
          style: typography.body,
          onChanged: onChanged,
        ),
        if (errorText != null) ...[
          const SizedBox(height: 4),
          Text(
            errorText!,
            style: typography.caption.copyWith(color: const Color(0xFFD64550)),
          ),
        ],
      ],
    );
  }
}
