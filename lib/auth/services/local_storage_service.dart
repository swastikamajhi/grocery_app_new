import 'dart:convert';

import 'package:new_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String _userDataKey = 'user_data_key';
  static const String _userLoggedInStatusKey = 'user_logged_in_status_key';

  static Future<void> saveUserData(UserModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userDataKey, jsonEncode(model.toJson(model)));
  }

  static Future<UserModel?> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_userDataKey);

    if (data != null) {
      final decodedData = jsonDecode(data);
      final userModel = UserModel.fromJson(decodedData);
      return userModel;
    } else {
      return null;
    }
  }

  static Future<void> setUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_userLoggedInStatusKey, true);
  }

  static Future<bool> getUserLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(_userLoggedInStatusKey) ?? false;
    return value;
  }

  static Future<void> setUserLogout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_userLoggedInStatusKey, false);
  }
}
