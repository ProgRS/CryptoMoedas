
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositories/coin_repository.dart';

class TelaInicialWidget extends StatefulWidget {


  TelaInicialWidget({Key? key}) : super(key: key);

  @override
  State<TelaInicialWidget> createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicialWidget> {
    int variacao1 = 1;
    int variacao2 = 1;
    int variacao3 = 0;
    final tabela = MoedaRepository.tabela;
    bool opacidade = true;
  @override
  Widget build(BuildContext context){

    return MaterialApp(
      debugShowCheckedModeBanner: false,


      home: Scaffold(

          bottomNavigationBar: BottomNavigationBar(

            currentIndex: 1,

            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.wallet_travel), label: 'Carteiras'),
              BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Movimentações')
            ],

          ) ,

          body:  ListView(
            children: <Widget> [


              Container(
                  height: 30,
                  margin: EdgeInsets.all(10.00),
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text( tabela[0].carteira, style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold,),),
                      FloatingActionButton(onPressed: () {
                        setState(() {
                          opacidade = ! opacidade;
                        });
                      },
                        child:  Icon(Icons.remove_red_eye, color: Colors.black,), backgroundColor: Colors.white.withOpacity(0),),
                    ],
                  )
              ),

        AnimatedOpacity(
          opacity: opacidade ? 1 : 0 ,
          duration: Duration(milliseconds: 800),

            child:  ListTile(
                title: Text(tabela[0].valorCarteira , style: TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,),
                ),
            ),
        ),
              Column(children: <Widget> [
                Container(
                  child: ListTile(

                    leading: Image.asset(tabela[0].icone, width: 30,),
                    title: Text(tabela[0].sigla),
                    subtitle: Text(tabela[0].moeda),

                    trailing: AnimatedOpacity(
                      opacity: opacidade ? 1 : 0 ,
                      duration: Duration(milliseconds: 800),
                      child: Column(children: [

                      Text('R\$0,00'),
                      Text('+75%' , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color:  (variacao1 > 0) ? Colors.green : Colors.red , backgroundColor: (variacao1 > 0) ? Colors.green[50] : Colors.red[50]),),
                    ],),
                  ),
                ),
              ),
                Container(
                  child: ListTile(
                    leading: Image.asset(tabela[1].icone, width: 30,),
                    title: Text(tabela[1].sigla),
                    subtitle: Text(tabela[1].moeda),
                    trailing:
                    AnimatedOpacity(
                      opacity: opacidade ? 1 : 0 ,
                      duration: Duration(milliseconds: 800),
                    child:Column(children: [
                      Text('R\$1.000,00'),
                      Text('+75%' , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color:  (variacao2 > 0) ? Colors.green : Colors.red , backgroundColor: (variacao2 > 0) ? Colors.green[50] : Colors.red[50]),),
                    ],),
                  ),
                ),
                ),
                Container(
                  child: ListTile(
                    leading: Image.asset(tabela[2].icone, width: 30,),
                    title: Text(tabela[2].sigla),
                    subtitle: Text(tabela[2].moeda),
                    trailing:
                    AnimatedOpacity(
                      opacity: opacidade ? 1 : 0 ,
                      duration: Duration(milliseconds: 800),
                    child:Column(children: [
                      Text('R\$0,00'),
                      Text('-0,7%' , style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color:  (variacao3 > 0) ? Colors.green : Colors.red , backgroundColor: (variacao3 > 0) ? Colors.green[50] : Colors.red[50]),),
                    ],),
                  ),
                ),
                ),
              ],)
            ],
          )
      ),
    ) ;
  }
}