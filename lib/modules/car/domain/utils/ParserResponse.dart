import 'dart:convert';

import 'package:greenwave_app/modules/car/domain/errors/errors.dart';
import 'package:http/http.dart';

abstract class ParserResponse {
  static doParserResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        Map data = jsonDecode(response.body);
        return data;
      case 401:
        print("deu 401 ruim");
        throw DataSourceError();
      case 400:
        throw DataSourceError(message: 'Parâmetros Inválidos');
      case 500:
        print("deu 500 ruim");
        throw DataSourceError(message: 'Falha ao realizar a chamada!');
      default:
        throw DataSourceError();
    }
  }
}
