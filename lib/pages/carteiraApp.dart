import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import 'moedas_detalhes_page.dart';

class TelaInicialWidget extends StatefulWidget {

  const TelaInicialWidget({Key? key}) : super(key: key);

  @override
  State<TelaInicialWidget> createState() => TelaInicialState();

}

class TelaInicialState extends State<TelaInicialWidget> {

    final tabela = MoedaRepository.tabela;
    
    bool opacidade = true;
    String carteira = 'Carteira';
    List<Moeda> selecionadas = [];
    Widget listagemCrypto(int moeda){
         return
             Column(
                children: <Widget>[
                  Container(
                      height: 0,
                  ),
                  ListTile(
                       leading: SizedBox( width: 30, child: Image.asset(tabela[moeda].icone),),
                       title: Text(tabela[moeda].sigla),
                       subtitle: Text(tabela[moeda].moeda),
                      trailing: AnimatedOpacity(
                        opacity: opacidade ? 1 : 0,
                        duration: const Duration(milliseconds: 800),
                        child: Column(
                          children: [
                            Text(tabela[moeda].valor),
                            Text('${tabela[moeda].variacao}%',
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: (tabela[moeda].variacao > 0) ? Colors.green : Colors.red,
                              backgroundColor: (tabela[moeda].variacao > 0) ? Colors.green[50] : Colors.red[50]
                            ),)
                          ],
                        ),
                      ),

                      selected: selecionadas.contains(tabela[moeda]),
                    selectedTileColor: Colors.indigo[50],
                    onLongPress: (){
                         setState(() {
                           (selecionadas.contains(tabela[moeda]))
                               ? selecionadas.remove(tabela[moeda]) : selecionadas.add(tabela[moeda]);
                         });
                    },
                    onTap: () => mostrarDetalhes(tabela[moeda]),
                    
                  )
                   
                  
                ],
         );
    }

 mostrarDetalhes(Moeda moeda){
        Navigator.push(context, MaterialPageRoute(
            builder: (_) => MoedasDetalhesPage(moeda: moeda),
         ),
        );
    }

    @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primarySwatch: Colors.pink,
       ),
      home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(

            currentIndex: 1,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.wallet_travel), label: 'Carteiras'),
              BottomNavigationBarItem(icon: Icon(Icons.tune), label: 'Movimentações')
            ],
          ) ,
          body: ListView(
            children: <Widget>[
              Container(
                  height: 30,
                  margin: const EdgeInsets.all(10.00),
                  padding: const EdgeInsets.all(1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        carteira,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      FloatingActionButton(onPressed: () {
                        setState(() {
                          opacidade = !opacidade;
                        });
                      },
                        backgroundColor: Colors.white.withOpacity(0),
                        child: const Icon(Icons.remove_red_eye, color: Colors.black,
                        ),
                      ),
                    ],
                  ),
              ),
              AnimatedOpacity(
                  opacity: opacidade ? 1 : 0,
                  duration: const Duration(milliseconds: 800),
              child:Container(
                height: 30,
                margin: const EdgeInsets.all(10.00),
                padding: const EdgeInsets.all(1),
                child: Text(tabela[0].valorCarteira, style: const TextStyle(fontSize: 30,
                  fontWeight: FontWeight.bold,),),
              )),
              listagemCrypto(0),
              listagemCrypto(1),
              listagemCrypto(2),
            ],
          ),

      )
    );
  }
}