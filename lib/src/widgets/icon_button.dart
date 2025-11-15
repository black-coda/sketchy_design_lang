import 'package:flutter/widgets.dart';
import 'package:rough_flutter/rough_flutter.dart';

import '../theme/sketchy_theme.dart';
import 'icons.dart';

class SketchyIconButton extends StatelessWidget {
  const SketchyIconButton({
    required this.icon,
    super.key,
    this.onPressed,
    this.size = 40,
  });
  final SketchyIconSymbol icon;
  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    final content = Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: RoughBoxDecoration(
        borderStyle: RoughDrawingStyle(
          width: theme.strokeWidth,
          color: theme.colors.ink,
        ),
        fillStyle: RoughDrawingStyle(color: theme.colors.paper),
      ),
      child: SketchyIcon(icon: icon),
    );

    if (onPressed == null) {
      return Opacity(opacity: 0.4, child: IgnorePointer(child: content));
    }

    return GestureDetector(onTap: onPressed, child: content);
  }
}
