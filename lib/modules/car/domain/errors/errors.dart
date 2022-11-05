/////////////// FailureAuthenticate //////////////////
abstract class FailureCar implements Exception {
  String message;
}

class InvalidFieldsError implements FailureCar {
  @override
  String message;

  InvalidFieldsError({this.message});
}

class DataSourceError implements FailureCar {
  @override
  String message;

  DataSourceError({this.message});
}
