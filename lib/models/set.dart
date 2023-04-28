import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Set with ChangeNotifier {
  final List<int> _set = [0, 0];
  final ConnectBoard _connectBoard;

  int maxSet = 1;

  int get getSetTeam1 => _set[0];
  int get getSetTeam2 => _set[1];

  Set(this._connectBoard);

  void update(int team) {
    if (team != 1 && team != 2) return;

    _set[team - 1] = _set[team - 1] >= maxSet ? 0 : _set[team - 1] + 1;

    notifyListeners();
  }
}
