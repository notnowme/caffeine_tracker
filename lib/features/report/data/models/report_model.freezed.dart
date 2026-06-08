// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DrinkRecordModel {

 int? get id; int? get supabaseItemId; int? get localItemId; double get caffeineAmount; bool get isCustom; DateTime get drinkAt;
/// Create a copy of DrinkRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DrinkRecordModelCopyWith<DrinkRecordModel> get copyWith => _$DrinkRecordModelCopyWithImpl<DrinkRecordModel>(this as DrinkRecordModel, _$identity);

  /// Serializes this DrinkRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DrinkRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.supabaseItemId, supabaseItemId) || other.supabaseItemId == supabaseItemId)&&(identical(other.localItemId, localItemId) || other.localItemId == localItemId)&&(identical(other.caffeineAmount, caffeineAmount) || other.caffeineAmount == caffeineAmount)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.drinkAt, drinkAt) || other.drinkAt == drinkAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,supabaseItemId,localItemId,caffeineAmount,isCustom,drinkAt);

@override
String toString() {
  return 'DrinkRecordModel(id: $id, supabaseItemId: $supabaseItemId, localItemId: $localItemId, caffeineAmount: $caffeineAmount, isCustom: $isCustom, drinkAt: $drinkAt)';
}


}

/// @nodoc
abstract mixin class $DrinkRecordModelCopyWith<$Res>  {
  factory $DrinkRecordModelCopyWith(DrinkRecordModel value, $Res Function(DrinkRecordModel) _then) = _$DrinkRecordModelCopyWithImpl;
@useResult
$Res call({
 int? id, int? supabaseItemId, int? localItemId, double caffeineAmount, bool isCustom, DateTime drinkAt
});




}
/// @nodoc
class _$DrinkRecordModelCopyWithImpl<$Res>
    implements $DrinkRecordModelCopyWith<$Res> {
  _$DrinkRecordModelCopyWithImpl(this._self, this._then);

  final DrinkRecordModel _self;
  final $Res Function(DrinkRecordModel) _then;

/// Create a copy of DrinkRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? supabaseItemId = freezed,Object? localItemId = freezed,Object? caffeineAmount = null,Object? isCustom = null,Object? drinkAt = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,supabaseItemId: freezed == supabaseItemId ? _self.supabaseItemId : supabaseItemId // ignore: cast_nullable_to_non_nullable
as int?,localItemId: freezed == localItemId ? _self.localItemId : localItemId // ignore: cast_nullable_to_non_nullable
as int?,caffeineAmount: null == caffeineAmount ? _self.caffeineAmount : caffeineAmount // ignore: cast_nullable_to_non_nullable
as double,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,drinkAt: null == drinkAt ? _self.drinkAt : drinkAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [DrinkRecordModel].
extension DrinkRecordModelPatterns on DrinkRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DrinkRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DrinkRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DrinkRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _DrinkRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DrinkRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _DrinkRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  int? supabaseItemId,  int? localItemId,  double caffeineAmount,  bool isCustom,  DateTime drinkAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DrinkRecordModel() when $default != null:
return $default(_that.id,_that.supabaseItemId,_that.localItemId,_that.caffeineAmount,_that.isCustom,_that.drinkAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  int? supabaseItemId,  int? localItemId,  double caffeineAmount,  bool isCustom,  DateTime drinkAt)  $default,) {final _that = this;
switch (_that) {
case _DrinkRecordModel():
return $default(_that.id,_that.supabaseItemId,_that.localItemId,_that.caffeineAmount,_that.isCustom,_that.drinkAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  int? supabaseItemId,  int? localItemId,  double caffeineAmount,  bool isCustom,  DateTime drinkAt)?  $default,) {final _that = this;
switch (_that) {
case _DrinkRecordModel() when $default != null:
return $default(_that.id,_that.supabaseItemId,_that.localItemId,_that.caffeineAmount,_that.isCustom,_that.drinkAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DrinkRecordModel implements DrinkRecordModel {
  const _DrinkRecordModel({this.id, this.supabaseItemId, this.localItemId, required this.caffeineAmount, required this.isCustom, required this.drinkAt});
  factory _DrinkRecordModel.fromJson(Map<String, dynamic> json) => _$DrinkRecordModelFromJson(json);

@override final  int? id;
@override final  int? supabaseItemId;
@override final  int? localItemId;
@override final  double caffeineAmount;
@override final  bool isCustom;
@override final  DateTime drinkAt;

/// Create a copy of DrinkRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DrinkRecordModelCopyWith<_DrinkRecordModel> get copyWith => __$DrinkRecordModelCopyWithImpl<_DrinkRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DrinkRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DrinkRecordModel&&(identical(other.id, id) || other.id == id)&&(identical(other.supabaseItemId, supabaseItemId) || other.supabaseItemId == supabaseItemId)&&(identical(other.localItemId, localItemId) || other.localItemId == localItemId)&&(identical(other.caffeineAmount, caffeineAmount) || other.caffeineAmount == caffeineAmount)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.drinkAt, drinkAt) || other.drinkAt == drinkAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,supabaseItemId,localItemId,caffeineAmount,isCustom,drinkAt);

@override
String toString() {
  return 'DrinkRecordModel(id: $id, supabaseItemId: $supabaseItemId, localItemId: $localItemId, caffeineAmount: $caffeineAmount, isCustom: $isCustom, drinkAt: $drinkAt)';
}


}

/// @nodoc
abstract mixin class _$DrinkRecordModelCopyWith<$Res> implements $DrinkRecordModelCopyWith<$Res> {
  factory _$DrinkRecordModelCopyWith(_DrinkRecordModel value, $Res Function(_DrinkRecordModel) _then) = __$DrinkRecordModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, int? supabaseItemId, int? localItemId, double caffeineAmount, bool isCustom, DateTime drinkAt
});




}
/// @nodoc
class __$DrinkRecordModelCopyWithImpl<$Res>
    implements _$DrinkRecordModelCopyWith<$Res> {
  __$DrinkRecordModelCopyWithImpl(this._self, this._then);

  final _DrinkRecordModel _self;
  final $Res Function(_DrinkRecordModel) _then;

/// Create a copy of DrinkRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? supabaseItemId = freezed,Object? localItemId = freezed,Object? caffeineAmount = null,Object? isCustom = null,Object? drinkAt = null,}) {
  return _then(_DrinkRecordModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,supabaseItemId: freezed == supabaseItemId ? _self.supabaseItemId : supabaseItemId // ignore: cast_nullable_to_non_nullable
as int?,localItemId: freezed == localItemId ? _self.localItemId : localItemId // ignore: cast_nullable_to_non_nullable
as int?,caffeineAmount: null == caffeineAmount ? _self.caffeineAmount : caffeineAmount // ignore: cast_nullable_to_non_nullable
as double,isCustom: null == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as bool,drinkAt: null == drinkAt ? _self.drinkAt : drinkAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
