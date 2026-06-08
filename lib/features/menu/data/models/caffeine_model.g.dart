// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'caffeine_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaffeineItemModel _$CaffeineItemModelFromJson(Map<String, dynamic> json) =>
    _CaffeineItemModel(
      id: (json['id'] as num?)?.toInt(),
      category: json['category'] as String? ?? '기타',
      name: json['name'] as String,
      brand: json['brand'] as String?,
      serviceSize: json['serviceSize'] as String? ?? '',
      volumeMl: (json['volumeMl'] as num?)?.toDouble(),
      caffeineAmount: (json['caffeineAmount'] as num?)?.toDouble() ?? 0.0,
      hits: (json['hits'] as num?)?.toInt() ?? 0,
      isCustom: (json['isCustom'] as num?)?.toInt(),
      categoryId: (json['categoryId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CaffeineItemModelToJson(_CaffeineItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
      'name': instance.name,
      'brand': instance.brand,
      'serviceSize': instance.serviceSize,
      'volumeMl': instance.volumeMl,
      'caffeineAmount': instance.caffeineAmount,
      'hits': instance.hits,
      'isCustom': instance.isCustom,
      'categoryId': instance.categoryId,
    };
