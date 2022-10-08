import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';

abstract class LoginState {}

class LoginSuccess implements LoginState {
  final UserAuthenticaded authUser;

  LoginSuccess({this.authUser});
}

class LoginStart implements LoginState {
  const LoginStart();
}

class LoginLoading implements LoginState {
  const LoginLoading();
}

class LoginError implements LoginState {
  final FailureAuthenticate error;

  LoginError(this.error);
}

class Authenticaded implements LoginState {}

class NotAuthenticaded implements LoginState {}
