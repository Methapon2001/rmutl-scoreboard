import "package:flutter/material.dart";
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/connect_database.dart';

import '../widgets/bar.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  DateTime? currentBackPressTime;
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Titlebar().appBar("S E T T I N G"),
        drawer: const MenuDrawer(index: 7),
        body: WillPopScope(
          onWillPop: onWillPop,
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: const Color.fromARGB(255, 255, 242, 218),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MediaQuery.of(context).viewInsets.bottom != 0 ? MainAxisAlignment.start : MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 23, 36, 113),
                              width: 8.0),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 5,
                                offset: Offset(4, 19))
                          ]),
                      child: const ConnectDatabase(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
