import 'dart:convert';

class Moeda {
  String? baseId;
  String sigla = "";
  String icone;
  String nome = "";
  String preco;
  double variacao;

  Moeda({
    required this.baseId,
    required this.nome,
    required this.preco,
    required this.variacao,
    required this.sigla,
    required this.icone,
  });

  factory Moeda.fromJson(Map<String, dynamic> json) {
    return Moeda(
      baseId: json['id'],
      nome: json['name'],
      sigla: json['symbol'],
      icone: json['image_url'],
      preco: json['market_cap'],
      variacao: json['percent_change'],
    );
  }
}
