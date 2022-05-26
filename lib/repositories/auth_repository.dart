import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:freedu_frontend/api/web_api.dart';
import 'package:freedu_frontend/models/user_class.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freedu_frontend/utils/token_storage.dart';
import 'package:freedu_frontend/utils/url.dart';

final authRepository = Provider<AuthRepositoryAPI>((ref) => AuthRepositoryAPI(ref.read));

abstract class AuthRepository {
  Future<void> login(String email, String password);

  Future<void> signUp(String name, String email, String password);

  Future<User> fetchAuthUser();
}

class AuthRepositoryAPI extends AuthRepository {
  final Reader read;

  AuthRepositoryAPI(this.read);

  @override
  Future<User> fetchAuthUser() async {
    try {
      final response = await Api().dio.get(Url.fetchAuthUser);
      return User.fromApi(response.data);
    } on DioError catch (error) { log(error.message); rethrow; }
  }

  @override
  Future<void> login(String email, String password) async {
    try {
      final jwt = await Api().dioForToken.post(Url.login, data: <String, String>{'email': email, 'password': password});
      await TokenStorage.persistAccessToken(jwt.toString());
    } on DioError catch (error) { log(error.message); }
  }

  @override
  Future<void> signUp(String name, String email, String password) async {
    try {
      await Api().dioForToken.post(Url.signUp, data: <String, String>{'name': name, 'email': email, 'password': password});
    } on DioError catch (error) { log(error.message); }
  }
}
