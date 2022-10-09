import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/infra/datasources/secure_storage_datasource.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SecureStorageDatasourceImpl implements SecureStorageDatasource {
  static const _KEY_TOKEN = "Bearer_JWT_token";
  static const _KEY_USER = "User_Authenticaded";

  final storage = new FlutterSecureStorage();
  final tokenValidate = new JwtDecoder();

  SecureStorageDatasourceImpl();

  @override
  Future<String> getTokenOfStorage() async {
    try {
      return await storage.read(key: _KEY_TOKEN);
    } catch (e) {
      throw GetTokenError();
    }
  }

  @override
  Future<void> storeUserAuthenticadedOnStorage(UserAuthenticaded user) async {
    try {
      var stringUser = jsonEncode(user);
      await storage.write(key: _KEY_TOKEN, value: user.token);
      await storage.write(key: _KEY_USER, value: stringUser);
    } catch (e) {
      throw StorageTokenError();
    }
  }

  @override
  Future<bool> tokenIsValid() async {
    try {
      final token = await getTokenOfStorage();
      final result = JwtDecoder.isExpired(token);
      return result;
    } catch (e) {
      throw InvalidTokenError();
    }
  }
}
