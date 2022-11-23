import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/coin.dart';

class MoedaRepository extends ChangeNotifier {
  late List<Moeda> nova = [];

  var data = [];
  MoedaRepository() {
    setupDadosTableMoeda();
  }

  void setData(newData) {
    data = newData;
    notifyListeners();

  }

  Future<Moeda> PegarMoeda() async {
    final res = await http
        .get(Uri.parse('https://api.coinbase.com/v2/assets/search?base=BRL'));
    var json = jsonDecode(res.body);
    final List<dynamic> moedas = json['data'];
    if (res.statusCode == 200) {
      return Moeda.fromJson(moedas[0]);
    } else {
      throw Exception('FALHOU');
    }
  }

  getHistoricoMoeda(Moeda moeda) async {
    final response = await http.get(
      Uri.parse(
        'https://api.coinbase.com/v2/assets/prices/${moeda.baseId}?base=BRL',
      ),
    );
    List<Map<String, dynamic>> precos = [];
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final Map<String, dynamic> moeda = json['data']['prices'];
      (moeda.forEach((key, value) {
        moeda['prices'];
      }));

      precos.add(moeda['hour']);
      precos.add(moeda['day']);
      precos.add(moeda['week']);
      precos.add(moeda['month']);
      precos.add(moeda['year']);
      precos.add(moeda['all']);
    }

    return precos;
  }

  Future<List<Moeda>> setupDadosTableMoeda() async {
    String uri = 'https://api.coinbase.com/v2/assets/search?base=BRL';

    final response = await http.get(Uri.parse(uri));

    var json = jsonDecode(response.body);

    final List<dynamic> moedas = json['data'];

    var parsed = moedas.cast<Map<String, dynamic>>();
    nova = parsed.map<Moeda>((json) {
      late Moeda coins;
      coins = Moeda.fromJson(json);
      return Moeda.fromJson(json);
    }).toList();

    return nova;
  }
}
