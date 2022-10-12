import 'package:greenwave_app/modules/dashboard/domain/repositories/mqtt_repository.dart';

abstract class SendTopicMessage {
  Future<void> call(String message);
}

class SendTopicMessageImpl implements SendTopicMessage {
  final MqttRepository repository;

  SendTopicMessageImpl(this.repository);

  @override
  Future<void> call(String message) async {
    await repository.sendMessageToTopic(message);
  }
}
