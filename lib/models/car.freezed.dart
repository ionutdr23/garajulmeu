// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'car.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Car {

 String get id; String get name; String get plate; int get year; DateTime? get insuranceExpiry; DateTime? get itpExpiry; DateTime? get vignetteExpiry;
/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CarCopyWith<Car> get copyWith => _$CarCopyWithImpl<Car>(this as Car, _$identity);

  /// Serializes this Car to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Car&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.year, year) || other.year == year)&&(identical(other.insuranceExpiry, insuranceExpiry) || other.insuranceExpiry == insuranceExpiry)&&(identical(other.itpExpiry, itpExpiry) || other.itpExpiry == itpExpiry)&&(identical(other.vignetteExpiry, vignetteExpiry) || other.vignetteExpiry == vignetteExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,plate,year,insuranceExpiry,itpExpiry,vignetteExpiry);

@override
String toString() {
  return 'Car(id: $id, name: $name, plate: $plate, year: $year, insuranceExpiry: $insuranceExpiry, itpExpiry: $itpExpiry, vignetteExpiry: $vignetteExpiry)';
}


}

/// @nodoc
abstract mixin class $CarCopyWith<$Res>  {
  factory $CarCopyWith(Car value, $Res Function(Car) _then) = _$CarCopyWithImpl;
@useResult
$Res call({
 String id, String name, String plate, int year, DateTime? insuranceExpiry, DateTime? itpExpiry, DateTime? vignetteExpiry
});




}
/// @nodoc
class _$CarCopyWithImpl<$Res>
    implements $CarCopyWith<$Res> {
  _$CarCopyWithImpl(this._self, this._then);

  final Car _self;
  final $Res Function(Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? plate = null,Object? year = null,Object? insuranceExpiry = freezed,Object? itpExpiry = freezed,Object? vignetteExpiry = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,insuranceExpiry: freezed == insuranceExpiry ? _self.insuranceExpiry : insuranceExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,itpExpiry: freezed == itpExpiry ? _self.itpExpiry : itpExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,vignetteExpiry: freezed == vignetteExpiry ? _self.vignetteExpiry : vignetteExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Car].
extension CarPatterns on Car {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Car value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Car() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Car value)  $default,){
final _that = this;
switch (_that) {
case _Car():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Car value)?  $default,){
final _that = this;
switch (_that) {
case _Car() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String plate,  int year,  DateTime? insuranceExpiry,  DateTime? itpExpiry,  DateTime? vignetteExpiry)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.id,_that.name,_that.plate,_that.year,_that.insuranceExpiry,_that.itpExpiry,_that.vignetteExpiry);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String plate,  int year,  DateTime? insuranceExpiry,  DateTime? itpExpiry,  DateTime? vignetteExpiry)  $default,) {final _that = this;
switch (_that) {
case _Car():
return $default(_that.id,_that.name,_that.plate,_that.year,_that.insuranceExpiry,_that.itpExpiry,_that.vignetteExpiry);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String plate,  int year,  DateTime? insuranceExpiry,  DateTime? itpExpiry,  DateTime? vignetteExpiry)?  $default,) {final _that = this;
switch (_that) {
case _Car() when $default != null:
return $default(_that.id,_that.name,_that.plate,_that.year,_that.insuranceExpiry,_that.itpExpiry,_that.vignetteExpiry);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Car implements Car {
  const _Car({required this.id, required this.name, required this.plate, required this.year, this.insuranceExpiry, this.itpExpiry, this.vignetteExpiry});
  factory _Car.fromJson(Map<String, dynamic> json) => _$CarFromJson(json);

@override final  String id;
@override final  String name;
@override final  String plate;
@override final  int year;
@override final  DateTime? insuranceExpiry;
@override final  DateTime? itpExpiry;
@override final  DateTime? vignetteExpiry;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CarCopyWith<_Car> get copyWith => __$CarCopyWithImpl<_Car>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CarToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Car&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.plate, plate) || other.plate == plate)&&(identical(other.year, year) || other.year == year)&&(identical(other.insuranceExpiry, insuranceExpiry) || other.insuranceExpiry == insuranceExpiry)&&(identical(other.itpExpiry, itpExpiry) || other.itpExpiry == itpExpiry)&&(identical(other.vignetteExpiry, vignetteExpiry) || other.vignetteExpiry == vignetteExpiry));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,plate,year,insuranceExpiry,itpExpiry,vignetteExpiry);

@override
String toString() {
  return 'Car(id: $id, name: $name, plate: $plate, year: $year, insuranceExpiry: $insuranceExpiry, itpExpiry: $itpExpiry, vignetteExpiry: $vignetteExpiry)';
}


}

/// @nodoc
abstract mixin class _$CarCopyWith<$Res> implements $CarCopyWith<$Res> {
  factory _$CarCopyWith(_Car value, $Res Function(_Car) _then) = __$CarCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String plate, int year, DateTime? insuranceExpiry, DateTime? itpExpiry, DateTime? vignetteExpiry
});




}
/// @nodoc
class __$CarCopyWithImpl<$Res>
    implements _$CarCopyWith<$Res> {
  __$CarCopyWithImpl(this._self, this._then);

  final _Car _self;
  final $Res Function(_Car) _then;

/// Create a copy of Car
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? plate = null,Object? year = null,Object? insuranceExpiry = freezed,Object? itpExpiry = freezed,Object? vignetteExpiry = freezed,}) {
  return _then(_Car(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,plate: null == plate ? _self.plate : plate // ignore: cast_nullable_to_non_nullable
as String,year: null == year ? _self.year : year // ignore: cast_nullable_to_non_nullable
as int,insuranceExpiry: freezed == insuranceExpiry ? _self.insuranceExpiry : insuranceExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,itpExpiry: freezed == itpExpiry ? _self.itpExpiry : itpExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,vignetteExpiry: freezed == vignetteExpiry ? _self.vignetteExpiry : vignetteExpiry // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
