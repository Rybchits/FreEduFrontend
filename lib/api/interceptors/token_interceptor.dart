import 'package:dio/dio.dart';
import 'package:freedu_frontend/utils/token_storage.dart';

class TokenInterceptor extends Interceptor {
  TokenInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var accessToken = await TokenStorage.getAccessToken();

    if (accessToken != null) { options.headers['Authorization'] = 'Bearer $accessToken'; }

    return handler.next(options);
  }
}