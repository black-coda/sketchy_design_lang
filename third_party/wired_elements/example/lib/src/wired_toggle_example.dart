import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredToggleExample extends StatelessWidget {
  const WiredToggleExample({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    const firstVal = false;
    const secondVal = true;

    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          title,
          fontSize: 20,
        ),
      ),
      body: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WiredToggle(
              value: firstVal,
              onChange: (val) {
                debugPrint('$val');
                return false;
              },
            ),
            const SizedBox(height: 50),
            WiredToggle(
              value: secondVal,
              onChange: (val) {
                debugPrint('$val');
                return true;
              },
            ),
          ],
        ),
      ),
    );
  }
}
