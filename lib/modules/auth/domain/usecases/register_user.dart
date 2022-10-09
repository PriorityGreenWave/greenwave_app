import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/register_input.dart';
import 'package:greenwave_app/modules/auth/domain/repositories/auth_repository.dart';

abstract class RegisterUser {
  Future<Either<FailureAuthenticate, void>> call(RegisterInput input);
}

class RegisterUserImpl implements RegisterUser {
  final AuthRepository repository;

  RegisterUserImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, void>> call(RegisterInput input) async {
    if (_validateInput(input)) {
      throw Left(InvalidFieldsError());
    }
    await repository.registerUser(input);
  }

  bool _validateInput(RegisterInput input) {
    if (input.name.isEmpty ||
        input.name == null ||
        input.email == null ||
        input.email.isEmpty ||
        input.password == null ||
        input.password.isEmpty ||
        input.cpf.isEmpty ||
        input.cpf == null ||
        input.phone.isEmpty ||
        input.phone == null) {
      return true;
    }
    return false;
  }
}
