import 'dart:typed_data';

import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';

class MqttDatasourceImpl {
  MqttServerClient mqttClient;
  final String AREA_1_LAST_TAG_READ_TOPIC =
      'Area_1/catadioptrico_1/lastTagRead';

  MqttDatasourceImpl() {
    mqttClient = new MqttServerClient.withPort('mqtt.tago.io', 'esp32', 1883);
  }

  Future<void> connect() async {
    mqttClient.logging(on: true);
    mqttClient.onConnected = onConnected;
    mqttClient.onDisconnected = onDisconnected;
    mqttClient.onUnsubscribed = onUnsubscribed;
    mqttClient.onSubscribed = onSubscribed;
    mqttClient.onSubscribeFail = onSubscribeFail;
    mqttClient.pongCallback = pong;

    final connMessage = MqttConnectMessage()
        .authenticateAs('esp32', 'e8e008b2-edba-4954-bd58-6111f26c8d41')
        // .withClientIdentifier("greenwave-app")
        .keepAliveFor(60)
        .withWillTopic('Area_1/devices')
        .withWillMessage('1')
        .startClean()
        .withWillQos(MqttQos.atLeastOnce);

    mqttClient.connectionMessage = connMessage;

    try {
      await mqttClient.connect();
      mqttClient.subscribe(AREA_1_LAST_TAG_READ_TOPIC, MqttQos.atLeastOnce);
    } catch (e) {
      print('Exception: $e');
      mqttClient.disconnect();
    }

    mqttClient.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage message = c[0].payload;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      print('Received message:$payload from topic: ${c[0].topic}>');
    });

    return mqttClient;
  }

  Future<void> sendMessageToTopic() async {
    await connect();
    final String str = "ahhhhhhhhhhhhhhhhhhhhh";
    final List<int> codeUnits = str.codeUnits;
    final Uint8List unit8List = Uint8List.fromList(codeUnits);
    final Uint8Buffer dataBuffer = Uint8Buffer();
    dataBuffer.addAll(unit8List);

    mqttClient.publishMessage(
        AREA_1_LAST_TAG_READ_TOPIC, MqttQos.atLeastOnce, dataBuffer,
        retain: true);
  }

  // connection succeeded
  void onConnected() {
    print(
        'Connected AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
  }

// unconnected
  void onDisconnected() {
    print('Disconnected');
  }

// subscribe to topic succeeded
  void onSubscribed(String topic) {
    print('Subscribed topic: $topic');
  }

// subscribe to topic failed
  void onSubscribeFail(String topic) {
    print('Failed to subscribe $topic');
  }

// unsubscribe succeeded
  void onUnsubscribed(String topic) {
    print('Unsubscribed topic: $topic');
  }

// PING response received
  void pong() {
    print('Ping response client callback invoked');
  }
}
