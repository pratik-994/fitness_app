import 'package:json_annotation/json_annotation.dart';

class FoodModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? image;
  int? calories;
  int? protein;
  int? sizeInGram;
  int? sugar;

  FoodModel({
    this.id,
    this.calories,
    this.image,
    this.name,
    this.protein,
    this.sizeInGram,
    this.sugar,
  });

  // converting to dart object from server json file
  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        id: json["_id"],
        calories: json["calories"],
        name: json["name"],
        image: json["image"],
        protein: json["protein"],
        sizeInGram: json["sizeInGram"],
        sugar: json["sugar"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "_id": id,
        "calories": calories,
        "name": name,
        "image": image,
        "protein": protein,
        "sizeInGram": sizeInGram,
        "sugar": sugar,
      };
}