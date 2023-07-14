import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quickalert/quickalert.dart';
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

  void showAlertSucces() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.success,
      title: "Successful",
      text: "Connect To Scoreboard Compled!",
      confirmBtnText: "Close",
      confirmBtnColor: const Color.fromARGB(255, 23, 36, 113),
    );
  }

  void showAlertError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: "Failed",
      text: "Something went wrong!\n Please try again.",
      confirmBtnText: "Close",
      confirmBtnColor: const Color.fromARGB(255, 23, 36, 113),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Connect_IP to ESP",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            inputField(myController1, myController2),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 23, 36, 113),
                minimumSize: const Size(80, 40),
              ),
              onPressed: () {
                if (myController1.text == "192.168.1.1" &&
                    myController2.text == "80") {
                  showAlertSucces();
                  print(myController1.text + ":" + myController2.text);
                } else {
                  showAlertError();
                }
              },
              child: const Text(
                'Connect',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Image.asset("image/connectesp.png", width: 300, height: 100),
          ],
        ),
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
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Text(
          " : ",
          style: TextStyle(fontSize: 30),
        ),
        Flexible(
          flex: 2,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Port',
            ),
            controller: myController2,
            onChanged: connectBoard.setPort,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
