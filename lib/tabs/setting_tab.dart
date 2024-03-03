import 'package:flutter/material.dart';
import 'package:islamy_app/my_themes.dart';
import 'package:islamy_app/bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy_app/providers/my_provider.dart';
import 'package:provider/provider.dart';



class SettingTab extends StatelessWidget {
  const SettingTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.appearance,
          ),
        ),
        GestureDetector(
          onTap: () {
            showBottomSheet(context,"appearance");
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.darkSecondaryColor,
              ),
            ),
            child: Text(provider.themeMode==ThemeMode.dark?AppLocalizations.of(context)!.dark:AppLocalizations.of(context)!.light),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.language,
          ),
        ),
        GestureDetector(
          onTap: (){
            showBottomSheet(context,"language");
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(8.0),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? MyThemeData.primaryColor
                    : MyThemeData.darkSecondaryColor,
              ),
            ),
            child: Text(provider.locale.languageCode=='en'?AppLocalizations.of(context)!.english:AppLocalizations.of(context)!.arabic),
          ),
        ),
      ],
    );
  }

  void showBottomSheet(BuildContext context,String type) {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (context) {
          return MyBottomSheet(type);
        });
  }
}
