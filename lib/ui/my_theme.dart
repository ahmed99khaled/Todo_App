import 'dart:ui';

import 'package:flutter/material.dart';

class MyTheme {
  static const Color lightPrimry = Color(0xFF5D9CEC);
  static const Color lightScaffoldBackground = Color(0xFFDFECDB);
  static const Color darkScaffoldBackground = Color(0xFF060E1E);
  static const Color greenColor = Color(0xFF61E757);
  static const Color blackColor = Color(0xFF383838);
  static const Color redColor = Color(0xFFE43737);
  static const Color greyColor = Color(0xFFC8C9CB);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: lightPrimry,
    accentColor: Colors.white,
    primaryColorLight: Colors.black,
    scaffoldBackgroundColor: lightScaffoldBackground,
    appBarTheme: AppBarTheme(
      color: lightPrimry,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(size: 36, color: lightPrimry),
      unselectedIconTheme: IconThemeData(size: 36, color: greyColor),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      )),
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
          fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
      headline4: TextStyle(
          fontSize: 23, fontWeight: FontWeight.bold, color: blackColor),
      headline5: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
      headline6: TextStyle(
          fontSize: 21, fontWeight: FontWeight.bold, color: blackColor),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    primaryColor: blackColor,
    accentColor: blackColor,
    primaryColorLight: Colors.white,
    scaffoldBackgroundColor: darkScaffoldBackground,
    appBarTheme: AppBarTheme(
      color: lightPrimry,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: Colors.transparent,
      selectedIconTheme: IconThemeData(size: 36, color: lightPrimry),
      unselectedIconTheme: IconThemeData(size: 36, color: greyColor),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: blackColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18),
        topRight: Radius.circular(18),
      )),
    ),
    textTheme: TextTheme(
      headline3: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: darkScaffoldBackground),
      headline4: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.bold,
          color: lightScaffoldBackground),
      headline5: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: lightScaffoldBackground),
      headline6: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
          color: lightScaffoldBackground),
    ),
  );
}
