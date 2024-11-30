// lib/core/network/interceptors/token_interceptor.dart
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add your token logic here
    // For example:
    // options.headers["Authorization"] = "Bearer YOUR_TOKEN";
    return super.onRequest(options, handler);
  }
}
