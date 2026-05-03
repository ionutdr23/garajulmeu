import 'package:freezed_annotation/freezed_annotation.dart';

part 'car.freezed.dart';
part 'car.g.dart';

@freezed
abstract class Car with _$Car {
  const factory Car({
    required String id,
    required String name,
    required String plate,
    required int year,
    DateTime? insuranceExpiry,
    DateTime? itpExpiry,
    DateTime? vignetteExpiry,
  }) = _Car;

  factory Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);
}
