import 'package:flutter/painting.dart';

class SketchyColors {
  const SketchyColors({
    required this.ink,
    required this.paper,
    required this.accent,
    required this.accentMuted,
    required this.info,
    required this.warning,
    required this.success,
  });
  final Color ink;
  final Color paper;
  final Color accent;
  final Color accentMuted;
  final Color info;
  final Color warning;
  final Color success;

  SketchyColors copyWith({
    Color? ink,
    Color? paper,
    Color? accent,
    Color? accentMuted,
    Color? info,
    Color? warning,
    Color? success,
  }) => SketchyColors(
    ink: ink ?? this.ink,
    paper: paper ?? this.paper,
    accent: accent ?? this.accent,
    accentMuted: accentMuted ?? this.accentMuted,
    info: info ?? this.info,
    warning: warning ?? this.warning,
    success: success ?? this.success,
  );
}
