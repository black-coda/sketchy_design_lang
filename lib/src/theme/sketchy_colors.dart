import 'package:flutter/painting.dart';

/// Supported Sketchy color modes derived from `specs/sketchy-mode-colors.png`.
enum SketchyColorMode {
  /// Classic light ink-on-paper palette.
  light,

  /// Bold scarlet-inspired palette.
  red,

  /// Energetic orange palette.
  orange,

  /// Bright yellow palette.
  yellow,

  /// Fresh green palette.
  green,

  /// Playful cyan palette.
  cyan,

  /// Default blue palette.
  blue,

  /// Deep indigo palette.
  indigo,

  /// Vivid violet palette.
  violet,

  /// Punchy magenta palette.
  magenta,

  /// High-contrast dark palette.
  dark,
}

/// Palette describing the “ink and paper” colors Sketchy components use.
class SketchyColors {
  /// Creates a palette with the provided role colors.
  const SketchyColors({
    required this.mode,
    required this.ink,
    required this.paper,
    required this.primary,
    required this.secondary,
    required this.info,
    required this.warning,
    required this.success,
  });

  /// Builds colors for the provided [mode].
  factory SketchyColors.forMode(SketchyColorMode mode) {
    final palette = _modePalettes[mode]!;
    return SketchyColors(
      mode: mode,
      ink: palette.ink,
      paper: palette.paper,
      primary: palette.primary,
      secondary: palette.secondary,
      info: const Color(0xFF4F7CAC),
      warning: const Color(0xFFED6A5A),
      success: const Color(0xFF6C9A8B),
    );
  }

  /// Active color mode.
  final SketchyColorMode mode;

  /// Primary stroke color used for outlines and text.
  final Color ink;

  /// Background color emulating paper.
  final Color paper;

  /// Bold accent color for primary actions.
  final Color primary;

  /// Softer accent variant for fills.
  final Color secondary;

  /// Informational accent color.
  final Color info;

  /// Warning accent color.
  final Color warning;

  /// Success accent color.
  final Color success;

  /// Returns a copy of this palette with the provided overrides.
  SketchyColors copyWith({
    SketchyColorMode? mode,
    Color? ink,
    Color? paper,
    Color? primary,
    Color? secondary,
    Color? info,
    Color? warning,
    Color? success,
  }) => SketchyColors(
    mode: mode ?? this.mode,
    ink: ink ?? this.ink,
    paper: paper ?? this.paper,
    primary: primary ?? this.primary,
    secondary: secondary ?? this.secondary,
    info: info ?? this.info,
    warning: warning ?? this.warning,
    success: success ?? this.success,
  );
}

class _ModePalette {
  const _ModePalette({
    required this.ink,
    required this.paper,
    required this.primary,
    required this.secondary,
  });

  final Color ink;
  final Color paper;
  final Color primary;
  final Color secondary;
}

const Map<SketchyColorMode, _ModePalette> _modePalettes =
    <SketchyColorMode, _ModePalette>{
      SketchyColorMode.light: _ModePalette(
        ink: Color(0xFF1B1B1B),
        paper: Color(0xFFFFFBF5),
        primary: Color(0xFF1B1B1B),
        secondary: Color(0xFFF5F2EA),
      ),
      SketchyColorMode.red: _ModePalette(
        ink: Color(0xFF5C1111),
        paper: Color(0xFFFFF3F0),
        primary: Color(0xFFE53935),
        secondary: Color(0xFFFFCDD2),
      ),
      SketchyColorMode.orange: _ModePalette(
        ink: Color(0xFF7A2F05),
        paper: Color(0xFFFFF4E9),
        primary: Color(0xFFFB8C00),
        secondary: Color(0xFFFFE0B2),
      ),
      SketchyColorMode.yellow: _ModePalette(
        ink: Color(0xFF7C5B04),
        paper: Color(0xFFFFFBE6),
        primary: Color(0xFFFBC02D),
        secondary: Color(0xFFFFF59D),
      ),
      SketchyColorMode.green: _ModePalette(
        ink: Color(0xFF184B2B),
        paper: Color(0xFFF1FFF4),
        primary: Color(0xFF2E7D32),
        secondary: Color(0xFFC8E6C9),
      ),
      SketchyColorMode.cyan: _ModePalette(
        ink: Color(0xFF06464E),
        paper: Color(0xFFF0FDFF),
        primary: Color(0xFF00ACC1),
        secondary: Color(0xFFB2EBF2),
      ),
      SketchyColorMode.blue: _ModePalette(
        ink: Color(0xFF0F305D),
        paper: Color(0xFFF0F6FF),
        primary: Color(0xFF1976D2),
        secondary: Color(0xFFBBDEFB),
      ),
      SketchyColorMode.indigo: _ModePalette(
        ink: Color(0xFF261E61),
        paper: Color(0xFFF4F0FF),
        primary: Color(0xFF5C6BC0),
        secondary: Color(0xFFD1C4E9),
      ),
      SketchyColorMode.violet: _ModePalette(
        ink: Color(0xFF3C164D),
        paper: Color(0xFFFFF0FF),
        primary: Color(0xFF8E24AA),
        secondary: Color(0xFFE1BEE7),
      ),
      SketchyColorMode.magenta: _ModePalette(
        ink: Color(0xFF5A0E2A),
        paper: Color(0xFFFFF1F7),
        primary: Color(0xFFD81B60),
        secondary: Color(0xFFF8BBD0),
      ),
      SketchyColorMode.dark: _ModePalette(
        ink: Color(0xFFF5F5F5),
        paper: Color(0xFF0F0F0F),
        primary: Color(0xFFF5F5F5),
        secondary: Color(0xFF1B1B1B),
      ),
    };
