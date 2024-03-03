import 'package:flutter/material.dart';
import 'package:islamy_app/models/hadeth_model.dart';

import '../my_themes.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routName = "HadithDetailsScreen";

  const HadithDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethModel;
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
            args.title,
            textDirection: TextDirection.rtl,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color:
            Theme.of(context).brightness == Brightness.light? Colors.white:MyThemeData.darkPrimaryColor),
            child: Text(args.content,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.justify,

              style: Theme.of(context).textTheme.bodySmall,),
          ),
        ),
      ),
    );
  }
}
