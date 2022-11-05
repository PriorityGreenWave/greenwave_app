import 'package:greenwave_app/modules/auth/domain/entities/user.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';

abstract class SecureStorageDatasource {
  Future<void> storeUserAuthenticadedOnStorage(UserAuthenticaded user);
  Future<User> getLoggedUser();
  Future<String> getTokenOfStorage();
  Future<bool> tokenIsValid();
}
