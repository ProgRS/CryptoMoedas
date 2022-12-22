


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


class MockClient extends Mock implements http.Client {

}


void main(){

  group('fetchMoeda', (){
        test('return moeda is a requisição foi efetuada com sucesso', () async {
           final client = MockClient();
           when(() async => client.get(Uri.parse('https://api.coinbase.com/v2/assets/search?base=BRL')));

        });

  });
}