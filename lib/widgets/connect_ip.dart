import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoreboard/models/connect.dart';

class ConnectIP extends StatefulWidget {
  const ConnectIP({super.key});

  @override
  State<ConnectIP> createState() => _ConnectIPState();
}

class _ConnectIPState extends State<ConnectIP> {
  late TextEditingController myController1;
  TextEditingController myController2 = TextEditingController();

  @override
  void initState() {
    ConnectBoard connectBoard =
        Provider.of<ConnectBoard>(context, listen: false);
    super.initState();
    myController1 = TextEditingController(text: connectBoard.ip);
  }

  @override
  void dispose() {
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ConnectBoard connectBoard = Provider.of<ConnectBoard>(context);
    return Row(
      children: <Widget>[
        Flexible(
          flex: 7,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'IP : 192.xxx.xx.x',
            ),
            controller: myController1,
            onChanged: connectBoard.setIP,
          ),
        ),
        const Text(
          " : ",
          style: TextStyle(fontSize: 30),
        ),
        Flexible(
          flex: 3,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Port',
            ),
            controller: myController2,
          ),
        ),
      ],
    );
  }
}
