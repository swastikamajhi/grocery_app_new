import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void resetIndex() {
    _currentIndex = 0;
    notifyListeners();
  }

  //This tab index is only for the tabs in the groceries
  int _currentGroceryTabIndex = 0;

  int get currentGroceryTabIndex => _currentGroceryTabIndex;

  void changeCurrentGroceryTabIndex(int index) {
    _currentGroceryTabIndex = index;
    notifyListeners();
  }
}
