import 'package:flutter/cupertino.dart';

class CheckboxProvider extends ChangeNotifier {
  bool? status;

  changeStatus(check) {
    status = check;
    notifyListeners();
  }
}
