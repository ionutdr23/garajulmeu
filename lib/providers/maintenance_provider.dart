import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/maintenance.dart';
import '../repositories/maintenance_repository.dart';

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
}
