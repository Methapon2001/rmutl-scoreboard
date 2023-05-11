import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Score with ChangeNotifier {
  final List<int> _score = [0, 0];

  final ConnectBoard _connectBoard;

  int get getScoreTeam1 => _score[0];
  int get getScoreTeam2 => _score[1];

  Score(this._connectBoard);

  void increment(int team, int increment) {
    if (team != 1 && team != 2) return;

    _score[team - 1] = _score[team - 1] + increment;
    syncBoard();
    notifyListeners();
  }

  void decrement(int team, int decrement) {
    if (team != 1 && team != 2) return;

    _score[team - 1] =
        _score[team - 1] <= decrement ? 0 : _score[team - 1] - decrement;
    syncBoard();
    notifyListeners();
  }

  void reset(){
    _score[0] = 0;
    _score[1] = 0;
    syncBoard();
    notifyListeners();
  }

  void syncBoard() {
    _connectBoard.TestScore(_score[0].toString(), _score[1].toString());
  }
}
