import 'package:flutter/material.dart';
import 'package:scoreboard/views/home.dart';

class ConnectDatabase extends StatefulWidget {
  const ConnectDatabase({super.key});

  @override
  State<ConnectDatabase> createState() => _ConnectDatabaseState();
}

class _ConnectDatabaseState extends State<ConnectDatabase> {
  final TextEditingController lineToken = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        const Text(
          "Setting Scoreboard",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 12,
                child: TextFormField(
                  controller: lineToken,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    labelText: 'Line Token',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 12,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    labelText: 'Database',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromARGB(255, 23, 36, 113),
                minimumSize: const Size(75, 40),
              ),
              onPressed: () {
                print(lineToken);
              },
              child: const Text("Save",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromARGB(255, 23, 36, 113),
                minimumSize: const Size(75, 40),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyHomePage()));
              },
              child: const Icon(Icons.keyboard_double_arrow_right)),
        ]),
        Image.asset("image/connectesp.png", width: 300, height: 100),
      ]),
    );
  }
}
