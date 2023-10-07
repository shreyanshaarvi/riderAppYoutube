import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderAssineeRecord extends FirestoreRecord {
  OrderAssineeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "riderRef" field.
  DocumentReference? _riderRef;
  DocumentReference? get riderRef => _riderRef;
  bool hasRiderRef() => _riderRef != null;

  // "resturantRef" field.
  DocumentReference? _resturantRef;
  DocumentReference? get resturantRef => _resturantRef;
  bool hasResturantRef() => _resturantRef != null;

  // "is_accepted" field.
  bool? _isAccepted;
  bool get isAccepted => _isAccepted ?? false;
  bool hasIsAccepted() => _isAccepted != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _riderRef = snapshotData['riderRef'] as DocumentReference?;
    _resturantRef = snapshotData['resturantRef'] as DocumentReference?;
    _isAccepted = snapshotData['is_accepted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orderAssinee');

  static Stream<OrderAssineeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderAssineeRecord.fromSnapshot(s));

  static Future<OrderAssineeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderAssineeRecord.fromSnapshot(s));

  static OrderAssineeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OrderAssineeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderAssineeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderAssineeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderAssineeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrderAssineeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrderAssineeRecordData({
  String? name,
  DocumentReference? riderRef,
  DocumentReference? resturantRef,
  bool? isAccepted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'riderRef': riderRef,
      'resturantRef': resturantRef,
      'is_accepted': isAccepted,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrderAssineeRecordDocumentEquality
    implements Equality<OrderAssineeRecord> {
  const OrderAssineeRecordDocumentEquality();

  @override
  bool equals(OrderAssineeRecord? e1, OrderAssineeRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.riderRef == e2?.riderRef &&
        e1?.resturantRef == e2?.resturantRef &&
        e1?.isAccepted == e2?.isAccepted;
  }

  @override
  int hash(OrderAssineeRecord? e) => const ListEquality()
      .hash([e?.name, e?.riderRef, e?.resturantRef, e?.isAccepted]);

  @override
  bool isValidKey(Object? o) => o is OrderAssineeRecord;
}
