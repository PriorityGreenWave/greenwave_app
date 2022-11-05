import 'package:greenwave_app/modules/car/domain/errors/errors.dart';

abstract class RegisterCarState {}

class RegisterCarStart implements RegisterCarState {}

class RegisterCarLoading implements RegisterCarState {}

class RegisterCarError implements RegisterCarState {
  final FailureCar error;

  RegisterCarError(this.error);
}

class RegisterCarSuccess implements RegisterCarState {}
