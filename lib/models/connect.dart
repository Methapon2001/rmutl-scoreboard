import 'package:flutter/material.dart';

class ConnectBoard with ChangeNotifier {
  //variable Connect
  String _boardip = "";
  String _boardport = "";
  String get boardip => _boardip;
  String get boardport => _boardport;

  //variable Score
  final List<int> _score = [0, 0];
  int get getScoreTeam1 => _score[0];
  int get getScoreTeam2 => _score[1];

  //variable Set
  final List<int> _set = [0, 0];
  int maxSet = 1;
  int get getSetTeam1 => _set[0];
  int get getSetTeam2 => _set[1];

  //variable Foul
  final List<int> _foul = [0, 0];
  int maxFoul = 1;
  int get getFoulTeam1 => _foul[0];
  int get getFoulTeam2 => _foul[1];

  //variable Quarter
  int _quarter = 1;
  int maxQuarter = 1;
  int get getQuarter => _quarter;

  //Connect
  void setIP(String boardip) {
    _boardip = boardip;
    notifyListeners();
  }

  void setPort(String boardport) {
    _boardport = boardport;
    notifyListeners();
  }

  //Score
  void increment(int team, int increment) {
    if (team != 1 && team != 2) return;

    _score[team - 1] = _score[team - 1] + increment;

    notifyListeners();
  }

  void decrement(int team, int decrement) {
    if (team != 1 && team != 2) return;

    _score[team - 1] =
        _score[team - 1] <= decrement ? 0 : _score[team - 1] - decrement;

    notifyListeners();
  }

  //Set
  void updateset(int team) {
    if (team != 1 && team != 2) return;

    _set[team - 1] = _set[team - 1] >= maxSet ? 0 : _set[team - 1] + 1;

    notifyListeners();
  }

  //Foul
  void updatefoul(int team) {
    if (team != 1 && team != 2) return;

    _foul[team - 1] = _foul[team - 1] >= maxFoul ? 0 : _foul[team - 1] + 1;

    notifyListeners();
  }

  //Quarter
  void updatequarter() {
    _quarter = _quarter >= maxQuarter ? 1 : _quarter + 1;

    notifyListeners();
  }
}
