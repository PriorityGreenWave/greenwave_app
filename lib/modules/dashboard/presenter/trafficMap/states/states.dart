import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/errors/errors.dart';

abstract class TrafficMapState {}

class TrafficMapStart implements TrafficMapState {}

class TrafficMapLoading implements TrafficMapState {}

class TrafficMapError implements TrafficMapState {
  final FailureTafficMap error;

  TrafficMapError(this.error);
}

class RefreshTrafficOccurency implements TrafficMapState {
  final List<CarOccurencyEntity> carOccurencyList;

  RefreshTrafficOccurency(this.carOccurencyList);
}

class TrafficMapSuccess implements TrafficMapState {}
