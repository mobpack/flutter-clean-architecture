import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/data/provider/network/api.dart';
import 'package:flutter_clean_architecture/data/provider/network/api_endpoint.dart';
import 'package:flutter_clean_architecture/data/provider/network/api_request_representation.dart';

abstract class ReceiptAPI {
  Future<Response> getAllReceipts();
}

class ReceiptAPIImpl implements ReceiptAPI {
  final APIProvider _apiProvider = APIProvider();

  @override
  Future<Response> getAllReceipts() {
    return _apiProvider.request(
      (APIRequestRepresentable(url: APIEndpoint.recipes)),
    );
  }
}
