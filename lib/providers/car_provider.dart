import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/car.dart';
import '../repositories/car_repository.dart';

final carRepositoryProvider = Provider((ref) => CarRepository());

final carsProvider = StreamProvider.family<List<Car>, String>((ref, familyId) {
  return ref.watch(carRepositoryProvider).watchCars(familyId);
});

final carServiceProvider = Provider((ref) => CarService(ref));

class CarService {
  final Ref _ref;
  CarService(this._ref);

  Future<void> addCar(String familyId, Car car) async {
    await _ref.read(carRepositoryProvider).addCar(familyId, car);
  }

  Future<void> updateCar(String familyId, Car car) async {
    await _ref.read(carRepositoryProvider).updateCar(familyId, car);
  }
}
