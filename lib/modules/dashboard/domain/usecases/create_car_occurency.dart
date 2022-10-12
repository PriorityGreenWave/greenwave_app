import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/domain/repositories/sqlite_repository.dart';

abstract class CreateCarOccurency {
  Future<void> call(CarOccurencyInput model);
}

class CreateCarOccurencyImpl implements CreateCarOccurency {
  final SqliteRepository repository;

  CreateCarOccurencyImpl(this.repository);

  @override
  Future<void> call(CarOccurencyInput input) async {
    await repository.createCarOccurency(input);
  }
}
