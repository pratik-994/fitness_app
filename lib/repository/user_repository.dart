
import 'package:fitness_app/api/user_api.dart';
import 'package:fitness_app/models/macrosModel.dart';
import 'package:fitness_app/models/userModel.dart';


class UserRepository {
  Future<bool> registerUser(UserModel user) async {
    return await UserApi().registerUser(user);
  }

  Future<bool> loginUser(String username, String password) async {
    return await UserApi().loginUser(username, password);
  }

  Future<List<MacrosModel?>?> addFood(String? userId, String? dailyIntake) async {
    return await UserApi().addFood(userId, dailyIntake);
  }

  // Future<UserModel?> getUserDetails() async {
  //   return await UserApi().getUserDetails();
  // }

  // Future<bool> updateUserProfile(
  //     UserProfile patientProfile, File? image) async {
  //   return await UserApi().updateUserProfile(patientProfile, image);
  // }
}