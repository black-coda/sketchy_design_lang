import 'package:flutter/widgets.dart';

import '../theme/sketchy_theme.dart';
import '../widgets/sketchy_frame.dart';

/// Wired dialog.
///
/// Usage:
/// ```dart
/// SketchyButton(
/// 	onPressed: () {
/// 	  showDialog(
/// 		context: context,
/// 		builder: (context) {
/// 		  return Center(
/// 			child: Container(
/// 			  height: 480.0,
/// 			  child: SketchyDialog(
/// 				child: Column(
/// 				  crossAxisAlignment: CrossAxisAlignment.start,
/// 				  children: [
/// 					WiredText(
/// 					  'Title',
/// 					  fontSize: 20.0,
/// 					  fontWeight: FontWeight.bold,
/// 					),
/// 					SizedBox(height: 15.0),
/// 					WiredText(
/// 					  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
/// 					),
/// 					SizedBox(height: 15.0),
/// 					Row(
/// 					  mainAxisAlignment: MainAxisAlignment.end,
/// 					  children: [
/// 						SketchyButton(
/// 						  child: Text('OK'),
/// 						  onPressed: () {
/// 							Navigator.of(context).pop();
/// 						  },
/// 						),
/// 					  ],
/// 					),
/// 				  ],
/// 				),
/// 			  ),
/// 			),
/// 		  );
/// 		},
/// 	  );
/// 	},
/// 	child: WiredText('Open wired dialog'),
///   ),
/// ```
class SketchyDialog extends StatelessWidget {
  const SketchyDialog({required this.child, super.key, this.padding});

  /// The content in dialog.
  final Widget child;

  /// The padding for dialog's content, defaults to 20.0 if null.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = SketchyTheme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: SketchyFrame(
          padding: padding ?? const EdgeInsets.all(20),
          cornerRadius: theme.borderRadius,
          fill: SketchyFill.none,
          child: child,
        ),
      ),
    );
  }
}
