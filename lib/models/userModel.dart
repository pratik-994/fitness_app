import 'package:json_annotation/json_annotation.dart';

class UserModel {
  @JsonKey(name: "_id")
  String? id;
  String? fullName;
  String? gender;
  String? age;
  String? email;
  String? password;
  String? weight;

  UserModel({
    this.id,
    this.fullName,
    this.gender,
    this.age,
    this.email,
    this.password,
    this.weight,
  });

  // converting to dart object from server json file
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        fullName: json["fullName"],
        gender: json["gender"],
        age: json["age"],
        email: json["email"],
        password: json["password"],
        weight:json["weight"],
      );

  // converting to json format from dart object
  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "gender": gender,
        "age": age,
        "email": email,
        "password": password,
        "weight":weight,
      };
}