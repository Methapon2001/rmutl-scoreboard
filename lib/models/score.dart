import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  final List<int> _score = [0, 0];

  int get getScoreTeam1 => _score[0];
  int get getScoreTeam2 => _score[1];

  void increment(int team, int increment) {
    if (team != 1 && team != 2) return;

    _score[team - 1] = _score[team - 1] + increment;

    notifyListeners();
  }

  void decrement(int team, int decrement) {
    if (team != 1 && team != 2) return;

    _score[team - 1] = _score[team - 1] <= decrement ? 0 : _score[team - 1] - decrement;

    notifyListeners();
  }
}