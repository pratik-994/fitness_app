import 'package:json_annotation/json_annotation.dart';
part 'macrosModel.g.dart';

@JsonSerializable()
class MacrosModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? calories;
  String? fat_total_g;
  String? fat_saturated_g;
  String? protein_g;
  String? sodium_mg;
  String? potassium_mg;
  String? cholesterol_mg;
  String? carbohydrates_total_g;
  String? fiber_g;
  String? sugar_g;
  String? foodHabitId;

  MacrosModel({
    this.calories,
    this.carbohydrates_total_g,
    this.cholesterol_mg,
    this.fat_saturated_g,
    this.fat_total_g,
    this.fiber_g,
    this.foodHabitId,
    this.id,
    this.name,
    this.potassium_mg,
    this.protein_g,
    this.sodium_mg,
    this.sugar_g,
  });

  factory MacrosModel.fromJson(Map<String, dynamic> json) =>
      _$MacrosModelFromJson(json);

  Map<String, dynamic> toJson() => _$MacrosModelToJson(this);
}