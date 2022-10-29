import 'package:greenwave_app/modules/dashboard/domain/usecases/init_mqtt_client.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/list_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/presenter/dashboard/states/state.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final InitMqttClient initMqttClientUsecase;
  final ListCarOccurency listCarOccurencyUsecase;

  _DashboardControllerBase(
      {this.initMqttClientUsecase, this.listCarOccurencyUsecase}) {
    initMqttClientUsecase(doListCarOccurency);
  }

  @observable
  DashboardState state = DashboardStart();

  Future<void> doListCarOccurency() async {
    final carOccurencyList = await listCarOccurencyUsecase();

    setState(DashboardTrafficOccurency(carOccurencyList));
  }

  @action
  setState(DashboardState value) => state = value;
}
