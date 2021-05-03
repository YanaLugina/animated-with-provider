import 'dart:math';
import 'package:flutter/material.dart';

class MyColorProvider extends ChangeNotifier {
  Color _color = Colors.red;
  bool _switchState = false;

  Color get colorValue => _color;
  bool get switchState => _switchState;
  double get switchHeight => random.nextInt(300).toDouble();
  double get switchWidth => random.nextInt(300).toDouble();
  double get switchCircular => random.nextInt(100).toDouble();
  final random = Random();

  void switchChange() {
    if (_switchState) {
      _color = Colors.green;
      _switchState = false;
    } else {
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _switchState = true;
    }
    notifyListeners();
  }
}