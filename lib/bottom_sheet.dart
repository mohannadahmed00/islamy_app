import 'package:flutter/material.dart';
import 'package:islamy_app/providers/my_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyBottomSheet extends StatelessWidget {
  final String type;
  const MyBottomSheet(this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              type == "appearance"?provider.changeMode(ThemeMode.light):provider.changeLanguage('ar');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type == "appearance"?AppLocalizations.of(context)!.light:AppLocalizations.of(context)!.arabic),
                Visibility(
                  visible: type == "appearance"?provider.themeMode==ThemeMode.light:provider.locale.languageCode=='ar',
                    child: const Icon(Icons.check)),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              type == "appearance"?provider.changeMode(ThemeMode.dark):provider.changeLanguage('en');
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(type == "appearance"?AppLocalizations.of(context)!.dark:AppLocalizations.of(context)!.english),
                Visibility(
                  visible: type == "appearance"?provider.themeMode==ThemeMode.dark:provider.locale.languageCode=='en',
                    child: const Icon(Icons.check)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
