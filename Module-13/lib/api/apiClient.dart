import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:task_manager/utility/toastMessage.dart';
import 'package:task_manager/utility/utility.dart';

const baseUrl = "https://task.teamrabbil.com/api/v1";
const requestHeader = {"Content-Type" : "application/json"};

class ApiClient{
  Future<bool>loginRequest({required Map formValues})async{
    var url = Uri.parse("$baseUrl/login");
    var postBody = jsonEncode(formValues);
    var response = await http.post(url,headers: requestHeader,body: postBody);
    var resultCode = response.statusCode;

    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      await Utility.writeUserData(userData: resultBody);
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<bool>registrationRequest({required Map formValues})async{
    var url = Uri.parse("$baseUrl/registration");
    var postBody = jsonEncode(formValues);
    var response = await http.post(url,headers: requestHeader,body: postBody);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<bool>verifyEmailRequest({required String userMail})async{
    var url = Uri.parse("$baseUrl/RecoverVerifyEmail/$userMail");
    var response = await http.get(url,headers: requestHeader);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      await Utility.writeEmailVerificationData(userMail: userMail);
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<bool>verifyOTPRequest({required String userMail,required String otp})async{
    var url = Uri.parse("$baseUrl/RecoverVerifyOTP/$userMail/$otp");
    var response = await http.get(url,headers: requestHeader);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      await Utility.writeOtpVerificationData(otp:otp);
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<bool>setPasswordRequest({required Map formValues})async{
    var url = Uri.parse("$baseUrl/RecoverResetPass");
    var postBody = jsonEncode(formValues);
    var response = await http.post(url,headers: requestHeader,body: postBody);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<List<dynamic>>taskListRequest(status)async{
    var url = Uri.parse("$baseUrl/listTaskByStatus/$status");
    String? token = await Utility.readUserData(key: "token");
    Map<String,String> requestHeaderWithToken = {
      "Content-Type" : "application/json",
       "token" : token.toString()
    };
    var response = await http.get(url,headers: requestHeaderWithToken);
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      return resultBody["data"];
    }else{
      Message.errorToast("Request failed ! try again");

    }
    return [];
  }
  Future<bool>taskCreateRequest({required Map formData})async{
    var url = Uri.parse("$baseUrl/createTask");
    String? token = await Utility.readUserData(key: "token");
    Map<String,String> requestHeaderWithToken = {
      "Content-Type" : "application/json",
      "token" : token.toString()
    };
    var postBody = json.encode(formData);
    var response = await http.post(
        url,
        headers: requestHeaderWithToken,
        body: postBody
    );
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<bool>taskDeleteRequest({required String taskId})async{
    var url = Uri.parse("$baseUrl/deleteTask/$taskId");
    String? token = await Utility.readUserData(key: "token");
    Map<String,String> requestHeaderWithToken = {
      "Content-Type" : "application/json",
      "token" : token.toString()
    };
    var response = await http.get(
        url,
        headers: requestHeaderWithToken
    );
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
  Future<bool>taskStatusUpdateRequest({required String taskId,required String status})async{
    var url = Uri.parse("$baseUrl/updateTaskStatus/$taskId/$status");
    String? token = await Utility.readUserData(key: "token");
    Map<String,String> requestHeaderWithToken = {
      "Content-Type" : "application/json",
      "token" : token.toString()
    };
    var response = await http.get(
        url,
        headers: requestHeaderWithToken
    );
    var resultCode = response.statusCode;
    var resultBody = jsonDecode(response.body);
    if(resultCode == 200 && resultBody['status'] == "success"){
      Message.successToast("Request Success");
      return true;
    }else{
      Message.errorToast("Request failed ! try again");
      return false;
    }
  }
}