import 'package:flutter/material.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/register_input.dart';
import 'package:intl/intl.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/auth/presenter/register/register_controller.dart';
import 'package:greenwave_app/modules/auth/presenter/register/states/states.dart';
import 'package:greenwave_app/modules/util/widget/loading_widget.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPage createState() => _RegisterPage();
}

class _RegisterPage extends ModularState<RegisterPage, RegisterController> {
  final _emailText = new TextEditingController();
  final _passwordText = new TextEditingController();
  final _nameText = new TextEditingController();
  final _cpfText = new TextEditingController();
  final _phoneText = new TextEditingController();
  var dateInput = new TextEditingController();

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dateInput.text = "";
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

              if (state is RegisterError) {
                return Center(
                  child: Text("Deu ruim"),
                );
              }

              if (state is RegisterStart) {
                return _buildStartWidget();
              } else if (state is RegisterLoading) {
                return LoadingWidget();
              } else if (state is RegisterSuccess) {
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
                'Vamos criar sua conta!',
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
                      color: Color(0xFF0076bc),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.30,
                        height: 50,
                        child: Center(
                          child: Text(
                            'Criar Conta',
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
                          final registerInput = new RegisterInput(
                              _nameText.text,
                              _emailText.text,
                              _passwordText.text,
                              _cpfText.text,
                              _phoneText.text,
                              dateInput.text);
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
                        return 'Digite seu Email';
                      }
                      return null;
                    },
                    controller: _emailText,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hoverColor: Colors.yellow,
                      labelText: "Email",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Informe o email",
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
                        return 'Digite sua Senha';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: _passwordText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Senha",
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
                        return 'Digite seu nome';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _nameText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Nome",
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
                        return 'Digite seu CPF';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _cpfText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "CPF",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "CPF",
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
                        return 'Digite seu telefone';
                      }
                      return null;
                    },
                    obscureText: false,
                    controller: _phoneText,
                    keyboardType: TextInputType.visiblePassword,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      labelText: "Telefone",
                      labelStyle: TextStyle(color: Colors.grey),
                      hintText: "Telefone",
                      hintStyle: TextStyle(color: Colors.grey),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      // ),
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 5, bottom: 100),
                    child: TextField(
                      controller: dateInput,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Data de Nascimento" //label text of field
                          ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        var pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            dateInput.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    )),
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
