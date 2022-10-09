import 'package:dartz/dartz.dart';
import 'package:greenwave_app/modules/auth/domain/entities/user_authenticaded.dart';
import 'package:greenwave_app/modules/auth/domain/errors/errors.dart';
import 'package:greenwave_app/modules/auth/domain/inputs/register_input.dart';
import 'package:greenwave_app/modules/auth/domain/repositories/auth_repository.dart';
import 'package:greenwave_app/modules/auth/infra/datasources/auth_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureAuthenticate, UserAuthenticaded>> login(
      String email, String password) async {
    try {
      final result = await datasource.doAuthenticateUser(email, password);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }

  @override
  Future<Either<FailureAuthenticate, void>> registerUser(
      RegisterInput input) async {
    try {
      await datasource.doRegisterUser(input);
    } on DataSourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DataSourceError());
    }
  }
}
