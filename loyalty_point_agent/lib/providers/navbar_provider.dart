import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int screenIndex = 0;

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
    notifyListeners();
  }
}
