// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$isAuthenticatedAtom =
      Atom(name: '_LoginControllerBase.isAuthenticated');

  @override
  bool get isAuthenticated {
    _$isAuthenticatedAtom.reportRead();
    return super.isAuthenticated;
  }

  @override
  set isAuthenticated(bool value) {
    _$isAuthenticatedAtom.reportWrite(value, super.isAuthenticated, () {
      super.isAuthenticated = value;
    });
  }

  final _$stateAtom = Atom(name: '_LoginControllerBase.state');

  @override
  LoginState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoginState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$userAuthenticadedAtom =
      Atom(name: '_LoginControllerBase.userAuthenticaded');

  @override
  UserAuthenticaded get userAuthenticaded {
    _$userAuthenticadedAtom.reportRead();
    return super.userAuthenticaded;
  }

  @override
  set userAuthenticaded(UserAuthenticaded value) {
    _$userAuthenticadedAtom.reportWrite(value, super.userAuthenticaded, () {
      super.userAuthenticaded = value;
    });
  }

  final _$acessTokenAtom = Atom(name: '_LoginControllerBase.acessToken');

  @override
  String get acessToken {
    _$acessTokenAtom.reportRead();
    return super.acessToken;
  }

  @override
  set acessToken(String value) {
    _$acessTokenAtom.reportWrite(value, super.acessToken, () {
      super.acessToken = value;
    });
  }

  final _$doAuthenticateUserAsyncAction =
      AsyncAction('_LoginControllerBase.doAuthenticateUser');

  @override
  Future<dynamic> doAuthenticateUser(LoginInput input) {
    return _$doAuthenticateUserAsyncAction
        .run(() => super.doAuthenticateUser(input));
  }

  final _$verifyIfUserAuthenticatedAsyncAction =
      AsyncAction('_LoginControllerBase.verifyIfUserAuthenticated');

  @override
  Future<dynamic> verifyIfUserAuthenticated() {
    return _$verifyIfUserAuthenticatedAsyncAction
        .run(() => super.verifyIfUserAuthenticated());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic setState(LoginState value) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAuthenticated: ${isAuthenticated},
state: ${state},
userAuthenticaded: ${userAuthenticaded},
acessToken: ${acessToken}
    ''';
  }
}
