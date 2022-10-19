import 'package:flutter/material.dart';

import 'carteiraApp.dart';
import 'movimentacoes_page.dart';
import 'navigation.dart';
import 'page_screen.dart';

class HomePage extends StatefulWidget {
  
  HomePage ({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return
           Scaffold(
             body: Navigatio(selectedIndex),
           );

  }
}