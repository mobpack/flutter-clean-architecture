import 'package:flutter_clean_architecture/features/receipt/domain/entity/receipt.dart';

abstract class ReceiptRepository {
  Future<List<Receipt>> getReceipts();
}
