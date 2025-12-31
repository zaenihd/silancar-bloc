import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:silancar_bloc/src/utils/app_messenger.dart';

class DioClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://silancar.nakertranskonut.go.id',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  // ======================
  // GET
  // ======================
  static Future<T?> get<T>(
    String path, {
    Map<String, dynamic>? query,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.get(path, queryParameters: query);
      log("$path \n $res");
      return fromJson(res.data);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // ======================
  // POST
  // ======================
  static Future<T?> post<T>(
    String path, {
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.post(path, data: body);
      log("$path $res");
      return fromJson(res.data);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // ======================
  // PUT
  // ======================
  static Future<T?> put<T>(
    String path, {
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.put(path, data: body);
      return fromJson(res.data);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // ======================
  // DELETE
  // ======================
  static Future<T?> delete<T>(
    String path, {
    dynamic body,
    required T Function(dynamic json) fromJson,
  }) async {
    try {
      final res = await _dio.delete(path, data: body);
      return fromJson(res.data);
    } catch (e) {
      _handleError(e);
      return null;
    }
  }

  // ======================
  // ERROR HANDLER
  // ======================
  static void _handleError(dynamic error) {
    if (error is DioException) {
      final message =
          error.response?.data?['message'] ??
          error.message ??
          'Terjadi kesalahan';

      AppMessenger.showError(message);
    } else {
      AppMessenger.showError('Unexpected error');
    }
  }

  // ======================
  // TOKEN
  // ======================
  static void setToken(String token) {
    _dio.options.headers['Authorization'] = 'Bearer $token';
  }

  static void clearToken() {
    _dio.options.headers.remove('Authorization');
  }
}
