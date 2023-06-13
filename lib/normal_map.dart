import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Normal extends StatefulWidget {
  const Normal({Key? key}) : super(key: key);

  @override
  State<Normal> createState() => _NormalState();
}

class _NormalState extends State<Normal> {

  static const CameraPosition initialPosition =
  CameraPosition(target: LatLng(20.987654, 78.98765), zoom: 5);

  final Completer<GoogleMapController> _controller = Completer();


  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              initialCameraPosition: initialPosition,
              onMapCreated: _onMapCreated
            ),
          ),
        ],
      ),
    );
  }
}
