

import 'package:flutter/material.dart';

import 'carteiraApp.dart';
import 'movimentacoes_page.dart';
import 'page_screen.dart';
class Navigatio extends StatefulWidget {
   final int selectedIndex ;
  const Navigatio(this.selectedIndex , {Key? key}) : super(key: key);

  @override
  State<Navigatio> createState() => NavigatioState();


}

class NavigatioState extends State<Navigatio> {


  final pageViewController = PageController(initialPage: 0);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

                body: PageView(
                controller: pageViewController,
                children: [
                  NewPageScreen("Pagina Home"),
                  TelaInicialWidget(),
                  MovimentacoesPage()
            ],
          ),

              bottomNavigationBar: AnimatedBuilder(
              animation: PageController(),
              builder: (context, snapshot){
                   return BottomNavigationBar(

                       items:<BottomNavigationBarItem> [

                         BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                         BottomNavigationBarItem(icon: Icon(Icons.wallet_travel), label: 'Carteiras'),
                         BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Movimentações')
                       ],


                        currentIndex:  widget.selectedIndex,
                        onTap: (index) {
                          pageViewController.jumpToPage(index);
                        },
                   );
              }
            ),

    );

  }
}
