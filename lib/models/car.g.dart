// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Car _$CarFromJson(Map<String, dynamic> json) => _Car(
  id: json['id'] as String,
  name: json['name'] as String,
  plate: json['plate'] as String,
  year: (json['year'] as num).toInt(),
  insuranceExpiry: json['insuranceExpiry'] == null
      ? null
      : DateTime.parse(json['insuranceExpiry'] as String),
  itpExpiry: json['itpExpiry'] == null
      ? null
      : DateTime.parse(json['itpExpiry'] as String),
  vignetteExpiry: json['vignetteExpiry'] == null
      ? null
      : DateTime.parse(json['vignetteExpiry'] as String),
);

Map<String, dynamic> _$CarToJson(_Car instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'plate': instance.plate,
  'year': instance.year,
  'insuranceExpiry': instance.insuranceExpiry?.toIso8601String(),
  'itpExpiry': instance.itpExpiry?.toIso8601String(),
  'vignetteExpiry': instance.vignetteExpiry?.toIso8601String(),
};
