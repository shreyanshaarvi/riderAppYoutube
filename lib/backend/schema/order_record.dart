import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orderName" field.
  String? _orderName;
  String get orderName => _orderName ?? '';
  bool hasOrderName() => _orderName != null;

  // "refResturant" field.
  DocumentReference? _refResturant;
  DocumentReference? get refResturant => _refResturant;
  bool hasRefResturant() => _refResturant != null;

  // "o_price" field.
  double? _oPrice;
  double get oPrice => _oPrice ?? 0.0;
  bool hasOPrice() => _oPrice != null;

  void _initializeFields() {
    _orderName = snapshotData['orderName'] as String?;
    _refResturant = snapshotData['refResturant'] as DocumentReference?;
    _oPrice = castToType<double>(snapshotData['o_price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderRecordData({
  String? orderName,
  DocumentReference? refResturant,
  double? oPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderName': orderName,
      'refResturant': refResturant,
      'o_price': oPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderRecordDocumentEquality implements Equality<OrderRecord> {
  const OrderRecordDocumentEquality();

  @override
  bool equals(OrderRecord? e1, OrderRecord? e2) {
    return e1?.orderName == e2?.orderName &&
        e1?.refResturant == e2?.refResturant &&
        e1?.oPrice == e2?.oPrice;
  }

  @override
  int hash(OrderRecord? e) =>
      const ListEquality().hash([e?.orderName, e?.refResturant, e?.oPrice]);

  @override
  bool isValidKey(Object? o) => o is OrderRecord;
}
