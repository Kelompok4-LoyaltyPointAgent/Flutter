import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int screenIndex = 0;
  List<bool> isSelected = [true, false];
  late bool onTap = false;

  void updateScreenIndex(int newIndex) {
    screenIndex = newIndex;
    notifyListeners();
  }

  // void updateIndex(int newIndex) {
  //   screenIndex = newIndex;

  //   for (int index = 0; index < isSelected.length; index++) {
  //     if (index == newIndex) {
  //       isSelected[index] = true;
  //     } else {
  //       isSelected[index] = false;
  //     }
  //   }
  //   onTap = onTap == true ? false : true;
  //   notifyListeners();
  // }
}
