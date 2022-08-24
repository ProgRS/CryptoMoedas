import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../repositories/coin_repository.dart';

class TelaInicialWidget extends StatefulWidget {
  TelaInicialWidget({Key? key}) : super(key: key);

  @override
  State<TelaInicialWidget> createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicialWidget> {
  
  final tabela = MoedaRepository.tabela;
  bool opacidade = true;
  String carteira = 'Carteira';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: 1,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.wallet_travel), label: 'Carteiras'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.tune), label: 'Movimentações')
            ],
          ),
          body: ListView(
            children: <Widget>[
              Container(
                  height: 30,
                  margin: EdgeInsets.all(10.00),
                  padding: EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        carteira,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            opacidade = !opacidade;
                          });
                        },
                        child: Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                        ),
                        backgroundColor: Colors.white.withOpacity(0),
                      ),
                    ],
                  )),
              AnimatedOpacity(
                opacity: opacidade ? 1 : 0,
                duration: Duration(milliseconds: 800),
                child: ListTile(
                  title: Text(
                    tabela[0].valorCarteira,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Container(
                    child: ListTile(
                      leading: Image.asset(
                        tabela[0].icone,
                        width: 30,
                      ),
                      title: Text(tabela[0].sigla),
                      subtitle: Text(tabela[0].moeda),
                      trailing: AnimatedOpacity(
                        opacity: opacidade ? 1 : 0,
                        duration: Duration(milliseconds: 800),
                        child: Column(
                          children: [
                            Text(tabela[0].valor),
                            Text(
                              '+' + tabela[0].variacao.toString() + '%',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: (tabela[0].variacao > 0)
                                      ? Colors.green
                                      : Colors.red,
                                  backgroundColor: (tabela[0].variacao > 0)
                                      ? Colors.green[50]
                                      : Colors.red[50]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: Image.asset(
                        tabela[1].icone,
                        width: 30,
                      ),
                      title: Text(tabela[1].sigla),
                      subtitle: Text(tabela[1].moeda),
                      trailing: AnimatedOpacity(
                        opacity: opacidade ? 1 : 0,
                        duration: Duration(milliseconds: 800),
                        child: Column(
                          children: [
                            Text(tabela[1].valor),
                            Text(
                              '+' + tabela[1].variacao.toString() + '%',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: (tabela[1].variacao > 0)
                                      ? Colors.green
                                      : Colors.red,
                                  backgroundColor: (tabela[1].variacao > 0)
                                      ? Colors.green[50]
                                      : Colors.red[50]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: ListTile(
                      leading: Image.asset(
                        tabela[2].icone,
                        width: 30,
                      ),
                      title: Text(tabela[2].sigla),
                      subtitle: Text(tabela[2].moeda),
                      trailing: AnimatedOpacity(
                        opacity: opacidade ? 1 : 0,
                        duration: Duration(milliseconds: 800),
                        child: Column(
                          children: [
                            Text(tabela[2].valor),
                            Text(
                               tabela[2].variacao.toString() + '%',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: (tabela[2].variacao > 0)
                                      ? Colors.green
                                      : Colors.red,
                                  backgroundColor: (tabela[2].variacao > 0)
                                      ? Colors.green[50]
                                      : Colors.red[50]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
