import 'package:flutter/material.dart';
import 'package:google_maps/polygons_polylines.dart';

import 'current_loc.dart';
import 'all_features.dart';
import 'normal_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const PolygonsPolylines(),
     // home: const CurrentLoc(),
   home: const GoogleMaps(),
      // home: const Normal(),
    );
  }
}

