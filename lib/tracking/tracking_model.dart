import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'tracking_widget.dart' show TrackingWidget;
import 'package:flutter/material.dart';

class TrackingModel extends FlutterFlowModel<TrackingWidget> {
  ///  Local state fields for this page.

  LatLng? resturant;

  LatLng? rider;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Tracking widget.
  ResturantRecord? resutratQuery;
  // Stores action output result for [Firestore Query - Query a collection] action in Tracking widget.
  RiderRecord? riderQuery;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
