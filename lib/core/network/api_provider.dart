import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/api_request_representation.dart';
import 'package:flutter_clean_architecture/core/network/dio_client.dart';
import 'package:flutter_clean_architecture/core/network/exceptions/dio_exception_mapper.dart';

class APIProvider {
  late Dio _dio;
  static final APIProvider _instance = APIProvider._internal();

  factory APIProvider() {
    return _instance;
  }

  APIProvider._internal() {
    _dio = DioClient.create();
  }

  Dio get instance => _dio;

  Future<Response> request(APIRequestRepresentable request) async {
    try {
      final response = await _dio.request(
        request.url,
        options: Options(method: request.method.string),
        data: request.body,
        queryParameters: request.query,
      );
      return response;
    } on DioException catch (e) {
      throw DioExceptionMapper.map(e);
    }
  }
}
