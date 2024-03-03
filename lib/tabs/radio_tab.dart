import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamy_app/providers/home_provider.dart';
import 'package:provider/provider.dart';

import '../my_themes.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<HomeProvider>(context).loadRadios();
    /*if (provider.radiosModel?.radios?.isEmpty ?? true) {
      provider.loadRadios();
    }*/
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/radio_ic.png"),
            const SizedBox(
              height: 50,
            ),
            Text(
              provider.selectedRadio?.name ?? "...",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 50,
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.previousRadioStation();
                      if (provider.isPlaying) {
                        provider.audioPlayer
                            .play(UrlSource(provider.selectedRadio?.url ?? ""));
                      }
                    },
                    child: Icon(Icons.skip_previous,
                        size: 50,
                        color: Theme.of(context).brightness == Brightness.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkSecondaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.changePlayingState();
                      if (provider.isPlaying) {
                        provider.audioPlayer
                            .play(UrlSource(provider.selectedRadio?.url ?? ""));
                      } else {
                        provider.audioPlayer.stop();
                      }
                    },
                    child: Icon(
                        provider.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 50,
                        color: Theme.of(context).brightness == Brightness.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkSecondaryColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.nextRadioStation();
                      if (provider.isPlaying) {
                        provider.audioPlayer
                            .play(UrlSource(provider.selectedRadio?.url ?? ""));
                      }
                    },
                    child: Icon(Icons.skip_next,
                        size: 50,
                        color: Theme.of(context).brightness == Brightness.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkSecondaryColor),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
    return ChangeNotifierProvider(
      create: (context) => HomeProvider()..loadRadios(),
      builder: (context, child) {
        final provider = Provider.of<HomeProvider>(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/radio_ic.png"),
            const SizedBox(
              height: 50,
            ),
            Text(
              provider.selectedRadio?.name ?? "loading radios...",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.previousRadioStation();
                    if (provider.isPlaying) {
                      provider.audioPlayer
                          .play(UrlSource(provider.selectedRadio?.url ?? ""));
                    }
                  },
                  child: Icon(Icons.skip_previous,
                      size: 50,
                      color: Theme.of(context).brightness == Brightness.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.darkSecondaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    provider.changePlayingState();
                    if (provider.isPlaying) {
                      provider.audioPlayer
                          .play(UrlSource(provider.selectedRadio?.url ?? ""));
                    } else {
                      provider.audioPlayer.stop();
                    }
                  },
                  child: Icon(
                      provider.isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 50,
                      color: Theme.of(context).brightness == Brightness.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.darkSecondaryColor),
                ),
                GestureDetector(
                  onTap: () {
                    provider.nextRadioStation();
                    if (provider.isPlaying) {
                      provider.audioPlayer
                          .play(UrlSource(provider.selectedRadio?.url ?? ""));
                    }
                  },
                  child: Icon(Icons.skip_next,
                      size: 50,
                      color: Theme.of(context).brightness == Brightness.light
                          ? MyThemeData.primaryColor
                          : MyThemeData.darkSecondaryColor),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}

/*
*return FutureBuilder(
          future: provider.radioFuture, builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text(snapshot.error.toString());
          } else if (snapshot.hasData) {
            print(snapshot.data);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/radio_ic.png"),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  AppLocalizations.of(context)!.quran_radio,
                  textAlign: TextAlign.center,
                  style: Theme
                      .of(context)
                      .textTheme
                      .bodySmall,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.skip_previous,
                        size: 50,
                        color: Theme
                            .of(context)
                            .brightness == Brightness.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkSecondaryColor),
                    Icon(Icons.play_arrow,
                        size: 50,
                        color: Theme
                            .of(context)
                            .brightness == Brightness.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkSecondaryColor),
                    Icon(Icons.skip_next,
                        size: 50,
                        color: Theme
                            .of(context)
                            .brightness == Brightness.light
                            ? MyThemeData.primaryColor
                            : MyThemeData.darkSecondaryColor),
                  ],
                )
              ],
            );
          } else {
            print("loading...");
            return Text("loading...");
          }
        },);
* */
