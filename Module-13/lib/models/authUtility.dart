import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/loginModel.dart';

class AuthUtils{
  AuthUtils._();
  static LoginModel userInfo = LoginModel();
  static Future<void> saveUserInfo(LoginModel loginModel)async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('user-data', jsonEncode(loginModel.toJson).toString());
  }
  static Future<void> updateUserInfo(UserData data) async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    userInfo.data = data;
    await sharedPrefs.setString('user-data', jsonEncode(userInfo.toJson()));
  }
  static Future<LoginModel> getUserInfo() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String value = sharedPrefs.getString('user-data')!;
    return LoginModel.fromJson(jsonDecode(value));
  }
  static Future<void> clearUserInfo() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
  }
  static Future<bool> checkIfUserLoggedIn() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    bool isLogin = sharedPrefs.containsKey('user-data');
    if (isLogin) {
      userInfo = await getUserInfo();
    }
    return isLogin;
  }
}