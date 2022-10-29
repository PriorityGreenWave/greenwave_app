import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/errors/errors.dart';

abstract class DashboardState {}

class DashboardStart implements DashboardState {}

class DashboardLoading implements DashboardState {}

class DashboardError implements DashboardState {
  final FailureTafficMap error;

  DashboardError(this.error);
}

class DashboardTrafficOccurency implements DashboardState {
  final List<CarOccurencyEntity> carOccurencyList;

  DashboardTrafficOccurency(this.carOccurencyList);
}

class DashboardSuccess implements DashboardState {}
