import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_clean_architecture/domain/entity/receipt.dart';

void main() {
  group('Receipt', () {
    test('props should contain all fields', () {
      const receipt = Receipt(
        calories: '200',
        carbos: '50g',
        description: 'Delicious meal',
        difficulty: 2,
        fats: '10g',
        headline: 'Tasty and Healthy',
        id: '1',
        image: 'image.png',
        name: 'Salad',
        proteins: '5g',
        thumb: 'thumb.png',
        time: '15 min',
      );

      expect(
        receipt.props,
        [
          '200',
          '50g',
          'Delicious meal',
          2,
          '10g',
          'Tasty and Healthy',
          '1',
          'image.png',
          'Salad',
          '5g',
          'thumb.png',
          '15 min',
        ],
      );
    });

    test('Receipts with same properties should be equal', () {
      const receipt1 = Receipt(
        calories: '200',
        carbos: '50g',
        description: 'Delicious meal',
        difficulty: 2,
        fats: '10g',
        headline: 'Tasty and Healthy',
        id: '1',
        image: 'image.png',
        name: 'Salad',
        proteins: '5g',
        thumb: 'thumb.png',
        time: '15 min',
      );

      const receipt2 = Receipt(
        calories: '200',
        carbos: '50g',
        description: 'Delicious meal',
        difficulty: 2,
        fats: '10g',
        headline: 'Tasty and Healthy',
        id: '1',
        image: 'image.png',
        name: 'Salad',
        proteins: '5g',
        thumb: 'thumb.png',
        time: '15 min',
      );

      expect(receipt1, receipt2);
    });

    test('Receipts with different properties should not be equal', () {
      const receipt1 = Receipt(
        calories: '200',
        carbos: '50g',
        description: 'Delicious meal',
        difficulty: 2,
        fats: '10g',
        headline: 'Tasty and Healthy',
        id: '1',
        image: 'image.png',
        name: 'Salad',
        proteins: '5g',
        thumb: 'thumb.png',
        time: '15 min',
      );

      const receipt2 = Receipt(
        calories: '250',
        carbos: '60g',
        description: 'Another meal',
        difficulty: 3,
        fats: '15g',
        headline: 'Also Healthy',
        id: '2',
        image: 'image2.png',
        name: 'Soup',
        proteins: '10g',
        thumb: 'thumb2.png',
        time: '20 min',
      );

      expect(receipt1, isNot(receipt2));
    });
  });
}
