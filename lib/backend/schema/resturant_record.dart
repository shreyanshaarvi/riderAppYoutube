import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ResturantRecord extends FirestoreRecord {
  ResturantRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "currentLocation" field.
  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  bool hasCurrentLocation() => _currentLocation != null;

  // "orderRef" field.
  DocumentReference? _orderRef;
  DocumentReference? get orderRef => _orderRef;
  bool hasOrderRef() => _orderRef != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _currentLocation = snapshotData['currentLocation'] as LatLng?;
    _orderRef = snapshotData['orderRef'] as DocumentReference?;
    _id = snapshotData['id'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Resturant');

  static Stream<ResturantRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResturantRecord.fromSnapshot(s));

  static Future<ResturantRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResturantRecord.fromSnapshot(s));

  static ResturantRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResturantRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResturantRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResturantRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResturantRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResturantRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResturantRecordData({
  String? name,
  LatLng? currentLocation,
  DocumentReference? orderRef,
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'currentLocation': currentLocation,
      'orderRef': orderRef,
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResturantRecordDocumentEquality implements Equality<ResturantRecord> {
  const ResturantRecordDocumentEquality();

  @override
  bool equals(ResturantRecord? e1, ResturantRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.currentLocation == e2?.currentLocation &&
        e1?.orderRef == e2?.orderRef &&
        e1?.id == e2?.id;
  }

  @override
  int hash(ResturantRecord? e) => const ListEquality()
      .hash([e?.name, e?.currentLocation, e?.orderRef, e?.id]);

  @override
  bool isValidKey(Object? o) => o is ResturantRecord;
}
