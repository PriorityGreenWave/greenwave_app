import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';

abstract class RegisterState {}

class RegisterStart implements RegisterState {}

class RegisterLoading implements RegisterState {}

class RegisterError implements RegisterState {
  final FailureAuthenticate error;

  RegisterError(this.error);
}

class RegisterSuccess implements RegisterState {}
