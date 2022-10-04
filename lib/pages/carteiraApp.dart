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

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
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
                FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      opacidade = !opacidade;
                    });
                  },
                  backgroundColor: Colors.white.withOpacity(0),
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
              opacity: opacidade ? 1 : 0,
              duration: const Duration(milliseconds: 800),
              child: Container(
                height: 30,
                margin: const EdgeInsets.all(10.00),
                padding: const EdgeInsets.all(1),
                child: Text(
                  tabela[0].valorCarteira,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )),
          _MyShinyWidget(0),
          _MyShinyWidget(1),
          _MyShinyWidget(2),
        ],
      ),
    );
    //);
  }
}

class _MyShinyWidget extends StatefulWidget {
  int moeda = 0;

  _MyShinyWidget(int i) {
    this.moeda = i;
  }

  @override
  State<_MyShinyWidget> createState() => _MyShinyWidgetState();
}

class _MyShinyWidgetState extends State<_MyShinyWidget> {
  final tabela = MoedaRepository.tabela;

  List<Moeda> selecionadas = [];

  mostrarDetalhes(Moeda moeda) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 0,
        ),
        ListTile(
          leading: SizedBox(
            width: 30,
            child: Image.asset(tabela[widget.moeda].icone),
          ),
          title: Text(tabela[widget.moeda].sigla),
          subtitle: Text(tabela[widget.moeda].moeda),
          trailing: AnimatedOpacity(
            opacity: TelaInicialState().opacidade ? 1 : 0,
            duration: const Duration(milliseconds: 800),
            child: Column(
              children: [
                Text(tabela[widget.moeda].valor),
                Text(
                  '${tabela[widget.moeda].variacao}%',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: (tabela[widget.moeda].variacao > 0)
                          ? Colors.green
                          : Colors.red,
                      backgroundColor: (tabela[widget.moeda].variacao > 0)
                          ? Colors.green[50]
                          : Colors.red[50]),
                )
              ],
            ),
          ),
          selected: selecionadas.contains(tabela[widget.moeda]),
          selectedTileColor: Colors.indigo[50],
          onLongPress: () {
            setState(() {
              (selecionadas.contains(tabela[widget.moeda]))
                  ? selecionadas.remove(tabela[widget.moeda])
                  : selecionadas.add(tabela[widget.moeda]);
            });
          },
          onTap: () => mostrarDetalhes(tabela[widget.moeda]),
        )
      ],
    );
  }
}
