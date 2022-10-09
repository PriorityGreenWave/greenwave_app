import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/register_input.dart';

abstract class AuthDataSource {
  Future<UserAuthenticaded> doAuthenticateUser(String email, String password);
  Future<void> doRegisterUser(RegisterInput input);
}
