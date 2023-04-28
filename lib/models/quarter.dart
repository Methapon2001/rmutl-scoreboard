import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Quarter with ChangeNotifier {
  final ConnectBoard _connectBoard;
  
  int _quarter = 1;
  int maxQuarter = 1;
  int get getQuarter => _quarter;

  Quarter(this._connectBoard);

  void update() {
    _quarter = _quarter >= maxQuarter ? 1 : _quarter + 1;

    notifyListeners();
  }
}
