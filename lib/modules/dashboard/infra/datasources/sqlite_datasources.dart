import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';

abstract class SqliteDatasource {
  Future<void> createCarOccurency(CarOccurencyInput carOccurrency);
  Future<List<CarOccurencyEntity>> listCarOccurency(DateTime dateFilter);
}
