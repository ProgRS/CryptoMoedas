import 'package:crypto/pages/conversion.dart';
import 'package:crypto/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/carteiraApp.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        
        primarySwatch: Colors.pink,
      ),
      routes: {
           '/home_page': (BuildContext context) => HomePage(),
          '/carteiraApp': (BuildContext context) => TelaInicialWidget(),
          '/conversion': (BuildContext context) => ConversionCoin(),
      },
      initialRoute: '/home_page',
    );
  }
}