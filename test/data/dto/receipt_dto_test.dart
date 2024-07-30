import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_architecture/data/dto/receipt_dto.dart';

void main() {
  group('ReceiptDTO', () {
    test('fromJson should convert JSON to ReceiptDTO', () {
      final json = {
        "calories": "516 kcal",
        "carbos": "47 g",
        "description": "",
        "difficulty": 0,
        "fats": "8 g",
        "headline": "with Sweet Potato Wedges",
        "id": "533143aaff604d567f8b4571",
        "image": "https://example.com/cake.jpg",
        "name": "Crispy Fish Goujons ",
        "proteins": "43 g",
        "thumb": "https://example.com/cake.jpg",
        "time": "PT35M"
      };

      final receiptDTO = ReceiptDTO.fromJson(json);

      expect(receiptDTO.calories, equals('516 kcal'));
      expect(receiptDTO.carbos, equals('47 g'));
      expect(receiptDTO.description, equals(''));
      expect(receiptDTO.difficulty, equals(0));
      expect(receiptDTO.fats, equals('8 g'));
      expect(receiptDTO.headline, equals('with Sweet Potato Wedges'));
      expect(receiptDTO.id, equals('533143aaff604d567f8b4571'));
      expect(receiptDTO.image, equals('https://example.com/cake.jpg'));
      expect(receiptDTO.name, equals('Crispy Fish Goujons '));
      expect(receiptDTO.proteins, equals('43 g'));
      expect(receiptDTO.thumb, equals('https://example.com/cake.jpg'));
      expect(receiptDTO.time, equals('PT35M'));
    });

    test('toJson should convert ReceiptDTO to JSON', () {
      const receiptDTO = ReceiptDTO(
        calories: '516 kcal',
        carbos: '47 g',
        description: '',
        difficulty: 0,
        fats: '8 g',
        headline: 'with Sweet Potato Wedges',
        id: '533143aaff604d567f8b4571',
        image: 'https://example.com/cake.jpg',
        name: 'Crispy Fish Goujons ',
        proteins: '43 g',
        thumb: 'https://example.com/cake.jpg',
        time: 'PT35M',
      );

      final json = receiptDTO.toJson();

      expect(json['calories'], equals('516 kcal'));
      expect(json['carbos'], equals('47 g'));
      expect(json['description'], equals(''));
      expect(json['difficulty'], equals(0));
      expect(json['fats'], equals('8 g'));
      expect(json['headline'], equals('with Sweet Potato Wedges'));
      expect(json['id'], equals('533143aaff604d567f8b4571'));
      expect(json['image'], equals('https://example.com/cake.jpg'));
      expect(json['name'], equals('Crispy Fish Goujons '));
      expect(json['proteins'], equals('43 g'));
      expect(json['thumb'], equals('https://example.com/cake.jpg'));
      expect(json['time'], equals('PT35M'));
    });
  });
}
