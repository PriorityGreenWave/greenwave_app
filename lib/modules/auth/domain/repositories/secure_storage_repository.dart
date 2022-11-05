import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';

abstract class SecureStorageRepository {
  Future<Either<FailureAuthenticate, void>> storeUserAuthenticaded(
      UserAuthenticaded user);
  Future<User> getLoggedUser();
}
