import 'package:ebuy/view/profile_screen.dart';
import 'package:ebuy/view/cart_screen.dart';
import 'package:ebuy/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeScreen();

  get currentScreen => _currentScreen;
  get navigatorValue => _navigatorValue;
  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = HomeScreen();
        break;
      case 2:
        _currentScreen = CartScreen();
        break;
      case 3:
        _currentScreen = HomeScreen();
        break;
      case 4:
        _currentScreen = ProfileScreen();
        break;
      default:
        _currentScreen = HomeScreen();
    }
    update();
  }
}
