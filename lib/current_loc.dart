import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLoc extends StatefulWidget {
  const CurrentLoc({Key? key}) : super(key: key);

  @override
  State<CurrentLoc> createState() => _CurrentLocState();
}

class _CurrentLocState extends State<CurrentLoc> {

  static const CameraPosition initialPosition =
  CameraPosition(target: LatLng(20.987654, 78.98765), zoom: 5);

  @override
  void initState() {
    super.initState();
    currentLocation();
  }

  Future<Position> getCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace){
      print("$error   Erroooooooor");
    });
    return await Geolocator.getCurrentPosition();
  }

  List<Marker> markers = [];
  Completer<GoogleMapController> controller = Completer();


  currentLocation() {
    getCurrentLocation().then((value) async {
      print("My coordinatesss aree     ${value.latitude}, ${value.longitude}");
      markers.add(Marker(
          markerId: MarkerId('Current'),
          position: LatLng(value.longitude, value.latitude),
          infoWindow: InfoWindow(title: 'Current Position ')));
      CameraPosition cammPos = CameraPosition(
          target: LatLng(value.latitude, value.longitude), zoom: 10);

      GoogleMapController gmc = await controller.future;

      gmc.animateCamera(CameraUpdate.newCameraPosition(cammPos));
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controllerr) {
                controller.complete(controllerr); },
              initialCameraPosition: const CameraPosition(target: LatLng(20.987654, 78.98765), zoom: 5),
            ),
          ),
        ],
      ),
    );
  }
}
