import '/flutter_flow/flutter_flow_util.dart';
import 'order_tracker_widget.dart' show OrderTrackerWidget;
import 'package:flutter/material.dart';

class OrderTrackerModel extends FlutterFlowModel<OrderTrackerWidget> {
  ///  Local state fields for this page.

  int? randomIndex;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

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
