import "package:flutter/material.dart";
import 'package:scoreboard/widgets/menu.dart';
import 'package:scoreboard/widgets/connect_ip.dart';

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
      appBar: Titlebar().appBar("Home"),
      body: Container(
        color: const Color.fromARGB(255, 255, 242, 218),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              SizedBox(
                child: Container(
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
                  child: const ConnectIP(),
                ),
              ),
            ],
          ),
        )),
      ),
      endDrawer: const MenuDrawer(index: 0),
    );
  }
}
