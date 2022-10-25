import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import "package:latlong/latlong.dart" as latLng;

class TrafficMapPage extends StatefulWidget {
  TrafficMapPage();

  @override
  _TrafficMapPageState createState() => _TrafficMapPageState();
}

class _TrafficMapPageState extends State<TrafficMapPage> {
  @override
  void initState() {
    super.initState();

    // _locationData = widget.location;
  }

  @override
  Widget build(BuildContext context) {
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
