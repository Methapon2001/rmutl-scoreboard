import "package:flutter/material.dart";

class ConnectBoard with ChangeNotifier{
  late String _ip;
  String get ip => _ip;

  get setip => null;
  setIP(String ip){
    _ip = ip;
    notifyListeners();
  }
}