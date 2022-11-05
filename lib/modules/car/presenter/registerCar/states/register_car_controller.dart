import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/get_loggedUser.dart';
import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';
import 'package:greenwave_app/modules/car/domain/usecases/register_car_usecase.dart';
import 'package:greenwave_app/modules/car/presenter/registerCar/states/states.dart';
import 'package:mobx/mobx.dart';

part 'register_car_controller.g.dart';

class RegisterCarController = _RegisterCarControllerBase
    with _$RegisterCarController;

abstract class _RegisterCarControllerBase with Store {
  final RegisterCarUsecase registerCarUsercase;
  final GetLoggedUser getLoggedUser;

  _RegisterCarControllerBase({this.registerCarUsercase, this.getLoggedUser});

  @observable
  RegisterCarState state = RegisterCarStart();

  doRegisterUser(CarInput input) async {
    setState(RegisterCarLoading());
    final userAuthenticaded = await getLoggedUser();

    await registerCarUsercase(new CarInput(
        idUsuario: userAuthenticaded.id,
        ano: input.ano,
        estadoEmergencia: input.estadoEmergencia,
        fabricante: input.fabricante,
        modelo: input.modelo,
        placa: input.placa,
        rfid: input.rfid,
        tipoVeiculo: input.tipoVeiculo,
        veiculoEmergencia: input.veiculoEmergencia));

    Modular.to.pushNamed('/dashboard');
  }

  @action
  setState(RegisterCarState value) => state = value;
}
