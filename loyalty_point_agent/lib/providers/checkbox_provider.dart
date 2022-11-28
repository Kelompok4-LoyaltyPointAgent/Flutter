import 'package:flutter/foundation.dart';

class CheckboxProvider with ChangeNotifier {
  bool isChecked = false;

  void change() {
    isChecked = !isChecked;
    notifyListeners();
  }
}
