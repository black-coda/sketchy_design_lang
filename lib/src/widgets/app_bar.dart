import 'package:flutter/widgets.dart';

import '../primitives/sketchy_primitives.dart';
import '../theme/sketchy_theme.dart';
import 'surface.dart';

/// Rough-styled app bar used by Sketchy screens.
class SketchyAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// Creates a sketchy app bar with the given [title].
  const SketchyAppBar({
    required this.title,
    super.key,
    this.actions,
    this.leading,
  });

  /// Title widget displayed at the center.
  final Widget title;

  /// Optional action widgets rendered on the trailing edge.
  final List<Widget>? actions;

  /// Optional leading widget (e.g., back button).
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SketchySurface(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        fillColor: theme.colors.paper,
        strokeColor: theme.colors.ink,
        createPrimitive: () => SketchyPrimitive.roundedRectangle(
          cornerRadius: theme.borderRadius,
          fill: SketchyFill.none,
        ),
        child: Row(
          children: [
            leading ?? const SizedBox.shrink(),
            if (leading != null) const SizedBox(width: 12),
            Expanded(
              child: DefaultTextStyle(
                style: theme.typography.title.copyWith(color: theme.colors.ink),
                child: title,
              ),
            ),
            if (actions != null && actions!.isNotEmpty) ...[
              const SizedBox(width: 8),
              ...actions!.map(
                (widget) => Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: widget,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
