import 'package:dio/dio.dart';

import '../exceptions/api_exception.dart';

abstract class IRestClient {
  Future<Response<T>> get<T>(String path, {Map<String, dynamic>? queryParameters, Options? options});
  Future<Response<T>> post<T>(String path, {data, Map<String, dynamic>? queryParameters, Options? options});
  Future<Response<T>> put<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options});
  Future<Response<T>> delete<T>(String path, {dynamic data, Map<String, dynamic>? queryParameters, Options? options});

  // Future<void> addAuthInterceptor();
  // Future<void> removeAuthInterceptor();
}

class RestClient extends IRestClient {
  RestClient({required baseApiUrl}) {
    _dio = Dio(BaseOptions(baseUrl: baseApiUrl));
  }

  late final Dio _dio;

  @override
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<Response<T>> post<T>(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<Response<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  @override
  Future<Response<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      return await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
    } on DioError catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // @override
  // Future<void> addAuthInterceptor() async {
  //   _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
  //     _dio.interceptors.requestLock.lock();
  //     _getApiKey().then((value) {
  //       options.headers['token'] = value;
  //       handler.next(options);
  //     }).whenComplete(() {
  //       _dio.interceptors.requestLock.unlock();
  //     });
  //   }));
  // }

  // @override
  // Future<void> removeAuthInterceptor() async {
  //   _dio.interceptors.clear();
  // }

  // Future<String?> _getApiKey() async {
  //   Token? apiKey = await _localStorageDataSource.read<Token>(fromJsonCallback: Token.fromJsonCallback);
  //   return apiKey?.value;
  // }
}
