import "package:flutter/material.dart";
import 'package:scoreboard/widgets/menu.dart';

class Volleyball extends StatefulWidget {
  const Volleyball({super.key});

  @override
  State<Volleyball> createState() => _VolleyballState();
}

class _VolleyballState extends State<Volleyball> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Volleyball"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [const Text('Volleyball')],
        ),
      ),
      endDrawer: const MenuDrawer(),
    );
  }
}
