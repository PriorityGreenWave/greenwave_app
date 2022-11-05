import 'package:greenwave_app/modules/car/domain/entities/CarEntity.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';
import 'package:greenwave_app/modules/car/domain/repositories/car_repository.dart';
import 'package:greenwave_app/modules/car/infra/datasources/car_datasource.dart';

class CarRepositoryImpl implements CarRepository {
  final CarDatasource carDatasource;

  CarRepositoryImpl(this.carDatasource);

  @override
  Future<void> doRegisterCar(CarInput input) async {
    return await carDatasource.doRegisterCar(input);
  }

  @override
  Future<List<CarEntity>> getUserCars(User user) async {
    return await carDatasource.doGetUserCars(user);
  }
}
