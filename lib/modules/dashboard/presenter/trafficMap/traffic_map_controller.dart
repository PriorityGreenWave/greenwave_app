import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/create_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/list_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/presenter/trafficMap/states/states.dart';
import 'package:mobx/mobx.dart';

part 'traffic_map_controller.g.dart';

class TrafficMapController = _TrafficMapControllerBase
    with _$TrafficMapController;

abstract class _TrafficMapControllerBase with Store {
  final ListCarOccurency listCarOccurencyUsecase;
  final CreateCarOccurency createCarOccurencyUsecase;

  _TrafficMapControllerBase(
      {this.listCarOccurencyUsecase, this.createCarOccurencyUsecase});

  @observable
  TrafficMapState state = TrafficMapStart();

  Future<void> doCreateCarOccurency(CarOccurencyInput input) async {
    setState(TrafficMapLoading());
    await createCarOccurencyUsecase(input);
    await doListCarOccurency();
    //Modular.to.pushNamed('/');
  }

  Future<void> doListCarOccurency() async {
    final carOccurencyList = await listCarOccurencyUsecase();

    setState(RefreshTrafficOccurency(carOccurencyList));
  }

  @action
  setState(TrafficMapState value) => state = value;
}
