import 'package:flutter/widgets.dart';
import 'package:rough_notation/rough_notation.dart';

import '../theme/sketchy_theme.dart';
import '../theme/sketchy_typography.dart';

enum SketchyAnnotationType { box, circle, underline, highlight }

class SketchyAnnotate extends StatelessWidget {
  const SketchyAnnotate._({
    required this.child,
    required this.type,
    super.key,
    this.label,
  });

  const SketchyAnnotate.box({required Widget child, Key? key, String? label})
    : this._(
        key: key,
        child: child,
        type: SketchyAnnotationType.box,
        label: label,
      );

  const SketchyAnnotate.circle({required Widget child, Key? key, String? label})
    : this._(
        key: key,
        child: child,
        type: SketchyAnnotationType.circle,
        label: label,
      );

  const SketchyAnnotate.underline({
    required Widget child,
    Key? key,
    String? label,
  }) : this._(
         key: key,
         child: child,
         type: SketchyAnnotationType.underline,
         label: label,
       );

  const SketchyAnnotate.highlight({
    required Widget child,
    Key? key,
    String? label,
  }) : this._(
         key: key,
         child: child,
         type: SketchyAnnotationType.highlight,
         label: label,
       );
  final Widget child;
  final String? label;
  final SketchyAnnotationType type;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    final typography = SketchyTypography.of(context);
    final annotation = switch (type) {
      SketchyAnnotationType.box => RoughBoxAnnotation(
        color: theme.colors.accent.withValues(alpha: 0.3),
        child: child,
      ),
      SketchyAnnotationType.circle => RoughCircleAnnotation(
        color: theme.colors.info,
        child: child,
      ),
      SketchyAnnotationType.underline => RoughUnderlineAnnotation(
        color: theme.colors.accent,
        child: child,
      ),
      SketchyAnnotationType.highlight => RoughHighlightAnnotation(
        color: theme.colors.accentMuted,
        child: child,
      ),
    };

    if (label == null) return annotation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        annotation,
        const SizedBox(height: 4),
        Text(
          label!,
          style: typography.caption.copyWith(
            color: theme.colors.ink.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
