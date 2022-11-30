import 'dart:convert';

class Coin {
  String? baseId;
  String sigla = "";
  String icone;
  String nome = "";
  String preco;
  double variacao;

  Coin({
    required this.baseId,
    required this.nome,
    required this.preco,
    required this.variacao,
    required this.sigla,
    required this.icone,
  });

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      baseId: json['id'],
      nome: json['name'],
      sigla: json['symbol'],
      icone: json['image_url'],
      preco: json['market_cap'],
      variacao: json['percent_change'],
    );
  }
}
