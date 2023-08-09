import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:scoreboard/views/home.dart';
import 'package:scoreboard/webview/webview.dart';
import 'package:scoreboard/widgets/bar.dart';
import 'package:sizer/sizer.dart';

class ConnectDatabase extends StatefulWidget {
  const ConnectDatabase({super.key});

  @override
  State<ConnectDatabase> createState() => _ConnectDatabaseState();
}

class _ConnectDatabaseState extends State<ConnectDatabase> {
  final TextEditingController firebase = TextEditingController();
  String getTokenWebView = '';
  final getToken = const FlutterSecureStorage();

  @override
  void initState() {
    checkToken();
    super.initState();
  }

  void checkToken() {
    getToken
        .read(key: 'Token')
        .then((value) => setState(() => getTokenWebView = value ?? ''));
  }

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
                flex: 15,
                child: Text(
                  'Line Token : ${getTokenWebView == '' ? 'NoToken' : getTokenWebView}',
                  style: TextStyle(fontSize: 14.sp),
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
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.green,
              minimumSize: const Size(75, 40),
            ),
            onPressed: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WebViewLine()))
                  .whenComplete(() => checkToken());
            },
            child: Text(getTokenWebView == '' ? 'GET TOKEN' : 'CHANGE TOKEN',
                style:
                    TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold))),
        if (getTokenWebView != '')
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: Colors.red,
                minimumSize: const Size(75, 40),
              ),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        title: const Text('Clear Data'),
                        content: Text(
                          'Do you want to clear the data?',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Cancel')),
                          TextButton(
                              onPressed: () {
                                getToken.delete(key: 'Token');
                                checkToken();
                                Navigator.of(context).pop();
                              },
                              child: const Text('OK')),
                        ],
                      )),
              child: Text('Clear Data',
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold))),
        Image.asset("image/connectesp.png", width: 80.w, height: 15.h),
      ]),
    );
  }
}
