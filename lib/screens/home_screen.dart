import 'package:flutter/material.dart';
import 'package:islamy_app/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "HomeScreen";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        var provider = Provider.of<HomeProvider>(context);
        return Stack(
          children: [
            SizedBox(
                width: double.infinity,
                child: Theme.of(context).brightness == Brightness.light
                    ? Image.asset(
                        "assets/images/main_bg.png",
                        fit: BoxFit.fill,
                      )
                    : Image.asset(
                        "assets/images/dark_bg.png",
                        fit: BoxFit.fill,
                      )),
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(
                  AppLocalizations.of(context)!.app_title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              body: provider.tabs[provider.index],
              bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  provider.changeIndex(value);
                },
                currentIndex: provider.index,
                items: [
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).primaryColor,
                      icon: const ImageIcon(
                          AssetImage("assets/images/quran.png")),
                      label: AppLocalizations.of(context)!.quran),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).primaryColor,
                      icon: const ImageIcon(
                          AssetImage("assets/images/hadeth.png")),
                      label: AppLocalizations.of(context)!.ahadeth),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).primaryColor,
                      icon: const ImageIcon(
                          AssetImage("assets/images/sebha.png")),
                      label: AppLocalizations.of(context)!.sebha),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).primaryColor,
                      icon: const ImageIcon(
                          AssetImage("assets/images/radio.png")),
                      label: AppLocalizations.of(context)!.radio),
                  BottomNavigationBarItem(
                      backgroundColor: Theme.of(context).primaryColor,
                      icon: const Icon(Icons.settings),
                      label: AppLocalizations.of(context)!.settings),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
