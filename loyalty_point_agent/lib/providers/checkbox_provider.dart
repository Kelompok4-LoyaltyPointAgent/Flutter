import 'package:flutter/cupertino.dart';

class CheckboxProvider extends ChangeNotifier {
  bool status = false;

  void changeStatus() {
    status = !status;
    notifyListeners();
  }
}
