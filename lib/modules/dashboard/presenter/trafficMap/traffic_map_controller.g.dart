// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'traffic_map_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrafficMapController on _TrafficMapControllerBase, Store {
  final _$stateAtom = Atom(name: '_TrafficMapControllerBase.state');

  @override
  TrafficMapState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(TrafficMapState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$_TrafficMapControllerBaseActionController =
      ActionController(name: '_TrafficMapControllerBase');

  @override
  dynamic setState(TrafficMapState value) {
    final _$actionInfo = _$_TrafficMapControllerBaseActionController
        .startAction(name: '_TrafficMapControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_TrafficMapControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
