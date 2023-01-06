import 'package:flutter/material.dart';

class Foul with ChangeNotifier {
  final List<int> _foul = [0, 0];

  int maxFoul = 1;

  int get getFoulTeam1 => _foul[0];
  int get getFoulTeam2 => _foul[1];

  void update(int team) {
    if (team != 1 && team != 2) return;

    _foul[team - 1] = _foul[team - 1] >= maxFoul ? 0 : _foul[team - 1] + 1;

    notifyListeners();
  }
}
