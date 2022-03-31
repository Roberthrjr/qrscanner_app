import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOption = 0;

  int get selectedMenuOption {
    return _selectedMenuOption;
  }

  set selectedMenuOption(int i) {
    _selectedMenuOption = i;
    notifyListeners();
  }
}
