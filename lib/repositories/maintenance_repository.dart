import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/maintenance.dart';

class MaintenanceRepository {
  final FirebaseFirestore _firestore;

  MaintenanceRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _maintenanceRef(
    String familyId,
    String carId,
  ) => _firestore
      .collection('families')
      .doc(familyId)
      .collection('cars')
      .doc(carId)
      .collection('maintenance');

  Future<List<Maintenance>> getMaintenanceRecords(
    String familyId,
    String carId,
  ) async {
    final snapshot = await _maintenanceRef(familyId, carId).get();
    return snapshot.docs.map(_fromDoc).toList();
  }

  Stream<List<Maintenance>> watchMaintenanceRecords(
    String familyId,
    String carId,
  ) {
    return _maintenanceRef(
      familyId,
      carId,
    ).snapshots().map((snapshot) => snapshot.docs.map(_fromDoc).toList());
  }

  Future<void> addMaintenanceRecord(
    String familyId,
    String carId,
    Maintenance maintenance,
  ) => _maintenanceRef(
    familyId,
    carId,
  ).doc(maintenance.id).set(_toFirestore(maintenance));

  Future<void> updateMaintenanceRecord(
    String familyId,
    String carId,
    Maintenance maintenance,
  ) => _maintenanceRef(
    familyId,
    carId,
  ).doc(maintenance.id).update(_toFirestore(maintenance));

  Future<void> deleteMaintenanceRecord(
    String familyId,
    String carId,
    Maintenance maintenance,
  ) => _maintenanceRef(familyId, carId).doc(maintenance.id).delete();

  Maintenance _fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Maintenance.fromJson({
      ...data,
      'id': doc.id,
      'date': _timestamp(data['date']),
      'nextDate': data['nextDate'] != null
          ? _timestamp(data['nextDate'])
          : null,
    });
  }

  Map<String, dynamic> _toFirestore(Maintenance maintenance) => {
    'carId': maintenance.carId,
    'type': maintenance.type,
    'date': Timestamp.fromDate(maintenance.date),
    'mileage': maintenance.mileage,
    'notes': maintenance.notes,
    'nextDate': maintenance.nextDate != null
        ? Timestamp.fromDate(maintenance.nextDate!)
        : null,
    'nextMileage': maintenance.nextMileage,
  };

  String _timestamp(dynamic value) =>
      (value as Timestamp).toDate().toIso8601String();
}
