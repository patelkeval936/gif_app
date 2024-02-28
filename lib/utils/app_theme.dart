
import 'package:flutter/material.dart';

class AppTheme{

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.red,
      primaryColor: isDarkTheme ? Colors.black : Colors.white,
        scaffoldBackgroundColor:isDarkTheme ? Colors.black :  Colors.white,

      disabledColor: Colors.grey,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme ? const ColorScheme.dark() : const ColorScheme.light()),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.redAccent,
            titleTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,
                color: Colors.black),
            centerTitle: true
        )
    );
  }

}