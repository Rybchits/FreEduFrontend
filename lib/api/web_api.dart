import 'package:dio/adapter_browser.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:freedu_frontend/api/interceptors/error_interceptor.dart';
import 'package:freedu_frontend/api/interceptors/token_interceptor.dart';

class Api {
  late final Dio dio;
  late final Dio dioForToken;

  static final _singleton = Api._internal();
  factory Api() => _singleton;

  Api._internal() {
    dioForToken = _createDio();
    dio = _createDio();
    dio.interceptors.add(TokenInterceptor());
  }

  static final _baseOptions = BaseOptions(
    receiveTimeout: 15000, // 15 seconds
    connectTimeout: 15000,
    sendTimeout: 15000,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Credentials": true, // Required for cookies, authorization headers with HTTPS
      "Access-Control-Allow-Methods": "GET, POST, DELETE, OPTIONS"
    },
  );

  static Dio _createDio() {
    var dio = Dio(_baseOptions);

    if (kIsWeb) {
      var adapter = BrowserHttpClientAdapter();
      adapter.withCredentials = true;
      dio.httpClientAdapter = adapter;
    }

    dio.interceptors.add(ErrorInterceptors());
    return dio;
  }
}
