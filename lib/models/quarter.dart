import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Quarter with ChangeNotifier {
  final ConnectBoard _connectBoard;
  
  int _quarter = 1;
  int maxQuarter = 1;
  int get getQuarter => _quarter;

  Quarter(this._connectBoard);

  void increment() {
    _quarter = _quarter >= maxQuarter ? 1 : _quarter + 1;
    syncBoard();
    notifyListeners();
  }

  void decrement() {
    _quarter = _quarter <= 1 ? 1 : _quarter - 1;
    syncBoard();
    notifyListeners();
  }

  void reset(){
    _quarter = 1;
    syncBoard();
    notifyListeners();
  }

  void syncBoard() {
    _connectBoard.TestQuarter(_quarter.toString());
  }
}
