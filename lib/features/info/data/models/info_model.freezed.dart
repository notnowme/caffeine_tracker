// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'info_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InfoModel {

 String get name; Gender get gender; double get weight; int get age; bool get smoking; Sensitive get sense; double get targetAmount;
/// Create a copy of InfoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InfoModelCopyWith<InfoModel> get copyWith => _$InfoModelCopyWithImpl<InfoModel>(this as InfoModel, _$identity);

  /// Serializes this InfoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.age, age) || other.age == age)&&(identical(other.smoking, smoking) || other.smoking == smoking)&&(identical(other.sense, sense) || other.sense == sense)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,gender,weight,age,smoking,sense,targetAmount);

@override
String toString() {
  return 'InfoModel(name: $name, gender: $gender, weight: $weight, age: $age, smoking: $smoking, sense: $sense, targetAmount: $targetAmount)';
}


}

/// @nodoc
abstract mixin class $InfoModelCopyWith<$Res>  {
  factory $InfoModelCopyWith(InfoModel value, $Res Function(InfoModel) _then) = _$InfoModelCopyWithImpl;
@useResult
$Res call({
 String name, Gender gender, double weight, int age, bool smoking, Sensitive sense, double targetAmount
});




}
/// @nodoc
class _$InfoModelCopyWithImpl<$Res>
    implements $InfoModelCopyWith<$Res> {
  _$InfoModelCopyWithImpl(this._self, this._then);

  final InfoModel _self;
  final $Res Function(InfoModel) _then;

/// Create a copy of InfoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? gender = null,Object? weight = null,Object? age = null,Object? smoking = null,Object? sense = null,Object? targetAmount = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,smoking: null == smoking ? _self.smoking : smoking // ignore: cast_nullable_to_non_nullable
as bool,sense: null == sense ? _self.sense : sense // ignore: cast_nullable_to_non_nullable
as Sensitive,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InfoModel].
extension InfoModelPatterns on InfoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InfoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InfoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InfoModel value)  $default,){
final _that = this;
switch (_that) {
case _InfoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InfoModel value)?  $default,){
final _that = this;
switch (_that) {
case _InfoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  Gender gender,  double weight,  int age,  bool smoking,  Sensitive sense,  double targetAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InfoModel() when $default != null:
return $default(_that.name,_that.gender,_that.weight,_that.age,_that.smoking,_that.sense,_that.targetAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  Gender gender,  double weight,  int age,  bool smoking,  Sensitive sense,  double targetAmount)  $default,) {final _that = this;
switch (_that) {
case _InfoModel():
return $default(_that.name,_that.gender,_that.weight,_that.age,_that.smoking,_that.sense,_that.targetAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  Gender gender,  double weight,  int age,  bool smoking,  Sensitive sense,  double targetAmount)?  $default,) {final _that = this;
switch (_that) {
case _InfoModel() when $default != null:
return $default(_that.name,_that.gender,_that.weight,_that.age,_that.smoking,_that.sense,_that.targetAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InfoModel implements InfoModel {
  const _InfoModel({required this.name, required this.gender, required this.weight, required this.age, required this.smoking, required this.sense, required this.targetAmount});
  factory _InfoModel.fromJson(Map<String, dynamic> json) => _$InfoModelFromJson(json);

@override final  String name;
@override final  Gender gender;
@override final  double weight;
@override final  int age;
@override final  bool smoking;
@override final  Sensitive sense;
@override final  double targetAmount;

/// Create a copy of InfoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InfoModelCopyWith<_InfoModel> get copyWith => __$InfoModelCopyWithImpl<_InfoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InfoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InfoModel&&(identical(other.name, name) || other.name == name)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.age, age) || other.age == age)&&(identical(other.smoking, smoking) || other.smoking == smoking)&&(identical(other.sense, sense) || other.sense == sense)&&(identical(other.targetAmount, targetAmount) || other.targetAmount == targetAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,gender,weight,age,smoking,sense,targetAmount);

@override
String toString() {
  return 'InfoModel(name: $name, gender: $gender, weight: $weight, age: $age, smoking: $smoking, sense: $sense, targetAmount: $targetAmount)';
}


}

/// @nodoc
abstract mixin class _$InfoModelCopyWith<$Res> implements $InfoModelCopyWith<$Res> {
  factory _$InfoModelCopyWith(_InfoModel value, $Res Function(_InfoModel) _then) = __$InfoModelCopyWithImpl;
@override @useResult
$Res call({
 String name, Gender gender, double weight, int age, bool smoking, Sensitive sense, double targetAmount
});




}
/// @nodoc
class __$InfoModelCopyWithImpl<$Res>
    implements _$InfoModelCopyWith<$Res> {
  __$InfoModelCopyWithImpl(this._self, this._then);

  final _InfoModel _self;
  final $Res Function(_InfoModel) _then;

/// Create a copy of InfoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? gender = null,Object? weight = null,Object? age = null,Object? smoking = null,Object? sense = null,Object? targetAmount = null,}) {
  return _then(_InfoModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,gender: null == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as Gender,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as double,age: null == age ? _self.age : age // ignore: cast_nullable_to_non_nullable
as int,smoking: null == smoking ? _self.smoking : smoking // ignore: cast_nullable_to_non_nullable
as bool,sense: null == sense ? _self.sense : sense // ignore: cast_nullable_to_non_nullable
as Sensitive,targetAmount: null == targetAmount ? _self.targetAmount : targetAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
