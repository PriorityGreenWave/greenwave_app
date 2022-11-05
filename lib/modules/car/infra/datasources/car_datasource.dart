import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/car/domain/entities/CarEntity.dart';
import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';

abstract class CarDatasource {
  Future<void> doRegisterCar(CarInput input);
  Future<List<CarEntity>> doGetUserCars(User user);
}
