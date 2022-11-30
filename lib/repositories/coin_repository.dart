import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/coin.dart';

class CoinRepository extends ChangeNotifier {
  late List<Coin> nova = [];

  var data = [];
  MoedaRepository() {
    setupDadosTableMoeda();
  }

  void setData(newData) {
    data = newData;
    notifyListeners();

  }

  Future<Coin> pegarMoeda() async {
    final res = await http
        .get(Uri.parse('https://api.coinbase.com/v2/assets/search?base=BRL'));
    var json = jsonDecode(res.body);
    final List<dynamic> moedas = json['data'];
    if (res.statusCode == 200) {
      return Coin.fromJson(moedas[0]);
    } else {
      throw Exception('FALHOU');
    }
  }

  getHistoricoMoeda(Coin moeda) async {
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

      precos.addAll({moeda['hour'],moeda['day'], moeda['week'], moeda['month'], moeda['year'], moeda['all']});

    }

    return precos;
  }

  Future<List<Coin>> setupDadosTableMoeda() async {
    String uri = 'https://api.coinbase.com/v2/assets/search?base=BRL';

    final response = await http.get(Uri.parse(uri));

    var json = jsonDecode(response.body);

    final List<dynamic> moedas = json['data'];

    var parsed = moedas.cast<Map<String, dynamic>>();
    nova = parsed.map<Coin>((json) {
      late Coin coins;
      coins = Coin.fromJson(json);
      return Coin.fromJson(json);
    }).toList();

    return nova;
  }
}
