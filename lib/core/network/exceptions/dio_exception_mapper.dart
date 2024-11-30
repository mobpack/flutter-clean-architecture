// lib/core/network/exceptions/dio_exception_mapper.dart
import 'package:dio/dio.dart';
import 'package:flutter_clean_architecture/core/errors/custom_exception.dart';

class DioExceptionMapper {
  static Exception map(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkException('Connection Timeout');
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 500) {
          return ServerException('Internal Server Error');
        }
        return ServerException(
          'Received invalid status code: ${error.response?.statusCode}',
        );
      case DioExceptionType.cancel:
        return NetworkException('Request to API server was cancelled');
      case DioExceptionType.unknown:
        return NetworkException(
          'Connection to API server failed due to internet connection',
        );
      default:
        return Exception('Unexpected error occurred');
    }
  }
}
