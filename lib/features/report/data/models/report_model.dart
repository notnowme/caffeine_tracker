import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_model.freezed.dart';
part 'report_model.g.dart';

@freezed
abstract class DrinkRecordModel with _$DrinkRecordModel {
  const factory DrinkRecordModel({
    int? id,
    int? supabaseItemId,
    int? localItemId,
    required double caffeineAmount,
    required bool isCustom,
    required DateTime drinkAt,
  }) = _DrinkRecordModel;

  factory DrinkRecordModel.fromMap(Map<String, dynamic> map) =>
      DrinkRecordModel(
        id: map['id'] as int?,
        supabaseItemId: map['supabase_item_id'] as int?,
        localItemId: map['local_item_id'] as int?,
        caffeineAmount: (map['caffeine_amount'] as num).toDouble(),
        isCustom: map['is_custom'] == 1,
        drinkAt: DateTime.parse(map['drink_at'] as String),
      );

  factory DrinkRecordModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkRecordModelFromJson(json);
}

extension DrinkRecordModelX on DrinkRecordModel {
  Map<String, dynamic> toMap() => {
    if (id != null) 'id': id,
    'supabase_item_id': supabaseItemId,
    'local_item_id': localItemId,
    'caffeine_amount': caffeineAmount,
    'is_custom': isCustom ? 1 : 0,
    'drink_at': drinkAt.toIso8601String(),
  };
}
