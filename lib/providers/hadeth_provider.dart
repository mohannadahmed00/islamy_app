import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/hadeth_model.dart';
//import 'package:logging/logging.dart';

class HadethProvider extends ChangeNotifier {
  List<HadethModel> ahadeth = [];

  void loadFile() async {
    /*try {
      String file = await rootBundle.loadString("assets/files/ahadeth.txt");
    }catch(error){
      print(error);
    }*/

    rootBundle.loadString("assets/files/ahadeth.txt").then((value) {
      List<String> allAhadeth = value.split("#");
      for (int i = 0; i < allAhadeth.length; i++) {
        int lastIndex = allAhadeth[i].trim().indexOf('\n');
        String title = allAhadeth[i].trim().substring(0, lastIndex);
        String content = allAhadeth[i].trim().substring(lastIndex + 1);
        ahadeth.add(HadethModel(title, content));
        notifyListeners();
      }
    }).catchError((error) {
      debugPrint(error);
    });
  }
}
