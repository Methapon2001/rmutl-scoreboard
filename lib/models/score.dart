import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  int _score1 = 0;
  int _score2 = 0; // กำหนดชนิดข้อมูล และค่าเริ่มต้น
  int get score1 => _score1;
  int get score2 => _score2; // กำหนด getter คือค่าจากตัวแปร _score

  void increment(int team, int increment) {
    if (team == 1) {
      _score1 = _score1 + increment;
    }
    if (team == 2) {
      _score2 = _score2 + increment;
    }
    notifyListeners(); // แจ้งเตือนการเปลี่ยนแปลงข้อมูล
  }

  void decrement(int team, int decrement) {
    if (team == 1) {
      _score1 = _score1 <= decrement ? 0 : _score1 - decrement;
    }
    if (team == 2) {
      _score2 = _score2 <= decrement ? 0 : _score2 - decrement;
    }
    notifyListeners();
  }
}