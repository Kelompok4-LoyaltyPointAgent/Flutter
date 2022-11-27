import 'package:flutter/cupertino.dart';

class OnboardingProvider extends ChangeNotifier {
  int currentIndex = 0;

  void updateScreenIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }
}
