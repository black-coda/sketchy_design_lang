import 'package:flutter/widgets.dart';

import '../theme/sketchy_theme.dart';
import 'app_bar.dart';

class SketchyScaffold extends StatelessWidget {
  const SketchyScaffold({
    super.key,
    this.appBar,
    this.body,
    this.floatingActionButton,
    this.backgroundColor,
  });
  final SketchyAppBar? appBar;
  final Widget? body;
  final Widget? floatingActionButton;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);

    return ColoredBox(
      color: backgroundColor ?? theme.colors.paper,
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                if (appBar != null) appBar!,
                if (body != null)
                  Expanded(
                    child: DefaultTextStyle(
                      style: theme.typography.body.copyWith(
                        color: theme.colors.ink,
                      ),
                      child: body!,
                    ),
                  ),
              ],
            ),
            if (floatingActionButton != null)
              Positioned(right: 24, bottom: 24, child: floatingActionButton!),
          ],
        ),
      ),
    );
  }
}
