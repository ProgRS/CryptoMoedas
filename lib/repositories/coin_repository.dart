
import '../models/coin.dart';

class MoedaRepository{
  static List<Moeda> tabela = [
    Moeda(
      carteira: 'Carteira',
      valorCarteira: 'R\$ 1.000,00',
      rendimento: '+R\$ 100,00',
      moeda:'Ethereum' ,
      sigla:'ETH',
      icone: 'images/Ethereum.png',
      cdi: '(100% do CDI)',
      valEthLtc: 'R\$0,00',
      valBtc: 'R\$1.000,00',
      variacao1: 75,
      variacao2: 75,
      variacao3: -0.7,
      alterarValorCarteira: true,
    ),
    Moeda(
      carteira: 'Carteira',
      valorCarteira: 'R\$ 2.000,00',
      rendimento: '+R\$ 100,00',
      moeda:'Bitcoin' ,
      sigla:'BTC' ,
      icone: 'images/bitcoin.png',
      cdi: '(100% do CDI)',
      valEthLtc: 'R\$0,00',
      valBtc: 'R\$1.000,00',
      variacao1: 75,
      variacao2: 75,
      variacao3: -0.7,
      alterarValorCarteira: true,
    ),
    Moeda(
      carteira: 'Carteira',
      valorCarteira: 'R\$ 2.000,00',
      rendimento: '+R\$ 100,00',
      moeda:'Litecoin' ,
      sigla:'LTC',
      icone: 'images/LiteCoin.png',
      cdi: '(100% do CDI)',
      valEthLtc: 'R\$0,00',
      valBtc: 'R\$1.000,00',
      variacao1: 75,
      variacao2: 75,
      variacao3: -0.7,
      alterarValorCarteira: true,
    ),
  ];
}