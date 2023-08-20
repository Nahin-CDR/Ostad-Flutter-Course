import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_manager/routes/routesNames.dart';
import 'package:task_manager/utility/utility.dart';
import '../api/networkResponse.dart';
import '../models/authUtility.dart';

class NetworkCaller {
  Future<NetworkResponse> getRequest(String url) async {
    try {
      log(url);
      String? token = await Utility.readUserData(key: 'token');
      http.Response response = await http.get(Uri.parse(url),
          headers: {'token': token!});
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(true, response.statusCode, jsonDecode(response.body));
      } else if (response.statusCode == 401) {
        gotoLogin();
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }

  Future<NetworkResponse> postRequest(
      String url,
      Map<String, dynamic> body,
      {bool isLogin = false}) async {
    try {
      log(body.toString());
      http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'token': AuthUtils.userInfo.token.toString()
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200) {
        return NetworkResponse(
          true,
          response.statusCode,
          jsonDecode(response.body),
        );
      } else if (response.statusCode == 401) {
        if (isLogin == false) {
          gotoLogin();
        }
      } else {
        return NetworkResponse(false, response.statusCode, null);
      }
    } catch (e) {
      log(e.toString());
    }
    return NetworkResponse(false, -1, null);
  }
  Future<void> gotoLogin() async {
    await AuthUtils.clearUserInfo();
    Get.offNamed(RoutesName.loginScreen);
  }
}
