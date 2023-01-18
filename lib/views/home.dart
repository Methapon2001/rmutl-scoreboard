import "package:flutter/material.dart";
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/connect_ip.dart';
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const ConnectIP(),
          ],
        ),
      ),
      endDrawer: const MenuDrawer(index: 0),
    );
  }
}
