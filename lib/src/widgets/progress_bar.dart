import 'package:flutter/widgets.dart';

import '../theme/sketchy_theme.dart';

class SketchyProgressBar extends StatelessWidget {
  const SketchyProgressBar({required this.value, super.key});
  final double value;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    return Container(
      height: 16,
      decoration: BoxDecoration(
        border: Border.all(color: theme.colors.ink, width: theme.strokeWidth),
      ),
      child: FractionallySizedBox(
        widthFactor: value.clamp(0, 1),
        alignment: Alignment.centerLeft,
        child: Container(color: theme.colors.accentMuted),
      ),
    );
  }
}
