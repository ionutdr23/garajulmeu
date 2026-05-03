// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maintenance.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Maintenance {

 String get id; String get carId; String get type; DateTime get date; int get mileage; String? get notes; DateTime? get nextDate; int? get nextMileage;
/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MaintenanceCopyWith<Maintenance> get copyWith => _$MaintenanceCopyWithImpl<Maintenance>(this as Maintenance, _$identity);

  /// Serializes this Maintenance to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Maintenance&&(identical(other.id, id) || other.id == id)&&(identical(other.carId, carId) || other.carId == carId)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.nextDate, nextDate) || other.nextDate == nextDate)&&(identical(other.nextMileage, nextMileage) || other.nextMileage == nextMileage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,carId,type,date,mileage,notes,nextDate,nextMileage);

@override
String toString() {
  return 'Maintenance(id: $id, carId: $carId, type: $type, date: $date, mileage: $mileage, notes: $notes, nextDate: $nextDate, nextMileage: $nextMileage)';
}


}

/// @nodoc
abstract mixin class $MaintenanceCopyWith<$Res>  {
  factory $MaintenanceCopyWith(Maintenance value, $Res Function(Maintenance) _then) = _$MaintenanceCopyWithImpl;
@useResult
$Res call({
 String id, String carId, String type, DateTime date, int mileage, String? notes, DateTime? nextDate, int? nextMileage
});




}
/// @nodoc
class _$MaintenanceCopyWithImpl<$Res>
    implements $MaintenanceCopyWith<$Res> {
  _$MaintenanceCopyWithImpl(this._self, this._then);

  final Maintenance _self;
  final $Res Function(Maintenance) _then;

/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? carId = null,Object? type = null,Object? date = null,Object? mileage = null,Object? notes = freezed,Object? nextDate = freezed,Object? nextMileage = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,carId: null == carId ? _self.carId : carId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,nextDate: freezed == nextDate ? _self.nextDate : nextDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextMileage: freezed == nextMileage ? _self.nextMileage : nextMileage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [Maintenance].
extension MaintenancePatterns on Maintenance {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Maintenance value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Maintenance value)  $default,){
final _that = this;
switch (_that) {
case _Maintenance():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Maintenance value)?  $default,){
final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String carId,  String type,  DateTime date,  int mileage,  String? notes,  DateTime? nextDate,  int? nextMileage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
return $default(_that.id,_that.carId,_that.type,_that.date,_that.mileage,_that.notes,_that.nextDate,_that.nextMileage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String carId,  String type,  DateTime date,  int mileage,  String? notes,  DateTime? nextDate,  int? nextMileage)  $default,) {final _that = this;
switch (_that) {
case _Maintenance():
return $default(_that.id,_that.carId,_that.type,_that.date,_that.mileage,_that.notes,_that.nextDate,_that.nextMileage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String carId,  String type,  DateTime date,  int mileage,  String? notes,  DateTime? nextDate,  int? nextMileage)?  $default,) {final _that = this;
switch (_that) {
case _Maintenance() when $default != null:
return $default(_that.id,_that.carId,_that.type,_that.date,_that.mileage,_that.notes,_that.nextDate,_that.nextMileage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Maintenance implements Maintenance {
  const _Maintenance({required this.id, required this.carId, required this.type, required this.date, required this.mileage, this.notes, this.nextDate, this.nextMileage});
  factory _Maintenance.fromJson(Map<String, dynamic> json) => _$MaintenanceFromJson(json);

@override final  String id;
@override final  String carId;
@override final  String type;
@override final  DateTime date;
@override final  int mileage;
@override final  String? notes;
@override final  DateTime? nextDate;
@override final  int? nextMileage;

/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MaintenanceCopyWith<_Maintenance> get copyWith => __$MaintenanceCopyWithImpl<_Maintenance>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MaintenanceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Maintenance&&(identical(other.id, id) || other.id == id)&&(identical(other.carId, carId) || other.carId == carId)&&(identical(other.type, type) || other.type == type)&&(identical(other.date, date) || other.date == date)&&(identical(other.mileage, mileage) || other.mileage == mileage)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.nextDate, nextDate) || other.nextDate == nextDate)&&(identical(other.nextMileage, nextMileage) || other.nextMileage == nextMileage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,carId,type,date,mileage,notes,nextDate,nextMileage);

@override
String toString() {
  return 'Maintenance(id: $id, carId: $carId, type: $type, date: $date, mileage: $mileage, notes: $notes, nextDate: $nextDate, nextMileage: $nextMileage)';
}


}

/// @nodoc
abstract mixin class _$MaintenanceCopyWith<$Res> implements $MaintenanceCopyWith<$Res> {
  factory _$MaintenanceCopyWith(_Maintenance value, $Res Function(_Maintenance) _then) = __$MaintenanceCopyWithImpl;
@override @useResult
$Res call({
 String id, String carId, String type, DateTime date, int mileage, String? notes, DateTime? nextDate, int? nextMileage
});




}
/// @nodoc
class __$MaintenanceCopyWithImpl<$Res>
    implements _$MaintenanceCopyWith<$Res> {
  __$MaintenanceCopyWithImpl(this._self, this._then);

  final _Maintenance _self;
  final $Res Function(_Maintenance) _then;

/// Create a copy of Maintenance
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? carId = null,Object? type = null,Object? date = null,Object? mileage = null,Object? notes = freezed,Object? nextDate = freezed,Object? nextMileage = freezed,}) {
  return _then(_Maintenance(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,carId: null == carId ? _self.carId : carId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,mileage: null == mileage ? _self.mileage : mileage // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,nextDate: freezed == nextDate ? _self.nextDate : nextDate // ignore: cast_nullable_to_non_nullable
as DateTime?,nextMileage: freezed == nextMileage ? _self.nextMileage : nextMileage // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
