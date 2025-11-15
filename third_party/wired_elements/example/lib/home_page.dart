import 'package:flutter/material.dart';

import 'demos.dart';
import 'src/wired_text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: const WiredText(
          'Flutter wired_elements example',
          fontSize: 20,
        )),
        body: const DemoList(),
      );
}

class DemoList extends StatelessWidget {
  const DemoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        child: ListView.separated(
          separatorBuilder: (context, position) => ColoredBox(
            color: Theme.of(context).cardColor,
            child: const Divider(
              indent: 64,
              thickness: 1,
              height: 4,
            ),
          ),
          itemCount: demos.length,
          itemBuilder: (context, position) => DemoRow(demo: demos[position]),
        ),
      );
}

class DemoRow extends StatelessWidget {
  const DemoRow({required this.demo, Key? key}) : super(key: key);
  final Demo demo;

  @override
  Widget build(BuildContext context) => ColoredBox(
        color: Theme.of(context).cardColor,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          title: WiredText(
            demo.name,
            fontSize: 20,
          ),
          dense: false,
          subtitle: WiredText(
            demo.description,
            fontSize: 16,
          ),
          leading: SizedBox(
            width: 42,
            height: 42,
            child: demo.icon,
          ),
          onTap: () => Navigator.push<MaterialPageRoute>(
            context,
            MaterialPageRoute(
              builder: demo.buildPage,
            ),
          ),
        ),
      );
}
