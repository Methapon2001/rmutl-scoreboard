import 'package:flutter/material.dart';

class ConnectBoard with ChangeNotifier {
  //variable Connect
  String _boardip = "";
  String _boardport = "";
  String get boardip => _boardip;
  String get boardport => _boardport;

  //Connect
  void setIP(String boardip) {
    _boardip = boardip;
    notifyListeners();
  }

  void setPort(String boardport) {
    _boardport = boardport;
    notifyListeners();
  }

  // sendScore(String scoreA, String scoreB) async {
  //   print("Show IP and Port");
  //   print(_boardip);
  //   print(_boardport);
  //   print("Show Score");
  //   print(scoreA);
  //   print("Show Score");
  //   print(scoreB);
  //   if (_boardip != "" && _boardip != "") {
  //     Socket sk = await Socket.connect(_boardip, int.parse(_boardport));
  //     print('App connected to ESP');

  //     // listen to the received data event stream
  //     print('Data reply from ESP: ');
  //     sk.listen((List<int> event) {
  //       print(utf8.decode(event));
  //     });

  //     sk.add(utf8.encode(
  //         "{'stateTimes':'na','times':'na','scoreA':'$scoreA','scoreB':'$scoreB','sets/foulsA':'99','sets/foulsB':'99'}"));

  //     sk.close();
  //     print('App disconnected from ESP');
  //   }
  // }
}
