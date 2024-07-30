import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/presentation/receipt/list/view/receipt_list.dart';

class ReceiptDetailPage extends StatelessWidget {
  static const _gap = SizedBox(height: 8);

  const ReceiptDetailPage({super.key, required this.receipt});

  final Receipt receipt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(receipt.name ?? 'Detail'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            if (receipt.image != null)
              SizedBox(
                height: 200,
                child: CachedImage(
                  url: receipt.image!,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(receipt.name ?? '',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Text(
                    receipt.headline ?? '',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                  _gap,
                  Text(receipt.description ?? '',
                      style: Theme.of(context).textTheme.bodyMedium),
                  _gap,
                  Table(
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(2),
                    },
                    children: [
                      _buildTableRow(
                          context, "Categories", "${receipt.calories}"),
                      _buildTableRow(context, "Carbos", "${receipt.carbos}"),
                      _buildTableRow(
                          context, "Difficulty", "${receipt.difficulty}"),
                      _buildTableRow(context, "Fats", "${receipt.fats}"),
                      _buildTableRow(
                          context, "Proteins", "${receipt.proteins}"),
                      _buildTableRow(context, "Time", "${receipt.time}"),
                    ],
                  ),
                  _gap,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildTableRow(BuildContext context, String title, String value) {
    return TableRow(
      children: [
        Text(title, style: Theme.of(context).textTheme.bodyLarge),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
