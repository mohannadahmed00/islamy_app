import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SurahDetailsProvider extends ChangeNotifier {
  List<String> verses = [];

  void loadFile(int index) async {
    String surah = await rootBundle.loadString("assets/files/$index.txt");
    List<String> lines = surah.split("\n");
    verses = lines;
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
