import 'package:freezed_annotation/freezed_annotation.dart';

part 'info_model.freezed.dart';
part 'info_model.g.dart';

enum Gender {
  male(0, '남성'),
  female(1, '여성');

  final int id;
  final String gender;
  const Gender(this.id, this.gender);

  static Gender fromInt(int num) {
    return Gender.values.firstWhere((e) => e.id == num);
  }
}

enum Sensitive {
  low(0, '둔감'),
  normal(1, '평범'),
  high(2, '민감');

  final int id;
  final String sense;
  const Sensitive(this.id, this.sense);

  static Sensitive fromInt(int num) {
    return Sensitive.values.firstWhere((e) => e.id == num);
  }
}

@freezed
abstract class InfoModel with _$InfoModel {
  const factory InfoModel({
    required String name,
    required Gender gender,
    required double weight,
    required int age,
    required bool smoking,
    required Sensitive sense,
    required double targetAmount,
  }) = _InfoModel;

  factory InfoModel.empty() => const InfoModel(
    name: '',
    gender: Gender.female,
    weight: 0,
    age: 17,
    smoking: false,
    sense: Sensitive.normal,
    targetAmount: 400,
  );

  factory InfoModel.fromMap(Map<String, dynamic> map) => InfoModel(
    name: map['name'] as String,
    gender: Gender.fromInt(map['gender'] as int),
    weight: (map['weight'] as num).toDouble(),
    age: 17,
    smoking: map['smoking'] == 1,
    sense: Sensitive.fromInt(map['sense'] as int),
    targetAmount: (map['target'] as num).toDouble(),
  );

  factory InfoModel.fromJson(Map<String, dynamic> json) =>
      _$InfoModelFromJson(json);
}

extension InfoModelX on InfoModel {
  Map<String, dynamic> toMap() => {
    'name': name,
    'gender': gender == Gender.male ? 0 : 1,
    'weight': weight,
    'target': targetAmount,
    'smoking': smoking ? 1 : 0,
    'sense': sense == Sensitive.low
        ? 0
        : sense == Sensitive.normal
        ? 1
        : 2,
  };
}
