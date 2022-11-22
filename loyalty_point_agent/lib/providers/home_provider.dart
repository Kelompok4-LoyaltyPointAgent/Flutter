import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int screenIndex = 0;
  int get fetchCurrentScreenIndex {
    return screenIndex;
  }

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
    notifyListeners();
  }
}
