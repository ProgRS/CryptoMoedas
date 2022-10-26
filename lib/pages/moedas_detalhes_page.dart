import 'package:flutter/material.dart';

import '../Widgets/chart_buttons.dart';
import '../models/coin.dart';
import '../repositories/coin_repository.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'conversion.dart';

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
  final tabela = MoedaRepository.tabela;

  @override
  initState() {
    super.initState();
    //data = generateSpots(50)
    int j;
    if (widget.moeda.moeda == "Ethereum") {
      j = 0;
    } else if (widget.moeda.moeda == "Bitcoin") {
      j = 1;
    } else {
      j = 2;
    }
    widget.moeda.valor_default = widget.moeda.valorAtual[0];
    widget.moeda.variacao = widget.moeda.capMercado[0];
    widget.moeda.valor_default_min = widget.moeda.valorMin[0];
    widget.moeda.valor_default_max = widget.moeda.valorMax[0];
    for (int i = 0; i < 5; i++) {
      data2 = ChartData(tabela[j].dia_5[i], tabela[j].valor_5[i]);
      data.add(data2);
    }
  }

  callDataCharts(int numberSpots, int posicao) {
    setState(() {
      if (numberSpots == 5) {
        widget.moeda.valor_default = widget.moeda.valorAtual[0];
        widget.moeda.variacao = widget.moeda.capMercado[0];
        widget.moeda.valor_default_min = widget.moeda.valorMin[0];
        widget.moeda.valor_default_max = widget.moeda.valorMax[0];
        data.clear();
        for (int i = 0; i < 5; i++) {
          data2 =
              ChartData(tabela[posicao].dia_5[i], tabela[posicao].valor_5[i]);
          data.add(data2);
        }
      } else if (numberSpots == 10) {
        widget.moeda.valor_default = widget.moeda.valorAtual[1];
        widget.moeda.variacao = widget.moeda.capMercado[1];
        widget.moeda.valor_default_min = widget.moeda.valorMin[1];
        widget.moeda.valor_default_max = widget.moeda.valorMax[1];
        data.clear();
        for (int i = 0; i < 10; i++) {
          data2 =
              ChartData(tabela[posicao].dia_10[i], tabela[posicao].valor_10[i]);
          data.add(data2);
        }
      } else if (numberSpots == 15) {
        widget.moeda.valor_default = widget.moeda.valorAtual[2];
        widget.moeda.variacao = widget.moeda.capMercado[2];
        widget.moeda.valor_default_min = widget.moeda.valorMin[2];
        widget.moeda.valor_default_max = widget.moeda.valorMax[2];
        data.clear();
        for (int i = 0; i < 15; i++) {
          data2 =
              ChartData(tabela[posicao].dia_15[i], tabela[posicao].valor_15[i]);
          data.add(data2);
        }
      } else if (numberSpots == 30) {
        widget.moeda.valor_default = widget.moeda.valorAtual[3];
        widget.moeda.variacao = widget.moeda.capMercado[3];
        widget.moeda.valor_default_min = widget.moeda.valorMin[3];
        widget.moeda.valor_default_max = widget.moeda.valorMax[3];
        data.clear();
        for (int i = 0; i < 30; i++) {
          data2 =
              ChartData(tabela[posicao].dia_30[i], tabela[posicao].valor_30[i]);
          data.add(data2);
        }
      } else {
        widget.moeda.valor_default = widget.moeda.valorAtual[4];
        widget.moeda.variacao = widget.moeda.capMercado[4];
        widget.moeda.valor_default_min = widget.moeda.valorMin[4];
        widget.moeda.valor_default_max = widget.moeda.valorMax[4];

        data.clear();
        for (int i = 0; i < 50; i++) {
          data2 =
              ChartData(tabela[posicao].dia_50[i], tabela[posicao].valor_50[i]);
          data.add(data2);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String pageName = AppLocalizations.of(context)!.nameDetails;;
    const valorCarteira = 1000;

    return Scaffold(
      appBar: AppBar(
        title:  Text(pageName),
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
                        widget.moeda.moeda,
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
                                if (widget.moeda.moeda == "Ethereum") {
                                  callDataCharts(5, 0);
                                } else if (widget.moeda.moeda == "Bitcoin") {
                                  callDataCharts(5, 1);
                                } else {
                                  callDataCharts(5, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "10D",
                              onPressed: () {
                                if (widget.moeda.moeda == "Ethereum") {
                                  callDataCharts(10, 0);
                                } else if (widget.moeda.moeda == "Bitcoin") {
                                  callDataCharts(10, 1);
                                } else {
                                  callDataCharts(10, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "15D",
                              onPressed: () {
                                if (widget.moeda.moeda == "Ethereum") {
                                  callDataCharts(15, 0);
                                } else if (widget.moeda.moeda == "Bitcoin") {
                                  callDataCharts(15, 1);
                                } else {
                                  callDataCharts(15, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "30D",
                              onPressed: () {
                                if (widget.moeda.moeda == "Ethereum") {
                                  callDataCharts(30, 0);
                                } else if (widget.moeda.moeda == "Bitcoin") {
                                  callDataCharts(30, 1);
                                } else {
                                  callDataCharts(30, 2);
                                }
                              }),
                          ChartButtons(
                              buttonName: "50D",
                              onPressed: () {
                                if (widget.moeda.moeda == "Ethereum") {
                                  callDataCharts(50, 0);
                                } else if (widget.moeda.moeda == "Bitcoin") {
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
                        widget.moeda.moeda,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 85, 83, 83),
                        ),
                      ),
                      subtitle: Text(AppLocalizations.of(context)!.nameActualValue),
                      trailing: Text("R\$${widget.moeda.valor_default}"),
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
                      title:  Text(
                        AppLocalizations.of(context)!.nameMinValue,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 85, 83, 83)),
                      ),
                      trailing: Text("R\$${widget.moeda.valor_default_min}"),
                    ),
                    ListTile(
                      title: Text(
                        AppLocalizations.of(context)!.nameMaxValue,
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 85, 83, 83)),
                      ),
                      trailing: Text("R\$${widget.moeda.valor_default_max}"),
                    ),
                    OutlinedButton(
                      style: ButtonStyle(
                          alignment: Alignment.center,
                          backgroundColor:
                              MaterialStateProperty.all(Colors.pink)),
                      onPressed: () {
                        
                            Navigator.pushNamed(context, '/conversion', arguments: "2");
                            
                      },
                      child:  Text(
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
