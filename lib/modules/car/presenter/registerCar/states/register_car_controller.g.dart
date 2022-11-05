// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_car_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterCarController on _RegisterCarControllerBase, Store {
  final _$stateAtom = Atom(name: '_RegisterCarControllerBase.state');

  @override
  RegisterCarState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(RegisterCarState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_RegisterCarControllerBaseActionController =
      ActionController(name: '_RegisterCarControllerBase');

  @override
  dynamic setState(RegisterCarState value) {
    final _$actionInfo = _$_RegisterCarControllerBaseActionController
        .startAction(name: '_RegisterCarControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_RegisterCarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
