import 'package:new_app/models/user_model.dart';

abstract class LocalStorageService {
  final bool isLoggedIn = false;

  Future<void> saveUserData(UserModel model);

  Future<UserModel> getUserData(UserModel model);

  Future<bool> userLoggedIn();
  //if user is logged in, true, navigate to homepage
  // if user if not logged in ,false, navigate to login page

  Future<void> logoutUser() {}

  Future<void> loginUser() {}
}
