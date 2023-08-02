import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Utility{
  static Future<void> writeUserData({required Map userData})async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', userData['token']);
    await prefs.setString('email', userData['data']['email']);
    await prefs.setString('firstName', userData['data']['firstName']);
    await prefs.setString('lastName', userData['data']['lastName']);
    await prefs.setString('mobile', userData['data']['mobile']);
    if(userData['data']['photo'] == null){
      userData['data']['photo'] = "img";
    }
    await prefs.setString('photo', userData['data']['photo']);
  }
  static Future<String?>readUserData({required String key})async{
    final prefs = await SharedPreferences.getInstance();
    String? myData = prefs.getString(key);
    return myData;
  }
  static Future<void> writeEmailVerificationData({required String userMail})async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('emailVerification', userMail);
  }
  static Future<void> writeOtpVerificationData({required String otp})async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('otp',otp);
  }
  static Uint8List showBase64Image(String base64String){
    UriData? data =  Uri.parse(base64String).data;
    Uint8List myImage = data!.contentAsBytes();
    return myImage;
  }
  static Future<bool>removeToken()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    return true;
  }
}