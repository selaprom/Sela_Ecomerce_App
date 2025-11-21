import 'package:ecomerce_24/app/data/themes/colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primarySwatch: Colors.purple,
  useMaterial3: true,
  scaffoldBackgroundColor: lightBgColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
  ),
  colorScheme: ColorScheme.light(
    surface: lightBgColor, //for background color
    onSurface: lightTextColor, //for card text color
    primary: Colors.deepPurple, //for appbar background color
    onPrimary: Colors.white, //for appbar text color
    secondary: buttonColor, //for button background color
    onSecondary: lightColor, //for button text color
    onError: Colors.red, //for error text color
    error: lightDivColor, //for error background color
    primaryContainer: lightDivColor, //for container background color
    secondaryContainer: lightDivColor, //for second container background color
    onPrimaryContainer: lightTextColor, //for container text color
    onSecondaryContainer: lightTextColor, //for second container text color
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.purple,
  useMaterial3: true,
  scaffoldBackgroundColor: darkBgColor,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.grey[800],
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
    centerTitle: true,
  ),
  colorScheme: ColorScheme.dark(
    surface: darkBgColor, //for background color
    onSurface: darkTextColor, //for text color
    primary: Colors.deepPurple, //for appbar background color
    onPrimary: Colors.white, //for appbar text color
    secondary: buttonColor, //for button background color
    onSecondary: darkColor, //for button text color
    onError: Colors.red, //for error text color,
    error: darkDivColor, //for error background color
    primaryContainer: darkDivColor, //for container background color
    onPrimaryContainer: darkTextColor, //for container text color
    secondaryContainer: darkDivColor, //for container background color
    onSecondaryContainer: darkTextColor, //for container text color
  ),
);
