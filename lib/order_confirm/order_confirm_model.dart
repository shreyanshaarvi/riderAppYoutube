import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'order_confirm_widget.dart' show OrderConfirmWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderConfirmModel extends FlutterFlowModel<OrderConfirmWidget> {
  ///  Local state fields for this page.

  double range = 1.0;

  double? riderDistance;

  bool isriderAssigned = false;

  int index = 0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<RiderRecord>? riderList;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ResturantRecord? resturantLocation;
  // Stores action output result for [Backend Call - API (DistanceMatrix )] action in Button widget.
  ApiCallResponse? apiResulte9g;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OrderAssineeRecord>? riderAcception;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
