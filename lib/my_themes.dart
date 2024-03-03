import 'package:flutter/material.dart';

class MyThemeData {
  BuildContext context;

  MyThemeData(this.context);

  static const Color primaryColor = Color(0xffB7935F);
  static const Color brown = Color(0xff7c5c2b);
  static const Color lightColor = Color(0x3cb7935f);
  static const Color secondaryColor = Color(0xff242424);
  static ThemeData lightThemeData = ThemeData(
      brightness: Brightness.light,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: primaryColor,
        selectedItemColor: secondaryColor,
        selectedLabelStyle:
            TextStyle(color: secondaryColor, fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: primaryColor,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
            fontSize: 20, fontFamily: 'Quran', color: MyThemeData.primaryColor),
        bodyMedium: TextStyle(
            fontSize: 25,
            fontFamily: 'Quran',
            fontWeight: FontWeight.bold,
            color: secondaryColor),
        bodyLarge: TextStyle(
            fontSize: 30,
            fontFamily: 'Quran',
            fontWeight: FontWeight.bold,
            color: primaryColor),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: primaryColor, size: 30)));

  static const Color darkPrimaryColor = Color(0xff141A2E);
  static const Color darkSecondaryColor = Color(0xffFACC1D);
  static ThemeData darkThemeData = ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        backgroundColor: darkPrimaryColor,
        selectedItemColor: darkSecondaryColor,
        selectedLabelStyle:
            TextStyle(color: darkSecondaryColor, fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.white,
        unselectedLabelStyle:
            TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
      ),
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: darkPrimaryColor,
      textTheme: const TextTheme(
        bodySmall: TextStyle(
            fontSize: 20,
            fontFamily: 'Quran',
            fontWeight: FontWeight.bold,
            color: darkSecondaryColor),
        bodyMedium: TextStyle(
            fontSize: 25,
            fontFamily: 'Quran',
            fontWeight: FontWeight.bold,
            color: darkSecondaryColor),
        bodyLarge: TextStyle(
            fontSize: 30,
            fontFamily: 'Quran',
            fontWeight: FontWeight.bold,
            color: darkSecondaryColor),
      ),
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkSecondaryColor, size: 30)));
}
