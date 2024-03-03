import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/my_themes.dart';
import 'package:islamy_app/providers/surah_details_provider.dart';
import 'package:islamy_app/models/surah_model.dart';
import 'package:provider/provider.dart';

class SurahDetailsScreen extends StatelessWidget {
  static const String routeName = "SurahDetailsScreen";

  final List<InlineSpan> versesSpan = [];
  final TextSpan textSpan = const TextSpan();

  SurahDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as SurahModel;

    return ChangeNotifierProvider(
      create: (context) => SurahDetailsProvider()..loadFile(args.index),
      builder: (context, child) {
        var surahProvider = Provider.of<SurahDetailsProvider>(context);
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: Theme.of(context).brightness == Brightness.light
                      ? const AssetImage("assets/images/main_bg.png")
                      : const AssetImage("assets/images/dark_bg.png"),
                  fit: BoxFit.fill)),
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                args.surahName,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              centerTitle: true,
            ),
            body: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).brightness == Brightness.light
                      ? Colors.white
                      : MyThemeData.darkPrimaryColor),
              child: ListView(
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    textDirection: TextDirection.rtl,
                    text: TextSpan(children: [
                      for (int i = 0; i < surahProvider.verses.length; i++) ...{
                        TextSpan(
                            text: surahProvider.verses[i].trim(),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text:
                                " \u06dd${surahProvider.replaceArabicNumber((i + 1).toString())} ",
                            style: GoogleFonts.lateef(
                                fontSize: 25,
                                color: Theme.of(context).brightness ==
                                        Brightness.light
                                    ? MyThemeData.primaryColor
                                    : Colors.white)),
                      }
                    ]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/*int num = lines.length;
    for (int i = 0; i < lines.length; i++) {
      versesSpan.add(TextSpan(text:"${lines[i]}",));
      versesSpan.add(TextSpan(text:("${i+1}"),));
    }
    textSpan = TextSpan(children: versesSpan.toList());*/

/*
*
* Stack(
                  alignment: Alignment.center,
                  children: [
                  Container(color:Colors.green,child: Text(' \uFD3E\uFD3F ',style: TextStyle(fontFamily: 'Quran'),)),
                  Container(color:Colors.yellow,child: Text(' $i ',style: TextStyle(fontFamily: 'Quran',fontSize: 16),)),
                ],)
* */
/*Text(
              paragraph.trim(),
              style: TextStyle(
              color: MyThemeData.primaryColor
            ),
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,
            )*/

/*coloredVerses.add(
        TextSpan(
            text: lines[i].trim(),
            style: TextStyle(color: Colors.brown.shade200)),
      );
      coloredVerses.add(
        TextSpan(
            text: ' \uFD3F${i + 1}\uFD3E ',
            style: TextStyle(fontFamily: 'Quran', color: Colors.brown)),
      );*/

/*TextSpan(
                    children: [
                      TextSpan(text: "a",style: TextStyle(color: Colors.red)),
                      TextSpan(text: "a",style: TextStyle(color: Colors.orange)),
                      TextSpan(text: "a",style: TextStyle(color: Colors.yellow)),
                      TextSpan(text: "a",style: TextStyle(color: Colors.green)),
                      TextSpan(text: "a",style: TextStyle(color: Colors.blue)),
                    ]

                  )*/
/*TextSpan(
                    children: [
                      TextSpan(text: "مهند"),
                      WidgetSpan(child: Text("5")),
                      TextSpan(text: "احمد"),
                      WidgetSpan(child: Text("٢")),
                      TextSpan(text: "قرني"),
                      WidgetSpan(child: Text("٣")),
                      TextSpan(text: "ابوالنور"),
                      WidgetSpan(child: Text("4")),
                      TextSpan(text: "علي"),
                      WidgetSpan(child: Text("١")),



                    ]
                  )*/

/*
* TextSpan(
                    children: [
                      TextSpan(
                        text: 'الكلمة الأولى',
                        style: TextStyle(fontSize: 16),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '  الكلمة الثانية',
                        style: TextStyle(fontSize: 16),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '  الكلمة الثالثة',
                        style: TextStyle(fontSize: 16),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              '3',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '  الكلمة الرابعة',
                        style: TextStyle(fontSize: 16),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              '4',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextSpan(
                        text: '  الكلمة الخامسة',
                        style: TextStyle(fontSize: 16),
                      ),
                      WidgetSpan(
                        child: Container(
                          margin: EdgeInsets.only(left: 4),
                          height: 16,
                          width: 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              '5',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )*/

/*WidgetSpan(child:Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(color:Colors.green,child: Text(' \uFD3E\uFD3F ',style: TextStyle(fontFamily: 'Quran'),)),
                        Container(color:Colors.yellow,child: Text(' ${i + 1} ',style: TextStyle(fontFamily: 'Quran',fontSize: 16),)),
                      ],)),*/
