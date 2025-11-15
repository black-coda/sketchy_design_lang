import 'package:flutter/material.dart';
import 'package:wired_elements/wired_elements.dart';

import 'wired_text.dart';

class WiredRadioExample extends StatefulWidget {
  const WiredRadioExample({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  WiredRadioExampleState createState() => WiredRadioExampleState();
}

class WiredRadioExampleState extends State<WiredRadioExample> {
  SingingCharacter? _character = SingingCharacter.lafayette;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: WiredText(
            widget.title,
            fontSize: 20,
          ),
        ),
        body: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            ListTile(
              title: const Text('Lafayette'),
              leading: WiredRadio<SingingCharacter>(
                value: SingingCharacter.lafayette,
                groupValue: _character,
                onChanged: (value) {
                  debugPrint('$value');
                  setState(() {
                    _character = value;
                  });

                  return true;
                },
              ),
            ),
            ListTile(
              title: const Text('Thomas Jefferson'),
              leading: WiredRadio<SingingCharacter>(
                value: SingingCharacter.jefferson,
                groupValue: _character,
                onChanged: (value) {
                  debugPrint('$value');
                  setState(() {
                    _character = value;
                  });

                  return true;
                },
              ),
            ),
          ],
        ),
      );
}

enum SingingCharacter { lafayette, jefferson }
