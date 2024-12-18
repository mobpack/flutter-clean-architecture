import 'package:flutter_clean_architecture/features/receipt/data/provider/network/apis/receipt_api.dart';
import 'package:flutter_clean_architecture/features/receipt/data/repository/receipt_repository_iml.dart';
import 'package:flutter_clean_architecture/features/receipt/domain/repository/receipt_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  final receiptApi = getIt.registerSingleton<ReceiptApi>(ReceiptApiImpl());

  getIt.registerLazySingleton<ReceiptRepository>(
    () => ReceiptRepositoryImpl(api: receiptApi),
  );
}
