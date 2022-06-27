import 'package:flutter/material.dart';

class AnimationStateModel extends ChangeNotifier {
  bool waterAnimationFinished = false;

  bool get state => waterAnimationFinished;

  void finish() {
    waterAnimationFinished = true;
    notifyListeners();
  }
}
