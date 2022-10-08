import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';

abstract class AuthRepository {
  Future<Either<FailureAuthenticate, UserAuthenticaded>> login(
      String email, String password);
}
