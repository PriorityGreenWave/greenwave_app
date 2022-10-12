abstract class MqttDatasource {
  Future<void> sendMessageToTopic(String message);
  Future<void> initMqttClient();
}
