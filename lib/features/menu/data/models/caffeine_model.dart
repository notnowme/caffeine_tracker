import 'package:freezed_annotation/freezed_annotation.dart';

part 'caffeine_model.freezed.dart';
part 'caffeine_model.g.dart';

enum CaffeineCategory {
  cafeCoffee(1, '카페 커피'),
  energyDrink(2, '에너지드링크'),
  cannedCoffee(3, '캔/병 커피'),
  instantCoffee(4, '커피믹스'),
  capsuleCoffee(5, '캡슐 커피'),
  tea(6, '차류'),
  soda(7, '탄산음료'),
  dessert(8, '디저트'),
  medicine(9, '약품/자양강장제'),
  etc(10, '기타');

  final int id;
  final String label;
  const CaffeineCategory(this.id, this.label);

  static CaffeineCategory? fromId(int? id) {
    if (id == null) return null;
    return CaffeineCategory.values.firstWhere((e) => e.id == id);
  }

  static CaffeineCategory? fromLabel(String label) {
    return values.firstWhere((e) => e.label == label);
  }
}

@freezed
abstract class CaffeineItemModel with _$CaffeineItemModel {
  const factory CaffeineItemModel({
    int? id,
    @Default('기타') String category,
    required String name,
    String? brand,
    @Default('') String serviceSize,
    double? volumeMl,
    @Default(0.0) double caffeineAmount,
    @Default(0) int hits,
    int? isCustom,
    int? categoryId,
  }) = _CaffeineItemModel;

  factory CaffeineItemModel.fromMap(Map<String, dynamic> map) =>
      CaffeineItemModel(
        id: map['id'] as int?,
        name: map['name'] as String,
        category: CaffeineCategory.fromId(map['category_id'])?.label ?? '기타',
        brand: map['brand'] as String?,
        serviceSize: map['service_size'] as String? ?? '',
        volumeMl: (map['volume_ml'] as num?)?.toDouble(),
        caffeineAmount: (map['caffeine_amount'] as num?)?.toDouble() ?? 0.0,
        hits: map['hits'] as int? ?? 0,
        categoryId: map['category_id'] as int?,
        isCustom: map['is_custom'] as int?,
      );

  factory CaffeineItemModel.fromJson(Map<String, dynamic> json) =>
      _$CaffeineItemModelFromJson(json);
}

extension CaffeineItemModelX on CaffeineItemModel {
  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'category_id': categoryId,
    'brand': brand,
    'service_size': serviceSize,
    'volume_ml': volumeMl,
    'caffeine_amount': caffeineAmount,
    'is_custom': isCustom,
    'hits': hits,
  };
}
