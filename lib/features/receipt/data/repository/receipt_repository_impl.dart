import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/features/receipt/data/dto/receipt_dto.dart';
import 'package:flutter_clean_architecture/features/receipt/data/provider/network/apis/receipt_api.dart';
import 'package:flutter_clean_architecture/features/receipt/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/features/receipt/domain/repository/receipt_repository.dart';

class ReceiptRepositoryImpl extends ReceiptRepository {
  final ReceiptApi _api;

  ReceiptRepositoryImpl({required ReceiptApi api}) : _api = api;

  @override
  Future<List<Receipt>> getReceipts() async {
    try {
      final response = await _api.getAllReceipts();
      return (response.data as List)
          .map((e) => ReceiptDTO.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw e.error.toString();
    } catch (e) {
      rethrow;
    }
  }
}
