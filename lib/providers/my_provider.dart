import 'package:flutter/material.dart';


class MyProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.light;
  Locale locale = Locale('en');
  void changeMode(ThemeMode mode){
    themeMode = mode;
    notifyListeners();
  }
  void changeLanguage(String langCode){
    locale = Locale(langCode);
    notifyListeners();
  }
}