import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/auth/domain/repositories/secure_storage_repository.dart';

abstract class GetLoggedUser {
  Future<User> call();
}

class GetLoggedUserImpl implements GetLoggedUser {
  final SecureStorageRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<User> call() async {
    final userAuthenticaded = await repository.getLoggedUser();
    return userAuthenticaded;
  }
}
