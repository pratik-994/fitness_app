import 'package:fitness_app/models/userModel.dart';

class LoginResponse {
  bool? ok;
  UserModel? data;

  LoginResponse({this.ok, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        ok: json["ok"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "data":data,
      };
}