// lib/core/network/dio_client.dart
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/network/api_endpoint.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/error_interceptor.dart';
import 'interceptors/token_interceptor.dart';

class DioClient {
  static Dio create() {
    final dio = Dio(
      BaseOptions(
        baseUrl: APIEndpoint.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    dio.interceptors.addAll([
      LoggingInterceptor(),
      ErrorInterceptor(),
      TokenInterceptor(),
    ]);

    return dio;
  }
}
