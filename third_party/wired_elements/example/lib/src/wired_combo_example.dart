import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredComboExample extends StatelessWidget {
  const WiredComboExample({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: WiredText(
            title,
            fontSize: 20,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(50),
              child: WiredCombo(
                value: 'One',
                items: ['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>(
                        (dynamic value) => DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: WiredText(value),
                              ),
                            ))
                    .toList(),
                onChanged: (value) {
                  debugPrint('$value');
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50),
              child: WiredCombo(
                value: 'Banana',
                items: ['Apple', 'Banana', 'Peach', 'Orange', 'Sandwich']
                    .map<DropdownMenuItem<String>>(
                        (dynamic value) => DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: WiredText(value),
                              ),
                            ))
                    .toList(),
                onChanged: (value) {
                  debugPrint('$value');
                },
              ),
            ),
          ],
        ),
      );
}
