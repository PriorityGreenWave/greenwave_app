/////////////// FailureAuthenticate //////////////////
abstract class FailureAuthenticate implements Exception {
  String message;
}

class InvalidFieldsError implements FailureAuthenticate {
  @override
  String message;

  InvalidFieldsError({this.message});
}

class DataSourceError implements FailureAuthenticate {
  final bool authenticated;

  @override
  String message;

  DataSourceError({this.authenticated, this.message});
}

class StorageTokenError implements FailureAuthenticate {
  @override
  String message;
}

class InvalidTokenError implements FailureAuthenticate {
  @override
  String message;
}

class InvalidUserError implements FailureAuthenticate {
  @override
  String message;
}

class GetTokenError implements FailureAuthenticate {
  @override
  String message;
}

/////////////// FailureForgotPassword //////////////////
abstract class FailureForgotPassword implements Exception {}

/////////////// FailureRegiterUser//////////////////
abstract class FailureRegister implements Exception {}

class InvalidFieldsResgister implements FailureRegister {}
