import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'helvetica-regular',
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.black),
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );
}
