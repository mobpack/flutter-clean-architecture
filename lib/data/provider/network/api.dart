import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/data/provider/network/api_request_representation.dart';

class APIProvider {
  late Dio _dio;
  static final APIProvider _instance = APIProvider._internal();

  factory APIProvider() {
    return _instance;
  }

  APIProvider._internal() {
    _dio = Dio();
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        // adding token if needed
        return handler.next(options);
      },
    ));
  }

  Dio get instance => _dio;

  Future<Response> request(APIRequestRepresentable request) async {
    try {
      final response = await _dio.request(
        request.url,
        options:
            Options(method: request.method.string, headers: request.headers),
        queryParameters: request.query,
        data: request.body,
      );
      return response;
    } on TimeoutException catch (_) {
      throw DioException.sendTimeout(
          timeout: const Duration(seconds: 30),
          requestOptions: RequestOptions());
    } on SocketException {
      throw DioException.connectionError(
        requestOptions: RequestOptions(),
        reason: 'Network is not available',
      );
    } on DioException {
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
