import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/my_themes.dart';
import 'package:islamy_app/providers/my_provider.dart';
import 'package:islamy_app/providers/quran_tab_provider.dart';
import 'package:islamy_app/screens/surah_details_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuranTabProvider()..addSurah(),
      builder: (context, child) {
        var provider = Provider.of<QuranTabProvider>(context);
        var mainProvider = Provider.of<MyProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset(
                  "assets/images/quran_bg.png",
                )),
            Divider(
              thickness: 3,
              color: Theme.of(context).brightness == Brightness.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkSecondaryColor,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.surah_name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 25),
                    )),
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.num_of_verses,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 25),
                )),
              ],
            ),
            Divider(
              thickness: 3,
              color: Theme.of(context).brightness == Brightness.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkSecondaryColor,
            ),
            Expanded(
              flex: 2,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, SurahDetailsScreen.routeName,
                          arguments: provider.surahModels[index]);
                    },
                    child: Row(
                      children: [
                        Expanded(
                            child: Text(
                              provider.surahModels[index].surahName,
                              textAlign: TextAlign.center,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 20),
                            )),
                        Expanded(
                            child: Text(
                          mainProvider.locale.languageCode == 'ar'
                              ? provider.replaceArabicNumber(provider
                                  .surahModels[index].numOfVerses
                                  .toString())
                              : provider.surahModels[index].numOfVerses
                                  .toString(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lateef().copyWith(
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? MyThemeData.primaryColor
                                  : MyThemeData.darkSecondaryColor),
                        )),
                      ],
                    ),
                  );
                },
                itemCount: provider.surahModels.length,
              ),
            )
          ],
        );
      },
    );
  }
}

/*Expanded(
          child: SingleChildScrollView(
            child: DataTable(
                columns: [
                  DataColumn(label: Text("Surah")),
                  DataColumn(label: Text("Number of Verses")),
                ],
                rows: surahs.map(
                        (surah) => DataRow(cells: [
                          DataCell(Text(surah.surahName)),
                          DataCell(Text(surah.numOfVerses.toString()))
                        ]),
                ).toList()
            ),
          ),
        )*/
/*
Divider( thickness: 3, color: Theme.of(context).primaryColor,),
        Text("Surah",style: Theme.of(context).textTheme.bodyLarge,),
        Divider( thickness: 3, color: Theme.of(context).primaryColor,)*/
/*NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (overscroll) {
              overscroll.disallowGlow();
              return true;
            },
            child: ListView.builder(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, SurahDetails.routeName,arguments: surahModels[index]);
                  },
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(surahModels[index].numOfVerses.toString(),
                              textAlign: TextAlign.center)),
                      Expanded(
                          child: Text(
                        surahModels[index].surahName,
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                );
              },
              itemCount: surahModels.length,
            ),
          )*/
