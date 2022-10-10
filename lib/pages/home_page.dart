import 'package:flutter/material.dart';

import 'carteiraApp.dart';
import 'movimentacoes_page.dart';
import 'page_screen.dart';

class HomePage extends StatefulWidget {
  HomePage ({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _indiceAtual = 0;
  final List<Widget> _telas = [

      NewPageScreen("Pagina Home"),
      TelaInicialWidget(),
      MovimentacoesPage()

  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
           currentIndex: _indiceAtual,
           onTap: onTabTapped,
           items: [
             BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
             BottomNavigationBarItem(icon: Icon(Icons.wallet_travel), label: 'Carteiras'),
             BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Movimentações')
           ],

      ),

    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}
