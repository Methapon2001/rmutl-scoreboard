import "package:flutter/material.dart";
import 'package:scoreboard/widgets/image_sport.dart';

import '../widgets/bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? currentBackPressTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Titlebar().appBar("H O M E"),
        // drawer: const MenuDrawer(index: 0),
        backgroundColor: MyBackgroundColor,
        body: WillPopScope(
          onWillPop: onWillPop,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const ImageSports()),
          ),
        ));
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 1)) {
      currentBackPressTime = now;
      showToastExit(context);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
