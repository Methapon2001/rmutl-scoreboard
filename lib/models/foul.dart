import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Foul with ChangeNotifier {
  final List<int> _foul = [0, 0];

  final ConnectBoard _connectBoard;

  int maxFoul = 1;

  int get getFoulTeam1 => _foul[0];
  int get getFoulTeam2 => _foul[1];

  Foul(this._connectBoard);

  void increment(int team) {
    if (team != 1 && team != 2) return;

    _foul[team - 1] = _foul[team - 1] >= maxFoul ? 0 : _foul[team - 1] + 1;
    syncBoard();
    notifyListeners();
  }

  void decrement(int team) {
    if (team != 1 && team != 2) return;

    _foul[team - 1] = _foul[team - 1] <= 1 ? 0 : _foul[team - 1] - 1;
    syncBoard();
    notifyListeners();
  }

  void reset() {
    _foul[0] = 0;
    _foul[1] = 0;
    syncBoard();
    notifyListeners();
  }

  void syncBoard() {
    _connectBoard.TestFoul(_foul[0].toString(), _foul[1].toString());
  }
}
