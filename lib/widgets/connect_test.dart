import 'package:flutter/material.dart';
import 'package:scoreboard/views/basketball.dart';

class ConnectTest extends StatefulWidget {
  const ConnectTest({super.key});

  @override
  State<ConnectTest> createState() => _ConnectTestState();
}

class _ConnectTestState extends State<ConnectTest> {
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
                    labelText: 'Address',
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
              onPressed: () {},
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BasketballPage()));
              },
              child: Icon(Icons.keyboard_double_arrow_right)),
        ]),
        Image.asset("image/connectesp.png", width: 300, height: 100),
      ]),
    );
  }
}
