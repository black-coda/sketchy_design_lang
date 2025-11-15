import 'package:flutter/widgets.dart';

import '../theme/sketchy_theme.dart';

enum SketchyIconSymbol {
  plus,
  chevronRight,
  pen,
  rectangle,
  eraser,
  copy,
  send,
}

class SketchyIcons {
  static const SketchyIconSymbol plus = SketchyIconSymbol.plus;
  static const SketchyIconSymbol chevronRight = SketchyIconSymbol.chevronRight;
  static const SketchyIconSymbol pen = SketchyIconSymbol.pen;
  static const SketchyIconSymbol rectangle = SketchyIconSymbol.rectangle;
  static const SketchyIconSymbol eraser = SketchyIconSymbol.eraser;
  static const SketchyIconSymbol copy = SketchyIconSymbol.copy;
  static const SketchyIconSymbol send = SketchyIconSymbol.send;
}

class SketchyIcon extends StatelessWidget {
  const SketchyIcon({
    required this.icon,
    super.key,
    this.size = 20,
    this.color,
  });
  final SketchyIconSymbol icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _SketchyIconPainter(
          icon: icon,
          color: color ?? theme.colors.ink,
        ),
      ),
    );
  }
}

class _SketchyIconPainter extends CustomPainter {
  _SketchyIconPainter({required this.icon, required this.color});
  final SketchyIconSymbol icon;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    switch (icon) {
      case SketchyIconSymbol.plus:
        canvas.drawLine(
          Offset(size.width / 2, 2),
          Offset(size.width / 2, size.height - 2),
          paint,
        );
        canvas.drawLine(
          Offset(2, size.height / 2),
          Offset(size.width - 2, size.height / 2),
          paint,
        );
      case SketchyIconSymbol.chevronRight:
        final path = Path()
          ..moveTo(4, 4)
          ..lineTo(size.width - 4, size.height / 2)
          ..lineTo(4, size.height - 4);
        canvas.drawPath(path, paint);
      case SketchyIconSymbol.pen:
        final path = Path()
          ..moveTo(2, size.height - 4)
          ..lineTo(size.width / 2, 4)
          ..lineTo(size.width - 2, size.height / 2);
        canvas.drawPath(path, paint);
        canvas.drawLine(
          Offset(2, size.height - 4),
          Offset(size.width / 2.2, size.height - 2),
          paint,
        );
      case SketchyIconSymbol.rectangle:
        final rect = Rect.fromLTWH(2, 2, size.width - 4, size.height - 4);
        canvas.drawRect(rect, paint);
      case SketchyIconSymbol.eraser:
        final path = Path()
          ..moveTo(2, size.height - 6)
          ..lineTo(size.width / 2, 2)
          ..lineTo(size.width - 2, size.height / 2)
          ..lineTo(size.width / 2, size.height - 2)
          ..close();
        canvas.drawPath(path, paint);
      case SketchyIconSymbol.copy:
        final rect1 = Rect.fromLTWH(4, 4, size.width - 8, size.height - 8);
        final rect2 = rect1.shift(const Offset(-3, -3));
        canvas.drawRect(rect1, paint);
        canvas.drawRect(rect2, paint);
      case SketchyIconSymbol.send:
        final path = Path()
          ..moveTo(2, size.height - 2)
          ..lineTo(size.width - 2, size.height / 2)
          ..lineTo(2, 2)
          ..lineTo(size.width / 3, size.height / 2)
          ..close();
        canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _SketchyIconPainter oldDelegate) =>
      oldDelegate.icon != icon || oldDelegate.color != color;
}
