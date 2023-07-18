import "package:flutter/material.dart";
import 'package:scoreboard/widgets/image_sport.dart';
import 'package:scoreboard/widgets/menu.dart';

import '../widgets/bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Titlebar().appBar("H O M E"),
        drawer: const MenuDrawer(index: 0),
        backgroundColor: MyBackgroundColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: const ImageSports()),
        ));
  }
}
