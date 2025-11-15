import 'package:flutter/widgets.dart';

import '../theme/sketchy_theme.dart';
import 'sketchy_page_route.dart';

typedef SketchyRouteBuilder = WidgetBuilder;

class SketchyApp extends StatelessWidget {
  const SketchyApp({
    required this.title,
    required this.theme,
    required this.home,
    super.key,
    this.routes,
    this.onGenerateRoute,
    this.onUnknownRoute,
    this.navigatorKey,
    this.navigatorObservers,
  });
  final String title;
  final SketchyThemeData theme;
  final Widget home;
  final Map<String, SketchyRouteBuilder>? routes;
  final RouteFactory? onGenerateRoute;
  final RouteFactory? onUnknownRoute;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver>? navigatorObservers;

  @override
  Widget build(BuildContext context) => WidgetsApp(
    navigatorKey: navigatorKey,
    title: title,
    color: theme.colors.paper,
    builder: (context, child) {
      final content = child ?? const SizedBox.shrink();
      return SketchyTheme(
        data: theme,
        child: DefaultTextStyle(
          style: theme.typography.body.copyWith(color: theme.colors.ink),
          child: content,
        ),
      );
    },
    navigatorObservers: navigatorObservers ?? const <NavigatorObserver>[],
    onGenerateRoute: (settings) {
      if (settings.name == Navigator.defaultRouteName) {
        return SketchyPageRoute(builder: (_) => home, settings: settings);
      }

      final mapBuilder = routes?[settings.name];
      if (mapBuilder != null) {
        return SketchyPageRoute(builder: mapBuilder, settings: settings);
      }

      if (onGenerateRoute != null) {
        return onGenerateRoute!(settings);
      }

      return null;
    },
    onUnknownRoute: onUnknownRoute,
  );
}
