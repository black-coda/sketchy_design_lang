import 'package:flutter/material.dart';

import '../demos.dart';

class WiredText extends StatelessWidget {
  const WiredText(
    this.data, {
    Key? key,
    this.fontWeight = FontWeight.w500,
    this.fontSize = 18.0,
    this.color = Colors.black,
  }) : super(key: key);
  final String data;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;

  @override
  Widget build(BuildContext context) => Text(
        data,
        style: TextStyle(
          decoration: TextDecoration.none,
          fontFamily: handWriting2,
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
      );
}
