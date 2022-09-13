import 'package:flutter/foundation.dart';

class BottomNavigationBarProvider with ChangeNotifier {
  int _currentIndex = 0;

  set currentIndex(var index) {
    _currentIndex = index;
    notifyListeners();
  }

  get currentIndex => _currentIndex;
}
