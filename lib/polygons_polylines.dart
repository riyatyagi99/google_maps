import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolygonsPolylines extends StatefulWidget {
  const PolygonsPolylines({Key? key}) : super(key: key);

  @override
  State<PolygonsPolylines> createState() => _PolygonsPolylinesState();
}

class _PolygonsPolylinesState extends State<PolygonsPolylines> {

  static const CameraPosition initialPosition =
  CameraPosition(target: LatLng(20.987654, 78.98765), zoom: 5);
  Completer<GoogleMapController> controller = Completer();

  @override
  void initState() {
    super.initState();
    polylineList.add(polyline);
    polygonList.add(polygon);

  }
  //Polygon
  Set<Polygon> polygonList = HashSet<Polygon>();
 static List<LatLng> polygonPoints = <LatLng>[
    LatLng(22.987654, 78.98765),
    LatLng(24.987654, 80.98765),
    LatLng(25.987654, 81.98765),
    LatLng(22.987654, 79.98765),
  ];
  Polygon polygon = Polygon(
      polygonId: PolygonId('1'),
      fillColor: Colors.red.withOpacity(0.3),
      points: polygonPoints,
      strokeWidth: 2,
      strokeColor: Colors.red,
      geodesic: true);



  //PolyLine
  Set<Polyline> polylineList = {};
 static List<LatLng> polylinePoints = <LatLng>[
    LatLng(18.987654, 78.98765),
    LatLng(19.987654, 80.98765),
    LatLng(20.987654, 81.98765),
    LatLng(21.987654, 82.98765),
  ];

  Polyline polyline = Polyline(
      polylineId: PolylineId('4567'),
      color: Colors.red,
      points: polylinePoints,
      width: 2);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
             polygons: polygonList,
             polylines: polylineList,
              initialCameraPosition: const CameraPosition(target: LatLng(20.987654, 78.98765), zoom: 5),
            ),
          ),
        ],
      ),
    );
  }
}
