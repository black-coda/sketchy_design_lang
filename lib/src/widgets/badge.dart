import 'package:flutter/widgets.dart';

import '../theme/sketchy_text_case.dart';
import 'chip.dart';

/// Tones supported by [SketchyBadge].
enum SketchyBadgeTone {
  /// Informational tone.
  info,

  /// Accent tone for primary emphasis.
  accent,

  /// Success tone.
  success,

  /// Neutral ink tone.
  neutral,
}

/// Pill-shaped label used for tagging content.
class SketchyBadge extends StatelessWidget {
  /// Creates a badge with the provided [label] and [tone].
  const SketchyBadge({
    required this.label,
    super.key,
    this.tone = SketchyBadgeTone.info,
    this.textCase,
  });

  /// Text displayed inside the badge.
  final String label;

  /// Visual tone applied to the badge fill.
  final SketchyBadgeTone tone;

  /// Text casing transformation. If null, uses theme default.
  final TextCase? textCase;

  SketchyChipTone _mapTone() => switch (tone) {
        SketchyBadgeTone.info => SketchyChipTone.info,
        SketchyBadgeTone.accent => SketchyChipTone.accent,
        SketchyBadgeTone.success => SketchyChipTone.success,
        SketchyBadgeTone.neutral => SketchyChipTone.neutral,
      };

  @override
  Widget build(BuildContext context) => SketchyChip.badge(
        label: label,
        tone: _mapTone(),
        textCase: textCase,
      );
}
