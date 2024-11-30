// lib/core/network/interceptors/error_interceptor.dart
import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle specific error scenarios or log them
    super.onError(err, handler);
  }
}
