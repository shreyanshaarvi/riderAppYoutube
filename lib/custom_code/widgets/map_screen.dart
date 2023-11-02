// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

class MapScreen extends StatefulWidget {
  const MapScreen({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final mapsWidgetController = GlobalKey<GoogleMapsWidgetState>();
  @override
  Widget build(BuildContext context) {
    return GoogleMapsWidget(
        apiKey: "AIzaSyAHxerJwxgZ4ua-fhc7X5lSObWf0ksrCLI",
        key: mapsWidgetController,
        sourceLatLng: LatLng(40.484000837597925, -3.369978368282318),
        destinationLatLng: LatLng(
          40.48017307700204,
          -3.3618026599287987,
        ));
  }
}
