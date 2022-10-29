import 'package:greenwave_app/modules/dashboard/domain/repositories/mqtt_repository.dart';
import 'package:greenwave_app/modules/dashboard/infra/datasources/mqtt_datasource.dart';

class MqttRepositoryImpl implements MqttRepository {
  final MqttDatasource datasource;

  MqttRepositoryImpl(this.datasource);

  @override
  Future<void> sendMessageToTopic(
      String message, Function refreshCarTraffic) async {
    await datasource.sendMessageToTopic(message, refreshCarTraffic);
  }

  @override
  Future<void> initMqttClient(
      Future<void> Function() doRefreshCarOccurencyList) async {
    await datasource.initMqttClient(doRefreshCarOccurencyList);
  }
}
