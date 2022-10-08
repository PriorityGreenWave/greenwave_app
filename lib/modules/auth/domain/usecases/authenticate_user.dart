import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/login_input.dart';
import 'package:greenwave_app/modules/auth/domain/repositories/auth_repository.dart';

abstract class AuthenticateUser {
  Future<Either<FailureAuthenticate, UserAuthenticaded>> call(LoginInput input);
}

class AuthenticateUserImpl implements AuthenticateUser {
  final AuthRepository repository;

  AuthenticateUserImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, UserAuthenticaded>> call(
      LoginInput input) async {
    if (validateInput(input)) {
      return Left(InvalidFieldsError());
    }
    return repository.login(input.email, input.password);
  }

  bool validateInput(LoginInput input) {
    if (input.email == null ||
        input.email == '' ||
        input.password == null ||
        input.password == '') {
      return true;
    }
    return false;
  }
}
