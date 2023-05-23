import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoreboard/models/connect.dart';

class Timer with ChangeNotifier {
  late ConnectBoard _connectBoard;
  late Duration duration;
  late Duration init;

  StreamSubscription<int>? _tickSubscription;
  bool isRunning = false;

  get currentTime => duration.inSeconds;

  Timer(ConnectBoard connectBoard, int seconds) {
    _connectBoard = connectBoard;
    init = Duration(seconds: seconds);
    duration = Duration(seconds: seconds);
  }

  void setDuration(int seconds) {
    init = Duration(seconds: seconds);
    duration = Duration(seconds: seconds);
    notifyListeners();
  }

  void toggleTimer() {
    if (!isRunning) {
      startTimer(duration.inSeconds);
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
      duration = Duration(seconds: timeLeftInSeconds);

      if (duration.inSeconds == 0) {
        isRunning = false;
        _tickSubscription?.cancel();
      }

      notifyListeners();
    });
  }

  void resetTimer() {
    duration = init;
    isRunning = false;
    _tickSubscription?.cancel();
    notifyListeners();
  }

  String get timeLeftString {
    print(duration.inSeconds);
    String minutes =
        ((duration.inSeconds / 60) % 60).floor().toString().padLeft(2, '0');
    String seconds =
        (duration.inSeconds % 60).floor().toString().padLeft(2, '0');

    return '$minutes:$seconds';
  }
}
