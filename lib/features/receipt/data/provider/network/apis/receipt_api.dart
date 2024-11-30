import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/api_provider.dart';
import 'package:flutter_clean_architecture/core/network/api_endpoint.dart';
import 'package:flutter_clean_architecture/core/network/api_request_representation.dart';

abstract class ReceiptApi {
  Future<Response> getAllReceipts();
}

class ReceiptApiImpl implements ReceiptApi {
  final APIProvider _apiProvider = APIProvider();

  @override
  Future<Response> getAllReceipts() {
    return _apiProvider.request(
      (APIRequestRepresentable(url: APIEndpoint.recipes)),
    );
  }
}
