import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/car/domain/entities/CarEntity.dart';
import 'package:greenwave_app/modules/car/domain/repositories/car_repository.dart';

abstract class GetUserCars {
  Future<List<CarEntity>> call(User user);
}

class GetUserCarsImpl implements GetUserCars {
  final CarRepository repository;

  GetUserCarsImpl(this.repository);

  @override
  Future<List<CarEntity>> call(User user) async {
    return await repository.getUserCars(user);
  }
}
