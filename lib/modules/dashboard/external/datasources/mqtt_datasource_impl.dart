import 'dart:typed_data';

import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/infra/datasources/mqtt_datasource.dart';
import 'package:greenwave_app/modules/dashboard/infra/datasources/sqlite_datasources.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:typed_data/typed_buffers.dart';

class MqttDatasourceImpl implements MqttDatasource {
  MqttServerClient mqttClient;
  final SqliteDatasource sqliteDatasource;
  final String AREA_1_LAST_TAG_READ_TOPIC =
      'Area_1/catadioptrico_1/lastTagRead';

  MqttDatasourceImpl(this.sqliteDatasource) {
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

    mqttClient.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) async {
      final MqttPublishMessage message = c[0].payload;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);

      final CarOccurencyInput carOccurencyInput =
          new CarOccurencyInput(tag: payload, datetime: DateTime(2022));

      await sqliteDatasource.createCarOccurency(carOccurencyInput);

      print('Received message:$payload from topic: ${c[0].topic}>');
    });

    return mqttClient;
  }

  @override
  Future<void> initMqttClient() async {
    await connect();
  }

  @override
  Future<void> sendMessageToTopic(String message) async {
    await connect();

    final List<int> codeUnits = message.codeUnits;
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
