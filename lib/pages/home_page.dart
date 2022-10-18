import 'package:flutter/material.dart';

import 'carteiraApp.dart';
import 'movimentacoes_page.dart';
import 'page_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> routes = [
    NewPageScreen("Pagina Home"),
    TelaInicialWidget(),
    MovimentacoesPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: routes.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.wallet_travel), label: 'Carteiras'),
          BottomNavigationBarItem(
              icon: Icon(Icons.tune), label: 'Movimentações')
        ],
      ),
    );
  }

  
}
