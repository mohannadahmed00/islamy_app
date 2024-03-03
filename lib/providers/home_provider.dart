import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Radio;

import '../models/radios_model.dart';
import '../tabs/hadeth_tab.dart';
import '../tabs/quran_tab.dart';
import '../tabs/radio_tab.dart';
import '../tabs/sebha_tab.dart';
import '../tabs/setting_tab.dart';

class HomeProvider extends ChangeNotifier {
  int index = 0;
  List<Widget> tabs = [
    const QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTab()
  ];

  void changeIndex(int index){
    this.index = index;
    notifyListeners();
  }


  final audioPlayer = AudioPlayer();

  RadiosModel? radiosModel;
  Radio? selectedRadio;
  int selectedRadioStationIndex = 0;
  bool isPlaying = false;

  void loadRadios() async {
    if(radiosModel==null){
      await Dio().get('https://mp3quran.net/api/v3/radios').then((value) {
        print("loadRadios (Success): $value");
        radiosModel = RadiosModel.fromJson(value.data);
        selectedRadio = radiosModel?.radios?[selectedRadioStationIndex];
      }).catchError((error) {
        print("loadRadios (error): $error");
      });
      notifyListeners();
    }

  }

  void nextRadioStation() {
    if (radiosModel?.radios?.isNotEmpty ?? false) {
      final stationsSize = radiosModel!.radios!.length;
      selectedRadioStationIndex++;
      if (selectedRadioStationIndex > stationsSize - 1) {
        selectedRadioStationIndex = 0;
      }
      selectedRadio = radiosModel?.radios?[selectedRadioStationIndex];
      notifyListeners();
    }
  }

  void previousRadioStation() {
    if (radiosModel?.radios?.isNotEmpty ?? false) {
      final stationsSize = radiosModel!.radios!.length;
      selectedRadioStationIndex--;
      if (selectedRadioStationIndex < 0) {
        selectedRadioStationIndex = stationsSize-1;
      }
      selectedRadio = radiosModel?.radios?[selectedRadioStationIndex];
      notifyListeners();
    }
  }

  void changePlayingState(){
    isPlaying = !isPlaying;
    notifyListeners();
  }
}
