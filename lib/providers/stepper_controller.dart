import 'package:flutter/material.dart';

class StepperController with ChangeNotifier {
  int _index = 0;

  get index => _index;

  void setIndex(index) {
    _index = index;
    notifyListeners();
  }

  void stepBack() {
    if (_index > 0) {
      _index -= 1;
    }
    notifyListeners();
  }

  void stepForward() {
    if (_index <= 0) {
      _index += 1;
    }
    notifyListeners();
  }
}
