import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Timer with ChangeNotifier {
  late ConnectBoard _connectBoard;
  late Duration _duration;
  late Duration _init;
  StreamSubscription<int>? _tickSubscription;
  bool isRunning = false;

  get duration => _duration;
  get currentTime => _duration.inSeconds;

  Timer(ConnectBoard connectBoard, int seconds) {
    _connectBoard = connectBoard;
    _init = Duration(seconds: seconds);
    _duration = Duration(seconds: seconds);
  }

  void setDuration(int seconds) {
    _init = Duration(seconds: seconds);
    _duration = Duration(seconds: seconds);
    notifyListeners();
  }

  void toggleTimer() {
    if (!isRunning) {
      startTimer(_duration.inSeconds);
    } else {
      _tickSubscription?.pause();
    }

    isRunning = !isRunning;
    notifyListeners();
  }

  void startTimer(int seconds) {
    _tickSubscription?.cancel();
    _tickSubscription = Stream<int>.periodic(
      const Duration(seconds: 1),
      (sec) => seconds - sec - 1,
    ).take(seconds).listen((timeLeftInSeconds) {
      _duration = Duration(seconds: timeLeftInSeconds);

      if (_duration.inSeconds == 0) {
        isRunning = false;
        _tickSubscription?.cancel();
      }

      notifyListeners();
    });
  }

  void resetTimer() {
    _duration = _init;
    isRunning = false;
    _tickSubscription?.cancel();
    syncBoard();
    notifyListeners();
  }

  String get timeLeftString {
    String minutes =
        ((_duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    String seconds =
        (_duration.inSeconds % 60).floor().toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }

  void syncBoard() {
    _connectBoard.TestTimer(timeLeftString);
  }
}
