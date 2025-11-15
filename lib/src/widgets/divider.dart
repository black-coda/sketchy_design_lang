import 'package:flutter/widgets.dart';

import '../theme/sketchy_theme.dart';

class SketchyDivider extends StatelessWidget {
  const SketchyDivider({super.key, this.height = 1});
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    return Container(
      height: height,
      color: theme.colors.ink.withValues(alpha: 0.2),
    );
  }
}
