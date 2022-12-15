import 'package:flutter/cupertino.dart';

class CheckboxProvider extends ChangeNotifier {
  bool status = false;

  changeStatus(check) {
    status = check;
    notifyListeners();
  }
}
