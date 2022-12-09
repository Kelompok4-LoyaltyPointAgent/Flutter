import 'package:flutter/cupertino.dart';

class CheckboxProvider extends ChangeNotifier {
  bool status = false;

  void changeStatus(check) {
    status = check;
    notifyListeners();
  }
}
