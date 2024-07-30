import 'package:flutter_clean_architecture/data/provider/network/apis/receipt_api.dart';
import 'package:flutter_clean_architecture/data/repository/receipt_repository_iml.dart';
import 'package:flutter_clean_architecture/domain/repository/receipt_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  final receiptApi = getIt.registerSingleton<ReceiptAPI>(ReceiptAPIImpl());

  getIt.registerLazySingleton<ReceiptRepository>(
      () => ReceiptRepositoryIml(api: receiptApi));
}
