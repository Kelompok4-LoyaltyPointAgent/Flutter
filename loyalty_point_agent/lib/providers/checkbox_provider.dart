import 'package:flutter/foundation.dart';

class CheckboxProvider with ChangeNotifier {
  bool _isChecked = false;

  // void change() {
  //   isChecked = !isChecked;
  //   notifyListeners();
  // }
  bool get val => _isChecked;

  void set(bool isChecked) {
    _isChecked = isChecked;
    notifyListeners();
  }
}
