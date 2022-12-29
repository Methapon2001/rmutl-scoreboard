import 'package:flutter/material.dart';

class Score with ChangeNotifier {
  int _count = 0;
  int _count2 = 0;
 
  int get count => _count;
  int get count2 => _count2;
  
  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }
}