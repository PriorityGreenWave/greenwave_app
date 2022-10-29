import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/repositories/sqlite_repository.dart';

abstract class ListCarOccurency {
  Future<List<CarOccurencyEntity>> call();
}

class ListCarOccurencyImpl implements ListCarOccurency {
  final SqliteRepository repository;

  ListCarOccurencyImpl(this.repository);

  @override
  Future<List<CarOccurencyEntity>> call() async {
    final DateTime dateFilter = new DateTime.now();

    final List<CarOccurencyEntity> carOccurencyList =
        await repository.listCarOccurency(dateFilter);

    return carOccurencyList;
  }
}
