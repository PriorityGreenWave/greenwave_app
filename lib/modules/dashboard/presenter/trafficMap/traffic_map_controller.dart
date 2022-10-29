import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/create_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/init_mqtt_client.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/list_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/send_topic_message.dart';
import 'package:greenwave_app/modules/dashboard/presenter/trafficMap/states/states.dart';
import 'package:mobx/mobx.dart';

part 'traffic_map_controller.g.dart';

class TrafficMapController = _TrafficMapControllerBase
    with _$TrafficMapController;

abstract class _TrafficMapControllerBase with Store {
  final ListCarOccurency listCarOccurencyUsecase;
  final CreateCarOccurency createCarOccurencyUsecase;
  final SendTopicMessage sendTopicMessageUsecase;
  final InitMqttClient initMqttClientUsecase;

  _TrafficMapControllerBase(
      {this.listCarOccurencyUsecase,
      this.createCarOccurencyUsecase,
      this.sendTopicMessageUsecase,
      this.initMqttClientUsecase}) {
    initMqttClientUsecase(doListCarOccurency);
  }

  @observable
  TrafficMapState state = TrafficMapStart();

  Future<void> doCreateCarOccurency(CarOccurencyInput input) async {
    // setState(TrafficMapLoading());
    await sendTopicMessageUsecase('Carro detectado', doTeste);
    //await createCarOccurencyUsecase(input);
    //await doListCarOccurency();
    //Modular.to.pushNamed('/');
  }

  doTeste() {
    print('XXXXXXXXXXXXXXXXXXXXXX');
  }

  Future<void> doListCarOccurency() async {
    final carOccurencyList = await listCarOccurencyUsecase();

    setState(RefreshTrafficOccurency(carOccurencyList));
  }

  @action
  setState(TrafficMapState value) => state = value;
}
