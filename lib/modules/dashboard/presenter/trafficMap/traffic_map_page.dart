import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
import 'package:greenwave_app/modules/dashboard/domain/inputs/CarOccurencyInput.dart';
import 'package:greenwave_app/modules/dashboard/presenter/trafficMap/states/states.dart';
import 'package:greenwave_app/modules/dashboard/presenter/trafficMap/traffic_map_controller.dart';
import 'package:greenwave_app/modules/util/widget/loading_widget.dart';
import "package:latlong/latlong.dart" as latLng;

class TrafficMapPage extends StatefulWidget {
  TrafficMapPage();

  @override
  _TrafficMapPageState createState() => _TrafficMapPageState();
}

class _TrafficMapPageState
    extends ModularState<TrafficMapPage, TrafficMapController> {
  List<CarOccurencyEntity> carOccurencyList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Observer(
          builder: (_) {
            var state = controller.state;

            if (state is TrafficMapError) {
              // this.errorMessage = state.error.message;
              return _trafficMapPage(); //mudar
            }

            if (state is TrafficMapStart) {
              return _trafficMapPage();
            } else if (state is TrafficMapLoading) {
              return _trafficMapPage();
            } else if (state is RefreshTrafficOccurency) {
              carOccurencyList = state.carOccurencyList;
              // setState(() {
              //   carOccurencyList = state.carOccurencyList;

              // });
              return _trafficMapPage();
            } else {
              return _trafficMapPage();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createCarOccurency(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> createCarOccurency() async {
    final x = new CarOccurencyInput(
        tag: "Teste do mapa", datetime: new DateTime(2022));
    await controller.doCreateCarOccurency(x);
  }

  Color decideColor(int carsOccurencyQuantity) {
    if (carsOccurencyQuantity < 5) {
      return Color.fromRGBO(2, 181, 26, 0.5);
    } else if (carsOccurencyQuantity >= 5 && carsOccurencyQuantity < 10) {
      return Color.fromRGBO(255, 187, 0, 0.5);
    } else {
      return Color.fromRGBO(255, 0, 0, 0.5);
    }
  }

  Widget _trafficMapPage() {
    print(carOccurencyList.length);
    return FlutterMap(
      //mapController: ...,
      options: MapOptions(
        center: latLng.LatLng(-19.917298, -43.939651),
        zoom: 13,
      ),
      layers: [
        TileLayerOptions(
          minZoom: 1,
          maxZoom: 18,
          backgroundColor: Colors.black,
          urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        CircleLayerOptions(circles: [
          CircleMarker(
              radius: 50,
              point: latLng.LatLng(-19.917298, -43.939651),
              color: decideColor(carOccurencyList.length))
        ]),
      ],
    );
  }
}
