


import 'dart:math';

import 'package:aula_01/models/coin.dart';
import 'package:aula_01/repositories/coin_repository.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
//import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

//import 'coin_repository_test.mocks.dart';
import 'package:http/src/mock_client.dart';


 class CoinRepository extends Mock implements MoedaRepository{}


void main(){

   final  moeda =  MoedaRepository();
   final MoedaRepository coinRepository;
   final coinTest = Moeda(baseId: "teste", nome: "teste", preco: "teste", variacao: 4, sigla: "teste", icone: "teste");

   final repository = MoedaRepository();


   test('description', () async {
      when((async) => moeda.PegarMoeda());
     final list_ = await repository.PegarMoeda();

      expect(list_.icone.isNotEmpty, equals(true));
      expect(list_.preco.isNotEmpty, equals(true)) ;
      expect(list_.variacao.isNaN, equals(false)) ;
      expect(list_.sigla.isNotEmpty, equals(true)) ;
      expect(list_.nome, equals('Bitcoin')) ;
      expect(list_.sigla, equals('BTC')) ;
   });

   test('Teste', () async {
     when((async) => moeda.getHistoricoMoeda(coinTest));
     final list = await repository.getHistoricoMoeda(coinTest);
     expect(list, equals([]));


   });

   test('Teste Lista', () async {
     when((async) => moeda.setupDadosTableMoeda());
     final list = await repository.setupDadosTableMoeda();
     expect(list.isNotEmpty, equals(true));
     expect(list[0].nome, equals("Bitcoin"));
     expect(list[0].sigla, equals("BTC"));
     expect(list[0].variacao.isNaN, equals(false));

   });


}