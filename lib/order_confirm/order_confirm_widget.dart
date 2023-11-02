import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'order_confirm_model.dart';
export 'order_confirm_model.dart';

class OrderConfirmWidget extends StatefulWidget {
  const OrderConfirmWidget({Key? key}) : super(key: key);

  @override
  _OrderConfirmWidgetState createState() => _OrderConfirmWidgetState();
}

class _OrderConfirmWidgetState extends State<OrderConfirmWidget> {
  late OrderConfirmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => OrderConfirmModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: FFButtonWidget(
                  onPressed: () async {
                    _model.riderList = await queryRiderRecordOnce();
                    _model.resturantLocation = await queryResturantRecordOnce(
                      singleRecord: true,
                    ).then((s) => s.firstOrNull);
                    while (_model.isriderAssigned == false) {
                      _model.apiResulte9g = await DistanceMatrixCall.call(
                        riderLocation: functions.removeOtherWord(_model
                            .riderList?[_model.index]?.currentLocation
                            ?.toString()),
                        restuant: functions.removeOtherWord(_model
                            .resturantLocation?.currentLocation
                            ?.toString()),
                      );
                      if ((_model.apiResulte9g?.succeeded ?? true)) {
                        setState(() {
                          _model.riderDistance = functions
                              .revomeMfromtextinAPI(DistanceMatrixCall.distance(
                            (_model.apiResulte9g?.jsonBody ?? ''),
                          ).toString());
                        });
                        if (_model.riderDistance! < _model.range) {
                          await OrderAssineeRecord.collection
                              .doc()
                              .set(createOrderAssineeRecordData(
                                name: _model.riderList?[_model.index]?.name,
                                riderRef:
                                    _model.riderList?[_model.index]?.reference,
                                resturantRef:
                                    _model.resturantLocation?.reference,
                                isAccepted: false,
                              ));
                        }
                        await Future.delayed(
                            const Duration(milliseconds: 10000));
                        _model.riderAcception =
                            await queryOrderAssineeRecordOnce();
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        if (_model.riderAcception?[_model.index]?.isAccepted ==
                            true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Rider Accepted Order',
                                style: TextStyle(
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                ),
                              ),
                              duration: Duration(milliseconds: 4000),
                              backgroundColor:
                                  FlutterFlowTheme.of(context).secondary,
                            ),
                          );
                          break;
                        } else {
                          setState(() {
                            _model.index = _model.index + 1;
                          });
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'False',
                              style: TextStyle(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                            duration: Duration(milliseconds: 4000),
                            backgroundColor:
                                FlutterFlowTheme.of(context).secondary,
                          ),
                        );
                      }
                    }

                    context.pushNamed('OrderTracker');

                    setState(() {});
                  },
                  text: 'Order Prepared',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
