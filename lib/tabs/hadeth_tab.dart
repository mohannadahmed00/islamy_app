import 'package:flutter/material.dart';
import 'package:islamy_app/screens/hadeth_details_screen.dart';
import 'package:islamy_app/my_themes.dart';
import 'package:islamy_app/providers/hadeth_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethTab extends StatelessWidget {
  const HadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HadethProvider()..loadFile(),
      builder: (context, child) {
        var provider = Provider.of<HadethProvider>(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 1,
                child: Image.asset("assets/images/prophet_muhammad.png")),
            Divider(
              thickness: 3,
              color: Theme.of(context).brightness == Brightness.light
                  ? MyThemeData.primaryColor
                  : MyThemeData.darkSecondaryColor,
            ),
            Text(
              AppLocalizations.of(context)!.ahadeth,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
              textAlign: TextAlign.center,
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
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, HadithDetailsScreen.routName,
                        arguments: provider.ahadeth[index]);
                  },
                  child: Text(
                    provider.ahadeth[index].title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 25),
                    textAlign: TextAlign.center,
                  ),
                ),
                itemCount: provider.ahadeth.length,
              ),
            )
          ],
        );
      },
    );
  }
}
