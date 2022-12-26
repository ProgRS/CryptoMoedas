import 'package:faker/faker.dart';

class ApiFactory {
  static List<Map<String, dynamic>> getCryptoList() {
    return [{
      "id": Faker().person.toString(),
      "symbol": Faker().lorem.toString(),
      "name": Faker().person.toString(),
      "image": Faker().image.image(),
      "price_change_percentage_24h":
      Faker().randomGenerator.integer(10).toDouble(),
      "current_price": Faker().randomGenerator.integer(100000).toDouble(),
    },];
  }

  static List<List<num>> getPrices() {
    return [
      [
        Faker().randomGenerator.integer(10000).toDouble(),
        Faker().randomGenerator.integer(1000).toDouble(),
      ],
      [
        Faker().randomGenerator.integer(10000).toDouble(),
        Faker().randomGenerator.integer(1000).toDouble(),
      ],
      [
        Faker().randomGenerator.integer(10000).toDouble(),
        Faker().randomGenerator.integer(1000).toDouble(),
      ],
      [
        Faker().randomGenerator.integer(10000).toDouble(),
        Faker().randomGenerator.integer(1000).toDouble(),
      ],
    ];
  }
}