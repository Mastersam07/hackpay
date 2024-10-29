// ignore_for_file: only_throw_errors

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import '../app_data/api_request.dart';
import '../app_data/exceptions.dart';
import 'network_api_service.dart';

class DioNetworkService extends NetworkApiService {
  final Dio _dio;

  DioNetworkService({
    Dio? dio,
  }) : _dio = dio ?? Dio();

  @override
  Future<Map<String, dynamic>> sendFormData<T>(
      {required ApiRequest request}) async {
    final data = FormData.fromMap(
      request.body.map(
        (key, value) {
          if (value is File) {
            return MapEntry(key, MultipartFile.fromFileSync(value.path));
          } else {
            return MapEntry(key, value);
          }
        },
      ),
    );
    try {
      final response = await _dio.request(
        request.endpoint,
        data: data,
        queryParameters: request.queryParams,
        options: Options(
          method: request.method,
          contentType: 'Multipart/form-data',
        ),
      );
      final res = response.data;

      return res;
    } on DioException catch (e) {
      if (e.error != null) {
        throw e.error!;
      } else {
        throw Exception('An unknown error occurred');
      }
    }
  }

  @override
  Future<Map<String, dynamic>> sendJson<T>(
      {required ApiRequest request}) async {
    try {
      final response = await _dio.request(
        request.endpoint,
        data: request.body,
        queryParameters: request.queryParams,
        options: Options(
          method: request.method,
          contentType: 'Application/json',
          responseType: ResponseType.json,
        ),
      );
      final res = response.data;
      if (res is! Map) {
        return {'data': res};
      }
      return res as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.error != null) {
        throw e.error!;
      } else {
        throw Exception('An unknown error occurred');
      }
    }
  }
}

class DataErrorInterceptor extends Interceptor {
  DataErrorInterceptor();

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.type == DioExceptionType.unknown &&
        err.error != null &&
        err.error is SocketException) {
      handler.next(err);
      throw NetworkException();
    } else if (_isTimeoutError(err.type)) {
      handler.next(err);
      throw TimeoutException('Request Timed out. Try again');
    } else if ((err.response?.statusCode ?? 501) >= 500) {
      handler.next(err);
      throw ServerException(errorMessage: err.response?.data['message']);
      // } else if (err.response?.statusCode == 401) {
      //   handler.next(err);
      //   throw InputException(errorMessage: 'Session expired. Please Log in');
    } else if ((err.response?.statusCode ?? 501) == 422) {
      Map json;
      if (err.response!.data is Map) {
        json = err.response!.data;
      } else {
        json = jsonDecode(err.response!.data);
      }
      handler.next(err);
      throw InputException(
          errorMessage: json.containsKey('data')
              ? (json['data'] as Map).values.length > 1
                  ? 'An error occurred, try again!'
                  : (json['data'] as Map).values.first as String
              : json['message']);
    } else {
      Map json;
      if (err.response!.data is Map) {
        json = err.response!.data;
      } else {
        json = jsonDecode(err.response!.data);
      }
      handler.next(err);
      throw InputException(
          errorMessage: json.containsKey('data')
              ? (json['data'] as Map).values.length > 1
                  ? 'An error occurred, try again!'
                  : (json['data'] as Map).values.first as String
              : json['message'] ?? json['error']);
    }
  }

  bool _isTimeoutError(DioExceptionType type) {
    return type == DioExceptionType.sendTimeout ||
        type == DioExceptionType.connectionTimeout ||
        type == DioExceptionType.receiveTimeout;
  }
}
