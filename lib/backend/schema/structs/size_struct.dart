// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SizeStruct extends FFFirebaseStruct {
  SizeStruct({
    int? size,
    double? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _size = size,
        _price = price,
        super(firestoreUtilData);

  // "size" field.
  int? _size;
  int get size => _size ?? 0;
  set size(int? val) => _size = val;
  void incrementSize(int amount) => _size = size + amount;
  bool hasSize() => _size != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  static SizeStruct fromMap(Map<String, dynamic> data) => SizeStruct(
        size: castToType<int>(data['size']),
        price: castToType<double>(data['price']),
      );

  static SizeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SizeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'size': _size,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'size': serializeParam(
          _size,
          ParamType.int,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
      }.withoutNulls;

  static SizeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SizeStruct(
        size: deserializeParam(
          data['size'],
          ParamType.int,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'SizeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SizeStruct && size == other.size && price == other.price;
  }

  @override
  int get hashCode => const ListEquality().hash([size, price]);
}

SizeStruct createSizeStruct({
  int? size,
  double? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SizeStruct(
      size: size,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SizeStruct? updateSizeStruct(
  SizeStruct? sizeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sizeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSizeStructData(
  Map<String, dynamic> firestoreData,
  SizeStruct? sizeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sizeStruct == null) {
    return;
  }
  if (sizeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sizeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sizeStructData = getSizeFirestoreData(sizeStruct, forFieldValue);
  final nestedData = sizeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sizeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSizeFirestoreData(
  SizeStruct? sizeStruct, [
  bool forFieldValue = false,
]) {
  if (sizeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sizeStruct.toMap());

  // Add any Firestore field values
  sizeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSizeListFirestoreData(
  List<SizeStruct>? sizeStructs,
) =>
    sizeStructs?.map((e) => getSizeFirestoreData(e, true)).toList() ?? [];
