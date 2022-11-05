import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';

abstract class CarRepository {
  Future<void> doRegisterCar(CarInput input);
}
