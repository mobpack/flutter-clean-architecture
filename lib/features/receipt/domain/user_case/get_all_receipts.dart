import 'package:flutter_clean_architecture/features/receipt/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/features/receipt/domain/repository/receipt_repository.dart';

class GetAllReceipts {
  final ReceiptRepository _receiptRepository;

  GetAllReceipts({required ReceiptRepository receiptRepository})
      : _receiptRepository = receiptRepository;

  Future<List<Receipt>> call() async {
    return await _receiptRepository.getReceipts();
  }
}
