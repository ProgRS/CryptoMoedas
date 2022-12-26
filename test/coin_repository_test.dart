


import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'api_factory.dart';

class DioMock extends Mock implements Dio {}

void main() {
  late Response<List<Map<String, dynamic>>> success;
  late DioMock dioMock;
  late CryptosEndpoint endpoint;

  When mockGetResponse() => when(() {
    return dioMock.get(
      any(),
      queryParameters: any(named: 'queryParameters'),
    );
  });

  mockResponse(List<Map<String, dynamic>> factory, int statusCode) {
    return Response(
      data: factory,
      statusCode: statusCode,
      requestOptions: RequestOptions(
        path: faker.internet.httpUrl(),
      ),
    );
  }

  setUp(() {
    dioMock = DioMock();
    endpoint = CryptosEndpoint(dioMock);
    success = mockResponse(ApiFactory.getCryptoList(), 200);
  });

  test('WHEN requisition is made THEN ensure it returns the status code',
          () async {
        mockGetResponse().thenAnswer((_) async => success);
        final result = await endpoint.getCryptoList();
        expect(result.statusCode, (200));
        expect(result, success);
      });
}
