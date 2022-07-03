import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes/core/api/api_consumer.dart';
import 'package:quotes/core/api/api_interceptor.dart';
import 'package:quotes/core/api/end_points.dart';
import 'package:quotes/core/api/status_code.dart';
import 'package:quotes/core/error/exceptions.dart';
import 'package:quotes/injection_container.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient? client) {
      client?.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) => status! < StatusCode.internalServerError;

    client.interceptors.add(instance<AppInterceptor>());
    if (kDebugMode) {
      client.interceptors.add(instance<LogInterceptor>());
    }
  }

  @override
  Future get({required String path, Map<String, dynamic>? queryParams}) async {
    try {
      final response = await client.get(path, queryParameters: queryParams);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleDioError(error);
    }
  }

  @override
  Future post(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams) async {
    final response =
        await client.post(path, data: body, queryParameters: queryParams);
    return jsonDecode(response.data.toString());
  }

  @override
  Future put(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? queryParams) async {
    final response =
        await client.post(path, data: body, queryParameters: queryParams);
    return jsonDecode(response.data.toString());
  }

  void _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case StatusCode.bad:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
          default:
            throw const FetchDataException();
        }
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw const NoInternetConnectionException();
    }
  }
}
