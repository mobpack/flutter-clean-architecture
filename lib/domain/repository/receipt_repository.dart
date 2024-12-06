import 'package:flutter_clean_architecture/domain/entity/receipt.dart';

abstract class ReceiptRepository {
  Future<List<Receipt>> getReceipts();
}
