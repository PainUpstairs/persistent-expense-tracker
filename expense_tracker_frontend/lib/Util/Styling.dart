import 'package:flutter/material.dart';

class Styling {
  ThemeData themedata = ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.teal,
      ),
      // textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(
      //       primary: Colors.teal,
      //     ),
      // ),
      scaffoldBackgroundColor: Colors.grey[200],
      textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)));
}
