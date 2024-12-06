import 'package:flutter_clean_architecture/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/domain/repository/receipt_repository.dart';
import 'package:flutter_clean_architecture/domain/user_case/get_all_receipts.dart';
import 'package:flutter_clean_architecture/setup.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'provider.g.dart';

@riverpod
Future<List<Receipt>> receiptList(ReceiptListRef ref) async {
  return GetAllReceipts(receiptRepository: getIt<ReceiptRepository>()).call();
}
