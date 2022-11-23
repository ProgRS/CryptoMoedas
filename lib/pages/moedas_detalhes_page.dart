import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../Widgets/chart_buttons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import 'conversion.dart';
import 'sucess_convert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MoedasDetalhesPage extends StatefulWidget {
  Moeda moeda;
  MoedasDetalhesPage({Key? key, required this.moeda}) : super(key: key);

  @override
  _MoedasDetalhesPageState createState() => _MoedasDetalhesPageState();
}

class _MoedasDetalhesPageState extends State<MoedasDetalhesPage> {
  int index = 0;
  double totalCarteira = 0;
  double saldo = 0;
  bool select = false;
  List<ChartData> data = <ChartData>[];
  ChartData data2 = ChartData(0, 0);
  late List<Moeda> tabela;
  late MoedaRepository moedas = MoedaRepository();
  List<Map<String, dynamic>> precos = [];
  List dadosCompletos = [];
  double max = 0.0;
  double min = 99999999999999999.99;
  late Map<String, String> loc;
  late MoedaRepository repositorio;
  late NumberFormat real;
  Widget grafico = Container();
  bool graficoLoaded = false;

  getGrafico() async {
    precos = await moedas.getHistoricoMoeda(widget.moeda);
    int j;
    if (widget.moeda.nome == "Ethereum") {
      j = 0;
    } else if (widget.moeda.nome == "Bitcoin") {
      j = 1;
    } else {
      j = 2;
    }
    dadosCompletos = precos[0]['prices'];
    dadosCompletos = dadosCompletos.reversed.map((item) {
      double preco = double.parse(item[0]);
      int time = int.parse(item[1].toString() + '000');
      return [preco, time];
    }).toList();

    moedas.setupDadosTableMoeda();

    for (int i = 0; i < 5; i++) {
      data2 = ChartData(dadosCompletos[i][1], dadosCompletos[i][0]);
      data.add(data2);
    }

    return precos;
  }

  @override
  initState() {
    super.initState();

    widget.moeda.preco = widget.moeda.preco;
    widget.moeda.variacao = widget.moeda.variacao;
    getGrafico();
  }

  callDataCharts(int numberSpots, int posicao) {
    setState(() {
      if (numberSpots == 5) {
        widget.moeda.preco = widget.moeda.preco;
        widget.moeda.variacao = widget.moeda.variacao;
        data.clear();
        dadosCompletos = precos[0]['prices'];
        dadosCompletos = dadosCompletos.reversed.map((item) {
          double preco = double.parse(item[0]);
          int time = int.parse(item[1].toString() + '000');
          return [preco, time];
        }).toList();

        for (int i = 0; i < 5; i++) {
          data2 = ChartData(dadosCompletos[i][1], dadosCompletos[i][0]);

          if (dadosCompletos[i][0] > max) {
            max = dadosCompletos[i][0];
            print(max);
          }
          if (dadosCompletos[i][0] < min) {
            min = dadosCompletos[i][0];
          }

          data.add(data2);
        }
      } else if (numberSpots == 10) {
        data.clear();
        dadosCompletos = precos[0]['prices'];
        dadosCompletos = dadosCompletos.reversed.map((item) {
          double preco = double.parse(item[0]);
          int time = int.parse(item[1].toString() + '000');
          return [preco, time];
        }).toList();
        for (int i = 0; i < 10; i++) {
          data2 = ChartData(dadosCompletos[i][1], dadosCompletos[i][0]);
          data.add(data2);
          if (dadosCompletos[i][0] > max) {
            max = dadosCompletos[i][0];
          }

          if (dadosCompletos[i][0] < min) {
            min = dadosCompletos[i][0];
          }
        }
      } else if (numberSpots == 15) {
        data.clear();
        dadosCompletos = precos[0]['prices'];
        dadosCompletos = dadosCompletos.reversed.map((item) {
          double preco = double.parse(item[0]);
          int time = int.parse(item[1].toString() + '000');
          return [preco, time];
        }).toList();
        for (int i = 0; i < 15; i++) {
          data2 = ChartData(dadosCompletos[i][1], dadosCompletos[i][0]);
          data.add(data2);
          if (dadosCompletos[i][0] > max) {
            max = dadosCompletos[i][0];
          }

          if (dadosCompletos[i][0] < min) {
            min = dadosCompletos[i][0];
          }
        }
      } else if (numberSpots == 30) {
        data.clear();
        dadosCompletos = precos[0]['prices'];
        dadosCompletos = dadosCompletos.reversed.map((item) {
          double preco = double.parse(item[0]);
          int time = int.parse(item[1].toString() + '000');
          return [preco, time];
        }).toList();
        for (int i = 0; i < 30; i++) {
          data2 = ChartData(dadosCompletos[i][1], dadosCompletos[i][0]);
          data.add(data2);
          if (dadosCompletos[i][0] > max) {
            max = dadosCompletos[i][0];
          }

          if (dadosCompletos[i][0] < min) {
            min = dadosCompletos[i][0];
          }
        }
      } else {
        data.clear();
        dadosCompletos = precos[0]['prices'];
        dadosCompletos = dadosCompletos.reversed.map((item) {
          double preco = double.parse(item[0]);
          int time = int.parse(item[1].toString() + '000');
          return [preco, time];
        }).toList();
        for (int i = 0; i < 50; i++) {
          data2 = ChartData(dadosCompletos[i][1], dadosCompletos[i][0]);
          data.add(data2);
          if (dadosCompletos[i][0] > max) {
            max = dadosCompletos[i][0];
          }

          if (dadosCompletos[i][0] < min) {
            min = dadosCompletos[i][0];
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageName = AppLocalizations.of(context)!;
    const valorCarteira = 1000;
    moedas = context.watch<MoedaRepository>();
    repositorio = context.read<MoedaRepository>();
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName.nameDetails),
      ),

      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey),
              ),
            ),
            child: SizedBox(
              child: Card(
                elevation: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.nameCoin,
                        style: TextStyle(fontSize: 40, color: Colors.black),
                      ),
                      subtitle: Text(
                        widget.moeda.nome,
                        style:
                            const TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: SfCartesianChart(
                          primaryXAxis: CategoryAxis(isVisible: false),
                          primaryYAxis: NumericAxis(isVisible: false),
                          backgroundColor:
                              const Color.fromARGB(255, 235, 231, 231),
                          title: ChartTitle(
                              text: ("R\$$valorCarteira,00"),
                              alignment: ChartAlignment.near,
                              textStyle: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                          series: <ChartSeries>[
                            LineSeries<ChartData, int>(
                              animationDuration: 1000,
                              color: Colors.orange,
                              dataSource: data,
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: false),
                              markerSettings:
                                  const MarkerSettings(isVisible: false),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ChartButtons(
                              buttonName: "5D",
                              onPressed: () {
                                if (widget.moeda.nome == "Ethereum") {
                                  callDataCharts(5, 0);
                                } else if (widget.moeda.nome == "Bitcoin") {
                                  callDataCharts(5, 1);
                                } else {
                                  callDataCharts(5, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "10D",
                              onPressed: () {
                                if (widget.moeda.nome == "Ethereum") {
                                  callDataCharts(10, 0);
                                } else if (widget.moeda.nome == "Bitcoin") {
                                  callDataCharts(10, 1);
                                } else {
                                  callDataCharts(10, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "15D",
                              onPressed: () {
                                if (widget.moeda.nome == "Ethereum") {
                                  callDataCharts(15, 0);
                                } else if (widget.moeda.nome == "Bitcoin") {
                                  callDataCharts(15, 1);
                                } else {
                                  callDataCharts(15, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "30D",
                              onPressed: () {
                                if (widget.moeda.nome == "Ethereum") {
                                  callDataCharts(30, 0);
                                } else if (widget.moeda.nome == "Bitcoin") {
                                  callDataCharts(30, 1);
                                } else {
                                  callDataCharts(30, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "50D",
                              onPressed: () {
                                if (widget.moeda.nome == "Ethereum") {
                                  callDataCharts(50, 0);
                                } else if (widget.moeda.nome == "Bitcoin") {
                                  callDataCharts(50, 1);
                                } else {
                                  callDataCharts(50, 2);
                                }
                              }),
                          IconButton(
                            onPressed: () => {},
                            icon: const Icon(Icons.bar_chart),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.nameInfo,
                        style: TextStyle(fontSize: 30, color: Colors.black),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: Text(
                        widget.moeda.nome,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 85, 83, 83),
                        ),
                      ),
                      subtitle:
                          Text(AppLocalizations.of(context)!.nameActualValue),
                      trailing: Text("R\$${widget.moeda.preco}"),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.nameMarketCap,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 85, 83, 83)),
                      ),
                      trailing: Text(
                        "${widget.moeda.variacao}%",
                        style: TextStyle(
                            color: (widget.moeda.variacao > 0)
                                ? Colors.green
                                : Colors.red,
                            backgroundColor: (widget.moeda.variacao > 0)
                                ? Colors.green[50]
                                : Colors.red[50]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.nameMinValue,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 85, 83, 83)),
                      ),
                      trailing: Text("R\$${this.min}"),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.nameMaxValue,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 85, 83, 83)),
                      ),
                      trailing: Text("R\$${this.max}"),
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink)),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ConversionCoin(),
                          ),
                        );
                      },
                      child: Text(
                        AppLocalizations.of(context)!.nameBtnConvert,
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      //)
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  int x;
  double? y;
}
