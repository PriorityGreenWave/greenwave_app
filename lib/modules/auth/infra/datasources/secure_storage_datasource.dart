import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';

abstract class SecureStorageDatasource {
  Future<void> storeUserAuthenticadedOnStorage(UserAuthenticaded user);
  Future<String> getTokenOfStorage();
  Future<bool> tokenIsValid();
}
