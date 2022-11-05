import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';
import 'package:greenwave_app/modules/car/domain/repositories/car_repository.dart';

abstract class RegisterCarUsecase {
  Future<void> call(CarInput input);
}

class RegisterCarUsecaseImpl implements RegisterCarUsecase {
  final CarRepository carRepository;

  RegisterCarUsecaseImpl(this.carRepository);

  @override
  Future<void> call(CarInput input) async {
    return await carRepository.doRegisterCar(input);
  }
}
