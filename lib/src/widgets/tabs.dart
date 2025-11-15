import 'package:flutter/widgets.dart';
import 'package:rough_flutter/rough_flutter.dart';

import '../theme/sketchy_theme.dart';
import '../theme/sketchy_typography.dart';

class SketchyTabs extends StatelessWidget {
  const SketchyTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
    super.key,
  });
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    final typography = SketchyTypography.of(context);

    return Row(
      children: [
        for (var i = 0; i < tabs.length; i++) ...[
          GestureDetector(
            onTap: () => onChanged(i),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: RoughBoxDecoration(
                borderStyle: RoughDrawingStyle(
                  width: theme.strokeWidth,
                  color: theme.colors.ink,
                ),
                fillStyle: RoughDrawingStyle(
                  color: i == selectedIndex
                      ? theme.colors.accentMuted
                      : theme.colors.paper,
                ),
              ),
              child: Text(
                tabs[i],
                style: typography.body.copyWith(
                  fontWeight: i == selectedIndex
                      ? FontWeight.w600
                      : FontWeight.normal,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
