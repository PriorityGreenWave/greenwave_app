import 'package:greenwave_app/modules/dashboard/domain/repositories/mqtt_repository.dart';

abstract class InitMqttClient {
  Future<void> call(Future<void> Function() doRefreshCarOccurencyList);
}

class InitMqttClientImpl implements InitMqttClient {
  final MqttRepository repository;

  InitMqttClientImpl(this.repository);

  @override
  Future<void> call(Future<void> Function() doRefreshCarOccurencyList) async {
    await repository.initMqttClient(doRefreshCarOccurencyList);
  }
}
