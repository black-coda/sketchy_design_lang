import 'package:flutter/widgets.dart';
import 'package:rough_flutter/rough_flutter.dart';

import '../theme/sketchy_theme.dart';
import '../theme/sketchy_typography.dart';

enum SketchyTileAlignment { start, end }

class SketchyListTile extends StatelessWidget {
  const SketchyListTile({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.alignment = SketchyTileAlignment.start,
  });
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final SketchyTileAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    final typography = SketchyTypography.of(context);

    final content = Container(
      padding: const EdgeInsets.all(12),
      decoration: RoughBoxDecoration(
        borderStyle: RoughDrawingStyle(
          width: theme.strokeWidth,
          color: theme.colors.ink,
        ),
        fillStyle: RoughDrawingStyle(
          color: alignment == SketchyTileAlignment.start
              ? theme.colors.paper
              : theme.colors.accentMuted.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (leading != null) ...[leading!, const SizedBox(width: 12)],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (title != null)
                  DefaultTextStyle(
                    style: typography.body.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    child: title!,
                  ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  DefaultTextStyle(style: typography.caption, child: subtitle!),
                ],
              ],
            ),
          ),
          if (trailing != null) ...[const SizedBox(width: 12), trailing!],
        ],
      ),
    );

    final bubble = alignment == SketchyTileAlignment.end
        ? Align(alignment: Alignment.centerRight, child: content)
        : Align(alignment: Alignment.centerLeft, child: content);

    if (onTap == null) return bubble;
    return GestureDetector(onTap: onTap, child: bubble);
  }
}
