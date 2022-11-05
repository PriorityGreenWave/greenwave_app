import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:greenwave_app/app_widget.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/authenticate_user.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/get_loggedUser.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/register_user.dart';
import 'package:greenwave_app/modules/auth/domain/usecases/store_authenticaded_user.dart';
import 'package:greenwave_app/modules/auth/external/datasources/auth_datasource_impl.dart';
import 'package:greenwave_app/modules/auth/external/datasources/secure_storage_datasource_impl.dart';
import 'package:greenwave_app/modules/auth/infra/repositories/auth_repository_impl.dart';
import 'package:greenwave_app/modules/auth/infra/repositories/secure_storage_repository_impl.dart';
import 'package:greenwave_app/modules/auth/presenter/login/login_controller.dart';
import 'package:greenwave_app/modules/auth/presenter/login/login_page.dart';
import 'package:greenwave_app/modules/auth/presenter/register/register_controller.dart';
import 'package:greenwave_app/modules/auth/presenter/register/register_page.dart';
import 'package:greenwave_app/modules/car/domain/usecases/register_car_usecase.dart';
import 'package:greenwave_app/modules/car/external/datasources/car_datasource_impl.dart';
import 'package:greenwave_app/modules/car/infra/repositories/car_repository_impl.dart';
import 'package:greenwave_app/modules/car/presenter/registerCar/register_car_page.dart';
import 'package:greenwave_app/modules/car/presenter/registerCar/states/register_car_controller.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/create_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/init_mqtt_client.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/list_car_occurency.dart';
import 'package:greenwave_app/modules/dashboard/domain/usecases/send_topic_message.dart';
import 'package:greenwave_app/modules/dashboard/external/datasources/mqtt_datasource_impl.dart';
import 'package:greenwave_app/modules/dashboard/external/datasources/sqlite_datasources_impl.dart';
import 'package:greenwave_app/modules/dashboard/infra/repositories/mqtt_repository_impl.dart';
import 'package:greenwave_app/modules/dashboard/infra/repositories/sqlite_repository_impl.dart';
import 'package:greenwave_app/modules/dashboard/presenter/dashboard/dashboard_controller.dart';
import 'package:greenwave_app/modules/dashboard/presenter/dashboard/dashboard_page.dart';
import 'package:greenwave_app/modules/dashboard/presenter/trafficMap/traffic_map_controller.dart';
import 'package:greenwave_app/modules/dashboard/presenter/trafficMap/traffic_map_page.dart';
import 'package:http/http.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        /// LOGIN USECASES ///
        Bind((i) => AuthenticateUserImpl(i())),
        Bind((i) => StoreAuthenticadedUserImpl(i())),
        Bind((i) => RegisterUserImpl(i())),
        Bind((i) => CreateCarOccurencyImpl(i())),
        Bind((i) => InitMqttClientImpl(i())),
        Bind((i) => ListCarOccurencyImpl(i())),
        Bind((i) => SendTopicMessageImpl(i())),
        Bind((i) => RegisterCarUsecaseImpl(i())),
        Bind((i) => GetLoggedUserImpl(i())),

        /// REPOSITORIES ///
        Bind((i) => AuthRepositoryImpl(i())),
        Bind((i) => SecureStorageRepositoryImpl(i())),
        Bind((i) => MqttRepositoryImpl(i())),
        Bind((i) => SqliteRepositoryImpl(i())),
        Bind((i) => CarRepositoryImpl(i())),

        /// DATASOURCES ///
        Bind((i) => AuthDatasourceImpl(i())),
        Bind((i) => SecureStorageDatasourceImpl()),
        Bind((i) => MqttDatasourceImpl(i())),
        Bind((i) => SqliteDatasourceImpl()),
        Bind((i) => CarDatasourceImpl(i())),

        /// LIB ///
        Bind((i) => Client()),
        Bind((i) => FlutterSecureStorage()),
        Bind((i) => MqttServerClient(i(), i())),

        /// CONTROLLER ///
        Bind((i) => LoginController(
            authenticateUserUsecase: i(), storeAuthenticadedUserUsecase: i()
            // initMqttClient: i()
            )),
        Bind((i) => RegisterController(registerUserUsecase: i())),
        Bind((i) => DashboardController(
            initMqttClientUsecase: i(), listCarOccurencyUsecase: i())),
        Bind((i) => TrafficMapController(
            createCarOccurencyUsecase: i(),
            listCarOccurencyUsecase: i(),
            sendTopicMessageUsecase: i(),
            initMqttClientUsecase: i())),
        Bind((i) =>
            RegisterCarController(getLoggedUser: i(), registerCarUsercase: i()))
      ];

  @override
  List<ModularRouter> get routers => [
        //LOGIN
        ModularRouter('/', child: (_, __) => LoginPage()),
        ModularRouter('/register-user', child: (_, __) => RegisterPage()),

        //DASHBOARD
        ModularRouter('/dashboard', child: (_, __) => DashboardPage()),

        //TRAFFICMAP
        ModularRouter('/traffic-map', child: (_, __) => TrafficMapPage()),

        //CAR
        ModularRouter('/register-car', child: (_, __) => RegisterCarPage())
      ];

  @override
  // TODO: implement bootstrap
  Widget get bootstrap => AppWidget();
}
