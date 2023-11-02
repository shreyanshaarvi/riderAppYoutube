import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class RiderRecord extends FirestoreRecord {
  RiderRecord._(
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

  // "riderID" field.
  String? _riderID;
  String get riderID => _riderID ?? '';
  bool hasRiderID() => _riderID != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _currentLocation = snapshotData['currentLocation'] as LatLng?;
    _riderID = snapshotData['riderID'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rider');

  static Stream<RiderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RiderRecord.fromSnapshot(s));

  static Future<RiderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RiderRecord.fromSnapshot(s));

  static RiderRecord fromSnapshot(DocumentSnapshot snapshot) => RiderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RiderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RiderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RiderRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RiderRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRiderRecordData({
  String? name,
  LatLng? currentLocation,
  String? riderID,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'currentLocation': currentLocation,
      'riderID': riderID,
    }.withoutNulls,
  );

  return firestoreData;
}

class RiderRecordDocumentEquality implements Equality<RiderRecord> {
  const RiderRecordDocumentEquality();

  @override
  bool equals(RiderRecord? e1, RiderRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.currentLocation == e2?.currentLocation &&
        e1?.riderID == e2?.riderID;
  }

  @override
  int hash(RiderRecord? e) =>
      const ListEquality().hash([e?.name, e?.currentLocation, e?.riderID]);

  @override
  bool isValidKey(Object? o) => o is RiderRecord;
}
