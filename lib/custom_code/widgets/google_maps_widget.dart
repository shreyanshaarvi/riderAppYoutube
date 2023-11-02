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

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({
    Key? key,
    this.width,
    this.height,
    required this.apikey,
    required this.sourceLatLng,
    required this.destinationLatLng,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String apikey;
  final LatLng sourceLatLng;
  final LatLng destinationLatLng;

  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleMapsWidget(
      sourceLatLng: widget.sourceLatLng,
      destinationLatLng: widget.destinationLatLng,
      apikey: 'AIzaSyAHxerJwxgZ4ua-fhc7X5lSObWf0ksrCLI',
    );
  }
}
