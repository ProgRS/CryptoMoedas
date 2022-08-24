
import '../models/coin.dart';

class MoedaRepository{
  static List<Moeda> tabela = [
    Moeda(
      
      valorCarteira: 'R\$ 1.000,00',
      rendimento: '+R\$ 100,00',
      moeda:'Ethereum' ,
      sigla:'ETH',
      icone: 'images/Ethereum.png',
      cdi: '(100% do CDI)',
      valor: 'R\$0,00',      
      variacao: 75,      
      
    ),
    Moeda(
      
      valorCarteira: 'R\$ 2.000,00',
      rendimento: '+R\$ 100,00',
      moeda:'Bitcoin' ,
      sigla:'BTC' ,
      icone: 'images/bitcoin.png',
      cdi: '(100% do CDI)',      
      valor: 'R\$1.000,00',
      variacao: 75,      
      
    ),
    Moeda(
      
      valorCarteira: 'R\$ 2.000,00',
      rendimento: '+R\$ 100,00',
      moeda:'Litecoin' ,
      sigla:'LTC',
      icone: 'images/LiteCoin.png',
      cdi: '(100% do CDI)',
      valor: 'R\$0,00',      
      variacao: -0.7,
      
    ),
  ];
}