import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredDialogExample extends StatelessWidget {
  const WiredDialogExample({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: WiredText(
            title,
            fontSize: 20,
          ),
        ),
        body: ColoredBox(
          color: Colors.white,
          child: Center(
            child: WiredButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Center(
                    child: SizedBox(
                      height: 480,
                      child: WiredDialog(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const WiredText(
                              'Title',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            const SizedBox(height: 15),
                            const WiredText(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                WiredButton(
                                  child: const Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              child: const WiredText('Open wired dialog'),
            ),
          ),
        ),
      );
}
