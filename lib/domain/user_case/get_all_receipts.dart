import 'package:flutter_clean_architecture/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/domain/repository/receipt_repository.dart';

class GetAllReceipts {
  final ReceiptRepository _receiptRepository;

  GetAllReceipts({required ReceiptRepository receiptRepository})
      : _receiptRepository = receiptRepository;

  Future<List<Receipt>> call() async {
    return await _receiptRepository.getReceipts();
  }
}
