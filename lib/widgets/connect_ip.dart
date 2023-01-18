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
  late TextEditingController myController2;

  @override
  void initState() {
    ConnectBoard connectBoard =
        Provider.of<ConnectBoard>(context, listen: false);
    super.initState();
    myController1 = TextEditingController(text: connectBoard.boardip);
    myController2 = TextEditingController(text: connectBoard.boardport);
  }

  @override
  void dispose() {
    myController1.dispose();
    myController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            "Connect_IP to ESP",
            style: TextStyle(fontSize: 30),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
              child: inputField(myController1, myController2)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.brown,
            ),
            onPressed: () {
              print(myController1.text + ":" + myController2.text);
            },
            child: const Text('Connect'),
          )
        ],
      ),
    );
  }

  Widget inputField(myController1, myController2) {
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
            onChanged: connectBoard.setPort,
          ),
        ),
      ],
    );
  }
}
