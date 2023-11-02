import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class DistanceMatrixCall {
  static Future<ApiCallResponse> call({
    String? riderLocation = '',
    String? restuant = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'DistanceMatrix ',
      apiUrl: 'https://maps.googleapis.com/maps/api/distancematrix/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'destinations': riderLocation,
        'origins': restuant,
        'key': "AIzaSyAP8EN4gXxwN8elKD74o6KGjPa3HHw8hew",
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }

  static dynamic distance(dynamic response) => getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      );
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
