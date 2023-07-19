import 'package:flutter/material.dart';
import 'package:scoreboard/views/home.dart';
import 'package:scoreboard/widgets/bar.dart';
import 'package:sizer/sizer.dart';

class ConnectDatabase extends StatefulWidget {
  const ConnectDatabase({super.key});

  @override
  State<ConnectDatabase> createState() => _ConnectDatabaseState();
}

class _ConnectDatabaseState extends State<ConnectDatabase> {
  final TextEditingController lineToken = TextEditingController();
  final TextEditingController firebase = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: <Widget>[
        Text(
          "Setting Scoreboard",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 2.h,
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
        SizedBox(
          height: 2.h,
        ),
        Row(
          children: <Widget>[
            Expanded(
                flex: 12,
                child: TextFormField(
                  controller: firebase,
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
        SizedBox(
          height: 1.5.h,
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
                print(firebase);
                showToastSave(context);
              },
              child: Row(
                children: [
                  const Icon(Icons.save),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text("Save",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.bold))
                ],
              )),
          SizedBox(
            width: 2.w,
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
        Image.asset("image/connectesp.png", width: 80.w, height: 15.h),
      ]),
    );
  }
}
