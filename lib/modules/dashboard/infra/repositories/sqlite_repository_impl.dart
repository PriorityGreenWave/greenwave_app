import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/domain/repositories/sqlite_repository.dart';
import 'package:greenwave_app/modules/dashboard/infra/datasources/sqlite_datasources.dart';

class SqliteRepositoryImpl implements SqliteRepository {
  final SqliteDatasource datasource;

  SqliteRepositoryImpl(this.datasource);

  @override
  Future<void> createCarOccurency(CarOccurencyInput carOccurrency) async {
    await datasource.createCarOccurency(carOccurrency);
  }

  @override
  Future<List<CarOccurencyEntity>> listCarOccurency(DateTime dateFilter) async {
    final carOccurencyList = await datasource.listCarOccurency(dateFilter);

    return carOccurencyList;
  }
}
