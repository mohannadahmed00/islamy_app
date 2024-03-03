import 'package:flutter/foundation.dart';

class SebhaProvider extends ChangeNotifier {
  int numOfTasbeh = 0;
  int typeOfTasbehIndex = 0;
  List<String> typeOfTasbeh = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "لا حول ولا قوة إلا بالله",
    "الله أكبر"
  ];

  void tic() {
    if (numOfTasbeh >= 0 && numOfTasbeh < 33) {
      numOfTasbeh++;
    } else {
      numOfTasbeh = 0;
      typeOfTasbehIndex++;
      if (typeOfTasbehIndex > typeOfTasbeh.length - 1) {
        typeOfTasbehIndex = 0;
      }
    }
    notifyListeners();
  }
  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'];
    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], arabic[i]);
    }
    return input;
  }
}
