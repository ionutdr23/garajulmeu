import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garajulmeu/models/car.dart';
import 'package:garajulmeu/providers/car_provider.dart';
import 'package:garajulmeu/models/maintenance.dart';
import 'package:garajulmeu/repositories/maintenance_repository.dart';
import 'package:rxdart/rxdart.dart';

final maintenanceRepositoryProvider = Provider(
  (ref) => MaintenanceRepository(),
);

final maintenanceProvider =
    StreamProvider.family<List<Maintenance>, (String, String)>((ref, params) {
      final (familyId, carId) = params;
      return ref
          .watch(maintenanceRepositoryProvider)
          .watchMaintenanceRecords(familyId, carId);
    });

final maintenanceServiceProvider = Provider((ref) => MaintenanceService(ref));

class MaintenanceService {
  final Ref _ref;
  MaintenanceService(this._ref);

  Future<void> addMaintenanceRecord(
    String familyId,
    String carId,
    Maintenance maintenance,
  ) async {
    await _ref
        .read(maintenanceRepositoryProvider)
        .addMaintenanceRecord(familyId, carId, maintenance);
  }

  Future<void> deleteMaintenance(
    String familyId,
    String carId,
    Maintenance maintenance,
  ) async {
    await _ref
        .read(maintenanceRepositoryProvider)
        .deleteMaintenanceRecord(familyId, carId, maintenance);
  }
}

final allMaintenanceProvider =
    StreamProvider.family<List<(Maintenance, Car)>, String>((ref, familyId) {
      final carsAsync = ref.watch(carsProvider(familyId));

      return carsAsync.when(
        data: (cars) {
          if (cars.isEmpty) return Stream.value([]);

          final streams = cars.map(
            (car) => ref
                .read(maintenanceRepositoryProvider)
                .watchMaintenanceRecords(familyId, car.id)
                .map((records) => records.map((m) => (m, car)).toList()),
          );

          return Rx.combineLatestList(streams).map((lists) {
            final all = lists.expand((list) => list).toList();
            all.sort((a, b) => b.$1.date.compareTo(a.$1.date));
            return all;
          });
        },
        loading: () => Stream.value([]),
        error: (_, __) => Stream.value([]),
      );
    });
