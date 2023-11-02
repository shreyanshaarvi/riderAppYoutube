import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ResturnatNameRecord extends FirestoreRecord {
  ResturnatNameRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "resturant" field.
  String? _resturant;
  String get resturant => _resturant ?? '';
  bool hasResturant() => _resturant != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _resturant = snapshotData['resturant'] as String?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('resturnatName');

  static Stream<ResturnatNameRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ResturnatNameRecord.fromSnapshot(s));

  static Future<ResturnatNameRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ResturnatNameRecord.fromSnapshot(s));

  static ResturnatNameRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ResturnatNameRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ResturnatNameRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ResturnatNameRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ResturnatNameRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ResturnatNameRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createResturnatNameRecordData({
  String? resturant,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'resturant': resturant,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class ResturnatNameRecordDocumentEquality
    implements Equality<ResturnatNameRecord> {
  const ResturnatNameRecordDocumentEquality();

  @override
  bool equals(ResturnatNameRecord? e1, ResturnatNameRecord? e2) {
    return e1?.resturant == e2?.resturant && e1?.location == e2?.location;
  }

  @override
  int hash(ResturnatNameRecord? e) =>
      const ListEquality().hash([e?.resturant, e?.location]);

  @override
  bool isValidKey(Object? o) => o is ResturnatNameRecord;
}
