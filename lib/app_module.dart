import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greenwave_app/app_widget.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:greenwave_app/modules/auth/external/datasources/auth_datasource_impl.dart';
import 'package:greenwave_app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:greenwave_app/modules/auth/presenter/login/login_controller.dart';
import 'package:greenwave_app/modules/auth/presenter/login/login_page.dart';
import 'package:http/http.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        /// LOGIN USECASES ///
        Bind((i) => AuthenticateUserImpl(i())),

        /// REPOSITORIES ///
        Bind((i) => AuthRepositoryImpl(i())),

        /// DATASOURCES ///
        Bind((i) => AuthDatasourceImpl(i())),

        /// LIB ///
        Bind((i) => Client()),
        Bind((i) => FlutterSecureStorage()),

        /// CONTROLLER ///
        Bind((i) => LoginController(
              authenticateUserUsecase: i(),
            )),
      ];

  @override
  List<ModularRouter> get routers => [
        //LOGIN
        ModularRouter('/', child: (_, __) => LoginPage()),
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
