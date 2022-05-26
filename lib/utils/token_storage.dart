import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const String _key = "jwt";
  static const _storage = FlutterSecureStorage();

  static Future<String?> getAccessToken() async{
    return _storage.read(key: _key);
  }

  static Future<void> persistAccessToken(String token) async{
    _storage.write(key: _key, value: token);
  }

  static Future<void> deleteAccessToken() async{
    _storage.delete(key: _key);
  }
}