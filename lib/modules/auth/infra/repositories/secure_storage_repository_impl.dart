import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/domain/repositories/secure_storage_repository.dart';
import 'package:greenwave_app/modules/auth/infra/datasources/secure_storage_datasource.dart';

class SecureStorageRepositoryImpl implements SecureStorageRepository {
  final SecureStorageDatasource datasource;

  SecureStorageRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureAuthenticate, void>> storeUserAuthenticaded(
      UserAuthenticaded user) async {
    try {
      return Right(await datasource.storeUserAuthenticadedOnStorage(user));
    } on StorageTokenError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(StorageTokenError());
    }
  }
}
