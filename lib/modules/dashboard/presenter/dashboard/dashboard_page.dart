import 'package:flutter/material.dart';
import 'package:flutter_group_sliver/flutter_group_sliver.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/presenter/dashboard/dashboard_controller.dart';
import 'package:greenwave_app/modules/dashboard/presenter/dashboard/states/state.dart';

class DashboardPage extends StatefulWidget {
  DashboardPage({Key key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  List<CarOccurencyEntity> carOccurencyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF539161),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            ListTile(
              title: Text('Minha Conta'),
            ),
            ListTile(
              title: Text('Planos'),
            ),
            ListTile(
              title: Text('Orçamentos'),
            ),
            ListTile(
              title: Text('Projetos'),
            ),
            ListTile(
              title: Text('Clientes'),
            ),
            ListTile(
              title: Text('Fornecedores'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Observer(
          builder: (_) {
            var state = controller.state;

            if (state is DashboardError) {
              // this.errorMessage = state.error.message;
              return _buildDashboarPage(); //mudar
            }

            if (state is DashboardStart) {
              return _buildDashboarPage();
            } else if (state is DashboardLoading) {
              return _buildDashboarPage();
            } else if (state is DashboardTrafficOccurency) {
              carOccurencyList = state.carOccurencyList;
              // setState(() {
              //   carOccurencyList = state.carOccurencyList;

              // });
              return _buildDashboarPage();
            } else {
              return _buildDashboarPage();
            }
          },
        ),
      ),
    );
  }

  Widget _buildDashboarPage() {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFF539161),
          title: Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Text(
              'Dashboard',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
          ),
          floating: false,
          expandedHeight: MediaQuery.of(context).size.height * 0.50,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(0),
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 5),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.blueGrey,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.17),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Carros detectados',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          carOccurencyList.length.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.red,
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.17),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 10, top: 20),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Carros em emergência',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 30, top: 25),
                                    child: Row(
                                      children: [
                                        Text(
                                          '10',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SliverGroupBuilder(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          margin: EdgeInsets.symmetric(vertical: 250, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: SliverGrid.count(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 10,
            children: [
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: new InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.map,
                          size: 70,
                          color: Colors.yellow[900],
                        ),
                        Text(
                          'Mapa de transito',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.yellow[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    return Modular.to.pushNamed('/traffic-map');
                  },
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.admin_panel_settings,
                        size: 70,
                        color: Colors.green[300],
                      ),
                      Text(
                        'Administração',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[300]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
