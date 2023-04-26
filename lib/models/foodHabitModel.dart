import 'package:json_annotation/json_annotation.dart';
part 'foodHabitModel.g.dart';

@JsonSerializable()
class FoodHabitModel {
  @JsonKey(name: "_id")
  String? id;
  String? userId;
  String? calories;
  String? date;

  FoodHabitModel({
    this.calories,
    this.id,
    this.date,
    this.userId,
  });

  factory FoodHabitModel.fromJson(Map<String, dynamic> json) =>
      _$FoodHabitModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodHabitModelToJson(this);
}