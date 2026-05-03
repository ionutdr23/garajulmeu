import 'package:freezed_annotation/freezed_annotation.dart';

part 'maintenance.freezed.dart';
part 'maintenance.g.dart';

@freezed
abstract class Maintenance with _$Maintenance {
  const factory Maintenance({
    required String id,
    required String carId,
    required String type,
    required DateTime date,
    required int mileage,
    String? notes,
    DateTime? nextDate,
    int? nextMileage,
  }) = _Maintenance;

  factory Maintenance.fromJson(Map<String, dynamic> json) =>
      _$MaintenanceFromJson(json);
}
