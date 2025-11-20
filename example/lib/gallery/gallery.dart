import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';

import 'navigation/example_gallery.dart';

void main() {
  runApp(const SketchyExamplesApp());
}

class SketchyExamplesApp extends StatefulWidget {
  const SketchyExamplesApp({super.key});

  @override
  State<SketchyExamplesApp> createState() => _SketchyExamplesAppState();
}

class _SketchyExamplesAppState extends State<SketchyExamplesApp> {
  SketchyThemes _theme = SketchyThemes.blue;
  double _roughness = 0.5;

  void _cycleMode() {
    const themes = SketchyThemes.values;
    final current = themes.indexOf(_theme);
    setState(() => _theme = themes[(current + 1) % themes.length]);
  }

  void _handleRoughness(double value) {
    setState(() => _roughness = value.clamp(0, 1));
  }

  @override
  Widget build(BuildContext context) => SketchyApp(
    title: 'Sketchy Examples',
    theme: SketchyThemeData.fromTheme(_theme, roughness: _roughness),
    debugShowCheckedModeBanner: false,
    home: ExampleGallery(
      onCycleMode: _cycleMode,
      roughness: _roughness,
      onRoughnessChanged: _handleRoughness,
    ),
  );
}
