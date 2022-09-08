class Moeda{
  
  String valorCarteira;
  String rendimento;
  String moeda;
  String sigla;
  String icone;
  String cdi;
  String valor;  
  double variacao;
  bool alterarValorCarteira;
  double valor_default;
  double valor_default_min;
  double valor_default_max;
  List <double> valorAtual;
  List <double> valorMin;
  List <double> valorMax;
  List <double> capMercado;
  List <int> dia_5 ;
  List <double> valor_5;
  List <int> dia_10 ;
  List <double> valor_10;
  List <int> dia_15 ;
  List <double> valor_15;
  List <int> dia_30 ;
  List <double> valor_30;
  List <int> dia_50 ;
  List <double> valor_50;  
  


  Moeda({
    
    required this.valorCarteira,
    required this.rendimento,
    required this.moeda,
    required this.sigla,
    required this.icone,
    required this.cdi,
    required this.valor,    
    required this.variacao,    
    required this.dia_5,
    required this.valor_5,
    required this.dia_10,
    required this.valor_10,
    required this.dia_15,
    required this.valor_15,
    required this.dia_30,
    required this.valor_30,
    required this.dia_50,
    required this.valor_50,
    required this.alterarValorCarteira,
    required this.valorAtual,
    required this.valorMin,
    required this.valorMax,
    required this.valor_default_max,
    required this.valor_default_min,
    required this.capMercado,
    required this.valor_default,


  });
}