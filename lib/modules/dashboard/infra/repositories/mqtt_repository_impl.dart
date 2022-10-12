import 'package:greenwave_app/modules/dashboard/domain/repositories/mqtt_repository.dart';
import 'package:greenwave_app/modules/dashboard/infra/datasources/mqtt_datasource.dart';

class MqttRepositoryImpl implements MqttRepository {
  final MqttDatasource datasource;

  MqttRepositoryImpl(this.datasource);

  @override
  Future<void> sendMessageToTopic(String message) async {
    await datasource.sendMessageToTopic(message);
  }

  @override
  Future<void> initMqttClient() async {
    await datasource.initMqttClient();
  }
}
