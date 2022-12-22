


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

import 'coin_test.mocks.dart';




@GenerateMocks([Moeda])
void main(){


  final moeda = MockMoeda();


  test('description', () async {
      when(moeda.nome ).thenReturn;

   });
}