import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'helvetica-regular',
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: appBarTheme,
    bottomAppBarTheme: BottomAppBarTheme(color: Colors.black),
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.black),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
    ),
  );

  static AppBarTheme appBarTheme = const AppBarTheme(
    color: Colors.black,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  );
}
