import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/car.dart';

class CarRepository {
  final FirebaseFirestore _firestore;

  CarRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _carsRef(String familyId) =>
      _firestore.collection('families').doc(familyId).collection('cars');

  Future<List<Car>> getCars(String familyId) async {
    final snapshot = await _carsRef(familyId).get();
    return snapshot.docs.map(_fromDoc).toList();
  }

  Stream<List<Car>> watchCars(String familyId) {
    return _carsRef(
      familyId,
    ).snapshots().map((snapshot) => snapshot.docs.map(_fromDoc).toList());
  }

  Future<void> addCar(String familyId, Car car) =>
      _carsRef(familyId).doc(car.id).set(_toFirestore(car));

  Future<void> updateCar(String familyId, Car car) =>
      _carsRef(familyId).doc(car.id).update(_toFirestore(car));

  Future<void> deleteCar(String familyId, Car car) =>
      _carsRef(familyId).doc(car.id).delete();

  Car _fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    final data = doc.data()!;
    return Car.fromJson({
      ...data,
      'id': doc.id,
      'insuranceExpiry': _timestamp(data['insuranceExpiry']),
      'itpExpiry': _timestamp(data['itpExpiry']),
      'vignetteExpiry': _timestamp(data['vignetteExpiry']),
    });
  }

  Map<String, dynamic> _toFirestore(Car car) => {
    'name': car.name,
    'plate': car.plate,
    'year': car.year,
    'insuranceExpiry': _timestampFromDate(car.insuranceExpiry),
    'itpExpiry': _timestampFromDate(car.itpExpiry),
    'vignetteExpiry': _timestampFromDate(car.vignetteExpiry),
  };

  String? _timestamp(dynamic value) =>
      value == null ? null : (value as Timestamp).toDate().toIso8601String();

  Timestamp? _timestampFromDate(DateTime? value) =>
      value == null ? null : Timestamp.fromDate(value);
}
