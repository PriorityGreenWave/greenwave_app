import 'dart:convert';

import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';
import 'package:greenwave_app/modules/car/domain/utils/ParserResponse.dart';
import 'package:greenwave_app/modules/car/infra/datasources/car_datasource.dart';
import 'package:greenwave_app/modules/config/environment.dart';
import 'package:http/http.dart';

class CarDatasourceImpl implements CarDatasource {
  final Client client;
  static const String _CAR_URI = Environment.URL + 'Veiculo';

  CarDatasourceImpl(this.client);

  @override
  Future<void> doRegisterCar(CarInput input) async {
    final body = jsonEncode({
      'idUsuario': input.idUsuario,
      'placa': input.placa,
      'rfid': input.rfid,
      'fabricante': input.fabricante,
      'modelo': input.modelo,
      'ano': input.ano,
      'tipoVeiculo': input.tipoVeiculo,
      'veiculoEmergencia': input.veiculoEmergencia,
      'estadoEmergencia': input.estadoEmergencia,
    });
    final response = await client.post(_CAR_URI + "/CreateVeiculo",
        body: body,
        headers: {"Accept": "*/*", "content-type": "application/json"});

    return ParserResponse.doParserResponse(response);
  }
}
