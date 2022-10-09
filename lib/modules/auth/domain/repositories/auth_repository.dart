import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/register_input.dart';

abstract class AuthRepository {
  Future<Either<FailureAuthenticate, UserAuthenticaded>> login(
      String email, String password);
  Future<Either<FailureAuthenticate, void>> registerUser(RegisterInput input);
}
