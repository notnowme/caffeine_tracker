// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DrinkRecordModel _$DrinkRecordModelFromJson(Map<String, dynamic> json) =>
    _DrinkRecordModel(
      id: (json['id'] as num?)?.toInt(),
      supabaseItemId: (json['supabaseItemId'] as num?)?.toInt(),
      localItemId: (json['localItemId'] as num?)?.toInt(),
      caffeineAmount: (json['caffeineAmount'] as num).toDouble(),
      isCustom: json['isCustom'] as bool,
      drinkAt: DateTime.parse(json['drinkAt'] as String),
    );

Map<String, dynamic> _$DrinkRecordModelToJson(_DrinkRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'supabaseItemId': instance.supabaseItemId,
      'localItemId': instance.localItemId,
      'caffeineAmount': instance.caffeineAmount,
      'isCustom': instance.isCustom,
      'drinkAt': instance.drinkAt.toIso8601String(),
    };
