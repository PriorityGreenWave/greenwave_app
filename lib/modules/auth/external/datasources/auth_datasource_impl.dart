import 'dart:convert';

import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/utils/parsed_response.dart';
import 'package:greenwave_app/modules/auth/infra/datasources/auth_datasource.dart';
import 'package:greenwave_app/modules/config/environment.dart';
import 'package:http/http.dart';

class AuthDatasourceImpl implements AuthDataSource {
  final Client client;
  static const String _USER_URI = Environment.URL + 'Usuario';

  AuthDatasourceImpl(this.client);

  @override
  Future<UserAuthenticaded> doAuthenticateUser(
      String email, String password) async {
    final body = jsonEncode({"login": email, "password": password});

    final response = await client.post(_USER_URI + "/LoginUsuario",
        body: body,
        headers: {"Accept": "*/*", "content-type": "application/json"});

    final data = ParserResponse.doParserResponse(response);
    return UserAuthenticaded.fromJson(data);
  }
}
