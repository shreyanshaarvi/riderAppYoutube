import '/flutter_flow/flutter_flow_util.dart';
import 'start_screen_widget.dart' show StartScreenWidget;
import 'package:flutter/material.dart';

class StartScreenModel extends FlutterFlowModel<StartScreenWidget> {
  ///  Local state fields for this page.

  LatLng? location;

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
