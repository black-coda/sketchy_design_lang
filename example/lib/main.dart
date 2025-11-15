import 'package:flutter/widgets.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';

import 'navigation/example_gallery.dart';

void main() {
  runApp(const SketchyExamplesApp());
}

class SketchyExamplesApp extends StatelessWidget {
  const SketchyExamplesApp({super.key});

  @override
  Widget build(BuildContext context) => SketchyApp(
    title: 'Sketchy Examples',
    theme: SketchyThemeData.light(),
    home: const ExampleGallery(),
  );
}
