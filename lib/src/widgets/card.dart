import 'package:flutter/widgets.dart';
import 'package:rough_flutter/rough_flutter.dart';

import '../theme/sketchy_theme.dart';

class SketchyCard extends StatelessWidget {
  const SketchyCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.height,
  });
  final Widget child;
  final EdgeInsetsGeometry padding;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    final decorated = Container(padding: padding, child: child);

    return Container(
      height: height,
      decoration: RoughBoxDecoration(
        borderStyle: RoughDrawingStyle(
          width: theme.strokeWidth,
          color: theme.colors.ink,
        ),
        fillStyle: RoughDrawingStyle(color: theme.colors.paper),
        drawConfig: DrawConfig.build(curveFitting: 0.9, bowing: 1),
        filler: ZigZagFiller(),
      ),
      child: decorated,
    );
  }
}
