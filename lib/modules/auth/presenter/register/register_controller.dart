import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/register_input.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/register_user.dart';
import 'package:greenwave_app/modules/auth/presenter/register/states/states.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterUser registerUserUsecase;

  _RegisterControllerBase({this.registerUserUsecase});

  @observable
  RegisterState state = RegisterStart();

  doRegisterUser(RegisterInput input) async {
    setState(RegisterLoading());
    await registerUserUsecase(input);
    Modular.to.pushNamed('/');
  }

  @action
  setState(RegisterState value) => state = value;
}
