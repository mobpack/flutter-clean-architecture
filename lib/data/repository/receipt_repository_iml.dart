import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/dto/receipt_dto.dart';
import 'package:flutter_clean_architecture/data/provider/network/apis/receipt_api.dart';
import 'package:flutter_clean_architecture/domain/entity/receipt.dart';
import 'package:flutter_clean_architecture/domain/repository/receipt_repository.dart';

class ReceiptRepositoryIml extends ReceiptRepository {
  final ReceiptAPI _api;

  ReceiptRepositoryIml({required ReceiptAPI api}) : _api = api;

  @override
  Future<List<Receipt>> getReceipts() async {
    try {
      final response = await _api.getAllReceipts();
      return (response.data as List)
          .map((e) => ReceiptDTO.fromJson(e))
          .toList();
    } on DioException catch (e) {
      throw e.error.toString();
    } catch (e) {
      rethrow;
    }
  }
}
