import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/receipt/detail/receipt_detail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_clean_architecture/domain/entity/receipt.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ReceiptDetailPage', () {
    const receipt = Receipt(
      name: 'Salad',
      headline: 'Tasty and Healthy',
      description: 'Delicious meal',
      calories: '200',
      carbos: '50g',
      difficulty: 2,
      fats: '10g',
      proteins: '5g',
      time: '15 min',
      image: 'https://example.com/image.png',
    );

    testWidgets('should display receipt details correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: ReceiptDetailPage(receipt: receipt),
      ));

      // Wait for any pending asynchronous tasks to complete
      await tester.pumpAndSettle();

      // Check if the app bar title is displayed
      // Check if the receipt details are displayed
      expect(find.text('Salad'), findsAtLeast(2));

      // Check if the image is displayed
      expect(find.byType(CachedNetworkImage), findsOneWidget);

      expect(find.text('Tasty and Healthy'), findsOneWidget);
      expect(find.text('Delicious meal'), findsOneWidget);
      expect(find.text('200'), findsOneWidget);
      expect(find.text('50g'), findsOneWidget);
      expect(find.text('2'), findsOneWidget);
      expect(find.text('10g'), findsOneWidget);
      expect(find.text('5g'), findsOneWidget);
      expect(find.text('15 min'), findsOneWidget);
    });

    testWidgets('should handle null image gracefully',
        (WidgetTester tester) async {
      const receiptWithoutImage = Receipt(
        name: 'Soup',
        headline: 'Also Healthy',
        description: 'Another meal',
        calories: '250',
        carbos: '60g',
        difficulty: 3,
        fats: '15g',
        proteins: '10g',
        time: '20 min',
      );

      await tester.pumpWidget(const MaterialApp(
        home: ReceiptDetailPage(receipt: receiptWithoutImage),
      ));

      // Wait for any pending asynchronous tasks to complete
      await tester.pumpAndSettle();

      // Check if the app bar title is displayed
      // Check if the receipt details are displayed
      expect(find.text('Soup'), findsAtLeast(2));

      expect(find.text('Also Healthy'), findsOneWidget);
      expect(find.text('Another meal'), findsOneWidget);
      expect(find.text('250'), findsOneWidget);
      expect(find.text('60g'), findsOneWidget);
      expect(find.text('3'), findsOneWidget);
      expect(find.text('15g'), findsOneWidget);
      expect(find.text('10g'), findsOneWidget);
      expect(find.text('20 min'), findsOneWidget);
    });
  });
}
