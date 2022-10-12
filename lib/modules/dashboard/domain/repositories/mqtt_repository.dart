abstract class MqttRepository {
  Future<void> sendMessageToTopic(String message);
  Future<void> initMqttClient();
}
