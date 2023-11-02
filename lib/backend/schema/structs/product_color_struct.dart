// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductColorStruct extends FFFirebaseStruct {
  ProductColorStruct({
    Color? colourName,
    List<SizeStruct>? size,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _colourName = colourName,
        _size = size,
        super(firestoreUtilData);

  // "colourName" field.
  Color? _colourName;
  Color? get colourName => _colourName;
  set colourName(Color? val) => _colourName = val;
  bool hasColourName() => _colourName != null;

  // "size" field.
  List<SizeStruct>? _size;
  List<SizeStruct> get size => _size ?? const [];
  set size(List<SizeStruct>? val) => _size = val;
  void updateSize(Function(List<SizeStruct>) updateFn) =>
      updateFn(_size ??= []);
  bool hasSize() => _size != null;

  static ProductColorStruct fromMap(Map<String, dynamic> data) =>
      ProductColorStruct(
        colourName: getSchemaColor(data['colourName']),
        size: getStructList(
          data['size'],
          SizeStruct.fromMap,
        ),
      );

  static ProductColorStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? ProductColorStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'colourName': _colourName,
        'size': _size?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'colourName': serializeParam(
          _colourName,
          ParamType.Color,
        ),
        'size': serializeParam(
          _size,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static ProductColorStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductColorStruct(
        colourName: deserializeParam(
          data['colourName'],
          ParamType.Color,
          false,
        ),
        size: deserializeStructParam<SizeStruct>(
          data['size'],
          ParamType.DataStruct,
          true,
          structBuilder: SizeStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ProductColorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProductColorStruct &&
        colourName == other.colourName &&
        listEquality.equals(size, other.size);
  }

  @override
  int get hashCode => const ListEquality().hash([colourName, size]);
}

ProductColorStruct createProductColorStruct({
  Color? colourName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductColorStruct(
      colourName: colourName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductColorStruct? updateProductColorStruct(
  ProductColorStruct? productColor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productColor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductColorStructData(
  Map<String, dynamic> firestoreData,
  ProductColorStruct? productColor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productColor == null) {
    return;
  }
  if (productColor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productColor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productColorData =
      getProductColorFirestoreData(productColor, forFieldValue);
  final nestedData =
      productColorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productColor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductColorFirestoreData(
  ProductColorStruct? productColor, [
  bool forFieldValue = false,
]) {
  if (productColor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productColor.toMap());

  // Add any Firestore field values
  productColor.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductColorListFirestoreData(
  List<ProductColorStruct>? productColors,
) =>
    productColors?.map((e) => getProductColorFirestoreData(e, true)).toList() ??
    [];
