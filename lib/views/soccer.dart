import 'package:flutter/material.dart';
import 'package:scoreboard/widgets/menu.dart';

class SoccerPage extends StatefulWidget {
  const SoccerPage({super.key});

  @override
  State<SoccerPage> createState() => _SoccerPageState();
}

class _SoccerPageState extends State<SoccerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Soccer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Soccer'),
          ],
        ),
      ),
      endDrawer: const MenuDrawer(index: 3),
    );
  }
}
