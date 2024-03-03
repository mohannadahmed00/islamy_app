import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamy_app/screens/home_screen.dart';
import 'package:islamy_app/my_themes.dart';
import 'package:islamy_app/providers/my_provider.dart';
import 'package:islamy_app/screens/surah_details_screen.dart';
import 'package:provider/provider.dart';
import 'screens/hadeth_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => MyProvider(), child: const MyApplication()));
}

class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: provider.locale,
      theme: MyThemeData.lightThemeData,
      darkTheme: MyThemeData.darkThemeData,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      themeMode: provider.themeMode,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        SurahDetailsScreen.routeName: (context) => SurahDetailsScreen(),
        HadithDetailsScreen.routName: (context) => const HadithDetailsScreen()
      },
    );
  }
}
