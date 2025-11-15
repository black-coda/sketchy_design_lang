import 'package:flutter/widgets.dart';

import '../primitives/sketchy_primitives.dart';
import '../theme/sketchy_theme.dart';
import 'surface.dart';

/// Container with a hand-drawn border and optional padding.
class SketchyCard extends StatelessWidget {
  /// Creates a new sketchy card wrapping [child].
  const SketchyCard({
    required this.child,
    super.key,
    this.padding = const EdgeInsets.all(16),
    this.height,
  });

  /// Content rendered inside the card.
  final Widget child;

  /// Inner padding applied around [child].
  final EdgeInsetsGeometry padding;

  /// Optional fixed height.
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);

    return SketchySurface(
      height: height,
      padding: padding,
      fillColor: theme.colors.paper,
      strokeColor: theme.colors.ink,
      createPrimitive: () => SketchyPrimitive.roundedRectangle(
        cornerRadius: theme.borderRadius,
        fill: SketchyFill.none,
      ),
      child: child,
    );
  }
}
