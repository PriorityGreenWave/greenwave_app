import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';

abstract class CarDatasource {
  Future<void> doRegisterCar(CarInput input);
}
