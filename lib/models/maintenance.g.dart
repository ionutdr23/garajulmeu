// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maintenance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Maintenance _$MaintenanceFromJson(Map<String, dynamic> json) => _Maintenance(
  id: json['id'] as String,
  carId: json['carId'] as String,
  type: json['type'] as String,
  date: DateTime.parse(json['date'] as String),
  mileage: (json['mileage'] as num).toInt(),
  notes: json['notes'] as String?,
  nextDate: json['nextDate'] == null
      ? null
      : DateTime.parse(json['nextDate'] as String),
  nextMileage: (json['nextMileage'] as num?)?.toInt(),
);

Map<String, dynamic> _$MaintenanceToJson(_Maintenance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carId': instance.carId,
      'type': instance.type,
      'date': instance.date.toIso8601String(),
      'mileage': instance.mileage,
      'notes': instance.notes,
      'nextDate': instance.nextDate?.toIso8601String(),
      'nextMileage': instance.nextMileage,
    };
