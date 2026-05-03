import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/car.dart';
import '../repositories/car_repository.dart';

final carRepositoryProvider = Provider((ref) => CarRepository());

final carsProvider = StreamProvider.family<List<Car>, String>((ref, familyId) {
  return ref.watch(carRepositoryProvider).watchCars(familyId);
});
