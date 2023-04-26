import 'package:fitness_app/response/foodResponseData.dart';

class FoodResponse {
  bool? ok;
  FoodResponseData? data;

  FoodResponse({this.ok, this.data});

  factory FoodResponse.fromJson(Map<String, dynamic> json) => FoodResponse(
        ok: json["ok"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data":data,
      };
}