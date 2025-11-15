import 'package:flutter/widgets.dart';
import 'package:rough_flutter/rough_flutter.dart';

import '../theme/sketchy_theme.dart';

class SketchyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SketchyAppBar({
    required this.title,
    super.key,
    this.actions,
    this.leading,
  });
  final Widget title;
  final List<Widget>? actions;
  final Widget? leading;

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    return Container(
      height: preferredSize.height,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: RoughBoxDecoration(
        borderStyle: RoughDrawingStyle(
          width: theme.strokeWidth,
          color: theme.colors.ink,
        ),
        fillStyle: RoughDrawingStyle(color: theme.colors.paper),
        drawConfig: DrawConfig.build(seed: 9, curveFitting: 0.8, bowing: 1),
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
    );
  }
}
