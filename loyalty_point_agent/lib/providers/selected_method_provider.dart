import 'package:flutter/cupertino.dart';

class SelectedMethodProvider extends ChangeNotifier {
  int selectedIndex = -1;

  changeStatus(check) {
    selectedIndex = check;
    notifyListeners();
  }
}
