// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caffeine_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CaffeineItemModel {

 int? get id; String get category; String get name; String? get brand; String get serviceSize; double? get volumeMl; double get caffeineAmount; int get hits; int? get isCustom; int? get categoryId;
/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaffeineItemModelCopyWith<CaffeineItemModel> get copyWith => _$CaffeineItemModelCopyWithImpl<CaffeineItemModel>(this as CaffeineItemModel, _$identity);

  /// Serializes this CaffeineItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaffeineItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.serviceSize, serviceSize) || other.serviceSize == serviceSize)&&(identical(other.volumeMl, volumeMl) || other.volumeMl == volumeMl)&&(identical(other.caffeineAmount, caffeineAmount) || other.caffeineAmount == caffeineAmount)&&(identical(other.hits, hits) || other.hits == hits)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,name,brand,serviceSize,volumeMl,caffeineAmount,hits,isCustom,categoryId);

@override
String toString() {
  return 'CaffeineItemModel(id: $id, category: $category, name: $name, brand: $brand, serviceSize: $serviceSize, volumeMl: $volumeMl, caffeineAmount: $caffeineAmount, hits: $hits, isCustom: $isCustom, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $CaffeineItemModelCopyWith<$Res>  {
  factory $CaffeineItemModelCopyWith(CaffeineItemModel value, $Res Function(CaffeineItemModel) _then) = _$CaffeineItemModelCopyWithImpl;
@useResult
$Res call({
 int? id, String category, String name, String? brand, String serviceSize, double? volumeMl, double caffeineAmount, int hits, int? isCustom, int? categoryId
});




}
/// @nodoc
class _$CaffeineItemModelCopyWithImpl<$Res>
    implements $CaffeineItemModelCopyWith<$Res> {
  _$CaffeineItemModelCopyWithImpl(this._self, this._then);

  final CaffeineItemModel _self;
  final $Res Function(CaffeineItemModel) _then;

/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? category = null,Object? name = null,Object? brand = freezed,Object? serviceSize = null,Object? volumeMl = freezed,Object? caffeineAmount = null,Object? hits = null,Object? isCustom = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,serviceSize: null == serviceSize ? _self.serviceSize : serviceSize // ignore: cast_nullable_to_non_nullable
as String,volumeMl: freezed == volumeMl ? _self.volumeMl : volumeMl // ignore: cast_nullable_to_non_nullable
as double?,caffeineAmount: null == caffeineAmount ? _self.caffeineAmount : caffeineAmount // ignore: cast_nullable_to_non_nullable
as double,hits: null == hits ? _self.hits : hits // ignore: cast_nullable_to_non_nullable
as int,isCustom: freezed == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CaffeineItemModel].
extension CaffeineItemModelPatterns on CaffeineItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaffeineItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaffeineItemModel value)  $default,){
final _that = this;
switch (_that) {
case _CaffeineItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaffeineItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String category,  String name,  String? brand,  String serviceSize,  double? volumeMl,  double caffeineAmount,  int hits,  int? isCustom,  int? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
return $default(_that.id,_that.category,_that.name,_that.brand,_that.serviceSize,_that.volumeMl,_that.caffeineAmount,_that.hits,_that.isCustom,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String category,  String name,  String? brand,  String serviceSize,  double? volumeMl,  double caffeineAmount,  int hits,  int? isCustom,  int? categoryId)  $default,) {final _that = this;
switch (_that) {
case _CaffeineItemModel():
return $default(_that.id,_that.category,_that.name,_that.brand,_that.serviceSize,_that.volumeMl,_that.caffeineAmount,_that.hits,_that.isCustom,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String category,  String name,  String? brand,  String serviceSize,  double? volumeMl,  double caffeineAmount,  int hits,  int? isCustom,  int? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _CaffeineItemModel() when $default != null:
return $default(_that.id,_that.category,_that.name,_that.brand,_that.serviceSize,_that.volumeMl,_that.caffeineAmount,_that.hits,_that.isCustom,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaffeineItemModel implements CaffeineItemModel {
  const _CaffeineItemModel({this.id, this.category = '기타', required this.name, this.brand, this.serviceSize = '', this.volumeMl, this.caffeineAmount = 0.0, this.hits = 0, this.isCustom, this.categoryId});
  factory _CaffeineItemModel.fromJson(Map<String, dynamic> json) => _$CaffeineItemModelFromJson(json);

@override final  int? id;
@override@JsonKey() final  String category;
@override final  String name;
@override final  String? brand;
@override@JsonKey() final  String serviceSize;
@override final  double? volumeMl;
@override@JsonKey() final  double caffeineAmount;
@override@JsonKey() final  int hits;
@override final  int? isCustom;
@override final  int? categoryId;

/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaffeineItemModelCopyWith<_CaffeineItemModel> get copyWith => __$CaffeineItemModelCopyWithImpl<_CaffeineItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaffeineItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaffeineItemModel&&(identical(other.id, id) || other.id == id)&&(identical(other.category, category) || other.category == category)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.serviceSize, serviceSize) || other.serviceSize == serviceSize)&&(identical(other.volumeMl, volumeMl) || other.volumeMl == volumeMl)&&(identical(other.caffeineAmount, caffeineAmount) || other.caffeineAmount == caffeineAmount)&&(identical(other.hits, hits) || other.hits == hits)&&(identical(other.isCustom, isCustom) || other.isCustom == isCustom)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,category,name,brand,serviceSize,volumeMl,caffeineAmount,hits,isCustom,categoryId);

@override
String toString() {
  return 'CaffeineItemModel(id: $id, category: $category, name: $name, brand: $brand, serviceSize: $serviceSize, volumeMl: $volumeMl, caffeineAmount: $caffeineAmount, hits: $hits, isCustom: $isCustom, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$CaffeineItemModelCopyWith<$Res> implements $CaffeineItemModelCopyWith<$Res> {
  factory _$CaffeineItemModelCopyWith(_CaffeineItemModel value, $Res Function(_CaffeineItemModel) _then) = __$CaffeineItemModelCopyWithImpl;
@override @useResult
$Res call({
 int? id, String category, String name, String? brand, String serviceSize, double? volumeMl, double caffeineAmount, int hits, int? isCustom, int? categoryId
});




}
/// @nodoc
class __$CaffeineItemModelCopyWithImpl<$Res>
    implements _$CaffeineItemModelCopyWith<$Res> {
  __$CaffeineItemModelCopyWithImpl(this._self, this._then);

  final _CaffeineItemModel _self;
  final $Res Function(_CaffeineItemModel) _then;

/// Create a copy of CaffeineItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? category = null,Object? name = null,Object? brand = freezed,Object? serviceSize = null,Object? volumeMl = freezed,Object? caffeineAmount = null,Object? hits = null,Object? isCustom = freezed,Object? categoryId = freezed,}) {
  return _then(_CaffeineItemModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: freezed == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String?,serviceSize: null == serviceSize ? _self.serviceSize : serviceSize // ignore: cast_nullable_to_non_nullable
as String,volumeMl: freezed == volumeMl ? _self.volumeMl : volumeMl // ignore: cast_nullable_to_non_nullable
as double?,caffeineAmount: null == caffeineAmount ? _self.caffeineAmount : caffeineAmount // ignore: cast_nullable_to_non_nullable
as double,hits: null == hits ? _self.hits : hits // ignore: cast_nullable_to_non_nullable
as int,isCustom: freezed == isCustom ? _self.isCustom : isCustom // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
