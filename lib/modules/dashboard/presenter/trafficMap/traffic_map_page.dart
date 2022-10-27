import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:greenwave_app/modules/dashboard/domain/entities/CarOccurencyEntity.dart';
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
      backgroundColor: Colors.grey[100],
      body: SizedBox(
        child: Column(
          children: [
            Observer(
              builder: (_) {
                var state = controller.state;

                if (state is TrafficMapError) {
                  //this.errorMessage = state.error.message;
                  return _trafficMapPage(); //mudar
                }

                if (state is TrafficMapStart) {
                  return _trafficMapPage();
                } else if (state is TrafficMapLoading) {
                  return LoadingWidget();
                } else if (state is RefreshTrafficOccurency) {
                  setState(() {
                    carOccurencyList = state.carOccurencyList;
                    ;
                  });
                  return _trafficMapPage();
                } else {
                  return Center(
                    child: Text("Falhou tudo meu caro kkkk"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _trafficMapPage() {
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
            color: Color.fromRGBO(255, 0, 0, 0.5),
          )
        ]),
      ],
    );
  }
}
