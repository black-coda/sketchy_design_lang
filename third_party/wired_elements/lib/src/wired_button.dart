import 'dart:math';

import 'package:flutter/material.dart';
import '../rough/rough.dart';

import 'wired_base.dart';
import 'wired_theme.dart';

/// Wired button.
///
/// Usage:
/// ```dart
/// WiredButton(
///  child: WiredText('Wired Button'),
///  onPressed: () {
///   print('Wired Button');
///  },
/// ),
/// ```
class WiredButton extends WiredBaseWidget {
  const WiredButton({required this.child, required this.onPressed, Key? key})
    : super(key: key);

  /// Typically the button's label.
  final Widget child;

  /// Called when the button is tapped
  final void Function() onPressed;

  @override
  @override
  Widget buildWiredElement(BuildContext context) {
    final theme = WiredTheme.of(context);
    final drawConfig = DrawConfig.build(
      roughness: theme.roughness,
      maxRandomnessOffset: 2 * theme.roughness,
      seed: Random().nextInt(1 << 31),
    );
    return Container(
      padding: EdgeInsets.zero,
      height: 42,
      decoration: RoughBoxDecoration(
        shape: RoughBoxShape.rectangle,
        drawConfig: drawConfig,
        borderStyle: RoughDrawingStyle(
          width: theme.strokeWidth,
          color: theme.borderColor,
        ),
      ),
      child: SizedBox(
        height: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: theme.textColor,
            textStyle: TextStyle(fontFamily: theme.fontFamily),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}
