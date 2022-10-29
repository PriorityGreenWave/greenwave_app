abstract class MqttRepository {
  Future<void> sendMessageToTopic(String message, Function refreshCarTraffic);
  Future<void> initMqttClient(
      Future<void> Function() doRefreshCarOccurencyList);
}
