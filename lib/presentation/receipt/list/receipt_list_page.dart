import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/receipt/list/view/receipt_list.dart';

class ReceiptListPage extends StatelessWidget {
  const ReceiptListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Receipts"),
      ),
      body: const ReceiptList(),
    );
  }
}
