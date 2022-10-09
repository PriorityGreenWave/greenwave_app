import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/domain/repositories/secure_storage_repository.dart';

abstract class StoreAuthenticadedUser {
  Future<Either<FailureAuthenticate, void>> call(UserAuthenticaded user);
}

class StoreAuthenticadedUserImpl implements StoreAuthenticadedUser {
  final SecureStorageRepository repository;

  StoreAuthenticadedUserImpl(this.repository);

  @override
  Future<Either<FailureAuthenticate, void>> call(UserAuthenticaded user) async {
    if (validateInput(user.token)) {
      return Left(InvalidTokenError());
    }
    return repository.storeUserAuthenticaded(user);
  }

  bool validateInput(String token) {
    if (token == null || token == '') {
      return true;
    }
    return false;
  }
}
