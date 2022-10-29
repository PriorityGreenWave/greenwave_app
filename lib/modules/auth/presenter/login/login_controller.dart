import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/login_input.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/store_authenticaded_user.dart';
import 'package:greenwave_app/modules/auth/presenter/login/states/login_state.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/init_mqtt_client.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final AuthenticateUser authenticateUserUsecase;
  final StoreAuthenticadedUser storeAuthenticadedUserUsecase;
  final InitMqttClient initMqttClient;

  @observable
  bool isAuthenticated;

  @observable
  LoginState state = new LoginStart();

  @observable
  UserAuthenticaded userAuthenticaded = new UserAuthenticaded();

  @observable
  String acessToken;

  _LoginControllerBase(
      {this.authenticateUserUsecase,
      this.storeAuthenticadedUserUsecase,
      this.initMqttClient}) {
    verifyIfUserAuthenticated();
  }

  @action
  Future doAuthenticateUser(LoginInput input) async {
    setState(LoginLoading());
    final result = await authenticateUserUsecase(input);

    result.fold((l) => setState(LoginError(l)), (r) {
      doStoreUserAuthenticaded(r);
      this.userAuthenticaded = r;
    });
  }

  doStoreUserAuthenticaded(UserAuthenticaded user) async {
    final result = await storeAuthenticadedUserUsecase(user);

    result.fold((l) => setState(LoginError(l)), (r) async {
      //await initMqttClient();
      setState(LoginSuccess());
      Modular.to.pushNamed('/dashboard');
    });
  }

  // @action
  // Future getAccessToken() async {
  //   final result = await getUserToken();

  //   return result.fold(
  //       (l) => setState(LoginError(l)), (r) => this.acessToken = r);
  // }

  @action
  Future verifyIfUserAuthenticated() async {
    // final result = await userTokenIsValidUsecase();

    // result.fold((l) => setState(LoginError(l)), (r) {
    //   if (r) {
    //     setState(NotAuthenticaded());
    //   } else {
    //     setState(Authenticaded());
    //     Modular.to.pushNamed('/dashboard');
    //   }
    // });
  }

  @action
  setState(LoginState value) => state = value;
}
