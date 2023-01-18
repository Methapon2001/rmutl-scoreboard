import 'package:flutter/material.dart';
class ConnectBoard with ChangeNotifier {
  String _boardip = "";
  String _boardport = "";
  String get boardip => _boardip;
  String get boardport => _boardport;
  setIP(String boardip) {
    _boardip = boardip;
    notifyListeners();
  }
  setPort(String boardport){
    _boardport = boardport;
    notifyListeners();
  }
}
