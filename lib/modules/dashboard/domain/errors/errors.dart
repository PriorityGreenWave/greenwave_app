/////////////// FailureAuthenticate //////////////////
abstract class FailureTafficMap implements Exception {
  String message;
}

class GetTrafficDataError implements FailureTafficMap {
  @override
  String message;

  GetTrafficDataError({this.message});
}
