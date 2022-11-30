import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import 'moedas_detalhes_page.dart';


class TelaInicialWidget extends StatefulWidget {
  static const route = '/carteiraApp';

  const TelaInicialWidget({Key? key}) : super(key: key);

  @override
  State<TelaInicialWidget> createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicialWidget> {
  late CoinRepository coinRepository = CoinRepository();
  bool opacidade = true;
  late String nov;
  List<Coin> selecionadas = [];
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    coinRepository = CoinRepository();
  }

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;
    coinRepository = CoinRepository();

    return Scaffold(
        appBar: AppBar(
          title: Text("Resultados"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: ListView(
          children: <Widget>[

            Container(
              height: 30,
              margin: const EdgeInsets.all(10.00),
              padding: const EdgeInsets.all(1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text.nameWallet,
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
              opacity: 1,
              duration: const Duration(milliseconds: 800),
              child: Container(
                height: 30,
                margin: const EdgeInsets.all(10.00),
                padding: const EdgeInsets.all(1),
                child: Text(
                  "R\$1000",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            _MyShinyWidget(0),
            _MyShinyWidget(1),
            _MyShinyWidget(17),
          ],
        )));
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

   CoinRepository coinRepository = CoinRepository();

  List<Coin> selecionadas = [];
  bool opacidade = true;

  mostrarDetalhes(Coin moeda) {
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
        FutureBuilder<List<Coin>>(
          future: coinRepository.setupDadosTableMoeda(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              snapshot.data![widget.moeda].sigla;
              return ListTile(
                leading: SizedBox(
                  width: 30,
                  child: Image.network(snapshot.data![widget.moeda].icone),
                ),
                title: Text(snapshot.data![widget.moeda].sigla),
                subtitle: Text(snapshot.data![widget.moeda].nome),
                trailing: AnimatedOpacity(
                  opacity: opacidade ? 1 : 0,
                  duration: const Duration(milliseconds: 800),
                  child: Column(
                    children: [
                      Text(snapshot.data![widget.moeda].preco),
                      Text(
                        '${snapshot.data![widget.moeda].variacao}%',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: (snapshot.data![widget.moeda].variacao > 0)
                                ? Colors.green
                                : Colors.red,
                            backgroundColor:
                                (snapshot.data![widget.moeda].variacao > 0)
                                    ? Colors.green[50]
                                    : Colors.red[50]),
                      )
                    ],
                  ),
                ),
                selected: selecionadas.contains(snapshot.data![widget.moeda]),
                selectedTileColor: Colors.indigo[50],
                onLongPress: () {
                  setState(() {
                    (selecionadas.contains(snapshot.data![widget.moeda]))
                        ? selecionadas.remove(snapshot.data![widget.moeda])
                        : selecionadas.add(snapshot.data![widget.moeda]);
                  });
                },
                onTap: () => mostrarDetalhes(snapshot.data![widget.moeda]),
              );
            } else if (snapshot.hasError) {
              return Text("Erro ${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ],
    );
  }
}
