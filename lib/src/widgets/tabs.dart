import 'package:flutter/widgets.dart';

import '../primitives/sketchy_primitives.dart';
import '../theme/sketchy_text_case.dart';
import '../theme/sketchy_theme.dart';
import 'surface.dart';
import 'text.dart';

/// Segmented control used to switch between sections.
class SketchyTabs extends StatelessWidget {
  /// Creates a new tab bar with the provided labels.
  const SketchyTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    this.textCase,
    this.detachSelected = false,
    this.detachGap = 4,
    this.backgroundColor,
    super.key,
  });

  /// Tab labels.
  final List<String> tabs;

  /// Currently selected tab index.
  final int selectedIndex;

  /// Callback invoked when a tab is selected.
  final ValueChanged<int> onChanged;

  /// Text casing transformation. If null, uses theTextCasing
  final TextCase? textCase;

  /// When true, reserves [detachGap] below the active tab to reveal the
  /// background color (useful for overlapping containers).
  final bool detachSelected;

  /// Height of the gap rendered when [detachSelected] is true.
  final double detachGap;

  /// Background color painted in the detached gap.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) => SketchyTheme.consumer(
        builder: (context, theme) => Row(
          children: [
            for (var i = 0; i < tabs.length; i++) ...[
              GestureDetector(
                onTap: () => onChanged(i),
                child: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SketchySurface(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        fillColor: i == selectedIndex
                            ? theme.colors.secondary
                            : theme.colors.paper,
                        strokeColor: theme.colors.ink,
                        createPrimitive: () =>
                            SketchyPrimitive.roundedRectangle(
                          cornerRadius: theme.borderRadius,
                          fill: i == selectedIndex
                              ? SketchyFill.solid
                              : SketchyFill.none,
                        ),
                        child: SketchyText(
                          tabs[i],
                          textCase: textCase,
                          style: theme.typography.body.copyWith(
                            fontWeight: i == selectedIndex
                                ? FontWeight.w700
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                      if (detachSelected)
                        SizedBox(
                          height: detachGap,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              color: i == selectedIndex
                                  ? backgroundColor ?? theme.colors.paper
                                  : const Color(0x00000000),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      );
}
