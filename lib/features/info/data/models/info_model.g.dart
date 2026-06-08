// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InfoModel _$InfoModelFromJson(Map<String, dynamic> json) => _InfoModel(
  name: json['name'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  weight: (json['weight'] as num).toDouble(),
  age: (json['age'] as num).toInt(),
  smoking: json['smoking'] as bool,
  sense: $enumDecode(_$SensitiveEnumMap, json['sense']),
  targetAmount: (json['targetAmount'] as num).toDouble(),
);

Map<String, dynamic> _$InfoModelToJson(_InfoModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender]!,
      'weight': instance.weight,
      'age': instance.age,
      'smoking': instance.smoking,
      'sense': _$SensitiveEnumMap[instance.sense]!,
      'targetAmount': instance.targetAmount,
    };

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$SensitiveEnumMap = {
  Sensitive.low: 'low',
  Sensitive.normal: 'normal',
  Sensitive.high: 'high',
};
