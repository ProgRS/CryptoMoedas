import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'myApp.dart';
import 'package:provider/provider.dart';

import 'repositories/coin_repository.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (contex) => MoedaRepository(),
      )
    ], child: MyApp()));
