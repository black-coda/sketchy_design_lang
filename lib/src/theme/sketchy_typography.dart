import 'package:flutter/widgets.dart';

import 'sketchy_theme.dart';

class SketchyTypographyData {
  const SketchyTypographyData({
    required this.headline,
    required this.title,
    required this.body,
    required this.caption,
    required this.label,
  });
  final TextStyle headline;
  final TextStyle title;
  final TextStyle body;
  final TextStyle caption;
  final TextStyle label;

  SketchyTypographyData merge(SketchyTypographyData? other) {
    if (other == null) return this;
    return SketchyTypographyData(
      headline: headline.merge(other.headline),
      title: title.merge(other.title),
      body: body.merge(other.body),
      caption: caption.merge(other.caption),
      label: label.merge(other.label),
    );
  }
}

class SketchyTypography {
  static SketchyTypographyData of(BuildContext context) =>
      SketchyTheme.of(context).typography;
}
