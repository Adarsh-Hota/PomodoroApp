import 'package:flutter/material.dart';
import 'dart:async';

class TimeService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 40;
  double selectedTime = 40;
  bool timerPlaying = false;
  String currentState = 'FOCUS';
  int rounds = 0;
  int goals = 0;

  void start() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration == 0) {
        handleNextRound();
      } else {
        currentDuration--;
        notifyListeners();
      }
    });
  }

  void pause() {
    timerPlaying = false;
    timer.cancel();
    notifyListeners();
  }

  void selectTime(double seconds) {
    currentDuration = seconds;
    selectedTime = seconds;
    notifyListeners();
  }

  void handleNextRound() {
    if (currentState == 'FOCUS' && rounds != 3) {
      currentState = 'BREAK';
      currentDuration = 5;
      selectedTime = 5;
      rounds++;
      goals++;
    } else if (currentState == 'BREAK') {
      currentState = 'FOCUS';
      currentDuration = 40;
      selectedTime = 40;
    } else if (currentState == 'FOCUS' && rounds == 3) {
      currentState = 'LONGBREAK';
      currentDuration = 10;
      selectedTime = 10;
      rounds++;
      goals++;
    } else if (currentState == 'LONGBREAK') {
      currentState = 'FOCUS';
      currentDuration = 40;
      selectedTime = 40;
      rounds = 0;
    }
    notifyListeners();
  }

  void reset() {
    timer.cancel();
    currentState = 'FOCUS';
    currentDuration = 40;
    selectedTime = 40;
    rounds = 0;
    goals = 0;
    timerPlaying = false;

    notifyListeners();
  }
}
