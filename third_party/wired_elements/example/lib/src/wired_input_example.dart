import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import '../demos.dart';
import 'wired_text.dart';

class WiredInputExample extends StatelessWidget {
  const WiredInputExample({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final controller1 = TextEditingController(text: 'Hello wired input');
    final controller2 = TextEditingController();
    final controller3 = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: WiredText(
          title,
          fontSize: 20,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WiredInput(
              controller: controller1,
              style: const TextStyle(
                fontFamily: handWriting2,
                fontSize: 18,
              ),
              labelText: 'Name',
              labelStyle: const TextStyle(
                fontFamily: handWriting2,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 15),
            WiredInput(
              controller: controller2,
              labelText: 'User Email',
              labelStyle: const TextStyle(
                fontFamily: handWriting2,
                fontSize: 18,
              ),
              style: const TextStyle(
                fontFamily: handWriting2,
              ),
              hintText: 'Please enter user email',
            ),
            const SizedBox(height: 15),
            WiredInput(
              controller: controller3,
              style: const TextStyle(
                fontFamily: handWriting2,
              ),
              hintText: 'Your age please!',
            ),
          ],
        ),
      ),
    );
  }
}
