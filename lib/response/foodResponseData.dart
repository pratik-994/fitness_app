import 'package:fitness_app/models/foodHabitModel.dart';
import 'package:fitness_app/models/macrosModel.dart';

class FoodResponseData {
  FoodHabitModel? foodhabit;
  List<MacrosModel?>? macros;

  FoodResponseData({this.foodhabit, this.macros});

  factory FoodResponseData.fromJson(Map<String, dynamic> json) => FoodResponseData(
        foodhabit: json["foodhabit"],
        macros: json["macros"],
      );

  Map<String, dynamic> toJson() => {
        "foodhabit": foodhabit,
        "macros":macros,
      };
}