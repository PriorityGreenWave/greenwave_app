abstract class MqttDatasource {
  Future<void> sendMessageToTopic(String message, Function refreshCarTraffic);
  Future<void> initMqttClient(
      Future<void> Function() doRefreshCarOccurencyList);
}
