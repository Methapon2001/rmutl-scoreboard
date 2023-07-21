import 'package:flutter/material.dart';
import 'package:scoreboard/widgets/bar.dart';
import 'package:scoreboard/widgets/menu.dart';

class LineWebview extends StatefulWidget {
  const LineWebview({super.key});

  @override
  State<LineWebview> createState() => _LineWebviewState();
}

class _LineWebviewState extends State<LineWebview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Titlebar().appBar('TESTLINE'),
      backgroundColor: MyBackgroundColor,
      drawer: const MenuDrawer(index: 8),
      body: Container(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ElevatedButton(onPressed: () {
              
            }, child: Text('Line'))]),
      ),
    );
  }
}
