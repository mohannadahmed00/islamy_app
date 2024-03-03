import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamy_app/my_themes.dart';
import 'package:islamy_app/providers/my_provider.dart';
import 'package:islamy_app/providers/sebha_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context)=>SebhaProvider(),
      builder: (context,child){
        var provider = Provider.of<SebhaProvider>(context);
        var mainProvider = Provider.of<MyProvider>(context);
        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onTap: (){
                      provider.tic();
                    },
                    child: Image(
                      image: Theme.of(context).brightness == Brightness.light ? const AssetImage("assets/images/sebha_ic.png") : const AssetImage("assets/images/dark_sebha.png"),
                    ),
                  )),
              Container(
                margin: const EdgeInsets.all(15),
                child: Text(
                  AppLocalizations.of(context)!.num_of_tasbehat,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).brightness == Brightness.light ? Theme.of(context).textTheme.bodyMedium : Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).brightness == Brightness.light ? MyThemeData.primaryColor : MyThemeData.darkPrimaryColor),
                  child: Text(
                    mainProvider.locale.languageCode == 'ar'?provider.replaceArabicNumber(provider.numOfTasbeh.toString()):provider.numOfTasbeh.toString(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).brightness == Brightness.light ? GoogleFonts.lateef() : GoogleFonts.lateef(),
                  )),
              Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).brightness == Brightness.light ? MyThemeData.primaryColor : MyThemeData.darkSecondaryColor),
                  child: Text(
                    provider.typeOfTasbeh[provider.typeOfTasbehIndex],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).brightness == Brightness.light ? Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white) : Theme.of(context).textTheme.bodyMedium?.copyWith(color: MyThemeData.darkPrimaryColor),
                  )),
              const Expanded(
                child: SizedBox(
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
