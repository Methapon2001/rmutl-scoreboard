import 'package:flutter/material.dart';

class Quarter with ChangeNotifier {
  int _quarter = 1;

  int maxQuarter = 1;

  int get getQuarter => _quarter;

  void update() {
    _quarter = _quarter >= maxQuarter ? 1 : _quarter + 1;

    notifyListeners();
  }
}
