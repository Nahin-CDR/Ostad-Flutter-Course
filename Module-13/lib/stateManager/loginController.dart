import 'package:get/get.dart';
import 'package:task_manager/api/networkResponse.dart';
import 'package:task_manager/models/authUtility.dart';
import 'package:task_manager/models/loginModel.dart';
import 'package:task_manager/services/networkCaller.dart';
import 'package:task_manager/utility/utility.dart';
import '../utility/urls.dart';
class LoginController extends GetxController {
  bool _loginInProgress = false;

  bool get loginInProgress => _loginInProgress;

  Future<bool> login(String email, String password) async {
    _loginInProgress = true;
    update();
    Map<String, dynamic> requestBody = {"email": email, "password": password};
    final NetworkResponse response = await NetworkCaller().postRequest(Urls.login, requestBody, isLogin: true);
    _loginInProgress = false;
    update();
    if (response.isSuccess) {

      Utility.writeUserData(userData: response.body!);
      print(response.body);
      //await AuthUtils.saveUserInfo(LoginModel.fromJson(response.body!));
      return true;
    } else {
      return false;
    }
  }
}