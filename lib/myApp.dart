import 'package:crypto/pages/conversion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/carteiraApp.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      theme: ThemeData(
        
        primarySwatch: Colors.pink,
      ),
      routes: {
          '/carteiraApp': (BuildContext context) => TelaInicialWidget(),
          '/conversion': (BuildContext context) => ConversionCoin(),
      },
      initialRoute: '/carteiraApp',
    );
  }
}