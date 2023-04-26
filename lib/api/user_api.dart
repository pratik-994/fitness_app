import 'package:dio/dio.dart';
import 'package:fitness_app/api/http_services.dart';
import 'package:fitness_app/models/macrosModel.dart';
import 'package:fitness_app/models/userModel.dart';
import 'package:fitness_app/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {
  Future<bool> registerUser(UserModel user) async {
    bool isSignUp = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isSignUp;
  }

  Future<bool> loginUser(String email, String password) async {
    bool isLogin = false;

    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      var response = await dio.get(
        url,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        debugPrint(response.toString());
        // LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        userid = response.data["data"]!["_id"];
        userEmail = response.data["data"]!["email"];
        userName = response.data["data"]!["fullName"];
        debugPrint("UserID: $userid");
        // print(token);
        if (response.data["ok"]!) {
          if (userid != null && userName != null && userEmail != null) {
            // debugPrint(token);
            SharedPreferences.setMockInitialValues({});
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("userid", userid!);
            prefs.setString("userName", userName!);
            prefs.setString("userEmail", userEmail!);

            // String? try1 = prefs.getString("userid");
            // debugPrint("SSSSSSSSSSSSSSSSSSSS$try1");

            // print("ok1233");
            isLogin = true;
          }
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<List<MacrosModel?>?> addFood(
      String? userId, String? dailyIntake) async {
    bool isSignUp = false;
    List<MacrosModel?>? listMacros = [];
    Response response;
    var url = baseUrl + foodUrl;
    var dio = HttpServices().getDioInstance();
    try {
      response = await dio.post(
        url,
        data: {
          "userId": userid,
          "dailyIntake": dailyIntake,
        },
      );
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        // FoodResponse bookAppointmentResponse =
        //     FoodResponse.fromJson(response.data);
        // for (var data in bookAppointmentResponse.data!.macros!) {
        for (var data in response.data["data"]["macros"]) {
          listMacros.add(MacrosModel(
            id: data["_id"],
            name: data["name"],
            calories: data["calories"].toString(),
            fat_total_g: data["fat_total_g"].toString(),
            fat_saturated_g: data["fat_saturated_g"].toString(),
            protein_g: data["protein_g"].toString(),
            sodium_mg: data["sodium_mg"].toString(),
            potassium_mg: data["potassium_mg"].toString(),
            cholesterol_mg: data["cholesterol_mg"].toString(),
            carbohydrates_total_g: data["carbohydrates_total_g"].toString(),
            fiber_g: data["fiber_g"].toString(),
            sugar_g: data["sugar_g"].toString(),
            foodHabitId: data["foodHabitId"].toString(),
          ));
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint("Addeddddddddddddddddddddddddddddddddddddd");
    return listMacros;
  }
  // Future<User?> getUserDetails() async {
  //   User? user;
  //   try {
  //     var url = baseUrl + getUserDetailsUrl;
  //     var dio = HttpServices().getDioInstance();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString("patient");
  //     var response = await dio.get(
  //       url,
  //       options: Options(
  //         headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  //       ),
  //     );
  //     debugPrint(response.data.toString());
  //     if (response.statusCode == 201) {
  //       user = User.fromJson(response.data);
  //     }
  //   } catch (e) {
  //     debugPrint("Error: ${e.toString()}");
  //   }
  //   return user;
  // }

  // Future<bool> updateUserProfile(
  //     UserProfile patientProfile, File? image) async {
  //   // String fileName = image!.path.split('/').last;
  //   // debugPrint("FileName: " + fileName);
  //   // debugPrint("Image Path: " + image.path.toString());
  //   bool isUpdated = false;
  //   FormData data = FormData.fromMap({
  //     "fname": patientProfile.fname,
  //     "lname": patientProfile.lname,
  //     "gender": patientProfile.gender,
  //     "age": patientProfile.age,
  //     "username": patientProfile.username,
  //     "phone": patientProfile.phone,
  //     "address": patientProfile.address,
  //     // "pat_img": await MultipartFile.fromFile(
  //     //   image.path,
  //     //   filename: fileName,
  //     // ),
  //   });
  //   try {
  //     var url = baseUrl + updateUserProfileUrl;
  //     var dio = HttpServices().getDioInstance();
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString("patient");
  //     var response = await dio.put(
  //       url,
  //       data: data,
  //       options: Options(
  //         headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       return true;
  //     }
  //   } catch (e) {
  //     debugPrint("Error updating patient profile: $e");
  //   }

  //   return isUpdated;
  // }

  // Future<User?> loadFoodDetails() async {
  //     User? user;
  //     try {
  //       var url = baseUrl + getUserDetailsUrl;
  //       var dio = HttpServices().getDioInstance();
  //       SharedPreferences prefs = await SharedPreferences.getInstance();
  //       String? token = prefs.getString("patient");
  //       var response = await dio.get(
  //         url,
  //         options: Options(
  //           headers: {HttpHeaders.authorizationHeader: "Bearer $token"},
  //         ),
  //       );
  //       debugPrint(response.data.toString());
  //       if (response.statusCode == 201) {
  //         user = User.fromJson(response.data);
  //       }
  //     } catch (e) {
  //       debugPrint("Error: ${e.toString()}");
  //     }
  //     return user;
  //   }
}
