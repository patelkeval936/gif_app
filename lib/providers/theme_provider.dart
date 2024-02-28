
import 'package:flutter/material.dart';
import 'package:gif_app/utils/app_enums.dart';



class ThemeProvider extends ChangeNotifier {

  bool isDarkMode = false;

  void toggleMode(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

}