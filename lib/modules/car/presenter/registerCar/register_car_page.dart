import 'package:flutter/material.dart';
import 'package:greenwave_app/modules/car/domain/inputs/CarInput.dart';
import 'package:greenwave_app/modules/car/presenter/registerCar/states/register_car_controller.dart';
import 'package:greenwave_app/modules/car/presenter/registerCar/states/states.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/util/widget/loading_widget.dart';

class RegisterCarPage extends StatefulWidget {
  @override
  _RegisterCarPage createState() => _RegisterCarPage();
}

class _RegisterCarPage
    extends ModularState<RegisterCarPage, RegisterCarController> {
  final _placaText = new TextEditingController();
  final _rfidText = new TextEditingController();
  final _fabricanteText = new TextEditingController();
  final _modeloText = new TextEditingController();
  final _anoText = new TextEditingController();
  final _tipoVeiculoText = new TextEditingController();

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Observer(
            builder: (_) {
              var state = controller.state;

              if (state is RegisterCarError) {
                return Center(
                  child: Text("Deu ruim"),
                );
              }

              if (state is RegisterCarStart) {
                return _buildStartWidget();
              } else if (state is RegisterCarLoading) {
                return LoadingWidget();
              } else if (state is RegisterCarSuccess) {
                return Center(
                  child: Text("Registrado com Sucesso"),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStartWidget() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.08,
            right: 25,
            left: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Text(
                'Cadastre um veículo',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 0),
              child: Container(
                child: Expanded(
                  child: Divider(
                    endIndent: 1,
                    indent: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0),
              padding: EdgeInsets.symmetric(vertical: 0),
              child: _buildForm(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    color: Color(0xFFffa101),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onPressed: () {
                      Modular.to.pushNamed('/');
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: FlatButton(
                      color: Color(0xFF539161),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Cadastrar',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          final registerInput = new CarInput(
                              ano: int.parse(_anoText.text),
                              estadoEmergencia: false,
                              veiculoEmergencia: true,
                              fabricante: _fabricanteText.text,
                              modelo: _modeloText.text,
                              placa: _placaText.text,
                              rfid: _rfidText.text,
                              tipoVeiculo: _tipoVeiculoText.text);
                          controller.doRegisterUser(registerInput);
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite a placa do veículo!';
                      }
                      return null;
                    },
                    controller: _placaText,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hoverColor: Colors.yellow,
                      labelText: "Placa",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Informe a placa",
                      hintStyle: TextStyle(color: Colors.grey[100]),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o RFID';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: _rfidText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "RFID",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "RFID",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o fabricante!';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _fabricanteText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Fabricante",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Fabricante",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o modelo!';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _modeloText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "modelo",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "modelo",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o Ano de fabricação!';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _anoText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Ano de fabricação",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Ano de fabricação",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Digite o tipo do veículo!';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _tipoVeiculoText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Tipo do Veículo",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Tipo do Veículo",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_formKey.currentState.validate()) {
      _currentStep < 1 ? setState(() => _currentStep += 1) : null;
    }
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
