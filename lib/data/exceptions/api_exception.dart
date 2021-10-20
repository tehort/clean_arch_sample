import 'package:dio/dio.dart';

import '../../domain/core/app_exception.dart';

class ApiException extends AppException {
  ApiException(message) : super(message);

  factory ApiException.fromDioError(DioError e) {
    switch (e.type) {
      case DioErrorType.connectTimeout:
        return ApiException('connectTimeout');
      case DioErrorType.sendTimeout:
        return ApiException('sendTimeout');
      case DioErrorType.receiveTimeout:
        return ApiException('receiveTimeout');
      case DioErrorType.response:
        return ApiException(e.response?.data['message'] ?? 'API Error');
      case DioErrorType.cancel:
        return ApiException('cancel');
      case DioErrorType.other:
        return ApiException('other');
      default:
        return ApiException.unknown();
    }
  }

  factory ApiException.unknown() => ApiException('An unknown exception occurred.');

  factory ApiException.unexpected() => ApiException('An unexpected exception occurred.');
}
