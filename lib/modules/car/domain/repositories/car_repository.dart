import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/car/domain/entities/CarEntity.dart';
import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';

abstract class CarRepository {
  Future<void> doRegisterCar(CarInput input);
  Future<List<CarEntity>> getUserCars(User user);
}
