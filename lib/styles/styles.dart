import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    primaryColor: Palette.ligthPrimaryColor,
    scaffoldBackgroundColor: Palette.bgColor,
    cardColor: Palette.cardColor,
    dividerColor: const Color.fromRGBO(221, 221, 221, 1.0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(
      primary: Palette.ligthPrimaryColor,
      secondary: Palette.ligthPrimaryColorAccent,
      error: Palette.error,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: Palette.darkPrimaryColor,
    scaffoldBackgroundColor: Palette.darkBgColor,
    cardColor: Palette.darkCardColor,
    dividerColor: Colors.grey,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.dark(
      primary: Palette.darkPrimaryColor,
      secondary: Palette.ligthPrimaryColorAccent,
      error: Palette.error,
    ),
  );
}

class Palette {
  static Color ligthPrimaryColor = const Color(0xff16397b);
  static Color ligthPrimaryColorAccent = const Color(0xff8ea5cc);
  static Color bgColor = const Color(0XFFf0eff4);
  static Color cardColor = Colors.white;
  static Color subtitleColor = Colors.grey;
  static Color error = const Color(0XFFef3038);
  static Color txtOnColoredCard = Colors.white;
  static Color darkPrimaryColor = const Color(0xff6c9ce4);
  static Color darkBgColor = const Color.fromARGB(255, 19, 19, 20);
  static Color darkCardColor = const Color.fromARGB(255, 31, 31, 31);
}
